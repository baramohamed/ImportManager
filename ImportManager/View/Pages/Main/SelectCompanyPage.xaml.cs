using ImportManager.Core;
using Model;
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
    /// Interaction logic for SelectCompanyPage.xaml
    /// </summary>
    public partial class SelectCompanyPage : Window
    {
        public SelectCompanyPage()
        {
            InitializeComponent();
            var importateurs = IoCContainer.Get<ModelContainer>().Entreprises.Where(e => e is Importateur).ToList();
            Importateurs.ItemsSource = importateurs;
        }

        private void Select_Importateur(object sender, RoutedEventArgs e)
        {
            var importateur = ((Button) sender).DataContext as Importateur;
            IoCContainer.Kernel.Bind<Importateur>().ToConstant(importateur);
            Application.Current.MainWindow.Hide();
            new MainWindow().Show();
        }

        private void Add_Importateur(object sender, RoutedEventArgs e)
        {

        }
    }
}
