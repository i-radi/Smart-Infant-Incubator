using System.Windows;
using System.Windows.Controls;
using System.Net.Http;
using Incubator.Models;
using Incubator.Services;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;


namespace Incubator;

/// <summary>
/// Interaction logic for UserControl5.xaml
/// </summary>
public partial class UserControl5 : UserControl
{
    private BabyData _Bdata;
    public UserControl5()
    {
        _Bdata = new BabyData();
        InitializeComponent();
        
 
    }
    BabyData babyData = new BabyData();
    
    public async void GetBabyInformation(BabyData _Bdata)
    {
        
       // var json = JsonConvert.serializeObject(_Bdata);
        //var data = new StringContent(json, Encoding.UTF8, "application/json");
        var url = "http://localhost:5000/api/Babies";
        using var client = new HttpClient();

        var response = await client.GetAsync(url);
        var get_data = response.Content.ReadAsStringAsync();
        babyData = JsonSerializer.Deserialize<BabyData>(get_data.Result);

        Application.Current?.Dispatcher.Invoke(() =>
        {
            //Bcode.Text = babyData.babyCode;
            Bgender.Text = _Bdata.Gender;
            doc.Text = _Bdata.DoctorName;
            nur.Text = _Bdata.NurseName;
            Bdate.Text = _Bdata.BirthDate.ToString("F6");
            //Bmother.Text = babyData.motherId;

        });


    }

    private void BabyHealth(object sender, RoutedEventArgs e)
    {
        GetBabyInformation(_Bdata);
        //UserControl6 uc6 = new();
        //Content = uc6;
    }
    private void Control(object sender, RoutedEventArgs e)
    {
        UserControl10 uc10 = new();
        Content = uc10;
    }  
    private void Delete(object sender, RoutedEventArgs e)
    {
        UserControl9 uc9 = new();
        Content = uc9;
    }
    private void Back(object sender, RoutedEventArgs e)
    {
        UserControl3 uc3 = new();
        Content = uc3;
    }
}