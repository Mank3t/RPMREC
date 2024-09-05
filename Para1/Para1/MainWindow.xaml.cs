using Para1.Windows;
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

namespace Para1
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BAuthClick(object sender, RoutedEventArgs e)
        {
            var WinVhod = new Window1();
            WinVhod.Show();
            this.Close();
            //if ()
            //{
            //    if ()
            //    {
            //        if ()
            //        {

            //        }
            //        else 
            //        { 

            //        }
            //    }
            //    else 
            //    { 

            //    }
            //}
            //else 
            //{ 

            //}
        }
    }
}
