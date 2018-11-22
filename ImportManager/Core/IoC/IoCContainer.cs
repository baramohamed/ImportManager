using Ninject;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public static class IoCContainer
    {
        public static IKernel Kernel { get; private set; } = new StandardKernel();

        public static T Get<T>()
        {
            return Kernel.Get<T>();
        }
    }
}
