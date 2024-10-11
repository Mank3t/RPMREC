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
    /// Логика взаимодействия для WinUserLogin.xaml
    /// </summary>
    public partial class WinUserLogin : Window
    {
        public WinUserLogin()
        {
            InitializeComponent();
            
            
        }

        private void EnterBut_Click(object sender, RoutedEventArgs e)
        {
            
            WinUserPassword OpenUserPassword = new WinUserPassword();
            OpenUserPassword.ShowDialog();
            if (OpenUserPassword.DialogResult == true) 
            {
            this.Close();
            }


        }

        private void BackBut_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void BCloseRegWin_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();

        }

        private void BRegistr_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
