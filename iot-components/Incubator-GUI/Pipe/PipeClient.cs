using System.IO.Pipes;

namespace Pipe;

public class PipeClient
{
    private const string PipeName = "PythonToCS";
    private readonly NamedPipeServerStream _stream;
    private readonly PipeProxy _proxy;
    public PipeClient(Action<string>? whenReceiveMessage = null)
    {
        _stream = new NamedPipeServerStream(PipeName);
        _proxy = new PipeProxy(_stream, true, whenReceiveMessage);
    }

    public void RunAndWait()
    {
        Console.WriteLine("Trying to connect server...");
        _stream.WaitForConnection();
        Console.WriteLine("Connected with the server");
        _proxy.Start();
    }

    ~PipeClient()
    {
        _stream.Dispose();
    }
}