using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class FactureTransitVM : BaseVM
    {
        private FactureTransit Facture;

        #region Constructor

        public FactureTransitVM(FactureTransit facture)
        {
            Facture = facture;

            #region Initialisation Divers

            AddFraisDeclare = new RelayCommand(() =>
            {
                Facture.FraisDeclares.Add(new FactureDeclaree() { NumFacture = "D01" });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisDeclare));
                OnPropertyChanged(nameof(TotalFraisDeclare));
            });

            AddFraisNonDeclare = new RelayCommand(() =>
            {
                Facture.FraisNonDeclares.Add(new FactureNonDeclaree() { NumFacture = "ND01" });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisNonDeclare));
                OnPropertyChanged(nameof(TotalFraisNonDeclare));
            });

            DeleteFraisDeclare = new RelayCommand(() =>
            {
                Facture.FraisDeclares.Remove(SelectedFraisDeclare.Facture as FactureDeclaree);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisDeclare));
                OnPropertyChanged(nameof(TotalFraisDeclare));
            });

            DeleteFraisNonDeclare = new RelayCommand(() =>
            {
                Facture.FraisNonDeclares.Remove(SelectedFraisNonDeclare.Facture as FactureNonDeclaree);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(FraisNonDeclare));
                OnPropertyChanged(nameof(TotalFraisNonDeclare));
            });

            #endregion

            #region Initialisation Facture

            #endregion
        }

        #endregion

        #region Private Members

        #endregion


        #region Public Properties

        public DateTime? FactureDate
        {
            get => Facture.Date;
            set
            {
                Facture.Date = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string FactureN
        {
            get => Facture.NumFacture;
            set 
            {
                Facture.NumFacture = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Dossier
        {
            get => Facture.NumDossier;
            set 
            {
                Facture.NumDossier = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Repertoire
        {
            get => Facture.NumRepertoire;
            set
            {
                Facture.NumRepertoire = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public ObservableCollection<FraisVM> FraisDeclare => new ObservableCollection<FraisVM>(Facture.FraisDeclares.Select(f => new FraisVM(f) { Update = UpdateFraisDeclare }));

        public ObservableCollection<FraisVM> FraisNonDeclare => new ObservableCollection<FraisVM>(Facture.FraisNonDeclares.Select(f => new FraisVM(f) { Update = UpdateFraisNonDeclare }));

        public double? TotalFraisDeclare => FraisDeclare.Select(f => f.Total).Sum();

        public double? TotalFraisNonDeclare => FraisNonDeclare.Select(f => f.Total).Sum();

        public FraisVM SelectedFraisDeclare { get; set; }

        public FraisVM SelectedFraisNonDeclare { get; set; }

        public ObservableCollection<FichierVM> Fichiers => new ObservableCollection<FichierVM>((Facture).FichiersJoints.Select(f => new FichierVM(f)));

        public bool IsDialogOpen { get; set; } = false;

        public RelayCommand AjouterFichier => new RelayCommand(() =>
        {
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog();
            var result = dlg.ShowDialog();
            if (result == true)
            {
                var fullPath = dlg.FileName;

                //var fileName = fullPath.Substring(fullPath.LastIndexOf('\\') + 1);
                //var source = fullPath.Remove(fullPath.LastIndexOf('\\'));

                var destination = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\ImportManager\Documents";
                if (!System.IO.Directory.Exists(destination))
                {
                    System.IO.Directory.CreateDirectory(destination);
                }
                var length = System.IO.Directory.GetFiles(destination).Length;
                var ext = fullPath.Substring(fullPath.LastIndexOf('.'));

                var destinationFile = destination + @"\" + (length + 1) + ext;

                System.IO.File.Copy(fullPath, destinationFile);

                Facture.FichiersJoints.Add(new Fichier() { NomFichier = "Fichier N° " + (Fichiers.Count + 1), Chemin = destinationFile });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Fichiers));
            }
        });

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
