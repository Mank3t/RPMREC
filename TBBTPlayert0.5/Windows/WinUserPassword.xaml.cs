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

namespace TBBTPlayert0._5.Windows
{
    /// <summary>
    /// Логика взаимодействия для WinUserPassword.xaml
    /// </summary>
    public partial class WinUserPassword : Window
    {
        public WinUserPassword()
        {
            InitializeComponent();
        }


        private void EnterBut_Click(object sender, RoutedEventArgs e)
        {
            this.DialogResult = true;
            this.Close();
           
        }

        private void BClosePasRegWin_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void BackBut_Click(object sender, RoutedEventArgs e)
        {
            DialogResult = false;
        }
    }
}
