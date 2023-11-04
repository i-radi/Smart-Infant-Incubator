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
    /// Interaction logic for UserControl5.xaml
    /// </summary>
    public partial class UserControl5 : UserControl
    {
        public UserControl5()
        {
            InitializeComponent();
        }
        private void BabyHealth(object sender, RoutedEventArgs e)
        {
            UserControl6 uc6 = new UserControl6();
            this.Content = uc6;
        }
        private void Control(object sender, RoutedEventArgs e)
        {
            UserControl10 uc10 = new UserControl10();
            this.Content = uc10;
        }
        
        private void Delete(object sender, RoutedEventArgs e)
        {
            UserControl9 uc9 = new UserControl9();
            this.Content = uc9;
        }
    }
}
