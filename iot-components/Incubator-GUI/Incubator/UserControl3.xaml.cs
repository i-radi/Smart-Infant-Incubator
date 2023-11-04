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
    /// Interaction logic for UserControl3.xaml
    /// </summary>
    public partial class UserControl3 : UserControl
    {
        public UserControl3()
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
        private void MotherNameText_GotFocused(object sender, RoutedEventArgs e)
        {
            MotherNameText.Visibility = System.Windows.Visibility.Collapsed;
            MotherName.Visibility = System.Windows.Visibility.Visible;
            MotherName.Focus();
        }
        private void MotherName_LostFocus(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(MotherName.Text))
            {
                MotherName.Visibility = System.Windows.Visibility.Visible;
                MotherNameText.Visibility = System.Windows.Visibility.Visible;
            }
        }
        private void Save(object sender, RoutedEventArgs e)
        {
            UserControl5 uc5 = new UserControl5();
            this.Content = uc5;
        }
        private void Back(object sender, RoutedEventArgs e)
        {
            MainWindow mainWindow = new MainWindow();
            this.Content = mainWindow;
        }
    }
}
