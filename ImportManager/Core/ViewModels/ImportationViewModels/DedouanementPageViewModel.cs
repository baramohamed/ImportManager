using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class DedouanementPageVM : OperationVM
    {
        private TaxeDouanier D10
        {
            get
            {
                if (IoCContainer.Get<Importation>().D10 == null)
                {
                    IoCContainer.Get<Importation>().D10 = new TaxeDouanier();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return IoCContainer.Get<Importation>().D10;
            }
            
        }

        private Devise _deviseFacture;
        private Devise _deviseFret;
        private Devise _deviseAssurances;
        private Devise _deviseFrais;

        private double? _montantFacture;
        private double? _montantFret;
        private double? _montantAssurances;
        private double? _montantFrais;

        private List<TaxeArticleVM> _taxes = null;

        public DedouanementPageVM()
        {
            
        }

        private int UpdateAssiettes()
        {
            OnPropertyChanged(nameof(ValeurDA));
            foreach (TaxeArticleVM t in Taxes) t.Assiette = Math.Round((ValeurDA * t.LigneFacture.Total / MontantFacture).Value);
            return 0;
        }

        private int UpdateTotals()
        {
            OnPropertyChanged(nameof(TotalDD));
            OnPropertyChanged(nameof(TotalTCS));
            OnPropertyChanged(nameof(TotalTVA));
            OnPropertyChanged(nameof(TotalTaxes));
            return 0;
        }

        #region Public Properties
        public override string Titre { get => "Dédouanement"; }

        public Transit Transit
        {
            get => IoCContainer.Get<Importation>().Transit;
            set
            {
                IoCContainer.Get<Importation>().Transit = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Transit));
            }
        }


        public double? CoursDedouanement
        {
            get => IoCContainer.Get<Importation>().CoursDedouanement;
            set
            {
                IoCContainer.Get<Importation>().CoursDedouanement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();

                if (_deviseFacture.Code == "DZD") D10.MontantFactureDA = MontantFacture;
                else D10.MontantFactureDA = MontantFacture * CoursDedouanement;

                if (_deviseFret != null)
                {
                    if (_deviseFret.Code == "DZD") D10.MontantFretDA = MontantFret;
                    else D10.MontantFretDA = MontantFret * CoursDedouanement;
                }

                if (_deviseAssurances != null)
                {
                    if (_deviseAssurances.Code == "DZD") D10.MontantAssurancesDA = MontantAssurances;
                    else D10.MontantAssurancesDA = MontantAssurances * CoursDedouanement;
                }

                if (_deviseFret != null)
                {
                    if (_deviseFret.Code == "DZD") D10.MontantFretDA = MontantFret;
                    else D10.MontantFretDA = MontantFret * CoursDedouanement;
                }

                if (_deviseFrais != null)
                {
                    if (_deviseFrais.Code == "DZD") D10.MontantFraisDA = MontantFrais;
                    else D10.MontantFraisDA = MontantFrais * CoursDedouanement;
                }

                IoCContainer.Get<ModelContainer>().SaveChanges();
                UpdateAssiettes();
            }
        }
        public Devise DeviseFacture
        {
            get
            {
                if (_deviseFacture == null)
                {
                    var factureDefinitive = IoCContainer.Get<Importation>().FactureDefinitive;
                    _deviseFacture = factureDefinitive.Devise;
                }
                return _deviseFacture;
            }
            set
            {
                _deviseFacture = value;
                if (_deviseFacture.Code == "DZD") D10.MontantFactureDA = MontantFacture;
                else D10.MontantFactureDA = MontantFacture * CoursDedouanement;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DeviseFacture));
                UpdateAssiettes();
            }
        }
        public Devise DeviseFret
        {
            get
            {
                if (_deviseFret == null)
                {
                    _deviseFret = IoCContainer.Get<ModelContainer>().Devises.SingleOrDefault(d => d.Code == "DZD");
                }
                return _deviseFret;
            }
            set
            {
                _deviseFret = value;
                if (_deviseFret.Code == "DZD") D10.MontantFretDA = MontantFret;
                else D10.MontantFretDA = MontantFret * CoursDedouanement;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DeviseFret));
                UpdateAssiettes();
            }
        }
        public Devise DeviseAssurances
        {
            get
            {
                if (_deviseAssurances == null)
                {
                    _deviseAssurances = IoCContainer.Get<ModelContainer>().Devises.SingleOrDefault(d => d.Code == "DZD");
                }
                return _deviseAssurances;
            }
            set
            {
                _deviseAssurances = value;
                if (_deviseAssurances.Code == "DZD") D10.MontantAssurancesDA = MontantAssurances;
                else D10.MontantAssurancesDA = MontantAssurances * CoursDedouanement;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DeviseAssurances));
                UpdateAssiettes();
            }
        }
        public Devise DeviseFrais
        {
            get
            {
                if (_deviseFrais == null)
                {
                    _deviseFrais = IoCContainer.Get<ModelContainer>().Devises.SingleOrDefault(d => d.Code == "DZD");
                }
                return _deviseFrais;
            }
            set
            {
                _deviseFrais = value;
                if (_deviseFrais.Code == "DZD") D10.MontantFraisDA = MontantFrais;
                else D10.MontantFraisDA = MontantFrais * CoursDedouanement;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DeviseFrais));
                UpdateAssiettes();
            }
        }

        public double? MontantFacture
        {
            get
            {
                if (_montantFacture == null)
                {
                    var factureDefinitive = IoCContainer.Get<Importation>().FactureDefinitive;
                    _montantFacture = new FactureDefinitiveVM(factureDefinitive).TotalPrix;
                }
                return _montantFacture;
            }
            set
            {
                _montantFacture = value;
                if (DeviseFacture.Code == "DZD") MontantFactureDA = value ?? 0;
                else MontantFactureDA = (value / CoursDedouanement) ?? 0;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(MontantFacture));
                UpdateAssiettes();
            }
        }

        public double? MontantFret
        {
            get
            {
                if (_montantFret == null)
                {
                    _montantFret = D10.MontantFretDA;
                }
                return _montantFret;
            }
            set
            {
                _montantFret = value;
                if (DeviseFret.Code == "DZD") MontantFretDA = value ?? 0;
                else MontantFretDA = (value / CoursDedouanement) ?? 0;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(MontantFret));
                UpdateAssiettes();
            }
        }

        public double? MontantAssurances
        {
            get
            {
                if (_montantAssurances == null)
                {
                    _montantAssurances = D10.MontantAssurancesDA;
                }
                return _montantAssurances;
            }
            set
            {
                _montantAssurances = value;
                if (DeviseAssurances.Code == "DZD") MontantAssurancesDA = value ?? 0;
                else MontantAssurancesDA = (value / CoursDedouanement) ?? 0;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(MontantAssurances));
                UpdateAssiettes();
            }
        }

        public double? MontantFrais
        {
            get
            {
                if (_montantFrais == null)
                {
                    _montantFrais = D10.MontantFraisDA;
                }
                return _montantFrais;
            }
            set
            {
                _montantFrais = value;
                if (DeviseFrais.Code == "DZD") MontantFraisDA = value ?? 0;
                else MontantFraisDA = (value / CoursDedouanement) ?? 0;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(MontantFrais));
                UpdateAssiettes();
            }
        }

        public double MontantFactureDA
        {
            get => D10.MontantFactureDA ?? 0;
            set
            {
                D10.MontantFactureDA = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                UpdateAssiettes();
            }
        }

        public double MontantFretDA
        {
            get => D10.MontantFretDA ?? 0;
            set
            {
                D10.MontantFretDA = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                UpdateAssiettes();
            }
        }

        public double MontantAssurancesDA
        {
            get => D10.MontantAssurancesDA ?? 0;
            set
            {
                D10.MontantAssurancesDA = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                UpdateAssiettes();
            }
        }

        public double MontantFraisDA
        {
            get => D10.MontantFraisDA ?? 0;
            set
            {
                D10.MontantFraisDA = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                UpdateAssiettes();
            }
        }

        public double ValeurDA => MontantFactureDA + MontantFretDA + MontantAssurancesDA + MontantFraisDA;

        public ObservableCollection<TaxeArticleVM> Taxes
        {
            get
            {
                if (_taxes == null) _taxes = IoCContainer.Get<Importation>()
                        .FactureDefinitive?
                        .LignesFacture?
                        .Select(l => new TaxeArticleVM(l)
                        {
                            Assiette = Math.Round((ValeurDA * new LigneFactureVM(l).Total / MontantFacture).Value),
                            Update = UpdateTotals,
                        })
                        .ToList();
                return (_taxes != null) ? new ObservableCollection<TaxeArticleVM>(_taxes) : null;
            }
        }

        public double? TotalRedevances
        {
            get => D10.TotalRedevances;
            set
            {
                D10.TotalRedevances = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(TotalTaxes));
            }
        }

        public double TotalDD => Taxes.Select(t => t.MontantDD).Sum();

        public double TotalTCS => Taxes.Select(t => t.MontantTCS).Sum();

        public double TotalTVA => Taxes.Select(t => t.MontantTVA).Sum();

        public double? TotalTaxes => TotalDD + TotalTCS + TotalTVA + TotalRedevances;

        public ObservableCollection<FichierVM> Fichiers => new ObservableCollection<FichierVM>(D10.FichiersJoints.Select(f => new FichierVM(f)));

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

                D10.FichiersJoints.Add(new Fichier() { NomFichier = "Fichier N° " + (Fichiers.Count + 1), Chemin = destinationFile });
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

        public FactureTransitVM FactureTransit
        {
            get
            {
                var facture = IoCContainer.Get<Importation>().FactureTransit;
                return facture != null ? new FactureTransitVM(facture) : null;
            }
        }

        public ObservableCollection<Transit> Transitaires => new ObservableCollection<Transit>(IoCContainer.Get<ModelContainer>().Entreprises.Where(e => e is Transit).Select(t => t as Transit));

        public ObservableCollection<Devise> Devises => new ObservableCollection<Devise>(IoCContainer.Get<ModelContainer>().Devises);

        public override EtatOperation Etat
        {
            get
            {
                return IoCContainer.Get<Importation>().FactureTransit == null ? EtatOperation.EnCours : EtatOperation.Cloturee;
            }
        }

        #endregion

        public override void Cloturer()
        {
            IoCContainer.Get<Importation>().FactureTransit = new FactureTransit() { NumFacture = "FT 01" };
            IoCContainer.Get<ModelContainer>().SaveChanges();
            Refresh();
            OnPropertyChanged(nameof(FactureTransit));
            
        }


    }
    

    public class TaxeArticleVM : BaseVM
    {
        public TaxeArticleVM(LigneFacture l)
        {
            LigneFacture = new LigneFactureVM(l);
            
        }

        public LigneFactureVM LigneFacture { get;}

        public Article Article => LigneFacture.Article;

        public string RefFournisseur => "Not Yet";

        public string Designation => LigneFacture.Designation;

        public int? Quantite => LigneFacture.Quantite;

        public double? PrixUnit => LigneFacture.PrixUnit;

        public double Assiette
        {
            get { return _assiette; }
            set
            {
                _assiette = value;
                OnPropertyChanged(nameof(Assiette));
                OnPropertyChanged(nameof(MontantDD));
                OnPropertyChanged(nameof(MontantTCS));
                OnPropertyChanged(nameof(MontantTVA));
                Update();
            }
        }

        public double MontantDD => Assiette * Parametres.TauxDD;

        public double MontantTCS => Assiette * Parametres.TauxTCS;

        public double MontantTVA => (Assiette + MontantDD + MontantTCS) * Parametres.TauxTVA;

        public Func<int> Update = () => { return 0; };

        private double _assiette;
    }
}
