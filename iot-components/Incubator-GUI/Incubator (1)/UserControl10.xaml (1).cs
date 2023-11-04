using System.Windows;
using System.Windows.Controls;
using Incubator.Models;
using Incubator.Services;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System;

namespace Incubator;

/// <summary>
/// Interaction logic for UserControl10.xaml
/// </summary>
public partial class UserControl10 : UserControl
{
    private readonly PipeService _pipeService;
    public UserControl10()
    {
        _pipeService = PipeService.Instance;
        InitializeComponent();
    }
    private void TurnOn(object sender, RoutedEventArgs e)
    {
        UserControl12 uc12 = new();
        Content = uc12;
    }
    private void TurnOff(object sender, RoutedEventArgs e)
    {
        _pipeService.SendAsJson(new SensorAction
        {
            UvLamp = "Stop UV"
        });
    }
    private void Back(object sender, RoutedEventArgs e)
    {
        UserControl5 uc5 = new();
        Content = uc5;
    }


    private void Up(object sender, RoutedEventArgs e)
    {
        _pipeService.SendAsJson(new SensorAction
        {
            Motor = "UP"
        });
    }
    private void Down(object sender, RoutedEventArgs e)
    {
        _pipeService.SendAsJson(new SensorAction
        {
            Motor = "DOWN"
        });
    }
    private void decrease_temp(object sender, RoutedEventArgs e)
    {
        int value = Convert.ToInt32(temp.Text);
        temp.Text = $"{value - 1}";


        _pipeService.SendAsJson(new SensorAction
        {
            TempA = Convert.ToInt32(temp.Text)
    }) ;
    }
    private void increase_temp(object sender, RoutedEventArgs e)
    {
        int value = Convert.ToInt32(temp.Text);
        temp.Text = $"{value + 1}";


        _pipeService.SendAsJson(new SensorAction
        {
            TempA = Convert.ToInt32(temp.Text)
        });
    }
}