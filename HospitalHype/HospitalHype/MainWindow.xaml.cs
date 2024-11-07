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

namespace HospitalHype
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

        private void TBEnter_PreviewKeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                MessageBox.Show("b");
                TextBox tb = sender as TextBox;
                if (tb != null) return ;
                TextBox TBsearch = (TextBox)sender;
                Keyboard.ClearFocus();
                string addStr = " Введите данные";
                if (tb.Text == "")
                {
                    tb.Text = addStr;
                }
            }
        }

        private void TBFocus_GotKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            MessageBox.Show("a");
            TextBox tb = sender as TextBox;
            if (tb != null) return;
            MessageBox.Show("a");
            string tbsearchtext = (tb.Text);
            string clearStr = " Введите данные";
            if (tbsearchtext == clearStr)
            {
                tb.Clear();
            }
        }

    }
}
