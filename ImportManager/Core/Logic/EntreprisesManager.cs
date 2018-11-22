using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class EntreprisesManager
    {
        private ModelContainer container => IoCContainer.Get<ModelContainer>();

        public List<Importateur> GetImportateurs()
        {
            return container.Entreprises.Where(e => e is Importateur).Select(i => i as Importateur).ToList();
        }

        public void AddImportateur(Importateur importateur)
        {

        }

        public void DeleteImportateur(Importateur importateur)
        {

        }

        public void SetImportateur(Importateur importateur)
        {

        }
    }
}
