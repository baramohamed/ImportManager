using ImportManager.Core;
using ImportManager.View;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.NetworkInformation;
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

namespace ImportManager
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            try
            {
                InitializeComponent();
                var container = IoCContainer.Get<ModelContainer>();
                this.DataContext = new MainWindowVM();
                var interfaces = NetworkInterface.GetAllNetworkInterfaces().Where(i => i.NetworkInterfaceType == NetworkInterfaceType.Ethernet);
                if (interfaces.Where(i => 
                {
                    var adr = i.GetPhysicalAddress().ToString();
                    return (adr == "F04DA226677F" || adr == "F0BCC864C305" || adr== "3065EC9431BD");
                })
                .Count() == 0)
                {
                    MessageBox.Show("Version Non Enregistrée");
                    Application.Current.Shutdown();
                }
                //MessageBox.Show(NetworkInterface.GetAllNetworkInterfaces().SingleOrDefault(i => i.NetworkInterfaceType == NetworkInterfaceType.Ethernet).GetPhysicalAddress().ToString());
            }
            catch (Exception e)
            {
                MessageBox.Show(e.Message + "\n" + e.StackTrace);
                MessageBox.Show(e.InnerException.Message);
            }

        }

        private void TabablzControl_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var tab = sender as Dragablz.TabablzControl;
            (tab.SelectedItem as TabItem).UpdateLayout();
        }

        private void ListView_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            var listview = sender as ListView;
            switch (listview.SelectedIndex)
            {
                case 0:
                    Content.Content = new HomePage();
                    break;
                case 1:
                    Content.Content = new ImportationsPage();
                    break;
                case 2:
                    Content.Content = new CataloguePage();
                    break;
                case 3:
                    Content.Content = new EcheancesPage();
                    break;
                case 4:
                    Content.Content = new ParametresPage();
                    break;
            }
                

        }
    }
}
