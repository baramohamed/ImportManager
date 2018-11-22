using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{

    public class ImportationsPageVM : BaseVM
    {

        #region Private Members

        private ImportationPageVM _selectedImportation;

        private bool _isImportationSelected = false;

        private bool _isImportationsListVisible = true;

        #endregion

        #region Constructor

        public ImportationsPageVM()
        {
            InitCommands();
        }

        #endregion


        #region Private Helpers

        private void InitCommands()
        {
            ShowImportation = new RelayCommand(() =>
            {
                IsImportationsListVisible = false;
                IsImportationSelected = true;
            });

            HideImportation = new RelayCommand(() =>
            {
                IsImportationSelected = false;
                IsImportationsListVisible = true;
            });

            AddImportation = new RelayCommand(() =>
            {
                var container = IoCContainer.Get<ModelContainer>();
                container.Importations.Add(new Importation() { DateCreation = DateTime.Today , D10 = new TaxeDouanier() { NumD10 = "D10-02" } });
                container.SaveChanges();
                OnPropertyChanged(nameof(Importations));
            });

            DeleteImportation = new RelayCommand(() =>
            {
                var container = IoCContainer.Get<ModelContainer>();
                container.TaxeDouaniers.Remove(SelectedImportation.Importation.D10);
                container.Importations.Remove(SelectedImportation.Importation);
                container.SaveChanges();
                OnPropertyChanged(nameof(Importations));
            });
        }

        #endregion


        #region Public Properties

        public ObservableCollection<ImportationPageVM> Importations
        {
            get
            {
                var container = IoCContainer.Get<ModelContainer>();
                return new ObservableCollection<ImportationPageVM>(container.Importations.ToList().Select(i => new ImportationPageVM(i)));
            }
        }

        public ImportationPageVM SelectedImportation
        {
            get
            {
                return _selectedImportation;
            }
            set
            {
                _selectedImportation = value;
                OnPropertyChanged(nameof(SelectedImportation));
                IoCContainer.Kernel.Unbind<Importation>();
                if (value != null) IoCContainer.Kernel.Bind<Importation>().ToConstant(value.Importation);
            }
        }

        public bool IsImportationSelected
        {
            get { return _isImportationSelected; }
            set
            {
                _isImportationSelected = value;
                OnPropertyChanged(nameof(IsImportationSelected));
            }
        }

        public bool IsImportationsListVisible
        {
            get { return _isImportationsListVisible; }
            set
            {
                _isImportationsListVisible = value;
                OnPropertyChanged(nameof(IsImportationsListVisible));
            }
        }

        #endregion

        #region Public Commands

        public RelayCommand ShowImportation
        {
            get;
            set;
        }

        public RelayCommand HideImportation
        {
            get;
            set;
        }

        public RelayCommand AddImportation { get; set; }

        public RelayCommand DeleteImportation { get; set; }

        #endregion

    }
}
