using System.Windows;
using System.Windows.Controls;
using System.Net.Http;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Text;
using Incubator.Models;
using Incubator.Services;
using System;
using System.Text.Json.Serialization;
using System.IO;
using System.Net;
using System.Runtime.Serialization;
using System.Collections.Generic;
using System.Linq;


namespace Incubator;

/// <summary>
/// Interaction logic for UserControl8.xaml
/// </summary>
public partial class UserControl8 : UserControl
{
    private CryAnalysisData _data;
    private readonly PipeService _pipeService;
    public UserControl8()
    {
        _data = new CryAnalysisData(); 
        _pipeService = PipeService.Instance;
        InitializeComponent();

        cryAnalysisResult(_data);

    }
    public void cryAnalysisResult(CryAnalysisData data)
    {
        

        Application.Current?.Dispatcher.Invoke(() =>
        {
            hungry.Text = data.hungry.ToString("F6");
            belly_pain.Text = data.belly_pain.ToString("F6");
            burping.Text = data.burping.ToString("F6");
            discomfort.Text = data.discomfort.ToString("F6");
        });
    }
    private void Back(object sender, RoutedEventArgs e)
    {
        UserControl7 uc7 = new();
        Content = uc7;
    }
}