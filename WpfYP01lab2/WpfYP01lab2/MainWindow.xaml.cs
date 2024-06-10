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

namespace WpfYP01lab2
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            TbXEnter.Text = "14,26";
            TbYEnter.Text = "-1,22";
            TbZEnter.Text = "0,035";
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            TBResShow.Text = "";
            double X = double.Parse(TbXEnter.Text) ;
            double Y = double.Parse(TbYEnter.Text) ;
            double Z = double.Parse(TbZEnter.Text) ;

            double a = 2 * Math.Cos(X - (Math.PI/6));
            double b = 0.5 + ((1 - Math.Cos(2 * Y)) / 2);
            double c = 1 + (Math.Pow(Z,2)/(3 - (Math.Pow(Z,2)/5)) );
            double Result = (a/b) * c;
            TBResShow.Text =  "X = " + X.ToString();
            TBResShow.Text += Environment.NewLine + "Y = " + Y.ToString();
            TBResShow.Text += Environment.NewLine + "Z = " + Z.ToString();

            TBResShow.Text += Environment.NewLine + "Ответ: " + $"{Result.ToString():N4}";
        }
    }
}
