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
    /// Interaction logic for UserControl10.xaml
    /// </summary>
    public partial class UserControl10 : UserControl
    {
        public UserControl10()
        {
            InitializeComponent();
        }
        private void TurnOn(object sender, RoutedEventArgs e)
        {
            UserControl12 uc12 = new UserControl12();
            this.Content = uc12;
        }
    }
}
