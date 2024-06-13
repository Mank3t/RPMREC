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

namespace WPFLabN4
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            TbAEnter.Text = "-1,25";
            TbBEnter.Text = "-1,5";
            TbCEnter.Text = "0,75";
            TbX0Enter.Text = "-1,5";
            TbXKEnter.Text = "3,5";
            TbDXEnter.Text = "0,5";
        }

        private void Solve_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                TbOutput.Text = "";
                TbOutput.Text = "Работу выполнил Дергунов Н.Ю \r\nгруппа 22-КИС-2 \r\n";
                double a = Convert.ToDouble(TbAEnter.Text);
                double b = Convert.ToDouble(TbBEnter.Text);
                double c = Convert.ToDouble(TbCEnter.Text);
                double x0 = Convert.ToDouble(TbX0Enter.Text);
                double xk = Convert.ToDouble(TbXKEnter.Text);
                double dx = Convert.ToDouble(TbDXEnter.Text);
                double y = 0;

                for (; x0 < xk; x0 += dx )
                {
                    if (x0 == 0)
                    {
                        TbOutput.Text += "деление на ноль при х = 0 \r\n";
                    }
                    else
                    {
                        if (Math.Pow(a,3)*x0 < 0) 
                        {
                            TbOutput.Text += "Неверно. подкоренное выражение (a^3)*x < 0 \r\n";
                        }

                        else 
                        {
                            y = (Math.Pow(10, -2) * b * c) / x0 + Math.Cos(Math.Sqrt(Math.Pow(a, 3) * x0));
                            TbOutput.Text += Convert.ToString("y = " + y + "  " + "x = " + x0 + "\r\n");
                        }
                    }
                    
                }

            }
            catch (Exception err) 
            {
                MessageBox.Show(Convert.ToString(err));
            }
            
            

        }

        private void Clear_Click(object sender, RoutedEventArgs e)
        {
            TbOutput.Text = "";
        }
    }
}

//if ((Math.Pow(a,3)*x0) < 0) 
//{

//}