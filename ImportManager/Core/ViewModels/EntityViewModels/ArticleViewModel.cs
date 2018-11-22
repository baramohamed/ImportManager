using Model;
using System;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class ArticleVM : BaseVM
    {
        public Article Article;
        public ArticleVM(ProduitVM produit)
        {
            Produit = produit;
        }

        public ArticleVM(Article article)
        {
            Article = article;
        }
        public ProduitVM Produit { get; set; }

        public string Designation
        {
            get => Article.Designation;
            set
            {
                Article.Designation = value;
            }
        }

        public string OEM
        {
            get => Article.OEM;
            set
            {
                Article.OEM = value;
            }
        }

        public string Reference { get; set; }

        public ObservableCollection<Core.Tuple<Attribut, Valeur>> Attributs
        {
            get
            {
                return new ObservableCollection<Core.Tuple<Attribut, Valeur>>(Article.ValeursAttributs.ToList().Select(v => new Core.Tuple<Attribut, Valeur>() { Key = v.Attribut , Value = v}));
            }
        }
    }
}
