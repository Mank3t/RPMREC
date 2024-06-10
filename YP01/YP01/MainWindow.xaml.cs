using System;
using System.Collections.Generic;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace YP01
{

    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        private void BColFormChangeRed_Click(object sender, RoutedEventArgs e)
        {
            BColFormChangeRed.Background = new SolidColorBrush(Color.FromRgb(255, 0, 0));
        }

        private void BColFormChangeGreen_Click(object sender, RoutedEventArgs e)
        {
            BColFormChangeGreen.Background = new SolidColorBrush(Color.FromRgb(0, 255, 0));
        }

        private void BColFormChangeBlue_Click(object sender, RoutedEventArgs e)
        {
            BColFormChangeBlue.Background = new SolidColorBrush(Color.FromRgb(0, 0, 255));  
        }
        private void BColFormChangeYellow_Click(object sender, RoutedEventArgs e)
        {
            BColFormChangeYellow.Background = new SolidColorBrush(Color.FromRgb(255, 255, 0));
        }
    }
}
