namespace Pipe.Models;

public class SensorData
{
    public string weightSens { get; set; }= null!;
    public float heartRate { get; set; }
    public float temp { get; set; }
    public float humi { get; set; }
    //public List<int> tempHumi { get; set; } = null!;
}
public class SensorAction
{
    public int TempA { get; set; }
    public string uvLamp { get; set; }= null!;
    public string Motor { get; set; }= null!;
    
}