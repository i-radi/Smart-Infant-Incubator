namespace Incubator.Models;

public class SensorData
{
    public string WeightSens { get; set; } = null!;
    public float HeartRate { get; set; }
    public float Temp { get; set; }
    public float Humi { get; set; }

    

    public override string ToString()
    {
        return $"Weight = {WeightSens},Rate={HeartRate},Temp={Temp},Humi={Humi}";
    }
}


