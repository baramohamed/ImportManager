using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class ArrivageVM : BaseVM
    {
        private ProduitVM _selectedProduit;
        private ObservableCollection<Tuple<Attribut, Valeur>> _attributs;

        public ArrivageVM(List<LigneCommande> arrivage)
        {
            Arrivage = arrivage;
        }

        #region Public Properties

        public List<LigneCommande> Arrivage
        {
            get;
            set;
        }

        public ProduitVM SelectedProduit
        {
            get => _selectedProduit;
            set
            {
                _selectedProduit = value;
                OnPropertyChanged(nameof(Attributs));
            }
        }

        public ObservableCollection<LigneCommandeVM> Lignes
        {
            get
            {
                return new ObservableCollection<LigneCommandeVM>(Arrivage.Select(l => new LigneCommandeVM(l) { Update = UpdateTotal }));
            }
        }

        public LigneCommande SelectedLigne { get; set; }

        public int? TotalArrivage => Lignes?.Select(l => l.Quantite).Sum();

        #endregion

        #region Other Properties

        public ObservableCollection<ProduitVM> Produits
        {
            get
            {
                var importateur = IoCContainer.Get<Importation>().Importateur as Importateur;
                var produits = importateur.Catalogue.Produits;
                return new ObservableCollection<ProduitVM>(produits.Select(p => new ProduitVM(p)));
            }
        }

        public ObservableCollection<Tuple<Attribut, Valeur>> Attributs
        {
            get
            {
                if (SelectedProduit != null)
                {
                    _attributs = new ObservableCollection<Tuple<Attribut, Valeur>>(
                        SelectedProduit?
                        .Produit?
                        .Attributs?
                        .ToList()
                        .Select(a => new Tuple<Attribut, Valeur>() { Key = a }));
                    return _attributs;
                }
                return new ObservableCollection<Tuple<Attribut, Valeur>>();
            }
        }
        #endregion

        #region Public Commands

        public RelayCommand Select => new RelayCommand(() => {
            var importateur = IoCContainer.Get<Importation>().Importateur as Importateur;
            var articles = SelectedProduit.Produit.Articles;
            var article = articles.SingleOrDefault(a => a.ValeursAttributs.SequenceEqual(_attributs.Select(at => at.Value)));
            var ligne = new LigneCommande();

            if (articles.Count == 0 || article == null)
            {
                ligne.Article = new Article() { Produit = SelectedProduit.Produit, Catalogue = importateur.Catalogue, ValeursAttributs = _attributs.Select(t => t.Value).ToArray() };
            }
            else
            {
                ligne.Article = article;
            }
            Arrivage.Add(ligne);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Lignes));
        });

        public RelayCommand Edit { get; set; }

        public RelayCommand Delete { get; set; }

        #endregion

        #region Helpers

        protected int UpdateTotal()
        {
            OnPropertyChanged(nameof(TotalArrivage));
            return 0;
        }

        #endregion
    }
}
