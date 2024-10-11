using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.Windows.Threading;
namespace TBBTPlayert0._5.Windows
{
    /// <summary>
    /// Логика взаимодействия для WinPlayer.xaml
    /// </summary>
    public partial class WinPlayer : Window
    {
        DispatcherTimer timer;
        public WinPlayer()
        {
            InitializeComponent();
            timer = new DispatcherTimer();
            timer.Interval = TimeSpan.FromMilliseconds(500);
        }

        void timer_Tick(object sender, RoutedEventArgs e)
        {
            PlayerControl.Value =  PlayerMedia.Position.TotalSeconds;
        }


        public string VideoChanger = null;// Переменная для серий


        int PlayerWork = 0;

        private void PausePlayBut_Click(object sender, RoutedEventArgs e)
        {
            //Переменная которая меняет паузу и пуск
            if (PlayerWork == 0)
            {
                PlayerMedia.Pause();
                PausePlayBut.Content = "❚❚";
                PlayerWork = 1;

            }
            else if (PlayerWork == 1)
            {

                PausePlayBut.Content = "▶";
                PlayerMedia.Play();
                PlayerWork = 0;
            }
        }

        private void valueSli_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            PlayerMedia.Volume = valueSli.Value;
        }

        private void PlayerControl_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            PlayerMedia.Position = TimeSpan.FromSeconds(PlayerControl.Value); 
        }

 

        private void MediaOpened(object sender, RoutedEventArgs e)
        {
            TimeSpan ts = TimeSpan.FromSeconds(PlayerMedia.Volume);
            PlayerControl.Maximum = ts.TotalSeconds;
        }

   
    }
}
