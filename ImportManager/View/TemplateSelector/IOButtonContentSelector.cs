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
    public class IOButtonContentSelector : DataTemplateSelector
    {
        public override DataTemplate SelectTemplate(object item, DependencyObject container)
        {
            FrameworkElement element = container as FrameworkElement;
            BaseVM facture = item as BaseVM;
            if (facture is CommandeVM)
            {
                var r = Application.Current.FindResource("PrinterIcon") as DataTemplate;
                return r;
            }
            else return Application.Current.FindResource("PaperClipIcon") as DataTemplate;
        }
    }
}
