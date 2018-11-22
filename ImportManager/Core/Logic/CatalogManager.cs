using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    class CatalogueManager
    {
        private Catalogue Catalogue;

        public CatalogueManager(Catalogue catalogue)
        {
            Catalogue = catalogue;
        }

        public void AddArticle(Article article)
        {
            if (article.Designation == string.Empty || article.OEM == string.Empty || article.Packaging == null || article.Reference == string.Empty)
                return;
            Catalogue.Articles.Add(article);
            IoCContainer.Get<ModelContainer>().SaveChanges();
        }

        //TODO
        public void DeleteArticle(Article article)
        {
            //IoCContainer.Get<ModelContainer>().SaveChanges();
        }

        public void SetArticle(Article article)
        {
            if (article.Designation == string.Empty || article.OEM == string.Empty || article.Packaging == null || article.Reference == string.Empty)
                return;
            var tmp = Catalogue.Articles.SingleOrDefault(a => a.Id==article.Id);
            if (tmp == null) return;

            tmp.Designation = article.Designation;
            tmp.OEM = article.OEM;
            tmp.Packaging = article.Packaging;
            tmp.PoidsNet = article.PoidsNet;
            tmp.Reference = article.Reference;
            tmp.Volume = article.Volume;
            IoCContainer.Get<ModelContainer>().SaveChanges();
        }

        public List<Article> GetArticles()
        {
            return Catalogue?.Articles?.ToList();
        }
    }
}
