using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class CatalogueParametresPageVM : BaseVM
    {
        #region Private Members

        private bool _isEditionButtonsVisible = false;
        private bool _isFicheArticleVisible = false;
        private Importateur _selectedImportateur;
        private ProduitVM _selectedProduit;
        private ModelContainer container = IoCContainer.Get<ModelContainer>();

        #endregion


        public CatalogueParametresPageVM()
        {
            #region Other Init

            #endregion

            #region Init Properties



            #endregion

            #region Init Commands

            AddProduit = new RelayCommand(() =>
            {
                if (SelectedImportateur.Catalogue == null) SelectedImportateur.Catalogue = new Catalogue();
                SelectedImportateur.Catalogue.Produits.Add(new Produit() { DesignationFR = "Nouveau" });
                container.SaveChanges();
                OnPropertyChanged(nameof(Produits));
                SelectedProduit = Produits.Last();
                OnPropertyChanged(nameof(SelectedProduit));
                IsFicheProduitVisible = true;
                IsEditionButtonsVisible = true;

            });

            DeleteProduit = new RelayCommand(() =>
            {
                SelectedImportateur.Catalogue.Produits.Remove(SelectedProduit.Produit);
                container.SaveChanges();
                OnPropertyChanged(nameof(Produits));
                IsFicheProduitVisible = false;
                IsEditionButtonsVisible = false;
            });

            EditProduit = new RelayCommand(() =>
            {
                IsFicheProduitVisible = true;
                IsEditionButtonsVisible = true;
            });

            #endregion

        }

        #region Public Properties

        public Importateur SelectedImportateur
        {
            get => _selectedImportateur;
            set
            {
                _selectedImportateur = value;
                OnPropertyChanged(nameof(Produits));
            }
        }

        public ProduitVM SelectedProduit
        {
            get => _selectedProduit;
            set
            {
                _selectedProduit = value;
                OnPropertyChanged(nameof(SelectedProduit));
            }
        }

        public bool IsEditionButtonsVisible
        {
            get { return _isEditionButtonsVisible; }
            set
            {
                _isEditionButtonsVisible = value;
                OnPropertyChanged(nameof(IsEditionButtonsVisible));
            }
        }

        public bool IsFicheProduitVisible
        {
            get { return _isFicheArticleVisible; }
            set
            {
                _isFicheArticleVisible = value;
                OnPropertyChanged(nameof(IsFicheProduitVisible));
            }
        }

        #endregion

        #region Other Properties

        public ObservableCollection<Importateur> Importateurs
        {
            get
            {
                var importateurs = container.Entreprises.Where(e => e is Importateur).Select(i => i as Importateur).ToList();
                return new ObservableCollection<Importateur>(importateurs);
            }
        }

        public ObservableCollection<ProduitVM> Produits
        {
            get
            {
                var produits = SelectedImportateur?.Catalogue?.Produits.Select(p => new ProduitVM(p));
                return (produits != null) ? new ObservableCollection<ProduitVM>(produits) : new ObservableCollection<ProduitVM>();
            }
        
        }

        #endregion

        #region Public Commands

        public RelayCommand AddProduit { get; set; }

        public RelayCommand DeleteProduit { get; set; }

        public RelayCommand EditProduit { get; set; }
        #endregion
    }

}
