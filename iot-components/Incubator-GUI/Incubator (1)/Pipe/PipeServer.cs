using System;
using System.IO.Pipes;
using System.Text.Json;
using System.Threading.Tasks;

namespace Incubator.Pipe;

public class PipeServer
{
    private readonly Action<string>? _whenSendingMessage;
    private const string PipeName = "CSToPython";
    private NamedPipeServerStream _stream;
    private PipeProxy _proxy;
    private Guid _invokeId;

    private readonly JsonSerializerOptions _jsonOptions = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };

    

    public PipeServer(Action<string>? whenSendingMessage = null)
    {
        _whenSendingMessage = whenSendingMessage;
        Init();
        _proxy!.PoxyStopped += async id =>
        {
            if (id != _invokeId) return;
            _invokeId = Guid.NewGuid();
            _stream!.Dispose();
            _proxy.Stop();
            Init();
            await RunAndWait();
        };
    }

    private void Init()
    {
        _invokeId = Guid.NewGuid();
        _stream = new(PipeName);
        _proxy = new(_stream, false, _invokeId, _whenSendingMessage);
    }

    public async Task RunAndWait()
    {
        Console.WriteLine("Waiting for connection...");
        await _stream.WaitForConnectionAsync();
        Console.WriteLine("Client Connected.");
        _proxy.Start();
    }

    public void SendMessage(string message) =>
        _proxy.SendMessage(message);

    public void SendJsonMessage(object message) =>
        _proxy.SendMessage(JsonSerializer.Serialize(message, _jsonOptions));

    ~PipeServer()
    {
        _stream.Dispose();
        _proxy.Stop();
    }
}
