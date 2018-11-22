using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public static class Parametres
    {

        public static void Init()
        {
            TauxDD = 0.15;

            TauxTCS = 0.01;

            TauxTVA = 0.19;

            Importateurs = new ObservableCollection<string>() { "El-Chahid Multiservices", "El-Chahid International", };

            Marques = new ObservableCollection<string>() { "Peugeot", "Renault", "Seat" };

            Modeles = new ObservableCollection<string>() { "207", "208", "Clio", "Ibiza" };

            Series = new ObservableCollection<string>() { "Ancien", "Nouveau", };

            Cotes = new ObservableCollection<string>() { "Gauche", "Droite", };

            //Attributs = new ObservableCollection<AttributVM>()
            //{
            //    new AttributVM() { DesignationAR = "Marque AR", DesignationEN = "Marque EN", DesignationFR = "Marque FR", Valeurs = Marques },
            //    new AttributVM() { DesignationAR = "Modèle AR", DesignationEN = "Modèle EN", DesignationFR = "Modèle FR", Valeurs = Modeles },
            //    new AttributVM() { DesignationAR = "Coté AR", DesignationEN = "Coté EN", DesignationFR = "Coté FR", Valeurs = Cotes },
            //    new AttributVM() { DesignationAR = "Série AR", DesignationEN = "Série EN", DesignationFR = "Série FR", Valeurs = Series },
            //};

            //Produits = new ObservableCollection<ProduitVM>()
            //{
            //    new ProduitVM() { DesignationEN = "Capot EN", DesignationAR = "Capot AR", DesignationFR = "Capot FR", Attributs = Attributs },
            //    new ProduitVM() { DesignationEN = "Pare-Choc EN", DesignationAR = "Pare-Choc AR", DesignationFR = "Pare-Choc FR", Attributs = Attributs },
            //    new ProduitVM() { DesignationEN = "Aile EN", DesignationAR = "Aile AR", DesignationFR = "Aile FR", Attributs = Attributs },
            //};

            //Articles = new ObservableCollection<ArticleVM>()
            //{
            //    new ArticleVM(Produits.ElementAt(0)) { OEM = "OEM 1", Reference = "Ref 1", Attributs = Attributs.ToDictionary(a => a,a => a.Valeurs.ElementAt(0))},
            //    new ArticleVM(Produits.ElementAt(0)) { OEM = "OEM 2", Reference = "Ref 2", Attributs = Attributs.ToDictionary(a => a,a => a.Valeurs.ElementAt(1))},
            //    new ArticleVM(Produits.ElementAt(0)) { OEM = "OEM 3", Reference = "Ref 3", Attributs = Attributs.ToDictionary(a => a,a => a.Valeurs.ElementAt(0))},
            //};

        }
        public static double TauxDD { get; set; }

        public static double TauxTCS { get; set; }

        public static double TauxTVA { get; set; }

        public static ObservableCollection<string> Importateurs { get; set; }

        public static ObservableCollection<string> Marques { get; set; }

        public static ObservableCollection<string> Modeles { get; set; }

        public static ObservableCollection<string> Series { get; set; }

        public static ObservableCollection<string> Cotes { get; set; }

        public static ObservableCollection<AttributVM> Attributs { get; set; }

        public static ObservableCollection<ProduitVM> Produits { get; set; }

        public static ObservableCollection<ArticleVM> Articles { get; set; }
    }
}
