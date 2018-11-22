using iTextSharp.text.pdf;
using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class DomiciliationPageVM : OperationVM
    {
        public DomiciliationPageVM()
        {
            PrintTaxe = new RelayCommand(() =>
            {
                var directory = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\ImportManager\Assets";

                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                var fullPath = directory + @"\C25.pdf";
                var newFile = directory + @"\C25_New.pdf";
                var reader = new PdfReader(fullPath);
                var stamper = new PdfStamper(reader, new FileStream(newFile, FileMode.OpenOrCreate));
                var importateur = IoCContainer.Get<Importation>().Importateur;
                var importation = IoCContainer.Get<Importation>();
                var fields = stamper.AcroFields;
                
                fields.SetField("DE", RecetteImpots.Wilaya.Designation);
                fields.SetField("RECETTE DES IMPOTS DE", RecetteImpots.Designation);
                fields.SetField("Code de la recette Ll", RecetteImpots.Code);
                fields.SetField("Nom et prénom ou raison sociale", importateur.Denomination);
                fields.SetField("Statut juridique", importateur.StatutJuridique.Designation);
                fields.SetField("Capital social", importateur.Capital.ToString());
                var adresse = (importateur.Adresse1 as AdresseLocale);
                fields.SetField("Adresse", adresse.LigneAdresse + ", " + adresse.Commune + ", " + adresse.Wilaya.Designation);
                fields.SetField("Texte1", importateur.NIF);
                fields.SetField("Texte2", "NIF 2");
                fields.SetField("Texte4", importateur.RegistreCommerce.Substring(0,2));
                fields.SetField("Texte3", importateur.RegistreCommerce.Substring(2));
                fields.SetField("Code dactivité", importation.Activite.Code);
                fields.SetField("Texte5", importateur.ComptesBancaires.SingleOrDefault(c => c.Banque == importation.BanqueImportateur.Banque)?.NumCompte);
                var gerant = importateur.Gerant;
                var adresseGerant = gerant.Adresse as AdresseLocale;
                var nomGerant = gerant.Nom + " " + gerant.Prenom + ", " + adresseGerant?.LigneAdresse + ", " + adresseGerant?.Commune + ", " + adresseGerant?.Wilaya.Designation;
                fields.SetField("Nom prénom et adresse du gérant", nomGerant);
                fields.SetField("LI 1", gerant.NIF);
                fields.SetField("Texte9", "NIF Gérant 2");
                var positions = importation.FactureProforma.LignesFacture.Select(l => l.Article.Produit.PositionTarifaire);

                fields.SetField("Texte6", "Position Tarifaire 1");
                fields.SetField("Texte7", positions.Select(p => p.Code.Replace(".", "")).Aggregate((current, next) => current + " " + (!current.Contains(next) ? next : "")));
                var proforma = new FactureProformaVM(importation.FactureProforma);
                fields.SetField("Texte8",proforma.TotalPrix + proforma.Devise.Designation + " = " + (proforma.TotalPrix * Cours) + " DA");
                fields.SetField("Texte10", Developpez.Dotnet.NumberConverter.Spell(Convert.ToInt64((proforma.TotalPrix * Cours).Value)) + " DA");
                fields.SetField("Numéro de la facture ou autre document commercial", proforma.InvoiceN);
                fields.SetField("Banque de domiciliation", AgenceBanqueImportateur.Banque.Denomination);
                fields.SetField("Désignation de lagence", AgenceBanqueImportateur.Designation);
                fields.SetField("Code de lagence", AgenceBanqueImportateur.Code);
                fields.SetField("Bénéficiaire étranger", importation.Fournisseur.Denomination);
                var adressFournisseur = importation.Fournisseur.Adresse1;
                fields.SetField("Adresse du bénéficiaire étranger", adressFournisseur.LigneAdresse + " " + adressFournisseur.CodePostal + " " + adressFournisseur.Pays.Designation);
                fields.SetField("le", DateTaxeDomiciliation.ToShortDateString());
                //fields.SetField("Numéro", "Numéro");
                //fields.SetField("Date", "Date");
                //fields.SetField("Mode de paiement", "Mode Paiement");
                fields.SetField("Fait à", RecetteImpots.Designation);
                //fields.SetField("Code de la recette Ll_3", "Code Recette");
                stamper.Close();
                reader.Close();

                Process.Start(newFile);
            });

            PrintFranchise = new RelayCommand(() => 
            {
                var directory = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\ImportManager\Assets";

                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                var fullPath = directory + @"\DemFranchise.pdf";
                var newFile = directory + @"\DemFranchise_New.pdf";
                var reader = new PdfReader(fullPath);
                var stamper = new PdfStamper(reader, new FileStream(newFile, FileMode.OpenOrCreate));
                var importateur = IoCContainer.Get<Importation>().Importateur;
                var importation = IoCContainer.Get<Importation>();
                var fields = stamper.AcroFields;

                fields.SetField("RaisonSociale", importateur.Denomination);
                fields.SetField("RaisonSociale_AR", importateur.DenominationAR);
                fields.SetField("Tel", importateur.Tel);
                fields.SetField("Fax", importateur.Fax);
                var adresse = (importateur.Adresse1 as AdresseLocale);
                fields.SetField("Adresse", adresse.LigneAdresse + ", " + adresse.Commune + ", " + adresse.Wilaya.Designation);
                fields.SetField("DesignationMarchandise", "A Déterminer");
                fields.SetField("SousPosition", "A Déterminer");
                fields.SetField("AgenceCNRC", "A Déterminer");
                fields.SetField("AgenceCNRC_AR", "A Déterminer");
                fields.SetField("NIF", importateur.NIF);
                fields.SetField("PoidsNet", "A Déterminer");
                fields.SetField("ValeurFOB", "A Déterminer");
                fields.SetField("Fret", "A Déterminer");
                fields.SetField("PaysOrigine", importation.PaysOrigine.Designation);
                fields.SetField("PaysProvenance", importation.FactureProforma.PortEmbarquement.Pays.Designation);
                stamper.Close();
                reader.Close();

            });

            PrintOrdreAchat = new RelayCommand(() =>
            {
                var directory = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\ImportManager\Assets";

                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                var fullPath = directory + @"\OrdreAchat.pdf";
                var newFile = directory + @"\OrdreAchat_New.pdf";
                var reader = new PdfReader(fullPath);
                var stamper = new PdfStamper(reader, new FileStream(newFile, FileMode.OpenOrCreate));
                var importateur = IoCContainer.Get<Importation>().Importateur;
                var importation = IoCContainer.Get<Importation>();
                var fields = stamper.AcroFields;

                fields.SetField("TypeMarchandise", "A Déterminer");
                fields.SetField("Quantite", new FactureProformaVM(importation.FactureProforma).TotalQuantite.ToString());
                fields.SetField("Prix", new FactureProformaVM(importation.FactureProforma).TotalPrix.ToString());
                fields.SetField("NumFacture", importation.FactureProforma.NumFacture);
                fields.SetField("Lieu", LieuOrdreAchat);
                fields.SetField("Date", DateOrdreAchat);
                stamper.Close();
                reader.Close();

            });

        }

        #region Public Properties
        public override string Titre { get => "Domiciliation"; }

        public Banque SelectedBanque => (AgenceBanqueImportateur != null) ? AgenceBanqueImportateur.Banque : null;
        public AgenceBanque AgenceBanqueImportateur
        {
            get => IoCContainer.Get<Importation>().BanqueImportateur;
            set
            {
                IoCContainer.Get<Importation>().BanqueImportateur = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(AgenceBanqueImportateur));
            }
        }

        public ObservableCollection<Financement> Financements => new ObservableCollection<Financement>(IoCContainer.Get<Importation>().Financements);

        public bool IsProforma { get; set; }

        public bool IsDefinitive { get; set; }

        public DestinationProduit DestinationProduit
        {
            get => IoCContainer.Get<Importation>().DestinationProduit;
            set
            {
                IoCContainer.Get<Importation>().DestinationProduit = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DestinationProduit));
            }
        }

        public DateTime? DateExpedition
        {
            get => IoCContainer.Get<Importation>().FactureProforma.DateEmbarquement;
            set
            {
                IoCContainer.Get<Importation>().FactureProforma.DateEmbarquement = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DateExpedition));
            }
        }

        public string NPreDomiciliation
        {
            get => IoCContainer.Get<Importation>().FactureProforma.NPredomiciliation;
            set
            {
                IoCContainer.Get<Importation>().FactureProforma.NPredomiciliation = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DestinationProduit));
            }
        }

        public DateTime? DatePreDomiciliation
        {
            get => IoCContainer.Get<Importation>().FactureProforma.DatePredomiciliation;
            set
            {
                IoCContainer.Get<Importation>().FactureProforma.DatePredomiciliation = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DestinationProduit));
            }
        }

        public RecetteImpots RecetteImpots
        {
            get => IoCContainer.Get<Importation>().RecetteImpots;
            set
            {
                IoCContainer.Get<Importation>().RecetteImpots = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(RecetteImpots));
            }
        }

        public DateTime DateTaxeDomiciliation { get; set; }

        public double? Cours
        {
            get => IoCContainer.Get<Importation>().CoursDomiciliation;
            set
            {
                IoCContainer.Get<Importation>().CoursDomiciliation = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(RecetteImpots));
            }
        }

        public string LieuOrdreAchat { get; set; }

        public string DateOrdreAchat { get; set; }

        public FactureDefinitiveVM FactureDefinitive
        {
            get
            {
                var facture = IoCContainer.Get<Importation>().FactureDefinitive;
                if (facture!= null) return new FactureDefinitiveVM(facture);
                return null;
            }
        }

        public DocumentVM Connaissement
        {
            get
            {
                if (IoCContainer.Get<Importation>().Connaissement == null)
                {
                    IoCContainer.Get<Importation>().Connaissement = new Document();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new DocumentVM(IoCContainer.Get<Importation>().Connaissement);
            }
        }

        public DocumentVM CertificatDeConformite
        {
            get
            {
                if (IoCContainer.Get<Importation>().CertificatDeConformite == null)
                {
                    IoCContainer.Get<Importation>().CertificatDeConformite = new Document();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new DocumentVM(IoCContainer.Get<Importation>().CertificatDeConformite);
            }
        }

        public DocumentVM CertificatDOrigine
        {
            get
            {
                if (IoCContainer.Get<Importation>().CertificatDOrigine == null)
                {
                    IoCContainer.Get<Importation>().CertificatDOrigine = new Document();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new DocumentVM(IoCContainer.Get<Importation>().CertificatDOrigine);
            }
        }

        public DocumentVM ListeDeColissage
        {
            get
            {
                if (IoCContainer.Get<Importation>().ListeDeColissage == null)
                {
                    IoCContainer.Get<Importation>().ListeDeColissage = new Document();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new DocumentVM(IoCContainer.Get<Importation>().ListeDeColissage);
            }
        }

        public DocumentVM SelectedDocument { get; set; }

        public bool IsDialogOpen { get; set; } = false;

        public RelayCommand JoinConnaissement => new RelayCommand(() =>
        {
            IsDialogOpen = true;
            SelectedDocument = Connaissement;
            OnPropertyChanged(nameof(SelectedDocument));
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public RelayCommand JoinCertificatDeConformite => new RelayCommand(() =>
        {
            IsDialogOpen = true;
            SelectedDocument = CertificatDeConformite;
            OnPropertyChanged(nameof(SelectedDocument));
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public RelayCommand JoinCertificatDOrigine => new RelayCommand(() =>
        {
            IsDialogOpen = true;
            SelectedDocument = CertificatDOrigine;
            OnPropertyChanged(nameof(SelectedDocument));
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public RelayCommand JoinListeDeColissage => new RelayCommand(() =>
        {
            IsDialogOpen = true;
            SelectedDocument = ListeDeColissage;
            OnPropertyChanged(nameof(SelectedDocument));
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public RelayCommand CloseDialog => new RelayCommand(() =>
        {
            IsDialogOpen = false;
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        #endregion

        #region Other Porperties

        public ObservableCollection<Banque> Banques => new ObservableCollection<Banque>(IoCContainer.Get<ModelContainer>().Entreprises.Where(e => e is Banque).Select(b => b as Banque));

        public ObservableCollection<Financement> ModesFinancement => new ObservableCollection<Financement>(IoCContainer.Get<ModelContainer>().Financements);

        public ObservableCollection<DestinationProduit> DestinationsProduit => new ObservableCollection<DestinationProduit>(IoCContainer.Get<ModelContainer>().DestinationProduits);

        public ObservableCollection<Wilaya> Wilayas => new ObservableCollection<Wilaya>(IoCContainer.Get<ModelContainer>().Wilayas);

        #endregion

        #region Public Commands

        public RelayCommand PrintTaxe { get; set; }

        public RelayCommand PrintFranchise { get; set; }

        public RelayCommand PrintOrdreAchat { get; set; }
        #endregion

        public override void Cloturer()
        {
            var lignes = new List<LigneFacture>();
            var proforma = IoCContainer.Get<Importation>().FactureProforma;
            lignes.AddRange(
                proforma.LignesFacture
                .Select(l => new LigneFacture()
                {
                    Article = l.Article,
                    PoidsUnitaire = l.PoidsUnitaire,
                    PrixUnitaire = l.PrixUnitaire,
                    Quantite = l.Quantite,
                    VolumeUnitaire = l.VolumeUnitaire
                }));
            IoCContainer.Get<Importation>().FactureDefinitive = new FactureDefinitive()
            {
                NumFacture = "Fact D01",
                LignesFacture = lignes,
                DateDebarquement = proforma.DateDebarquement,
                DateEmbarquement = proforma.DateEmbarquement,
                Devise = proforma.Devise,
                Incoterm = proforma.Incoterm,
                ModeReglement = proforma.ModeReglement,
                PortDebarquement = proforma.PortDebarquement,
                PortEmbarquement = proforma.PortEmbarquement,
            };
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(FactureDefinitive));
            Refresh();
        }

        public override EtatOperation Etat
        {
            get
            {
                return (IoCContainer.Get<Importation>().FactureDefinitive == null) ? EtatOperation.EnCours : EtatOperation.Cloturee;
            }
        }
    }

    public class DocumentVM : BaseVM
    {
        public Document Document;

        public DocumentVM(Document document)
        {
            Document = document;
        }

        public string Num
        {
            get => Document.Num;
            set
            {
                Document.Num = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public DateTime? Date
        {
            get => Document.Date;
            set
            {
                Document.Date = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public ObservableCollection<FichierVM> Fichiers => new ObservableCollection<FichierVM>(Document.Fichiers.Select(f => new FichierVM(f)));

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

                Document.Fichiers.Add(new Fichier() { NomFichier = "Fichier N° " + (Fichiers.Count + 1), Chemin = destinationFile });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Fichiers));
            }
        });
    }
}
