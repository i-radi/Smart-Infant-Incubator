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
/// Interaction logic for UserControl12.xaml
/// </summary>
public partial class UserControl12 : UserControl
{
    private readonly PipeService _pipeService;
    public UserControl12()
    {
        _pipeService = PipeService.Instance;
        InitializeComponent();
    }

    public void increase_hour(object sender, RoutedEventArgs e)
    {
        int UValue = Convert.ToInt32(UvHour.Text);
        UvHour.Text = $"{UValue + 1}";


       
    }
    public void decrease_hour(object sender, RoutedEventArgs e)
    {
        int UValue = Convert.ToInt32(UvHour.Text);
        UvHour.Text = $"{UValue - 1}";
    }

    public void increase_minute(object sender, RoutedEventArgs e)
    {
        int UValues = Convert.ToInt32(UvMinutes.Text);
        UvMinutes.Text = $"{UValues + 1}";
    }
    public void decrease_minute(object sender, RoutedEventArgs e)
    {
        int UValues = Convert.ToInt32(UvMinutes.Text);
        UvMinutes.Text = $"{UValues - 1}";


        
    }

    private void start(object sender, RoutedEventArgs e)
    {
        UserControl10 uc10 = new();
        Content = uc10;

        _pipeService.SendAsJson(new SensorAction
        {
            UvLamp = "Start UV"
        }) ;
    }
}