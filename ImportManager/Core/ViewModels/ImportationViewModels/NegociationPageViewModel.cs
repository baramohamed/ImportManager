using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class NegociationPageVM : OperationVM
    {
        private FactureVM _selectedFacture;

        public NegociationPageVM()
        {

            AddCommande = new RelayCommand(() =>
            {
                var importation = IoCContainer.Get<Importation>();
                if (importation.Commande != null) return;
                importation.Commande = new Commande() { NumFacture = "Comm 0", Date = DateTime.Today };
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Factures));
            });

            AddOffre = new RelayCommand(() =>
            {
                var offres = IoCContainer.Get<Importation>().Offres;
                if (offres == null) offres = new Collection<Offre>();
                var lignes = new List<LigneFacture>();
                var commande = IoCContainer.Get<Importation>().Commande;
                if (commande != null) lignes.AddRange(commande.LignesCommande.Select(l => new LigneFacture() { Article = l.Article, Quantite = l.Quantite }));
                offres.Add(new Offre() { NumFacture = "Offre " + (offres.Count() + 1), Date = DateTime.Today, LignesFacture = lignes });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Factures));
            });

            Delete = new RelayCommand(() =>
            {
                var container = IoCContainer.Get<ModelContainer>();
                container.Factures.Remove(SelectedFacture.Facture);
                container.SaveChanges();
                OnPropertyChanged(nameof(Factures));
            });
        }

        #region Public Properties
        public override string Titre { get => "Négociation"; }

        public ObservableCollection<BaseVM> Factures
        {
            get
            {
                var importation = IoCContainer.Get<Importation>();
                var commande = importation.Commande;
                var offres = IoCContainer.Get<Importation>().Offres;
                var proforam = IoCContainer.Get<Importation>().FactureProforma;
                var factures = new List<BaseVM>();
                if (commande != null) factures.Add(new CommandeVM(commande));
                factures.AddRange(offres.Select(o => new OffreVM(o)));
                if (proforam != null) factures.Add(new FactureProformaVM(proforam));
                return new ObservableCollection<BaseVM>(factures);
            }
        }

        public FactureVM SelectedFacture
        {
            get => _selectedFacture;
            set
            {
                _selectedFacture = value;
                OnPropertyChanged(nameof(SelectedFacture));
            }
        }


        #endregion

        #region Public Commands

        public RelayCommand AddCommande { get; set; }

        public RelayCommand AddOffre { get; set; }

        public RelayCommand AddFactureProforma { get; set; }

        public RelayCommand Delete { get; set; }

        #endregion

        public override void Cloturer()
        {
            var lignes = new List<LigneFacture>();
            lignes.AddRange(
                IoCContainer.Get<Importation>()
                .Offres
                .Last()
                .LignesFacture
                .Select(l => new LigneFacture()
                {
                    Article = l.Article,
                    PoidsUnitaire = l.PoidsUnitaire,
                    PrixUnitaire = l.PrixUnitaire,
                    Quantite = l.Quantite,
                    VolumeUnitaire = l.VolumeUnitaire
                }));
            IoCContainer.Get<Importation>().FactureProforma = new FactureProforma() { NumFacture = "Fact p01", LignesFacture = lignes };
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Factures));
            Refresh();
        }

        public override EtatOperation Etat
        {
            get
            {
                return (IoCContainer.Get<Importation>().FactureProforma == null) ? EtatOperation.EnCours : EtatOperation.Cloturee;
            }
        }
    }
}
