﻿using ImportManager.Core;
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

namespace ImportManager.View
{
    /// <summary>
    /// Interaction logic for ParametresAvancesPage.xaml
    /// </summary>
    public partial class ParametresAvancesPage : UserControl
    {
        public ParametresAvancesPage()
        {
            InitializeComponent();
            DataContext = new ParametresAvancesPageVM();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            InitDB.Init();
        }
    }
}
