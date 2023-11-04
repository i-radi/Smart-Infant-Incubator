using System;
using System.Windows;
using System.Windows.Controls;
using Incubator.Models;
using Incubator.Services;


namespace Incubator;

/// <summary>
/// Interaction logic for UserControl6.xaml
/// </summary>
public partial class UserControl6 : UserControl
{
    private readonly PipeService _pipeService;
    public UserControl6()
    {
        _pipeService = PipeService.Instance;
        InitializeComponent();

        _pipeService.AddJsonReceiver<SensorData>(DataReceivedFromPython);
    }

    private void DataReceivedFromPython(SensorData data)
    {
        Application.Current?.Dispatcher.Invoke(() =>
        {
            lbl_Temp.Text = data.Temp.ToString("####");
            lbl_Humidity.Text = data.Humi.ToString("####");
            lbl_HeartBeat.Text = data.HeartRate.ToString("F");
            lbl_Weight.Text = data.WeightSens;
        });
       
    }
    private void Control(object sender, RoutedEventArgs e)
    {
        _pipeService.RemoveJsonReceiver<SensorData>();
        UserControl10 uc10 = new();
        Content = uc10;
    }
    private void CryAnalysis(object sender, RoutedEventArgs e)
    {
        _pipeService.RemoveJsonReceiver<SensorData>();
        UserControl7 uc7 = new();
        Content = uc7;
    }
    private void Back(object sender, RoutedEventArgs e)
    {
        _pipeService.RemoveJsonReceiver<SensorData>();
        UserControl5 uc5 = new();
        Content = uc5;
    }




}