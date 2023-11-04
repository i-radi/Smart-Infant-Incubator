using System;
using System.Collections.Concurrent;
using System.IO;
using System.IO.Pipes;
using System.Text;
using System.Threading;

namespace Incubator.Pipe;

public class PipeProxy
{
    private readonly Guid _invokeId;
    private readonly Action<string>? _aggregator;

    private readonly BinaryReader? _br;
    private readonly BinaryWriter? _bw;


    private readonly ConcurrentQueue<string> _queue = new();
    private readonly CancellationTokenSource _cts = new();
    private bool _started;

    public delegate void Notify(Guid id);  // delegate

    public event Notify? PoxyStopped; // event

    public PipeProxy(NamedPipeServerStream stream, bool isReader,Guid invokeId, Action<string>? aggregator = null)
    {
        _invokeId = invokeId;
        _aggregator = aggregator;
        if (isReader)
        {
            _br = new(stream);
            ThreadPool.QueueUserWorkItem(ReceiveThread, _cts.Token);
        }
        else
        {
            _bw = new(stream);
            ThreadPool.QueueUserWorkItem(SendThread, _cts.Token);
        }
    }


    public void Stop()
    {
        _br?.Dispose();
        _bw?.Dispose();
        if (_started)
        {
            _cts.Cancel();
            _cts.Dispose();
            _started = false;
        }
    }

    ~PipeProxy()
    {
        Stop();
    }

    #region MyRegion

    public void Start() => _started = true;

    private void ReceiveThread(object? obj)
    {
        var token = (CancellationToken)(obj ?? throw new ArgumentNullException(nameof(obj)));
        try
        {
            while (true)
            {
                if (!_started)
                    Thread.Sleep(150);
                else if (token.IsCancellationRequested)
                    return;
                else
                     ReadMessage();
            }
        }
        catch (EndOfStreamException)
        {
            PoxyStopped?.Invoke(_invokeId);
        }
    }

    private void SendThread(object? obj)
    {
        var token = (CancellationToken)(obj ?? throw new ArgumentNullException(nameof(obj)));
        try
        {
            while (true)
            {
                if (_started)
                {
                    if (token.IsCancellationRequested)
                        return;
                    if (!_bw!.BaseStream.CanWrite)
                        throw new EndOfStreamException();
                    if (_queue.TryDequeue(out var item) && !string.IsNullOrEmpty(item))
                        WriteMessage(item);
                }

                Thread.Sleep(50);
            }
        }
        catch (EndOfStreamException)
        {
            PoxyStopped?.Invoke(_invokeId);
        }
    }

    #endregion Thread Management


    public void SendMessage(string message) =>
        _queue.Enqueue(message);

    private string ReadMessage()
    {
        if (_br is null)
        {
            Console.WriteLine("Something Wrong: br is null");
            return string.Empty;
        }

        try
        {
            var len = (int) _br.ReadUInt32(); // Read string length
            var str = new string(_br.ReadChars(len)); // Read string
            _aggregator?.Invoke(str);
            return str;
        }
        catch (ObjectDisposedException)
        {
            PoxyStopped?.Invoke(_invokeId);
            throw new EndOfStreamException();
        }
    }

    private void WriteMessage(string message)
    {
        if (_bw is null)
        {
            Console.WriteLine("Something Wrong: bw is null");
            return;
        }

        var buf = Encoding.ASCII.GetBytes(message); // Get ASCII byte array
        try
        {
            _bw.Write((uint) buf.Length); // Write string length
            _bw.Write(buf); // Write string
            _aggregator?.Invoke(message);
        }
        catch (ObjectDisposedException)
        {
            PoxyStopped?.Invoke(_invokeId);
            throw new EndOfStreamException();
        }
        catch (IOException)
        {
            Console.WriteLine("Pipe is Closed");
            throw new EndOfStreamException();
        }
        catch (Exception e)
        {
            Console.WriteLine("Undefined Error {0}", e);
        }
    }
}