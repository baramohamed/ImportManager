using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class FactureFraisVM : BaseVM
    {
        private FraisVM _selectedFraisDeclare;
        private FraisVM _selectedFraisNonDeclare;
        #region Constructor

        public FactureFraisVM()
        {

            #region Initialisation Divers

            AddFraisDeclare = new RelayCommand(() =>
            {
                IoCContainer.Get<Importation>().FraisDivers.Add(new FactureDeclaree() { NumFacture = "FraisD01" });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisDeclare));
                OnPropertyChanged(nameof(TotalFraisDeclare));
            });

            AddFraisNonDeclare = new RelayCommand(() =>
            {
                IoCContainer.Get<Importation>().FraisDivers.Add(new FactureNonDeclaree() { NumFacture = "FraisND01" });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisNonDeclare));
                OnPropertyChanged(nameof(TotalFraisNonDeclare));
            });

            DeleteFraisDeclare = new RelayCommand(() =>
            {
                IoCContainer.Get<Importation>().FraisDivers.Remove(SelectedFraisDeclare.Facture);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisDeclare));
                OnPropertyChanged(nameof(TotalFraisDeclare));
            });

            DeleteFraisNonDeclare = new RelayCommand(() =>
            {
                IoCContainer.Get<Importation>().FraisDivers.Remove(SelectedFraisDeclare.Facture);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisNonDeclare));
                OnPropertyChanged(nameof(TotalFraisNonDeclare));
            });

            #endregion
        }

        #endregion


        #region Public Properties

        public ObservableCollection<FraisVM> FraisDeclare => new ObservableCollection<FraisVM>(IoCContainer.Get<Importation>().FraisDivers.Where(f => f is FactureDeclaree).Select(x => new FraisVM(x) { Update = UpdateFraisDeclare }));

        public ObservableCollection<FraisVM> FraisNonDeclare => new ObservableCollection<FraisVM>(IoCContainer.Get<Importation>().FraisDivers.Where(f => f is FactureNonDeclaree).Select(x => new FraisVM(x) { Update = UpdateFraisNonDeclare }));

        public double? TotalFraisDeclare => FraisDeclare.Select(f => f.Total).Sum();

        public double? TotalFraisNonDeclare => FraisNonDeclare.Select(f => f.Total).Sum();

        public FraisVM SelectedFraisDeclare {
            get => _selectedFraisDeclare;
            set
            {
                _selectedFraisDeclare = value;
                SelectedFrais = value;
                OnPropertyChanged(nameof(SelectedFrais));
            }
        }

        public FraisVM SelectedFraisNonDeclare
        {
            get => _selectedFraisNonDeclare;
            set
            {
                _selectedFraisNonDeclare = value;
                SelectedFrais = value;
                OnPropertyChanged(nameof(SelectedFrais));
            }
        }

        public FraisVM SelectedFrais { get; set; }

        public bool IsDialogOpen { get; set; } = false;

        public RelayCommand OpenDialog => new RelayCommand(() =>
        {
            IsDialogOpen = true;
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public RelayCommand CloseDialog => new RelayCommand(() =>
        {
            IsDialogOpen = false;
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        #endregion

        #region Public Commands

        public RelayCommand AddFraisDeclare { get; set; }

        public RelayCommand DeleteFraisDeclare { get; set; }

        public RelayCommand AddFraisNonDeclare { get; set; }

        public RelayCommand DeleteFraisNonDeclare { get; set; }

        #endregion

        #region Helpers

        private int UpdateFraisDeclare()
        {
            OnPropertyChanged(nameof(FraisDeclare));
            OnPropertyChanged(nameof(TotalFraisDeclare));
            return 0;
        }

        private int UpdateFraisNonDeclare()
        {
            OnPropertyChanged(nameof(FraisNonDeclare));
            OnPropertyChanged(nameof(TotalFraisNonDeclare));
            return 0;
        }

        #endregion


    }
}
