using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class LigneCommandeVM : BaseVM
    {
        public LigneCommande Ligne;
        public LigneCommandeVM(LigneCommande ligne)
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
                return (reference != null)? reference.Reference : string.Empty;
            }
            set
            {
                var importation = IoCContainer.Get<Importation>();
                var reference = Article.ReferencesFournisseurs.SingleOrDefault(r => (r.Fournisseur == importation.Fournisseur));
                if (reference == null)
                {
                    reference = new ReferenceFournisseur() { Fournisseur = importation.Fournisseur, Reference = value };
                    Article.ReferencesFournisseurs.Add(reference);
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
                Update();
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public Func<int> Update = () => { return 0; };

        #endregion
    }
}
