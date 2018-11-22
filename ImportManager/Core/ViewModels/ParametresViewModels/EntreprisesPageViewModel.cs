using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class EntreprisesPageVM : BaseVM
    {
        private ModelContainer container = IoCContainer.Get<ModelContainer>();
        private EntrepriseVM _selectedEntreprise;
        private TypeListe _selectedList;
        private bool _isDialogHostOpen;

        #region Constructor

        public EntreprisesPageVM()
        {

            #region Init Commands

            AddEntreprise = new RelayCommand(() =>
            {
                switch (SelectedList)
                {
                    case TypeListe.Importateur:
                        container.Entreprises.Add(new Importateur() { Denomination = "Nouveau" });
                        container.SaveChanges();
                        OnPropertyChanged(nameof(Importateurs));
                        SelectedEntreprise = Importateurs.Last();
                        break;
                    case TypeListe.Fournisseur:
                        container.Entreprises.Add(new Fournisseur() { Denomination = "Nouveau" });
                        container.SaveChanges();
                        OnPropertyChanged(nameof(Fournisseurs));
                        SelectedEntreprise = Fournisseurs.Last();
                        break;
                    case TypeListe.Banque:
                        container.Entreprises.Add(new Banque() { Denomination = "Nouveau" });
                        container.SaveChanges();
                        OnPropertyChanged(nameof(Banques));
                        SelectedEntreprise = Banques.Last();
                        break;
                    case TypeListe.Transit:
                        container.Entreprises.Add(new Transit() { Denomination = "Nouveau" });
                        container.SaveChanges();
                        OnPropertyChanged(nameof(Transitaires));
                        SelectedEntreprise = Transitaires.Last();
                        break;
                    case TypeListe.Autre:
                        container.Entreprises.Add(new Entreprise() { Denomination = "Nouveau" });
                        container.SaveChanges();
                        OnPropertyChanged(nameof(Autres));
                        SelectedEntreprise = Autres.Last();
                        break;
                }
                IsDialogHostOpen = true;
            });

            DeleteEntreprise = new RelayCommand(() =>
            {
                container.Entreprises.Remove(SelectedEntreprise.Entreprise);
                container.SaveChanges();
                switch (SelectedList)
                {
                    case TypeListe.Importateur:
                        OnPropertyChanged(nameof(Importateurs));
                        break;
                    case TypeListe.Fournisseur:
                        OnPropertyChanged(nameof(Fournisseurs));
                        break;
                    case TypeListe.Banque:
                        OnPropertyChanged(nameof(Banques));
                        break;
                    case TypeListe.Transit:
                        OnPropertyChanged(nameof(Transitaires));
                        break;
                    case TypeListe.Autre:
                        OnPropertyChanged(nameof(Autres));
                        break;
                }
            });

            EditEntreprise = new RelayCommand(() => 
            {
                IsDialogHostOpen = true;
            });

            CloseDialogHost = new RelayCommand(() =>
            {
                IsDialogHostOpen = false;
            });

            #endregion
        }

        #endregion

        #region Public Properties

        public ObservableCollection<EntrepriseVM> Importateurs => new ObservableCollection<EntrepriseVM>(container.Entreprises.Where(e => e is Importateur).ToList().Select(e => new EntrepriseVM(e)));

        public ObservableCollection<EntrepriseVM> Fournisseurs => new ObservableCollection<EntrepriseVM>(container.Entreprises.Where(e => e is Fournisseur).ToList().Select(e => new EntrepriseVM(e)));

        public ObservableCollection<EntrepriseVM> Banques => new ObservableCollection<EntrepriseVM>(container.Entreprises.Where(e => e is Banque).ToList().Select(e => new EntrepriseVM(e)));

        public ObservableCollection<EntrepriseVM> Transitaires => new ObservableCollection<EntrepriseVM>(container.Entreprises.Where(e => e is Transit).ToList().Select(e => new EntrepriseVM(e)));

        public ObservableCollection<EntrepriseVM> Autres
        {
            get
            {
                try
                {
                    var list = container.Entreprises.Where(e => !((e is Importateur) || (e is Fournisseur) || (e is Banque) || (e is Transit))).ToList();
                    return new ObservableCollection<EntrepriseVM>(list.Select(e => new EntrepriseVM(e)));
                }
                catch (Exception e)
                {
                    //Console.WriteLine(e.Message + "\n" + e.StackTrace + "\n" + e.InnerException.Message);
                    return null;
                }
            }
        }
        //{
        //    get
        //    {
                
        //        var entreprises = container.Entreprises.ToList();
        //        if (entreprises.Count() == 0) return null;
        //        var autres = entreprises.Where(e => !((e is Importateur) || (e is Fournisseur) || (e is Banque) || (e is Transit))).ToList();
        //        if (autres.Count == 0) return null;
        //        return new ObservableCollection<EntrepriseVM>(autres.Select(e => new EntrepriseVM(e)));
        //    }
        //}

        public EntrepriseVM SelectedEntreprise
        {
            get => _selectedEntreprise;
            set
            {
                _selectedEntreprise = value;
                OnPropertyChanged(nameof(SelectedEntreprise));
            }
        }

        public TypeListe SelectedList
        {
            get => _selectedList;
            set
            {
                _selectedList = value;
                OnPropertyChanged(nameof(SelectedList));
            }
        }

        public bool IsDialogHostOpen
        {
            get => _isDialogHostOpen;
            set
            {
                _isDialogHostOpen = value;
                OnPropertyChanged(nameof(IsDialogHostOpen));
            }
        }


        #endregion

        #region Public Commands

        public RelayCommand AddEntreprise { get; set; }

        public RelayCommand DeleteEntreprise { get; set; }

        public RelayCommand EditEntreprise { get; set; }

        public RelayCommand CloseDialogHost { get; set; }

        #endregion
    }

    public enum TypeListe
    {
        Importateur = 0,
        Fournisseur = 1,
        Banque = 2,
        Transit = 3,
        Autre = 4,
    }
}
