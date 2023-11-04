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
    /// Interaction logic for UserControl6.xaml
    /// </summary>
    public partial class UserControl6 : UserControl
    {
        public UserControl6()
        {
            InitializeComponent();
        }
        private void control(object sender, RoutedEventArgs e)
        {
            UserControl10 uc10 = new UserControl10();
            this.Content = uc10;
        }
        private void CryAnalysis(object sender, RoutedEventArgs e)
        {
            UserControl7 uc7 = new UserControl7();
            this.Content = uc7;
        }
    }
}
