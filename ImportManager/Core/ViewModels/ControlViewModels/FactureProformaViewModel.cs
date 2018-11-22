using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{

    public class FactureProformaVM : FactureVM
    {
        #region Constructor

        public FactureProformaVM(FactureFournisseur facture) : base(facture)
        {

        }

        

        #endregion


        #region Public Properties

        public Pays PaysOrigine
        {
            get => IoCContainer.Get<Importation>().PaysOrigine;
            set
            {
                IoCContainer.Get<Importation>().PaysOrigine = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(PaysOrigine));
            }
        }

        public Incoterm Incoterm
        {
            get => (Facture as FactureProforma).Incoterm;
            set
            {
                (Facture as FactureProforma).Incoterm = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Incoterm));
            }
        }

        public Port PortEmbarquement
        {
            get => (Facture as FactureProforma).PortEmbarquement;
            set
            {
                (Facture as FactureProforma).PortEmbarquement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(PortEmbarquement));
            }
        }

        public Port PortDebarquement
        {
            get => (Facture as FactureProforma).PortDebarquement;
            set
            {
                (Facture as FactureProforma).PortDebarquement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(PortDebarquement));
            }
        }

        public DateTime? DateEmbarquement
        {
            get => (Facture as FactureProforma).DateEmbarquement;
            set
            {
                (Facture as FactureProforma).DateEmbarquement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DateEmbarquement));
            }
        }

        public DateTime? DateDebarquement
        {
            get => (Facture as FactureProforma).DateDebarquement;
            set
            {
                (Facture as FactureProforma).DateDebarquement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DateDebarquement));
            }
        }

        public AgenceBanque AgenceBanqueFournisseur
        {
            get => IoCContainer.Get<Importation>().BanqueFournisseur;
            set
            {
                IoCContainer.Get<Importation>().BanqueFournisseur = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(AgenceBanqueFournisseur));
            }
        }

        public ModeReglement ModeReglement
        {
            get => (Facture as FactureProforma).ModeReglement;
            set
            {
                (Facture as FactureProforma).ModeReglement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(ModeReglement));
            }
        }

        public Devise Devise
        {
            get => (Facture as FactureProforma).Devise;
            set
            {
                (Facture as FactureProforma).Devise = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Devise));
            }
        }

        #region Other Properties

        public ObservableCollection<Pays> Pays => new ObservableCollection<Pays>(IoCContainer.Get<ModelContainer>().Pays);

        public ObservableCollection<Incoterm> Incoterms => new ObservableCollection<Incoterm>(IoCContainer.Get<ModelContainer>().Incoterms);

        public ObservableCollection<Port> PortsEmbarquement => new ObservableCollection<Port>(IoCContainer.Get<ModelContainer>().Ports);

        public ObservableCollection<Port> PortsDebarquement => new ObservableCollection<Port>(IoCContainer.Get<ModelContainer>().Pays.SingleOrDefault(p => p.Code=="DZ").Ports);

        public ObservableCollection<Banque> Banques => new ObservableCollection<Banque>(IoCContainer.Get<ModelContainer>().Entreprises.Where(e => e is Banque).Select(b => b as Banque));

        public ObservableCollection<ModeReglement> ModesReglement => new ObservableCollection<ModeReglement>(IoCContainer.Get<ModelContainer>().ModesReglement);

        public ObservableCollection<Devise> Devises => new ObservableCollection<Devise>(IoCContainer.Get<ModelContainer>().Devises);


        public ObservableCollection<FichierVM> Fichiers => new ObservableCollection<FichierVM>((Facture as FactureProforma).FichiersJoints.Select(f => new FichierVM(f)));

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

                (Facture as FactureProforma).FichiersJoints.Add(new Fichier() { NomFichier = "Fichier N° " + (Fichiers.Count + 1), Chemin = destinationFile });
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

        #endregion

        #region Public Commands

        #endregion

        public override string ToString()
        {
            return "Facture Proforma " + InvoiceN;
        }

    }
}
