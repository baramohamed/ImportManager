using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{

    public class FactureVM : BaseVM
    {
        public FactureFournisseur Facture;
        private Article _selectedArticle;
        #region Constructor

        public FactureVM(FactureFournisseur facture)
        {
            Facture = facture;
        }

        public FactureVM()
        {
            #region Initialisation Divers

            //Pays = new ObservableCollection<string>() { "Turkey", "France", "Spain" };

            //Incoterms = new ObservableCollection<string>() { "FOB", "CFR" };

            //ModesReglement = new ObservableCollection<string>() { "L/C", "D/P", "Remise Documentaire" };

            //Devises = new ObservableCollection<string>() { "Dollar", "Euro" };

            //Produits = Parametres.Produits;

            //Attributs = Parametres.Attributs.ToDictionary(a => a, a => string.Empty);

            #endregion

            #region Initialisation Facture

            //DateFacture = DateTime.Today;

            //InvoiceN = "I18-05";

            //PaysOrigine = Pays.ElementAt(0);

            //Incoterm = Incoterms.ElementAt(0);

            //ModeReglement = ModesReglement.ElementAt(0);

            //Devise = Devises.ElementAt(0);

            //Lignes = new ObservableCollection<LigneFactureVM>()
            //{
            //    new LigneFactureVM(Parametres.Articles.ElementAt(0)) { PrixUnit=50.00, Quantite=80 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(1)) { PrixUnit=66.00, Quantite=60 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(2)) { PrixUnit=82.00, Quantite=30 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(0)) { PrixUnit=95.00, Quantite=200 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(1)) { PrixUnit=129.00, Quantite=60 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(2)) { PrixUnit=168.00, Quantite=40 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(0)) { PrixUnit=44.00, Quantite=20 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(1)) { PrixUnit=63.33, Quantite=20 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(2)) { PrixUnit=50.00, Quantite=60 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(0)) { PrixUnit=66.00, Quantite=100 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(1)) { PrixUnit=82.00, Quantite=20 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(2)) { PrixUnit=95.00, Quantite=130 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(0)) { PrixUnit=129.00, Quantite=40 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(1)) { PrixUnit=168.00, Quantite=30 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(2)) { PrixUnit=44.00, Quantite=15 , Update = UpdateTotal},
            //    new LigneFactureVM(Parametres.Articles.ElementAt(0)) { PrixUnit=63.33, Quantite=15 , Update = UpdateTotal},
            //};

            #endregion
        }

        #endregion


        #region Public Properties

        public DateTime? DateFacture
        {
            get => Facture.Date;
            set => Facture.Date = value;
        }

        public string InvoiceN
        {
            get => Facture.NumFacture;
            set => Facture.NumFacture = value;
        }


        public ObservableCollection<LigneFactureVM> Lignes
        {            
            get
            {
                return new ObservableCollection<LigneFactureVM>(Facture.LignesFacture.Select(l => new LigneFactureVM(l) { Update = UpdateTotal }));
            }
        }

        public LigneFactureVM SelectedLigne { get; set; }

        public int? TotalQuantite => Lignes?.Select(l => l.Quantite).Sum();

        public double? TotalPrix => Lignes?.Select(l => l.Total).Sum();

        #region Other Properties

        public ObservableCollection<Article> Articles
        {
            get
            {
                var articles = IoCContainer.Get<Importateur>().Catalogue.Articles.ToList();
                return new ObservableCollection<Article>(articles);
            }
        }

        public Article SelectedArticle
        {
            get => _selectedArticle;
            set
            {
                _selectedArticle = value;
            }
        }



        #endregion

        #endregion

        #region Public Commands

        public RelayCommand Select => new RelayCommand(() => {
            if (SelectedArticle == null || Lignes.Where(l => l.Article == SelectedArticle).Count() > 0) return;

            Facture.LignesFacture.Add(new LigneFacture() { Article = SelectedArticle, Quantite = 0 });
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Lignes));
        });

        public RelayCommand Edit { get; set; }

        public RelayCommand Delete => new RelayCommand(() =>
        {
            if (SelectedLigne == null) return;
            Facture.LignesFacture.Remove(SelectedLigne.Ligne);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Lignes));
        });

        #endregion

        #region Helpers

        protected int UpdateTotal()
        {
            OnPropertyChanged(nameof(TotalQuantite));
            OnPropertyChanged(nameof(TotalPrix));
            return 0;
        }

        #endregion

        public override string ToString()
        {
            return "Facture " + InvoiceN;
        }
    }
}
