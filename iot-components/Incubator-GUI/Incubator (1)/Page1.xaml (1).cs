using System.Windows;
using System.Windows.Controls;

namespace Incubator;

/// <summary>
/// Interaction logic for Page1.xaml
/// </summary>
public partial class Page1 : Page
{
    public Page1()
    {
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
    private void DayText_GotFocused(object sender, RoutedEventArgs e)
    {
        DayText.Visibility = Visibility.Collapsed;
        Day.Visibility = Visibility.Visible;
        Day.Focus();
    }
    private void Day_LostFocus(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrEmpty(Day.Text))
        {
            Day.Visibility = Visibility.Visible;
            DayText.Visibility = Visibility.Visible;
        }
    }

    private void MonthText_GotFocused(object sender, RoutedEventArgs e)
    {
        MonthText.Visibility = Visibility.Collapsed;
        Month.Visibility = Visibility.Visible;
        Month.Focus();
    }
    private void Month_LostFocus(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrEmpty(Day.Text))
        {
            Month.Visibility = Visibility.Visible;
            MonthText.Visibility = Visibility.Visible;
        }
    }

    private void YearText_GotFocused(object sender, RoutedEventArgs e)
    {
        YearText.Visibility = Visibility.Collapsed;
        Year.Visibility = Visibility.Visible;
        Year.Focus();
    }
    private void Year_LostFocus(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrEmpty(Day.Text))
        {
            Year.Visibility = Visibility.Visible;
            YearText.Visibility = Visibility.Visible;
        }
    }

    private void MotherNameText_GotFocused(object sender, RoutedEventArgs e)
    {
        MotherNameText.Visibility = Visibility.Collapsed;
        MotherName.Visibility = Visibility.Visible;
        MotherName.Focus();
    }
    private void MotherName_LostFocus(object sender, RoutedEventArgs e)
    {
        if (string.IsNullOrEmpty(Day.Text))
        {
            MotherName.Visibility = Visibility.Visible;
            MotherNameText.Visibility = Visibility.Visible;
        }
    }
    private void Save(object sender, RoutedEventArgs e)
    {
        Page5 page5 = new();
        Content = page5;
    }

}