﻿using System;
using System.Collections.Generic;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using TBBTPlayert0._5.Windows;

namespace TBBTPlayert0._5
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {

        

        public MainWindow()
        {
            InitializeComponent();

            WinUserLogin OpenUserLogin = new WinUserLogin();
            OpenUserLogin.ShowDialog();
        }

            
        

        private void TBSearch_TextChanged(object sender, TextChangedEventArgs e)
        {

        }

        private void RctOpenS1Ser1_MouseDown(object sender, MouseButtonEventArgs e)
        {
            WinPlayer OpenWinPlayer = new WinPlayer();
            OpenWinPlayer.Show();


            
        }

        private void ToggleDropdown(object sender, System.Windows.Input.MouseButtonEventArgs e)
        {
            if (PPPUserImage.IsOpen)
            {
                PPPUserImage.IsOpen = false;
            }
            else
            {
                PPPUserImage.IsOpen = true;
            }
        }



        private void TBSearch_PreviewKeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                TextBox TBsearch = (TextBox)sender;
                Keyboard.ClearFocus();
                string addStr = " Найти серию";
                if (TBSearch.Text == "")
                {
                    TBSearch.Text = addStr;
                }
            }
        }

        private void TBSearch_GotKeyboardFocus(object sender, KeyboardFocusChangedEventArgs e)
        {
            string tbsearchtext = (TBSearch.Text);
            string clearStr = " Найти серию";
            if (tbsearchtext == clearStr)
            {
                TBSearch.Clear();
            }
        }

        private void ElExitMainwindow_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void LWikiOpen_MouseLeftButtonUp(object sender, MouseButtonEventArgs e)
        {
            this.Hide();
            wikibbt WikiTbbtOp = new wikibbt();
            WikiTbbtOp.ShowDialog();
            this.Show();
        }
    }
}