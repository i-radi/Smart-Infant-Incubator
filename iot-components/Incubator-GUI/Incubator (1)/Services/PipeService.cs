using System;
using System.Collections.Generic;
using System.Text.Json;
using System.Threading.Tasks;
using Incubator.Pipe;

namespace Incubator.Services;

public class PipeService
{
    private static PipeService? _obj = new();

    private static readonly JsonSerializerOptions JsonSerializerOptions = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };

    public static PipeService Instance => _obj!;
    private static readonly Dictionary<Type, Action<string> > Hooks = new();

    private PipeService() { }


    private static PipeServer? _server;
    private static PipeClient? _client;
    public static async Task Init()
    {
        _obj = new();
        _server = new PipeServer(WhenMessageSent);
        _client = new PipeClient(WhenMessageReceived);
        await _server.RunAndWait();
        await _client.RunAndWait();
    }

    public static void Stop()
    {
        _obj = null;
        _server = null;
        _client = null;
        GC.Collect();
    }

    private static void WhenMessageReceived(string str)
    {
        if (string.IsNullOrEmpty(str)) return;
        Console.WriteLine($"Data Received: {str}");
        foreach (var hook in Hooks.Values) 
            hook.Invoke(str);
    }

    private static void WhenMessageSent(string str)
    {
        Console.WriteLine($"Message Sent: {str}");
    }

    public void AddJsonReceiver<T>(Action<T> hook)
    {
        Hooks.Add(typeof(T), (str) =>
        {
            var data = JsonSerializer.Deserialize<T>(str, JsonSerializerOptions);
            if (data == null) return;
            Console.WriteLine($"Json Data Received: {data}");
            hook.Invoke(data);
        });
    }

    /// <summary>
    /// Send any object throw pipe and will serialize automatically
    /// </summary>
    /// <param name="obj"> the object you want to send</param>
    public void SendAsJson(object obj) =>
        _server?.SendJsonMessage(obj);

    public void RemoveJsonReceiver<T>()
    {
        if (Hooks.ContainsKey(typeof(T)))
            Hooks.Remove(typeof(T));
    }
}