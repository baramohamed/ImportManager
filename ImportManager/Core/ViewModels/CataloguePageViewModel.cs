using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class CataloguePageVM : BaseVM
    {
        private Article _selectedArticle;
        private CatalogueManager catalogueManager;

        public CataloguePageVM()
        {
            //Importateurs = Parametres.Importateurs;
            //Produits = Parametres.Produits;
            //Attributs = Parametres.Attributs.ToDictionary(a => a, a => string.Empty);
            //Articles = Parametres.Articles;
            var importateur = IoCContainer.Get<Importateur>();
            if (importateur.Catalogue == null) importateur.Catalogue = new Catalogue();
            SelectedImportateur = importateur;
        }

        public ObservableCollection<Importateur> Importateurs => new ObservableCollection<Importateur>(IoCContainer.Get<ModelContainer>().Entreprises.Where(e => e is Importateur).Select(i => i as Importateur));

        public Importateur SelectedImportateur
        {
            set
            {
                catalogueManager = new CatalogueManager(value.Catalogue);
                OnPropertyChanged(nameof(Articles));
            }
        }

        public Article SelectedArticle
        {
            get => _selectedArticle;
            set
            {
                _selectedArticle = new Article() { Designation = value.Designation, OEM = value.OEM, Packaging = value.Packaging, PoidsNet = value.PoidsNet, Reference = value.Reference, Volume = value.Volume, Id = value.Id };
                OnPropertyChanged(nameof(SelectedArticle));
            }
        }

        public bool IsEditEnabled { get; set; }

        public ObservableCollection<Article> Articles
        {
            get
            {
                if (catalogueManager == null) return null;
                return new ObservableCollection<Article>(catalogueManager.GetArticles());
            }
        }

        public ObservableCollection<Packaging> Packagings
        {
            get => new ObservableCollection<Packaging>(IoCContainer.Get<ModelContainer>().Packagings);
        }


        public RelayCommand AddArticle => new RelayCommand(() =>
        {
            SelectedArticle = new Article();
            IsEditEnabled = true;
            OnPropertyChanged(nameof(IsEditEnabled));
            OkCommand = ValidateAdd;
            OnPropertyChanged(nameof(OkCommand));
        });

        private RelayCommand ValidateAdd => new RelayCommand(() => 
        {
            catalogueManager.AddArticle(_selectedArticle);
            OnPropertyChanged(nameof(Articles));
            IsEditEnabled = false;
            OnPropertyChanged(nameof(IsEditEnabled));
        });

        private RelayCommand ValidateEdit => new RelayCommand(() =>
        {
            catalogueManager.SetArticle(SelectedArticle);
            OnPropertyChanged(nameof(Articles));
            IsEditEnabled = false;
            OnPropertyChanged(nameof(IsEditEnabled));
        });

        public RelayCommand OkCommand
        {
            get;
            private set;
        }

        public RelayCommand EditArticle => new RelayCommand(() =>
        {
            if (SelectedArticle == null) return;
            IsEditEnabled = true;
            OnPropertyChanged(nameof(IsEditEnabled));
            OkCommand = ValidateEdit;
            OnPropertyChanged(nameof(OkCommand));
        });

        public RelayCommand DeletArticle => new RelayCommand(() => 
        {
            catalogueManager.DeleteArticle(_selectedArticle);
            OnPropertyChanged(nameof(Articles));
        });

        public List<string> Produits
        {
            get
            {
                var importateur = IoCContainer.Get<Importateur>();
                var list = importateur.Catalogue.Produits.Select(p => {
                    var s = p.DesignationFR + " ";
                    p.Attributs.Select(a => a.Valeurs.Select(v => v));
                    return s;
                });
                return list.ToList();
            }
        }

        public RelayCommand GenerateCatalogue => new RelayCommand(() =>
        {
            
            OnPropertyChanged(nameof(Articles));
        });
    }
}
