using IncubatorApi.Configuration.RabbitMQ;
using RabbitMQ.Client;

namespace IncubatorApi.Services.IOTService
{
    public class IotBind :IHostedService
    {
        private readonly IModel _channel;

        public IotBind(Factory factory)
        {
            _channel = factory.Create();
        }
       

        public Task StartAsync(CancellationToken cancellationToken)
        {
            new Thread(() => QueueConsumer.Consume(_channel, "Mic" )).Start();
            return Task.CompletedTask;
        }

        public Task StopAsync(CancellationToken cancellationToken)
        {
            return Task.CompletedTask;
        }
    }
}
