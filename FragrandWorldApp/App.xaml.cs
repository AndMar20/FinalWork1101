﻿using System.Configuration;
using System.Data;
using System.Windows;
using System.Windows.Controls;

namespace FragrandWorldApp
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public static Frame CurrentFrame { get; set; }
    }

}