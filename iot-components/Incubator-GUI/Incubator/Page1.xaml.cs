using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Incubator
{
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
            BabyCodeText.Visibility = System.Windows.Visibility.Collapsed;
            BabyCode.Visibility = System.Windows.Visibility.Visible;
            BabyCode.Focus();
        }
        private void BabyCode_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(BabyCode.Text))
            {
                BabyCode.Visibility = System.Windows.Visibility.Visible;
                BabyCodeText.Visibility = System.Windows.Visibility.Visible;
            }
        }
        private void DayText_GotFocused(object sender, RoutedEventArgs e)
        {
            DayText.Visibility = System.Windows.Visibility.Collapsed;
            Day.Visibility = System.Windows.Visibility.Visible;
            Day.Focus();
        }
        private void Day_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Day.Text))
            {
                Day.Visibility = System.Windows.Visibility.Visible;
                DayText.Visibility = System.Windows.Visibility.Visible;
            }
        }

        private void MonthText_GotFocused(object sender, RoutedEventArgs e)
        {
            MonthText.Visibility = System.Windows.Visibility.Collapsed;
            Month.Visibility = System.Windows.Visibility.Visible;
            Month.Focus();
        }
        private void Month_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Day.Text))
            {
                Month.Visibility = System.Windows.Visibility.Visible;
                MonthText.Visibility = System.Windows.Visibility.Visible;
            }
        }

        private void YearText_GotFocused(object sender, RoutedEventArgs e)
        {
            YearText.Visibility = System.Windows.Visibility.Collapsed;
            Year.Visibility = System.Windows.Visibility.Visible;
            Year.Focus();
        }
        private void Year_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Day.Text))
            {
                Year.Visibility = System.Windows.Visibility.Visible;
                YearText.Visibility = System.Windows.Visibility.Visible;
            }
        }

        private void MotherNameText_GotFocused(object sender, RoutedEventArgs e)
        {
            MotherNameText.Visibility = System.Windows.Visibility.Collapsed;
            MotherName.Visibility = System.Windows.Visibility.Visible;
            MotherName.Focus();
        }
        private void MotherName_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(Day.Text))
            {
                MotherName.Visibility = System.Windows.Visibility.Visible;
                MotherNameText.Visibility = System.Windows.Visibility.Visible;
            }
        }
        private void Save(object sender, RoutedEventArgs e)
        {
            Page5 page5 = new Page5();
            this.Content = page5;
        }

    }
}
