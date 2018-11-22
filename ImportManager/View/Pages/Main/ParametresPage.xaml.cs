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
    /// Interaction logic for ParametresPage.xaml
    /// </summary>
    public partial class ParametresPage : UserControl
    {
        public ParametresPage()
        {
            InitializeComponent();
        }

        private void ListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var listview = sender as ListView;
            switch (listview.SelectedIndex)
            {
                case 0:
                    Content.Content = new EntreprisesPage();
                    break;
                case 1:
                    Content.Content = new CatalogueParametresPage();
                    break;
                case 2:
                    Content.Content = new UtilisateursPage();
                    break;
                case 3:
                    Content.Content = new ParametresAvancesPage();
                    break;
            }
        }
    }
}
