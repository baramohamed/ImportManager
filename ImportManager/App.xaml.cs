using ImportManager.Core;
using Model;
using Ninject;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System.Windows;

namespace ImportManager
{
    /// <summary>
    /// Interaction logic for App.xaml
    /// </summary>
    public partial class App : Application
    {
        public App() : base()
        {
            var kernel = IoCContainer.Kernel;
            var container = new ModelContainer();
            kernel.Bind<ModelContainer>().ToConstant(container);
            Parametres.Init();
        }
    }
}
