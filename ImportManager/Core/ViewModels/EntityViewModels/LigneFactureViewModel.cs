using ImportManager.Core;
using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager
{
    public class LigneFactureVM : BaseVM
    {
        public LigneFacture Ligne;
        public LigneFactureVM(LigneFacture ligne)
        {
            Ligne = ligne;
        }

        #region Public Properties

        public Article Article
        {
            get => Ligne.Article;
            set
            {
                Ligne.Article = value;
            }
        }

        public int Index { get; }

        public string OEM => Article.OEM;

        public string RefFournisseur
        {
            get
            {
                var importation = IoCContainer.Get<Importation>();
                var reference = Article.ReferencesFournisseurs.SingleOrDefault(r => (r.Fournisseur == importation.Fournisseur));
                return (reference != null) ? reference.Reference : string.Empty;
            }
            set
            {
                var importation = IoCContainer.Get<Importation>();
                var reference = Article.ReferencesFournisseurs.SingleOrDefault(r => (r.Fournisseur == importation.Fournisseur));
                if (reference == null)
                {
                    Article.ReferencesFournisseurs.Add(new ReferenceFournisseur() { Article = Article, Fournisseur = importation.Fournisseur, Reference = value });
                }
                else
                {
                    reference.Reference = value;
                }
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Designation => Article.Designation;

        public int? Quantite
        {
            get { return Ligne.Quantite; }
            set
            {
                Ligne.Quantite = value;
                OnPropertyChanged(nameof(Total));
                IoCContainer.Get<ModelContainer>().SaveChanges();
                Update();
            }
        }

        public double? PrixUnit
        {
            get { return Ligne.PrixUnitaire; }
            set
            {
                Ligne.PrixUnitaire = value;
                OnPropertyChanged(nameof(Total));
                IoCContainer.Get<ModelContainer>().SaveChanges();
                Update();
            }
        }

        public double? Total => Quantite * PrixUnit;

        public Func<int> Update = () => { return 0; };

        #endregion

    }

}
