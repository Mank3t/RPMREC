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
using System.Windows.Shapes;

namespace Para1.Windows
{
    /// <summary>
    /// Логика взаимодействия для Window1.xaml
    /// </summary>
    public partial class Window1 : Window
    {
        public Window1()
        {
            InitializeComponent();
        }

        private void BCloseZayav_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BOtchWinOpen_Click(object sender, RoutedEventArgs e)
        {

            var WinOtchetOpen = new WinOtchety();
            WinOtchetOpen.Show();
        }

        private void BAddWinOpen_Click(object sender, RoutedEventArgs e)
        {
            var WinAddZayav = new WinDobOtchet();
            WinAddZayav.Show();
        }
    }
}
