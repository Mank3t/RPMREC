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

namespace LabN3
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

        private void Решить_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                double x = Convert.ToDouble(TbXEnter.Text);
                double y = Convert.ToDouble(TbYEnter.Text);
                double z = Convert.ToDouble(TbZEnter.Text);
                double fx = 0;
                double Otvet = 0;

                if (RBshx.IsChecked == true)
                {
                    fx = Math.Sinh(x);
                }
                else if (RBex.IsChecked == true)
                {
                    fx = Math.Exp(x);
                }

                else if (RBx2.IsChecked == true)
                {
                    fx = Math.Pow(x, 2);
                }

                if (x * y > 0)
                {
                    Otvet = Math.Pow((fx + y), 2) - Math.Sqrt(fx * y);
                }
                else if (x * y < 0)
                {
                    Otvet = Math.Pow((fx + y), 2) - Math.Sqrt(Math.Abs(fx * y));
                }
                else if (x * y == 0)
                {
                    Otvet = Math.Pow((fx + y), 2) + 1;

                }

                TbOutput.Text = "Лаб.Раб N3. Студентов гр. 22-КИС- 2 \r\n Кузнецова В.А. Дергунова Н.Ю." + "\r\n" + $"x = {x}" + "\r\n" + $"y = {y}" + "\r\n" + $"z = {z}" + "\r\n" + $"Результат = " + Convert.ToString(Otvet);
            }
            catch (Exception err) 
            {
                MessageBox.Show(Convert.ToString(err));
            }
           
        }

        private void Clear_Click(object sender, RoutedEventArgs e)
        {
            TbOutput.Text = "";
            TbXEnter.Text = "";
            TbYEnter.Text = "";
            TbXEnter.Text = "";
            
        }
    }
}
