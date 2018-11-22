using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class ImportationPageVM : BaseVM
    {
        public Importation Importation;
        private ModelContainer container = IoCContainer.Get<ModelContainer>();
        private OperationVM _selectedOperation;

        public ImportationPageVM(Importation importation)
        {

            Importation = importation;

            #region Initialisation

            Operations = new ObservableCollection<OperationVM>()
            {
                new NegociationPageVM(),
                new DomiciliationPageVM(),
                new DedouanementPageVM(),
                new CloturationPageVM(),
                new BilanPageVM(),
            };

            Cloturer = new RelayCommand(() =>
            {
                SelectedOperation.Cloturer();
            });

            #endregion

        }

        #region Public Properties

        public string NumImport => Importation.Id.ToString();

        public DateTime? DateCreation
        {
            get => Importation.DateCreation;
            private set => DateCreation = value;
        }

        public Importateur Importateur
        {
            get => Importation.Importateur as Importateur;
            set
            {
                Importation.Importateur = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Importateur));
                OnPropertyChanged(nameof(Activites));
            }
        }

        public Fournisseur Fournisseur
        {
            get => Importation.Fournisseur as Fournisseur;
            set
            {
                Importation.Fournisseur = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Fournisseur));
            }
        }

        public Activite Activite
        {
            get => Importation.Activite;
            set
            {
                Importation.Activite = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Activite));
            }
        }

        public string Avancement
        {
            get
            {
                if (Importation.DateCloturation != null) return "Cloturée";
                if (Importation.DateDedouanement != null) return "Clôturation";
                if (Importation.DateDomiciliation != null) return "Dédouanement";
                if (Importation.DateNegociation != null) return "Domiciliation";
                return "Négociation";
            }
        }

        public EtatImportation Etat
        {
            get
            {
                if (Importation.DateCloturation != null) return EtatImportation.Cloturee;
                if (Importation.DateDedouanement != null) return EtatImportation.Cloturation;
                if (Importation.DateDomiciliation != null) return EtatImportation.Dedouanement;
                if (Importation.DateNegociation != null) return EtatImportation.Domiciliation;
                return EtatImportation.Negociation;
            }
        }

        public ObservableCollection<OperationVM> Operations { get; set; }

        #endregion

        #region Other Properties

        public ObservableCollection<Importateur> Importateurs => new ObservableCollection<Importateur>(container.Entreprises.Where(e => e is Importateur).Select(i => i as Importateur));

        public ObservableCollection<Activite> Activites
        {
            get
            {
                return (Importateur != null) ? new ObservableCollection<Activite>(Importateur?.Activites) : null;
            }
        }

        public ObservableCollection<Fournisseur> Fournisseurs => new ObservableCollection<Fournisseur>(container.Entreprises.Where(e => e is Fournisseur).Select(f => f as Fournisseur));

        public OperationVM SelectedOperation
        {
            get => _selectedOperation;
            set
            {
                _selectedOperation = value;
                OnPropertyChanged(nameof(SelectedOperation));
            }
        }

        #endregion

        #region Public Commands

        public RelayCommand Cloturer { get; set; }

        #endregion

    }
}
