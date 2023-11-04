using System;
using System.IO.Pipes;
using System.Threading.Tasks;

namespace Incubator.Pipe;

public class PipeClient
{
    private readonly Action<string>? _whenReceiveMessage;
    private const string PipeName = "PythonToCS";
    private NamedPipeServerStream _stream;
    private PipeProxy _proxy;
    private Guid _invokeId;

    public PipeClient(Action<string>? whenReceiveMessage = null)
    {
        _whenReceiveMessage = whenReceiveMessage;
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
        _proxy = new(_stream, true, _invokeId, _whenReceiveMessage);
    }

    public async Task RunAndWait()
    {
        Console.WriteLine("Trying to connect server...");
        await _stream.WaitForConnectionAsync();
        Console.WriteLine("Connected with the server");
        _proxy.Start();
    }

    ~PipeClient()
    {
        _stream.Dispose();
        _proxy.Stop();
    }
}