using System.Text.Json;
using Pipe.Models;

namespace Pipe;

public static class Program
{
    static async Task Main(string[] args)
    {
        var server = new PipeServer();
        var client = new PipeClient(WhenMessageReceived);
        server.RunAndWait();
        client.RunAndWait();

        var data = new SensorAction
        {
            TempA = 25 ,
            uvLamp = "ON",
            Motor = "UP",
            //Values = new List<int>{3,7,8,9}
        };

        int i = 0;
        while (true)
        {
            //server.SendMessage(i.ToString());
            server.SendJsonMessage(data);
            i++;
            await Task.Delay(5000);
        }

    }

    public static void WhenMessageReceived(string str)
    {
        var data = JsonSerializer.Deserialize<SensorData>(str, new JsonSerializerOptions{PropertyNamingPolicy = JsonNamingPolicy.CamelCase});
        Console.WriteLine($"Data Received with temp.: {data.temp} and Humi: {data.humi}");
        //Console.WriteLine($"Data Received with tempHumi: {string.Join(',',data.TempHumi)}");
        //Console.WriteLine($"Data Received with tempHumi: {data.tempHumi}");
        Console.WriteLine($"weight the baby : {data.weightSens}");
        Console.WriteLine($"HeartRate of the baby : {data.heartRate}");
    }

    //public static void WhenMessageSent(string str)
    //{
    //    Console.WriteLine($"Message Sent: {str}");
    //}
}