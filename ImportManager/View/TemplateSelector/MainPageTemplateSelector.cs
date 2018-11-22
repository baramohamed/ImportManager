using ImportManager.Core;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace ImportManager.View
{
    class MainPageTemplateSelector : DataTemplateSelector
    {
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            FrameworkElement element = container as FrameworkElement;
            if (item is ImportationsPageVM) return element.FindResource("ImportateurPageDataTemplate") as DataTemplate;
            else if (item is CataloguePageVM) return element.FindResource("FournisseurPageDataTemplate") as DataTemplate;
            else if (item is Banque) return element.FindResource("BanquePageDataTemplate") as DataTemplate;
            else if (item is Transit) return element.FindResource("TransitPageDataTemplate") as DataTemplate;
            else return element.FindResource("EntreprisePageDataTemplate") as DataTemplate;
        }
    }
}
