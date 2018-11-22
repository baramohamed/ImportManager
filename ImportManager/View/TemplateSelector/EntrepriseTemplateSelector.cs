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
    class EntrepriseTemplateSelector : DataTemplateSelector
    {
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            FrameworkElement element = container as FrameworkElement;
            var entreprise = (item as EntrepriseVM).Entreprise;
            if (entreprise is Importateur) return element.FindResource("ImportateurPageDataTemplate") as DataTemplate;
            else if (entreprise is Fournisseur) return element.FindResource("FournisseurPageDataTemplate") as DataTemplate;
            else if (entreprise is Banque) return element.FindResource("BanquePageDataTemplate") as DataTemplate;
            else if (entreprise is Transit) return element.FindResource("TransitPageDataTemplate") as DataTemplate;
            else return element.FindResource("EntreprisePageDataTemplate") as DataTemplate;
        }
    }
}
