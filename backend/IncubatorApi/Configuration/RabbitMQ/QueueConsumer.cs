using RabbitMQ.Client;
using RabbitMQ.Client.Events;
namespace IncubatorApi.Configuration.RabbitMQ
{
    public class QueueConsumer
    {
        public static byte[] imageBytes { get; set; }
        public static void Consume(IModel channel, string queue)
        {
            var consumer = new EventingBasicConsumer(channel);
            consumer.Received += (sender, e) =>
            {
                var body = e.Body.ToArray();
                var message = Encoding.UTF8.GetString(body);
                Console.WriteLine("\n\tReceive image from Raspberry-pi\n");
                imageBytes = Convert.FromBase64String(message);
            };

            channel.BasicConsume(queue, true, consumer);
            Console.WriteLine("Consumer started");
        }
    }
}
