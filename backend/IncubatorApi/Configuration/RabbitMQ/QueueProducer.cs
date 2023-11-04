using RabbitMQ.Client;
using System.Text.Json;

namespace IncubatorApi.Configuration.RabbitMQ
{
    public static class QueueProducer
    {
        public static void Publish(IModel channel, Form message)
        {
            channel.QueueDeclare("Controls", true, false, false, null);
            var body = Encoding.UTF8.GetBytes(JsonSerializer.Serialize(message));
            channel.BasicPublish("", "Controls", null, body);


        }
    }
}
