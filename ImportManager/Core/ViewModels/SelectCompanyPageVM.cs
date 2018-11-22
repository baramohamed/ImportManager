using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class SelectCompanyPageVM : BaseVM
    {

        private EntreprisesManager entreprisesManager;

        public SelectCompanyPageVM(EntreprisesManager manager)
        {
            entreprisesManager = manager;
        }

        public List<Importateur> Importateurs {
            get => entreprisesManager.GetImportateurs();
        }

        public Importateur SelectedImportateur { get; set; }

        public RelayCommand SelectImportateur => new RelayCommand(() =>
        {

        });

        public RelayCommand AddImportateur => new RelayCommand(() =>
        {
            
        });

        public RelayCommand EditImportateur => new RelayCommand(() =>
        {

        });

        public RelayCommand DeleteImportateur => new RelayCommand(() =>
        {

        });
    }
}
