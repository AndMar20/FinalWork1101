using System.Windows;
﻿using ExamWork.Pages;

namespace FragrandWorldApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            App.CurrentFrame = MainFrame;
            MainFrame.Navigate(new AuthorizationPage());
        }
    }
}
