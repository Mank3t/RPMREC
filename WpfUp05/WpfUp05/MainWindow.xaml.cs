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

namespace WpfUp05
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

        private void Window_MouseLeftButtonUp(object sender, MouseButtonEventArgs e) //при подняиии леврй кнопокой мыши
        {
            Point CursorPos = Mouse.GetPosition(this); // получить позицию мыши (x,y)
            Button b = new Button(); // создание нового класса кнопки b
            b.Height = 50; // задание высоты и ширины
            b.Width = 100;           
            Canvas.SetLeft(b, CursorPos.X); // установка координаты кнопки (canvas использует не пиксели а dpi Каждая такая единица равна 1 /96 дюйма, и при стандартной установке в 96 dpi эта независимая от устройства единица будет равна физическому пикселю, так как 1/96 дюйма * 96 dpi (96 точек на дюйм) = 1.
            Canvas.SetTop(b, CursorPos.Y);
            CanvBG.Children.Add(b); // создание дочерней кнопки на canvas

        }
    }
}
