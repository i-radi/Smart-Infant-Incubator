using System.Collections.Concurrent;
using System.IO.Pipes;
using System.Text;

namespace Pipe;

public class PipeProxy
{
    private readonly Action<string>? _aggregator;

    private readonly BinaryReader? _br;
    private readonly BinaryWriter? _bw;


    private readonly Thread _thread;
    private readonly ConcurrentQueue<string> _queue = new();

    public PipeProxy(NamedPipeServerStream stream, bool isReader, Action<string>? aggregator = null)
    {
        _aggregator = aggregator;

        if (isReader)
        {
            _br = new BinaryReader(stream);
            _thread = new Thread(ReceiveThread);
        }
        else
        {
            _bw = new BinaryWriter(stream);
            _thread = new Thread(SendThread);
        }


    }

    ~PipeProxy()
    {
        _br?.Dispose();
        _bw?.Dispose();
    }

    #region MyRegion

    public void Start() => _thread.Start();

    private void ReceiveThread()
    {
        while (true)
        {
            try
            {
                var str = ReadMessage();
            }
            catch (EndOfStreamException)
            {
                return;
            }
        }
    }

    private void SendThread()
    {
        while (true)
        {
            try
            {
                if (_queue.TryDequeue(out var item) && !string.IsNullOrEmpty(item))
                    WriteMessage(item);
            }
            catch (EndOfStreamException)
            {
                return;
            }
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

        var len = (int) _br.ReadUInt32(); // Read string length
        var str = new string(_br.ReadChars(len)); // Read string
        _aggregator?.Invoke(str);
        return str;
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