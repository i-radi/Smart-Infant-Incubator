using System.Windows;
using System.Windows.Controls;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;
using Incubator.Models;
using Incubator.Services;

namespace Incubator;

/// <summary>
/// Interaction logic for UserControl7.xaml
/// </summary>
public partial class UserControl7 : UserControl
{
    private CryAnalysisAction _CAaction;
    private readonly PipeService _pipeService;
    public UserControl7()
    {
        _CAaction = new CryAnalysisAction();
        _pipeService = PipeService.Instance;
        InitializeComponent();
    }

    private void Back(object sender, RoutedEventArgs e)
    {
        UserControl6 uc6 = new();
        Content = uc6;
    }

    private async void NewAnalysis(object sender, RoutedEventArgs e)
    {
        UserControl8 uc8 = new();
        Content = uc8;

        var json = JsonConvert.SerializeObject(_CAaction);
        var data = new StringContent(json, Encoding.UTF8, "application/json");

        var url = "https://localhost:7226/api/IOT/Mic";
        using var client = new HttpClient();

        var response = await client.PostAsync(url, data);

        string result = response.Content.ReadAsStringAsync().Result;


    }
}
    