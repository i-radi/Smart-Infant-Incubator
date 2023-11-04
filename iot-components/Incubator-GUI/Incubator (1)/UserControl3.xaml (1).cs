using Newtonsoft.Json;
using System.Net.Http;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using Incubator.Models;
using Incubator.Services;
using System;

namespace Incubator;

/// <summary>
/// Interaction logic for UserControl3.xaml
/// </summary>
public partial class UserControl3 : UserControl
{
    private babyInformationAction _BIaction;
    public UserControl3()
    {
        _BIaction = new babyInformationAction();
        InitializeComponent();
    }
    private void BabyCodeText_GotFocused(object sender, RoutedEventArgs e)
    {
        BabyCodeText.Visibility = Visibility.Collapsed;
        BabyCode.Visibility = Visibility.Visible;
        BabyCode.Focus();
    }
    private void BabyCode_LostFocus(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrEmpty(BabyCode.Text))
        {
            BabyCode.Visibility = Visibility.Visible;
            BabyCodeText.Visibility = Visibility.Visible;
        }
    }
    /*private void MotherNameText_GotFocused(object sender, RoutedEventArgs e)
    {
        MotherNameText.Visibility = Visibility.Collapsed;
        MotherName.Visibility = Visibility.Visible;
        MotherName.Focus();
    }
    private void MotherName_LostFocus(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrEmpty(MotherName.Text))
        {
            MotherName.Visibility = Visibility.Visible;
            MotherNameText.Visibility = Visibility.Visible;
        }
    }*/
    public void Save(object sender, RoutedEventArgs e)
    {


        UserControl5 uc5 = new();
        Content = uc5;


        string Bdate = $"{Byear}+{Bmonth}+{Bday}";
        SendBabyInformation(new babyInformationAction
        {
            babyCode = BabyCodeText.Text,
            gender = Gender_type.Text,
            birthDate = Bdate,
            doctorId = doc.Text,
            nurseId = nur.Text,
            
        });
        
    }

    public async void SendBabyInformation(babyInformationAction babyInformationAction)
    {


        var json = JsonConvert.SerializeObject(_BIaction);
        var data = new StringContent(json, Encoding.UTF8, "application/json");

        var url = "https://localhost:7226/api/Babies";
        using var client = new HttpClient();

        var response = await client.PostAsync(url, data);

        //string result = response.Content.ReadAsStringAsync().Result;

        
    }


}
