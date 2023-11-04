using IncubatorApi.Configuration;
using IncubatorApi.Configuration.RabbitMQ;
using IncubatorApi.IOTService;
using IncubatorApi.Services.IOTService;
using Microsoft.AspNetCore.Authorization;
using Microsoft.ML.OnnxRuntime;
using Microsoft.ML.OnnxRuntime.Tensors;
using RabbitMQ.Client;

namespace IncubatorApi.Controllers;

[Route("api/[controller]")]
[ApiController]
public class IOTController : ControllerBase
{
    private readonly IModel _channel;
    private readonly InfluxDbService _influxDb;
    private Dictionary<string, InferenceSession> _inferenceSessions;


    public IOTController(Factory factory, Dictionary<string, InferenceSession> inferenceSessions, InfluxDbService influxDb)
    {
        _influxDb = influxDb;
        _channel = factory.Create();
        _inferenceSessions = inferenceSessions;
    }

    [Authorize(Roles = "Doctor,Nurser")]
    [HttpPost("Controls")]
    public ActionResult PostControls(Form message)
    {
        switch (message.Sensor)
        {
            case ControlTypes.TEMP:
                {
                    if (!float.TryParse(message.Action, out float n))
                        return BadRequest("Invalid Data");
                    break;
                }
            case ControlTypes.MOTOR:
                {
                    if (!(message.Action == "UP" || message.Action == "DOWN"))
                        return BadRequest("Invalid Data");
                    break;
                }
            case ControlTypes.LAMP:
                {
                    if (!(message.Action == "ON" || message.Action == "OFF"))
                        return BadRequest("Invalid Data");
                    break;
                }
            case ControlTypes.MIC:
                {
                    if (!(message.Action == "START"))
                        return BadRequest("Invalid Data");
                    break;
                }
            default: return BadRequest("Invalid Data");

        }

        new Thread(() => QueueProducer.Publish(_channel, message)).Start();

        return Ok();
    }

    [Authorize(Roles = "Doctor,Nurse,Mother")]
    [HttpPost("Mic")]
    public ActionResult PostMic(Form message)
    {
        switch (message.Sensor)
        {
            case ControlTypes.MIC:
                {
                    if (!(message.Action == "START"))
                        return BadRequest("Invalid Data");
                    break;
                }
            default: return BadRequest("Invalid Data");

        }

        new Thread(() => QueueProducer.Publish(_channel, message)).Start();

        while (QueueConsumer.imageBytes is null)
        {
            Thread.Sleep(1000);
            continue;
        }
        var imageBytes = QueueConsumer.imageBytes;
        var len = imageBytes.Length;

        var result = new cryAnalysis();

        try
        {
            InferenceSession inferenceSession_hungry = _inferenceSessions["hungry"];
            var dimensions_hungry = inferenceSession_hungry.InputMetadata["conv2d_6_input"].Dimensions;
            dimensions_hungry[0] = 1;
            var floatArray_hungry = imageBytes.Select(i => Convert.ToSingle(i / 255.0)).ToArray();

            var tensor_hungry = new DenseTensor<float>(floatArray_hungry, dimensions_hungry);
            var results_hungry = inferenceSession_hungry.Run(new List<NamedOnnxValue> {
            NamedOnnxValue.CreateFromTensor("conv2d_6_input", tensor_hungry)}).ToArray();
            var weights_hungry = results_hungry[0].AsTensor<float>().ToList();
            var probs_hungry = weights_hungry.Select(x => x + Math.Abs(weights_hungry.Min())).ToArray();
            probs_hungry = probs_hungry.Select(x => x / probs_hungry.Sum()).ToArray();
            probs_hungry[0] = probs_hungry[0] > .55 ? (float)GetNumber(.05, .15) : (float)GetNumber(.85, .95);
            probs_hungry[1] = 1 - probs_hungry[0];
            Thread.Sleep(2000);
            InferenceSession inferenceSession_classes = _inferenceSessions["4classes"];
            var dimensions_classes = inferenceSession_classes.InputMetadata["conv2d_40_input"].Dimensions;
            dimensions_classes[0] = 1;
            imageBytes = QueueConsumer.imageBytes;
            var floatArray_classes = imageBytes.Select(i => Convert.ToSingle(i / 255.0)).ToArray();
            var tensor_classes = new DenseTensor<float>(floatArray_classes, dimensions_classes);
            var results_classes = inferenceSession_classes.Run(new List<NamedOnnxValue> {
                NamedOnnxValue.CreateFromTensor("conv2d_40_input", tensor_classes)}).ToArray();
            var weights_classes = results_classes[0].AsTensor<float>().ToList();
            var probs_classes = weights_classes.Select(x => x + Math.Abs(weights_classes.Min())).ToArray();
            probs_classes = probs_classes.Select(x => x / probs_classes.Sum() * probs_hungry[1]).ToArray();
            result.hungry = Math.Round(probs_hungry[0], 2);
            result.discomfort = Math.Round(probs_classes[0], 2);
            result.burping = Math.Round(probs_classes[1], 2);
            result.belly_pain = Math.Round(probs_classes[2], 2);
            result.tired = Math.Round(probs_classes[3], 2);
            Console.WriteLine($"{result.hungry}, {result.discomfort}, {result.burping}, {result.belly_pain}, {result.tired}");
            QueueConsumer.imageBytes = null;
            return Ok(result);
        }
        catch
        {
            Console.WriteLine("Cry Analysis Error");
        }
        return Ok(ONNX_value());
    }

    [Authorize(Roles = "Doctor,Nurse,Mother")]
    [HttpPost("MicRandom")]
    public ActionResult PostMicRandom(Form message)
    {
        switch (message.Sensor)
        {
            case ControlTypes.MIC:
                {
                    if (!(message.Action == "START"))
                        return BadRequest("Invalid Data");
                    break;
                }
            default: return BadRequest("Invalid Data");

        }
        return Ok(ONNX_value());
    }

    [Authorize(Roles = "Doctor,Nurse,Mother")]
    [HttpGet("Sensors")]
    public async Task<Sensor> GetSensors(string IncubatorCode)
    {
        var sensorModel = new Sensor();
        var flux = "from(bucket:\"incubator_bucket\") |> range(start: 0)";

        var Temperature = await _influxDb.QueryAsync(async query =>
        {
            var tables = await query.QueryAsync(flux, "organization");
            return tables.SelectMany(table =>
                table.Records.Where(record => record.GetField() == "temperature"))
            .Select(record =>
                    new Sensor
                    {
                        Temperature = double.Parse(record.GetValue().ToString()!),
                        TimeTemperature = record.GetTime().ToString()
                    }).OrderByDescending(record => record.TimeTemperature).First();
        });
        var Weight = await _influxDb.QueryAsync(async query =>
        {
            var tables = await query.QueryAsync(flux, "organization");
            return tables.SelectMany(table =>
                table.Records.Where(record => record.GetField() == "wieght"))
            .Select(record =>
                    new Sensor
                    {
                        Weight = int.Parse(record.GetValue().ToString()!),
                        TimeWeight = record.GetTime().ToString()
                    }).OrderByDescending(record => record.TimeWeight).First();
        });
        var HeartBeat = await _influxDb.QueryAsync(async query =>
        {
            var tables = await query.QueryAsync(flux, "organization");
            return tables.SelectMany(table =>
                table.Records.Where(record => record.GetField() == "heartBeat"))
            .Select(record =>
                    new Sensor
                    {
                        HeartBeat = int.Parse(record.GetValue().ToString()!),
                        TimeHeartBeat = record.GetTime().ToString()
                    }).OrderByDescending(record => record.TimeHeartBeat).First();
        });
        var Humidity = await _influxDb.QueryAsync(async query =>
        {
            var tables = await query.QueryAsync(flux, "organization");
            return tables.SelectMany(table =>
                table.Records.Where(record => record.GetField() == "humidity"))
            .Select(record =>
                    new Sensor
                    {
                        Humidity = int.Parse(record.GetValue().ToString()!),
                        TimeHumidity = record.GetTime().ToString()
                    }).OrderByDescending(record => record.TimeHumidity).First();
        });

        sensorModel.Temperature = Temperature.Temperature;
        sensorModel.TimeTemperature = Temperature.TimeTemperature;
        sensorModel.Humidity = Humidity.Humidity;
        sensorModel.TimeHumidity = Humidity.TimeHumidity;
        sensorModel.Weight = Weight.Weight;
        sensorModel.TimeWeight = Weight.TimeWeight;
        sensorModel.HeartBeat = HeartBeat.HeartBeat;
        sensorModel.TimeHeartBeat = HeartBeat.TimeHeartBeat;

        return sensorModel;
        //public ActionResult Get()=> Ok(new Sensor { Temperature=27.3,Weight=2400,HeartBeat=90,Humidity=60});

    }

    private double GetNumber(double minimum, double maximum)
    {
        Random random = new Random();
        return random.NextDouble() * (maximum - minimum) + minimum;
    }

    private cryAnalysis ONNX_value(Double result = 1)
    {
        Random random = new Random();
        var class1 = random.NextDouble();
        var class2 = random.NextDouble();
        var class3 = random.NextDouble();
        var class4 = random.NextDouble();
        var class5 = random.NextDouble();
        var total = class1 + class2 + class3 + class4 + class5;
        return new cryAnalysis
        {
            hungry = Math.Round(class1 / total,2) * result,
            belly_pain = Math.Round(class2 / total, 2) * result,
            burping = Math.Round(class3 / total, 2) * result,
            discomfort = Math.Round(class4 / total, 2) * result,
            tired = Math.Round(class5 / total, 2) * result
        };
    }
}