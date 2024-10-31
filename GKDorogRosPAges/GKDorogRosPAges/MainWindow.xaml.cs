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

namespace GKDorogRosPAges
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            NavigWin.Content = new CalendarPage();
        }

        private void CalendButtOp_Click(object sender, RoutedEventArgs e)
        {

            NavigWin.Content = new CalendarPage();

        }

        private void IerarhyButtOp_Click(object sender, RoutedEventArgs e)
        {
            NavigWin.Content = new Ierarhy();
        }
    }
}
