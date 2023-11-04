using IncubatorApi.IOTService;
using RabbitMQ.Client;

namespace IncubatorApi.Configuration.RabbitMQ;
public class Factory
{
    public IModel Create()
    {
        var factory = new ConnectionFactory
        {
            Uri = new Uri("amqp://guest:guest@localhost:5672")
        };
        var connection = factory.CreateConnection();
        var channel = connection.CreateModel();
        return channel;

    }
}

public class Form
{
    public string IncubatorCode { get; set; }
    public ControlTypes Sensor { get; set; }
    public string Action { get; set; }
}