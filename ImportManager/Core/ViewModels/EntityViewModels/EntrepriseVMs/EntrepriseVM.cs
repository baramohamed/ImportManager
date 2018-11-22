using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class EntrepriseVM : BaseVM
    {
        public Entreprise Entreprise;
        public EntrepriseVM(Entreprise entreprise)
        {
            Entreprise = entreprise;
            AddAgence = new RelayCommand(() =>
            {
                var banque = Entreprise as Banque;
                banque.Agences.Add(new AgenceBanque());
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Agences));
            });

            DeleteAgence = new RelayCommand(() => 
            {
                if (SelectedAgence.Agence == null) return;
                var container = IoCContainer.Get<ModelContainer>();
                container.AgenceBanques.Remove(SelectedAgence.Agence);
                container.SaveChanges();
                OnPropertyChanged(nameof(Agences));
            });

            AddCompte = new RelayCommand(() =>
            {
                Entreprise.ComptesBancaires.Add(new CompteBancaire());
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Comptes));
            });

            DeleteCompte = new RelayCommand(() =>
            {
                if (SelectedCompte.Compte == null) return;
                var container = IoCContainer.Get<ModelContainer>();
                container.ComptesBancaires.Remove(SelectedCompte.Compte);
                container.SaveChanges();
                OnPropertyChanged(nameof(Comptes));
            });

            AddMotif = new RelayCommand(() =>
            {
                Entreprise.Motifs.Add(new MotifFacture());
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Motifs));
            });

            DeleteMotif = new RelayCommand(() =>
            {
                if (SelectedMotif == null) return;
                var container = IoCContainer.Get<ModelContainer>();
                Entreprise.Motifs.Remove(SelectedMotif);
                container.SaveChanges();
                OnPropertyChanged(nameof(Motifs));
                OnPropertyChanged(nameof(ListeMotifs));
            });

            SelectMotif = new RelayCommand(() =>
            {
                if (AvailableMotif == null) return;
                Entreprise.Motifs.Add(AvailableMotif);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Motifs));
            });

            DeleteActivite = new RelayCommand(() =>
            {
                (Entreprise as Importateur).Activites.Remove(SelectedActivite);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Activites));
            });

            SelectActivite = new RelayCommand(() =>
            {
                if (AvailableActivite == null) return;
                (Entreprise as Importateur).Activites.Add(AvailableActivite);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Activites));
            });

        }

        public EntrepriseVM()
        {

        }

        public string Denomination
        {
            get => Entreprise.Denomination;
            set
            {
                Entreprise.Denomination = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Denomination));
            }
        }
        public string DenominationAR
        {
            get => Entreprise.DenominationAR;
            set
            {
                Entreprise.DenominationAR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
        public double? Capital
        {
            get => Entreprise.Capital;
            set
            {
                Entreprise.Capital = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
        public TypeEntreprise Type
        {
            get => Entreprise.Type;
            set
            {
                Entreprise.Type = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public TypeActivite TypeActivite
        {
            get => Entreprise.TypeActivite;
            set
            {
                Entreprise.TypeActivite = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public StatutJuridique StatutJuridique
        {
            get => Entreprise.StatutJuridique;
            set
            {
                Entreprise.StatutJuridique = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
        public string RegistreCommerce
        {
            get => Entreprise.RegistreCommerce;
            set
            {
                Entreprise.RegistreCommerce = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(RegistreCommerce));
            }
        }
        public string NumArticle
        {
            get => Entreprise.NumArticle;
            set
            {
                Entreprise.NumArticle = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string NIF
        {
            get => Entreprise.NIF;
            set
            {
                Entreprise.NIF = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string NIS
        {
            get => Entreprise.NIS;
            set
            {
                Entreprise.NIS = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Tel
        {
            get => Entreprise.Tel;
            set
            {
                Entreprise.Tel = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Fax
        {
            get => Entreprise.Fax;
            set
            {
                Entreprise.Fax = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string EMail
        {
            get => Entreprise.EMail;
            set
            {
                Entreprise.EMail = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string SiteWeb
        {
            get => Entreprise.SiteWeb;
            set
            {
                Entreprise.SiteWeb = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public AdresseVM Adresse
        {
            get
            {
                if (Entreprise.Adresse1 == null)
                {
                    if (Entreprise is Fournisseur) Entreprise.Adresse1 = new Adresse();
                    else Entreprise.Adresse1 = new AdresseLocale();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new AdresseVM(Entreprise.Adresse1);
            }
        }

        public PersonneVM Contact
        {
            get
            {
                if (Entreprise.Contact == null)
                {
                    Entreprise.Contact = new Personne();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new PersonneVM(Entreprise.Contact);
            }
        }

        public PersonneVM Gerant
        {
            get
            {
                if (Entreprise.Gerant == null)
                {
                    Entreprise.Gerant = new Personne();
                    IoCContainer.Get<ModelContainer>().SaveChanges();
                }
                return new PersonneVM(Entreprise.Gerant);
            }
        }

        public FichierVM Logo => new FichierVM(Entreprise.Logo);

        public ObservableCollection<MotifFacture> Motifs => new ObservableCollection<MotifFacture>(Entreprise.Motifs);

        public MotifFacture SelectedMotif { get; set; }

        public ObservableCollection<MotifFacture> ListeMotifs => new ObservableCollection<MotifFacture>(IoCContainer.Get<ModelContainer>().MotifFactures);

        public MotifFacture AvailableMotif { get; set; }

        public ObservableCollection<Activite> Activites => new ObservableCollection<Activite>((Entreprise as Importateur).Activites);

        public Activite SelectedActivite { get; set; }

        public ObservableCollection<Activite> ListeActivites => new ObservableCollection<Activite>(IoCContainer.Get<ModelContainer>().Activites);

        public Activite AvailableActivite { get; set; }

        public ObservableCollection<TypeEntreprise> TypesEntreprises => new ObservableCollection<TypeEntreprise>(IoCContainer.Get<ModelContainer>().TypesEntreprises);

        public ObservableCollection<TypeActivite> TypesActivites => new ObservableCollection<TypeActivite>(IoCContainer.Get<ModelContainer>().TypesActivites);

        public ObservableCollection<StatutJuridique> Statuts => new ObservableCollection<StatutJuridique>(IoCContainer.Get<ModelContainer>().StatutsJuridiques);

        public ObservableCollection<AgenceBanqueVM> Agences => new ObservableCollection<AgenceBanqueVM>((Entreprise as Banque).Agences.Select(a => new AgenceBanqueVM(a)));

        public AgenceBanqueVM SelectedAgence { get; set; }

        public ObservableCollection<CompteBancaireVM> Comptes => new ObservableCollection<CompteBancaireVM>(Entreprise.ComptesBancaires.Select(c => new CompteBancaireVM(c)));

        public CompteBancaireVM SelectedCompte { get; set; }

        public RelayCommand AddAgence { get; set; }

        public RelayCommand DeleteAgence { get; set; }

        public RelayCommand AddCompte { get; set; }

        public RelayCommand DeleteCompte { get; set; }

        public RelayCommand AddMotif { get; set; }

        public RelayCommand DeleteMotif { get; set; }

        public RelayCommand SelectMotif { get; set; }

        public RelayCommand DeleteActivite { get; set; }

        public RelayCommand SelectActivite { get; set; }
    }

    public class MotifFactureVM : BaseVM
    {
        public MotifFacture Motif;

        public MotifFactureVM(MotifFacture motif)
        {
            Motif = motif;
        }

        public string Designation
        {
            get => Motif.Designation;
            set
            {
                Motif.Designation = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
    }

    public class CompteBancaireVM
    {
        public CompteBancaire Compte;

        public CompteBancaireVM(CompteBancaire compte)
        {
            Compte = compte;
        }

        public ObservableCollection<Banque> Banques => new ObservableCollection<Banque>(IoCContainer.Get<ModelContainer>().Entreprises.Where(e => e is Banque).Select(b => b as Banque));

        public Banque Banque
        {
            get => Compte.Banque;
            set
            {
                Compte.Banque = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string NumCompte
        {
            get => Compte.NumCompte;
            set
            {
                Compte.NumCompte = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
    }

    public class PersonneVM
    {
        public Personne Personne;

        public PersonneVM(Personne personne)
        {
            Personne = personne;
        }

        public string Nom
        {
            get => Personne.Nom;
            set
            {
                Personne.Nom = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Prenom
        {
            get => Personne.Prenom;
            set
            {
                Personne.Prenom = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Tel
        {
            get => Personne.Tel;
            set
            {
                Personne.Tel = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string EMail
        {
            get => Personne.EMail;
            set
            {
                Personne.EMail = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public Titre? Titre
        {
            get => Personne.Titre;
            set
            {
                Personne.Titre = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Fonction
        {
            get => Personne.Fonction;
            set
            {
                Personne.Fonction = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string NIF
        {
            get => Personne.NIF;
            set
            {
                Personne.NIF = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string NIS
        {
            get => Personne.NIS;
            set
            {
                Personne.NIS = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public Array Titres => Enum.GetValues(typeof(Titre));
    }

    public class AdresseVM : BaseVM
    {
        public Adresse Adresse;

        public AdresseVM(Adresse adresse)
        {
            Adresse = adresse;
        }

        public string LigneAdresse
        {
            get => Adresse.LigneAdresse;
            set
            {
                Adresse.LigneAdresse = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string CodePostal
        {
            get => Adresse.CodePostal;
            set
            {
                Adresse.CodePostal = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public Pays Pays
        {
            get => Adresse.Pays;
            set
            {
                Adresse.Pays = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(IsAdresseLocale));
            }
        }

        public string Commune
        {
            get
            {
                var adresse = (Adresse as AdresseLocale);
                if (adresse == null) return null;
                return adresse.Commune;
            }
            set
            {
                (Adresse as AdresseLocale).Commune = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Daira
        {
            get
            {
                var adresse = (Adresse as AdresseLocale);
                if (adresse == null) return null;
                return adresse.Daira;
            }
            set
            {
                (Adresse as AdresseLocale).Daira = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public Wilaya Wilaya
        {
            get
            {
                var adresse = (Adresse as AdresseLocale);
                if (adresse == null) return null;
                return adresse.Wilaya;
            }
            set
            {
                (Adresse as AdresseLocale).Wilaya = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public bool IsAdresseLocale
        {
            get
            {
                if (Pays == null) return false;
                return Pays.Code == "DZ";
            }
        }

        public ObservableCollection<Pays> ListePays => new ObservableCollection<Pays>(IoCContainer.Get<ModelContainer>().Pays);

        public ObservableCollection<Wilaya> Wilayas => new ObservableCollection<Wilaya>(IoCContainer.Get<ModelContainer>().Wilayas);
    }

    public class AgenceBanqueVM : BaseVM
    {
        public AgenceBanque Agence;

        public AgenceBanqueVM(AgenceBanque agence)
        {
            Agence = agence;
        }

        public string Code
        {
            get => Agence.Code;
            set
            {
                Agence.Code = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Designation
        {
            get => Agence.Designation;
            set
            {
                Agence.Designation = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public virtual Banque Banque { get; set; }
    }
}
