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
    class OperationTemplateSelector : DataTemplateSelector
    {
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            FrameworkElement element = container as FrameworkElement;
            OperationVM facture = item as OperationVM;
            if (facture is NegociationPageVM) return element.FindResource("NegociationPageDataTemplate") as DataTemplate;
            else if (facture is DomiciliationPageVM) return element.FindResource("DomiciliationPageDataTemplate") as DataTemplate;
            else if (facture is DedouanementPageVM) return element.FindResource("DedouanementPageDataTemplate") as DataTemplate;
            else if (facture is CloturationPageVM) return element.FindResource("CloturationPageDataTemplate") as DataTemplate;
            else if (facture is BilanPageVM) return element.FindResource("BilanPageDataTemplate") as DataTemplate;
            return new DataTemplate();
        }
    }
}
