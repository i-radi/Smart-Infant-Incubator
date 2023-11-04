using System.IO.Pipes;
using System.Text.Json;

namespace Pipe;

public class PipeServer
{
    private const string PipeName = "CSToPython";
    private readonly NamedPipeServerStream _stream;
    private readonly PipeProxy _proxy;

    private readonly JsonSerializerOptions _jsonOptions = new()
    {
        PropertyNamingPolicy = JsonNamingPolicy.CamelCase
    };

    public PipeServer(Action<string>? whenSendingMessage = null)
    {
        _stream = new NamedPipeServerStream(PipeName);
        _proxy = new PipeProxy(_stream, false, whenSendingMessage);
    }

    public void RunAndWait()
    {
        Console.WriteLine("Waiting for connection...");
        _stream.WaitForConnection();
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
    }
}