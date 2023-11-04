using System.Windows;
using Incubator.Services;
using Newtonsoft.Json;
using System.Net.Http;

namespace Incubator;

/// <summary>
/// Interaction logic for MainWindow.xaml
/// </summary>
public partial class MainWindow : Window
{
    public MainWindow()
    {
        InitializeComponent();
            
    }
    private async void AddBabyCode(object sender, RoutedEventArgs e)
    {
        Content = new UserControl3();
    } 
}