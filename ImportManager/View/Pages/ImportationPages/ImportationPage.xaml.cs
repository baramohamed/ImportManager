using ImportManager.Core;
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
    /// Interaction logic for ImportationPage.xaml
    /// </summary>
    public partial class ImportationPage : UserControl
    {
        public ImportationPage()
        {
            InitializeComponent();
            
        }

        private void ShowEntreprises(object sender, RoutedEventArgs e)
        {
            Window Entreprises = new Window();
            Entreprises.Content = new EntreprisesPage();
            Entreprises.DataContext = new EntreprisesPageVM();
            Entreprises.Show();
        }

    }
}
