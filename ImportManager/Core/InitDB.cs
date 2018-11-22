using ImportManager.Core;
using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager
{
    public static class InitDB
    {
        public static void Init()
        {
            ModelContainer container = IoCContainer.Get<ModelContainer>();

            //var adresses = new List<Adresse>();
            //container.Adresses.AddRange(adresses);

            //var agences = new List<AgenceBanque>();
            //container.AgenceBanques.AddRange(agences);

            //var articles = new List<Article>();
            //container.Articles.AddRange(articles);

            //var attributs = new List<Attribut>();
            //container.Attributs.AddRange(attributs);

            //var catalogues = new List<Catalogue>();
            //container.Catalogues.AddRange(catalogues);

            //var connaissements = new List<Connaissement>();
            //container.Connaissements.AddRange(connaissements);

            //var conteneurs = new List<Conteneur>();
            //container.Conteneurs.AddRange(conteneurs);

            //var echeances = new List<Echeance>();
            //container.Echeances.AddRange(echeances);

            //var entreprises = new List<Entreprise>();
            //container.Entreprises.AddRange(entreprises);

            //var factures = new List<Facture>();
            //container.Factures.AddRange(factures);

            //var fichiers = new List<Fichier>();
            //container.Fichiers.AddRange(fichiers);

            //var importations = new List<Importation>();
            //container.Importations.AddRange(importations);

            //var lignesCommandes = new List<LigneCommande>();
            //container.LigneCommandes.AddRange(lignesCommandes);

            //var lignesFactures = new List<LigneFacture>();
            //container.LigneFactures.AddRange(lignesFactures);

            //var paiements = new List<Paiement>();
            //container.Paiements.AddRange(paiements);

            //var personnes = new List<Personne>();
            //container.Personnes.AddRange(personnes);

            //var produits = new List<Produit>();
            //container.Produits.AddRange(produits);

            //var texes = new List<TaxeDouanier>();
            //container.TaxeDouaniers.AddRange(texes);

            //var valeurs = new List<Valeur>();
            //container.Valeurs.AddRange(valeurs);



            //var devises = new List<Devise>()
            //{
            //    new Devise(){Code = "DZD", Designation = "Dinar Algérien", },
            //    new Devise(){Code = "USD", Designation = "Dollar Américain", },
            //    new Devise(){Code = "EUR", Designation = "Euro", },
            //};
            //container.Devises.AddRange(devises);
            //container.SaveChanges();

            var modesFinancement = new List<Financement>()
            {
                new Financement() { Designation = "Mourabaha" },
                new Financement() { Designation = "Salam" },
                new Financement() { Designation = "Crédit classique" },
            };
            container.Financements.AddRange(modesFinancement);
            container.SaveChanges();

            var destinations = new List<DestinationProduit>()
            {
                new DestinationProduit() { Designation = "La Revente En L'Etat" },
                new DestinationProduit() { Designation = "La Consommation" },
            };
            container.DestinationProduits.AddRange(destinations);
            container.SaveChanges();

            //var pays = new List<Pays>() {
            //    new Pays() { Code = "DZ", Designation = "Algérie", Devise = container.Devises.ToList().ElementAt(0)},
            //    new Pays() { Code = "FR", Designation = "France", Devise = container.Devises.ToList().ElementAt(2)},
            //    new Pays() { Code = "IT", Designation = "Italie", Devise = container.Devises.ToList().ElementAt(2)},
            //    new Pays() { Code = "TR", Designation = "Turquie", Devise = container.Devises.ToList().ElementAt(1)},
            //};
            //container.Pays.AddRange(pays);
            //container.SaveChanges();

            //var ports = new List<Port>()
            //{
            //    new Port() { Designation="Port d'Alger", Pays = container.Pays.ToList().ElementAt(0)},
            //    new Port() { Designation="Port d'Oran", Pays = container.Pays.ToList().ElementAt(0)},
            //    new Port() { Designation="Port de Jijel", Pays = container.Pays.ToList().ElementAt(0)},
            //    new Port() { Designation="Port Marseille", Pays = container.Pays.ToList().ElementAt(1)},
            //    new Port() { Designation="Port de Rome", Pays = container.Pays.ToList().ElementAt(2)},
            //    new Port() { Designation="Port d'Izmir", Pays = container.Pays.ToList().ElementAt(3)},
            //};
            //container.Ports.AddRange(ports);
            //container.SaveChanges();

            //var wilayas = new List<Wilaya>()
            //{
            //    new Wilaya(){Code = "1", Designation = "Adrar", },
            //    new Wilaya(){Code = "2", Designation = "Chlef", },
            //    new Wilaya(){Code = "16", Designation = "Alger", },
            //    new Wilaya(){Code = "19", Designation = "Sétif", },
            //    new Wilaya(){Code = "31", Designation = "Oran", },
            //};
            //container.Wilayas.AddRange(wilayas);
            //container.SaveChanges();

            //var recettes = new List<RecetteImpots>()
            //{
            //    new RecetteImpots() { Code = "19600" , Designation = "El-Eulma" , Wilaya = IoCContainer.Get<ModelContainer>().Wilayas.ToList().ElementAt(3) },
            //    new RecetteImpots() { Code = "16000" , Designation = "Dar Beida" , Wilaya = IoCContainer.Get<ModelContainer>().Wilayas.ToList().ElementAt(2) },
            //    new RecetteImpots() { Code = "19000" , Designation = "Sétif" , Wilaya = IoCContainer.Get<ModelContainer>().Wilayas.ToList().ElementAt(3) },
            //    new RecetteImpots() { Code = "31000" , Designation = "Bir El-Djir" , Wilaya = IoCContainer.Get<ModelContainer>().Wilayas.ToList().ElementAt(4)},
            //};
            //container.RecetteImpots.AddRange(recettes);
            //container.SaveChanges();

            //var incoterms = new List<Incoterm>()
            //{
            //    new Incoterm(){ Code = "FOB" },
            //    new Incoterm(){ Code = "CFR" },
            //    new Incoterm(){ Code = "EXWORKS" },
            //};
            //container.Incoterms.AddRange(incoterms);
            //container.SaveChanges();

            //var status = new List<StatutJuridique>()
            //{
            //    new StatutJuridique(){ Designation = "Personne phyisque" },
            //    new StatutJuridique(){ Designation = "Personne morale" },
            //};
            //container.StatutsJuridiques.AddRange(status);
            //container.SaveChanges();

            //var raisons = new List<TypeEntreprise>()
            //{
            //    new TypeEntreprise() { Designation = "SARL", },
            //    new TypeEntreprise() { Designation = "EURL", },
            //};
            //container.TypesEntreprises.AddRange(raisons);
            //container.SaveChanges();

            //var activites = new List<Activite>()
            //{
            //    new Activite() { Code = "401101", Designation = "IMPORT-EXPORT DES PRODUITS , EQUIPEMENTS ET  MATERIELS ET PRODUITS LIES AU DOMAINE DE L'AGRICULTURE, LEURS PIECES DETACHEES ET ACCESSOIRES" },
            //    new Activite() { Code = "401102", Designation = "IMPORT-EXPORT DE MATERIELS ET PRODUITS DESTINES A L'AVICULTURE" },
            //    new Activite() { Code = "401201", Designation = "IMPORTATION DES MATERIELS ET PRODUITS LIES AU DOMAINE DE LA SYLVICULTURE" },
            //    new Activite() { Code = "401301", Designation = "IMPORT-EXPORT DES PRODUITS ET MATERIELS LIE AU SECTEUR DE LA PECHE ET DE L'AQUACULTURE" },
            //    new Activite() { Code = "402001", Designation = "IMPORT-EXPORT DES PRODUITS LIES A L'ALIMENTATION HUMAINE" },
            //};
            //container.Activites.AddRange(activites);
            //container.SaveChanges();

            //var modes = new List<ModeReglement>()
            //{
            //    new ModeReglement() { Designation = "Espèce" },
            //    new ModeReglement() { Designation = "Chèque" },
            //    new ModeReglement() { Designation = "Virement banquaire" },
            //};
            //container.ModesReglement.AddRange(modes);
            //container.SaveChanges();

            //var motifs = new List<MotifFacture>()
            //{
            //    new MotifFacture() { Designation = "Frais Surestaries" },
            //    new MotifFacture() { Designation = "Taxe de domiciliation" },
            //    new MotifFacture() { Designation = "Décharge des marchandises" },
            //    new MotifFacture() { Designation = "Transport des marchandises" },
            //    new MotifFacture() { Designation = "Frais transitaires" },
            //};
            //container.MotifFactures.AddRange(motifs);
            //container.SaveChanges();

            var typesEcheances = new List<TypeEcheance>()
            {
                new TypeEcheance(){ Designation = "Délai"},
                new TypeEcheance(){ Designation = "Mensuelle"},
                new TypeEcheance(){ Designation = "Bimestrielle"},
                new TypeEcheance(){ Designation = "Trimestrielle"},
                new TypeEcheance(){ Designation = "Semestrielle"},
                new TypeEcheance(){ Designation = "Annuelle"},
            };
            container.TypeEcheances.AddRange(typesEcheances);
            container.SaveChanges();

            var typesConteneurs = new List<TypeConteneur>()
            {
                new TypeConteneur() { Designation = "Dry 20'ST" },
                new TypeConteneur() { Designation = "Dry 40'ST" },
                new TypeConteneur() { Designation = "Dry 40'HC" },
                new TypeConteneur() { Designation = "Dry 45'HC" },
            };
            container.TypesConteneurs.AddRange(typesConteneurs);
            container.SaveChanges();

            //var utilisateurs = new List<Utilisateur>()
            //{
            //    new Utilisateur() { MotDePasse = "Admin", NomUtilisateur = "Admin", Type = TypeUtilisateur.Administrateur },
            //};
            //container.Utilisateurs.AddRange(utilisateurs);
            //container.SaveChanges();

            //var uqns = new List<UQN>()
            //{
            //    new UQN() { Code = "kg" , Designation = "Kilogrammes"},
            //    new UQN() { Code = "m" , Designation = "Mètres"},
            //    new UQN() { Code = "m2" , Designation = "Mètres carrés"},
            //    new UQN() { Code = "U" , Designation = "Unités"},
            //};
            //container.UQNs.AddRange(uqns);
            //container.SaveChanges();

            var sections = new List<Section>()
            {
                new Section() { Code = "1" , Designation = "ANIMAUX VIVANTS ET PRODUITS DU REGNE ANIMAL"},
                new Section() { Code = "2" , Designation = "PRODUITS DU REGNE VEGETAL"},
            };
            container.Sections.AddRange(sections);
            container.SaveChanges();

            var chapitres = new List<Chapitre>()
            {
                new Chapitre() { Code = "1" , Designation = "Animaux vivants" , Section = container.Sections.ToList().ElementAt(0) },
                new Chapitre() { Code = "2" , Designation = "Viandes et abats comestibles" , Section = container.Sections.ToList().ElementAt(0) },
                new Chapitre() { Code = "6" , Designation = "Plantes vivantes et produites de la floriculture" , Section = container.Sections.ToList().ElementAt(1) },
                new Chapitre() { Code = "7" , Designation = "Légumes, plantes, racines et tu recules alimentaires" , Section = container.Sections.ToList().ElementAt(1) },
            };
            container.Chapitres.AddRange(chapitres);
            container.SaveChanges();

            var positions = new List<Position>()
            {
                new Position() { Code = "01.01" , Designation = "Chevaux, ânes, mulets et bardots, vivants" , Chapitre = container.Chapitres.ToList().ElementAt(0) },
                new Position() { Code = "02.01" , Designation = "Viandes des animaux de l'espèce bovine, fraîches ou réfrigérées" , Chapitre = container.Chapitres.ToList().ElementAt(1) },
                new Position() { Code = "06.01" , Designation = "Bulbes, oignons, tubercules, racines tubéreuses, griffes et rhizomes, en repos végétatif, en végétation ou en fleur ; plants, plantes et racines de chicorée autres que les racines du n° 12.12" , Chapitre = container.Chapitres.ToList().ElementAt(2) },
                new Position() { Code = "07.01" , Designation = "Pommes de terre, à l'état frais ou réfrigéré" , Chapitre = container.Chapitres.ToList().ElementAt(3) },
            };
            container.Positions.AddRange(positions);
            container.SaveChanges();

            var sousPositions = new List<SousPosition>()
            {
                new SousPosition() { Code = "0101.21.11.00" , Designation = "Chevaux reproducteurs de race pure de course de pur-sang arabe" , DD = 0.05 , TVA = 0.19 , UQN = container.UQNs.ToList().ElementAt(3) , Position = container.Positions.ToList().ElementAt(0) },
                new SousPosition() { Code = "0201.10.11.00" , Designation = "En carcasses ou demi-carcasses de l’espèce domestique de veaux" , DD = 0.3 , TVA = 0.19 , UQN = container.UQNs.ToList().ElementAt(0) , Position = container.Positions.ToList().ElementAt(1) },
                new SousPosition() { Code = "0601.10.11.00" , Designation = "Bulbes, oignons, tubercules, racines tubéreuses, griffes et rhizomes, en repos végétatif griffes de légumes destinés à la plantation" , DD = 0.05 , TVA = 0.19 , UQN = container.UQNs.ToList().ElementAt(3) , Position = container.Positions.ToList().ElementAt(2) },
                new SousPosition() { Code = "0701.10.00.00" , Designation = "De semence" , DD = 0.05 , TVA = 0.19 , UQN = container.UQNs.ToList().ElementAt(0) , Position = container.Positions.ToList().ElementAt(3) },
            };
            container.SousPositions.AddRange(sousPositions);
            container.SaveChanges();

            //var entreprises = new List<Entreprise>()
            //{
            //    new Importateur() {
            //        Activites = container.Activites.ToList(),
            //        Denomination = "El-Chahid Multiservices",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 0",
            //    },
            //    new Importateur() {
            //        Activites = container.Activites.ToList(),
            //        Denomination = "El-Chahid International",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 1",
            //    },
            //    new Fournisseur() {
            //        Denomination = "GENAC",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 2",
            //    },
            //    new Fournisseur() {
            //        Denomination = "IMPO",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 3",
            //    },
            //    new Banque() {
            //        Denomination = "AGB",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 4",
            //    },
            //    new Transit() {
            //        Denomination = "Amel Transit",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 5",
            //    },
            //    new Transit() {
            //        Denomination = "Global Transit",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 6",
            //    },
            //    new Entreprise() {
            //        Denomination = "CMA CGM",
            //        Type = container.TypesEntreprises.ToList().ElementAt(0),
            //        StatutJuridique = container.StatutsJuridiques.ToList().ElementAt(0),
            //        RegistreCommerce = "RegistreCommerce 7",
            //    },
            //};
            //container.Entreprises.AddRange(entreprises);
            //container.SaveChanges();

            //var attributs = new List<Attribut>()
            //{
            //    new Attribut()
            //    {
            //        DesignationFR = "Marque" ,
            //        Valeurs = new List<Valeur>()
            //        {
            //            new Valeur() { ValeurFR = "Seat" },
            //            new Valeur() { ValeurFR = "VolksWagen" },
            //            new Valeur() { ValeurFR = "Peugeot" },
            //        }
            //    },
            //    new Attribut()
            //    {
            //        DesignationFR = "Modèle" ,
            //        Valeurs = new List<Valeur>()
            //        {
            //            new Valeur() { ValeurFR = "208" },
            //            new Valeur() { ValeurFR = "Golf" },
            //            new Valeur() { ValeurFR = "Leon" },
            //        }
            //    },
            //};

            //var catalogue = new Catalogue()
            //{
            //    Produits = new List<Produit>()
            //    {
            //        new Produit() { Attributs = attributs , DesignationFR = "Capot" , PositionTarifaire = container.SousPositions.ToList().ElementAt(0) },
            //        new Produit() { Attributs = attributs , DesignationFR = "Aile" , PositionTarifaire = container.SousPositions.ToList().ElementAt(1) },
            //        new Produit() { Attributs = attributs , DesignationFR = "Pare-Choc" , PositionTarifaire = container.SousPositions.ToList().ElementAt(2) },
            //    },
            //    Importateur = container.Entreprises.ToList().ElementAt(0) as Importateur,
            //};
            //container.Catalogues.Add(catalogue);
            //container.SaveChanges();
        }
    }
}
