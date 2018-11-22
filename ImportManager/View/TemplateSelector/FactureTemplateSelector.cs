using ImportManager.Core;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;

namespace ImportManager.View
{
    class FactureTemplateSelector : DataTemplateSelector
    {
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            FrameworkElement element = container as FrameworkElement;
            BaseVM facture = item as BaseVM;
            if (facture is FactureProformaVM) return element.FindResource("FactureProformaDataTemplate") as DataTemplate;
            else if (facture is CommandeVM) return element.FindResource("CommandeDataTemplate") as DataTemplate;
            else return element.FindResource("OffreDataTemplate") as DataTemplate;
        }
    }
}
