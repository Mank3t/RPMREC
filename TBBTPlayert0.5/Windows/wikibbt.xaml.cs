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
    /// Логика взаимодействия для wikibbt.xaml
    /// </summary>
    public partial class wikibbt : Window
    {
        public wikibbt()
        {
            InitializeComponent();
        }



        private void HomePageBackB_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            this.Close();
        }
    }
}
