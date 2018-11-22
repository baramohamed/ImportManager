
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 10/26/2018 16:35:53
-- Generated from EDMX file: E:\Projects\Import\ImportManager\Model\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [ImportManagerDB];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_ImportationFactureProforma]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_ImportationFactureProforma];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationFactureDefinitive]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDefinitive] DROP CONSTRAINT [FK_ImportationFactureDefinitive];
GO
IF OBJECT_ID(N'[dbo].[FK_AssocationASupprimer1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_Banque] DROP CONSTRAINT [FK_AssocationASupprimer1];
GO
IF OBJECT_ID(N'[dbo].[FK_LigneFactureArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneFactures] DROP CONSTRAINT [FK_LigneFactureArticle];
GO
IF OBJECT_ID(N'[dbo].[FK_CatalogueArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_CatalogueArticle];
GO
IF OBJECT_ID(N'[dbo].[FK_AssociationASupprimer2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_Banque] DROP CONSTRAINT [FK_AssociationASupprimer2];
GO
IF OBJECT_ID(N'[dbo].[FK_BanqueAgence]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AgenceBanques] DROP CONSTRAINT [FK_BanqueAgence];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureProformaPortEmbarquement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_FactureProformaPortEmbarquement];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureProformaPortDebarquement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_FactureProformaPortDebarquement];
GO
IF OBJECT_ID(N'[dbo].[FK_SectionChapitre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Chapitres] DROP CONSTRAINT [FK_SectionChapitre];
GO
IF OBJECT_ID(N'[dbo].[FK_AdresseLocaleWilaya]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Adresses_AdresseLocale] DROP CONSTRAINT [FK_AdresseLocaleWilaya];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseAdresse1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Adresses] DROP CONSTRAINT [FK_EntrepriseAdresse1];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseAdresse2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Adresses] DROP CONSTRAINT [FK_EntrepriseAdresse2];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureTransitFactureNonDeclaree]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureNonDeclaree] DROP CONSTRAINT [FK_FactureTransitFactureNonDeclaree];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureTransitFrais]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDeclaree] DROP CONSTRAINT [FK_FactureTransitFrais];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationD10]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[TaxeDouaniers] DROP CONSTRAINT [FK_ImportationD10];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDefinitivePortEmbarquement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ports] DROP CONSTRAINT [FK_FactureDefinitivePortEmbarquement];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDefinitivePortDebarquement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ports] DROP CONSTRAINT [FK_FactureDefinitivePortDebarquement];
GO
IF OBJECT_ID(N'[dbo].[FK_ChapitrePosition]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Positions] DROP CONSTRAINT [FK_ChapitrePosition];
GO
IF OBJECT_ID(N'[dbo].[FK_PositionSousPosition]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SousPositions] DROP CONSTRAINT [FK_PositionSousPosition];
GO
IF OBJECT_ID(N'[dbo].[FK_ConnaissementConteneur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Conteneurs] DROP CONSTRAINT [FK_ConnaissementConteneur];
GO
IF OBJECT_ID(N'[dbo].[FK_ConnaissementCompagnieMaritime]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Connaissements] DROP CONSTRAINT [FK_ConnaissementCompagnieMaritime];
GO
IF OBJECT_ID(N'[dbo].[FK_ConnaissementFichierJoint]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fichiers] DROP CONSTRAINT [FK_ConnaissementFichierJoint];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureFichier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fichiers] DROP CONSTRAINT [FK_FactureFichier];
GO
IF OBJECT_ID(N'[dbo].[FK_D10Fichier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fichiers] DROP CONSTRAINT [FK_D10Fichier];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseLogo]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fichiers] DROP CONSTRAINT [FK_EntrepriseLogo];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportateurCatalogue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Catalogues] DROP CONSTRAINT [FK_ImportateurCatalogue];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationFrais]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureFrais] DROP CONSTRAINT [FK_ImportationFrais];
GO
IF OBJECT_ID(N'[dbo].[FK_FournisseurReferenceFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReferenceFournisseurs] DROP CONSTRAINT [FK_FournisseurReferenceFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_ReferenceFournisseurArticle]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ReferenceFournisseurs] DROP CONSTRAINT [FK_ReferenceFournisseurArticle];
GO
IF OBJECT_ID(N'[dbo].[FK_PaysAdresse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Adresses] DROP CONSTRAINT [FK_PaysAdresse];
GO
IF OBJECT_ID(N'[dbo].[FK_ConteneurTypeConteneur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Conteneurs] DROP CONSTRAINT [FK_ConteneurTypeConteneur];
GO
IF OBJECT_ID(N'[dbo].[FK_RaisonSocialeEntreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises] DROP CONSTRAINT [FK_RaisonSocialeEntreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_StatutJuridiqueEntreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises] DROP CONSTRAINT [FK_StatutJuridiqueEntreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_PaysDevise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pays] DROP CONSTRAINT [FK_PaysDevise];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureFraisMotif]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureFrais] DROP CONSTRAINT [FK_FactureFraisMotif];
GO
IF OBJECT_ID(N'[dbo].[FK_PortPays]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Ports] DROP CONSTRAINT [FK_PortPays];
GO
IF OBJECT_ID(N'[dbo].[FK_SousPositionUQN]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[SousPositions] DROP CONSTRAINT [FK_SousPositionUQN];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationBanqueImportateur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationBanqueImportateur];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationBanqueFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationBanqueFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportateurActivite_Importateur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImportateurActivite] DROP CONSTRAINT [FK_ImportateurActivite_Importateur];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportateurActivite_Activite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImportateurActivite] DROP CONSTRAINT [FK_ImportateurActivite_Activite];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationActivite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationActivite];
GO
IF OBJECT_ID(N'[dbo].[FK_PositionProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produits] DROP CONSTRAINT [FK_PositionProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_AttributsProduit_Produit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AttributsProduit] DROP CONSTRAINT [FK_AttributsProduit_Produit];
GO
IF OBJECT_ID(N'[dbo].[FK_AttributsProduit_Attribut]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[AttributsProduit] DROP CONSTRAINT [FK_AttributsProduit_Attribut];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_ArticleProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_ValeursAttribut]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Valeurs] DROP CONSTRAINT [FK_ValeursAttribut];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleValeur_Article]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleValeur] DROP CONSTRAINT [FK_ArticleValeur_Article];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleValeur_Valeur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ArticleValeur] DROP CONSTRAINT [FK_ArticleValeur_Valeur];
GO
IF OBJECT_ID(N'[dbo].[FK_ContactEntreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Personnes] DROP CONSTRAINT [FK_ContactEntreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticleLigneCommande]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneCommandes] DROP CONSTRAINT [FK_ArticleLigneCommande];
GO
IF OBJECT_ID(N'[dbo].[FK_CommandeLigneCommande]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneCommandes] DROP CONSTRAINT [FK_CommandeLigneCommande];
GO
IF OBJECT_ID(N'[dbo].[FK_LigneFactureFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneFactures] DROP CONSTRAINT [FK_LigneFactureFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationFactureTransit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureTransit] DROP CONSTRAINT [FK_ImportationFactureTransit];
GO
IF OBJECT_ID(N'[dbo].[FK_PaiementModeReglement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Paiements] DROP CONSTRAINT [FK_PaiementModeReglement];
GO
IF OBJECT_ID(N'[dbo].[FK_PaiementDevise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Paiements] DROP CONSTRAINT [FK_PaiementDevise];
GO
IF OBJECT_ID(N'[dbo].[FK_EcheanceTypeEcheance]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Echeances] DROP CONSTRAINT [FK_EcheanceTypeEcheance];
GO
IF OBJECT_ID(N'[dbo].[FK_EcheancePaiement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Paiements] DROP CONSTRAINT [FK_EcheancePaiement];
GO
IF OBJECT_ID(N'[dbo].[FK_FacturePaiement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Paiements] DROP CONSTRAINT [FK_FacturePaiement];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureEcheance]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Echeances] DROP CONSTRAINT [FK_FactureEcheance];
GO
IF OBJECT_ID(N'[dbo].[FK_PaiementFichier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fichiers] DROP CONSTRAINT [FK_PaiementFichier];
GO
IF OBJECT_ID(N'[dbo].[FK_TaxeDouanierPaiement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Paiements] DROP CONSTRAINT [FK_TaxeDouanierPaiement];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationCommande]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_Commande] DROP CONSTRAINT [FK_ImportationCommande];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationOffre]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_Offre] DROP CONSTRAINT [FK_ImportationOffre];
GO
IF OBJECT_ID(N'[dbo].[FK_CatalogueProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Produits] DROP CONSTRAINT [FK_CatalogueProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationPaysOrigine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationPaysOrigine];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureProformaModeReglement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_FactureProformaModeReglement];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureProformaDevise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_FactureProformaDevise];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationFinancement_Importation]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImportationFinancement] DROP CONSTRAINT [FK_ImportationFinancement_Importation];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationFinancement_Financement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ImportationFinancement] DROP CONSTRAINT [FK_ImportationFinancement_Financement];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationDestinationProduit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationDestinationProduit];
GO
IF OBJECT_ID(N'[dbo].[FK_WilayaRecetteImpots]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RecetteImpots] DROP CONSTRAINT [FK_WilayaRecetteImpots];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationRecetteImpots]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationRecetteImpots];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDefinitiveModeReglement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDefinitive] DROP CONSTRAINT [FK_FactureDefinitiveModeReglement];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDefinitiveDevise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDefinitive] DROP CONSTRAINT [FK_FactureDefinitiveDevise];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationImportateur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationImportateur];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationTransit]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Importations] DROP CONSTRAINT [FK_ImportationTransit];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseMotifFacture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[MotifFactures] DROP CONSTRAINT [FK_EntrepriseMotifFacture];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureFraisEntreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureFrais] DROP CONSTRAINT [FK_FactureFraisEntreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationArrivage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LigneCommandes] DROP CONSTRAINT [FK_ImportationArrivage];
GO
IF OBJECT_ID(N'[dbo].[FK_DocumentFichier]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Fichiers] DROP CONSTRAINT [FK_DocumentFichier];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationCertificatDeConformite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_ImportationCertificatDeConformite];
GO
IF OBJECT_ID(N'[dbo].[FK_CertificatDOrigine]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_CertificatDOrigine];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationListeDeColissage]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_ImportationListeDeColissage];
GO
IF OBJECT_ID(N'[dbo].[FK_ImportationConnaissement]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Documents] DROP CONSTRAINT [FK_ImportationConnaissement];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseCompteBancaire]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComptesBancaires] DROP CONSTRAINT [FK_EntrepriseCompteBancaire];
GO
IF OBJECT_ID(N'[dbo].[FK_BanqueCompteBancaire]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[ComptesBancaires] DROP CONSTRAINT [FK_BanqueCompteBancaire];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseGerant]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises] DROP CONSTRAINT [FK_EntrepriseGerant];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonneAdresse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Adresses] DROP CONSTRAINT [FK_PersonneAdresse];
GO
IF OBJECT_ID(N'[dbo].[FK_EntrepriseTypeActivite]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises] DROP CONSTRAINT [FK_EntrepriseTypeActivite];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDefinitiveIncoterm]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDefinitive] DROP CONSTRAINT [FK_FactureDefinitiveIncoterm];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureProformaIncoterm]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_FactureProformaIncoterm];
GO
IF OBJECT_ID(N'[dbo].[FK_AttributPereFils]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Attributs] DROP CONSTRAINT [FK_AttributPereFils];
GO
IF OBJECT_ID(N'[dbo].[FK_ValeurPereFils]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Valeurs] DROP CONSTRAINT [FK_ValeurPereFils];
GO
IF OBJECT_ID(N'[dbo].[FK_ArticlePackaging]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Articles] DROP CONSTRAINT [FK_ArticlePackaging];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureFournisseur_inherits_Facture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureFournisseur] DROP CONSTRAINT [FK_FactureFournisseur_inherits_Facture];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureProforma_inherits_FactureFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureProforma] DROP CONSTRAINT [FK_FactureProforma_inherits_FactureFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDefinitive_inherits_FactureFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDefinitive] DROP CONSTRAINT [FK_FactureDefinitive_inherits_FactureFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_Banque_inherits_Entreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_Banque] DROP CONSTRAINT [FK_Banque_inherits_Entreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_AdresseLocale_inherits_Adresse]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Adresses_AdresseLocale] DROP CONSTRAINT [FK_AdresseLocale_inherits_Adresse];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureTransit_inherits_Facture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureTransit] DROP CONSTRAINT [FK_FactureTransit_inherits_Facture];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureFrais_inherits_Facture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureFrais] DROP CONSTRAINT [FK_FactureFrais_inherits_Facture];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureNonDeclaree_inherits_FactureFrais]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureNonDeclaree] DROP CONSTRAINT [FK_FactureNonDeclaree_inherits_FactureFrais];
GO
IF OBJECT_ID(N'[dbo].[FK_FactureDeclaree_inherits_FactureFrais]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_FactureDeclaree] DROP CONSTRAINT [FK_FactureDeclaree_inherits_FactureFrais];
GO
IF OBJECT_ID(N'[dbo].[FK_CompagnieMaritime_inherits_Entreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_CompagnieMaritime] DROP CONSTRAINT [FK_CompagnieMaritime_inherits_Entreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_Importateur_inherits_Entreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_Importateur] DROP CONSTRAINT [FK_Importateur_inherits_Entreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_Fournisseur_inherits_Entreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_Fournisseur] DROP CONSTRAINT [FK_Fournisseur_inherits_Entreprise];
GO
IF OBJECT_ID(N'[dbo].[FK_Commande_inherits_Facture]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_Commande] DROP CONSTRAINT [FK_Commande_inherits_Facture];
GO
IF OBJECT_ID(N'[dbo].[FK_Offre_inherits_FactureFournisseur]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Factures_Offre] DROP CONSTRAINT [FK_Offre_inherits_FactureFournisseur];
GO
IF OBJECT_ID(N'[dbo].[FK_Transit_inherits_Entreprise]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Entreprises_Transit] DROP CONSTRAINT [FK_Transit_inherits_Entreprise];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Importations]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Importations];
GO
IF OBJECT_ID(N'[dbo].[Entreprises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entreprises];
GO
IF OBJECT_ID(N'[dbo].[Factures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures];
GO
IF OBJECT_ID(N'[dbo].[LigneFactures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LigneFactures];
GO
IF OBJECT_ID(N'[dbo].[Personnes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Personnes];
GO
IF OBJECT_ID(N'[dbo].[Ports]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Ports];
GO
IF OBJECT_ID(N'[dbo].[AgenceBanques]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AgenceBanques];
GO
IF OBJECT_ID(N'[dbo].[Catalogues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Catalogues];
GO
IF OBJECT_ID(N'[dbo].[Articles]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Articles];
GO
IF OBJECT_ID(N'[dbo].[Sections]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Sections];
GO
IF OBJECT_ID(N'[dbo].[Chapitres]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Chapitres];
GO
IF OBJECT_ID(N'[dbo].[Positions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Positions];
GO
IF OBJECT_ID(N'[dbo].[SousPositions]', 'U') IS NOT NULL
    DROP TABLE [dbo].[SousPositions];
GO
IF OBJECT_ID(N'[dbo].[Adresses]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Adresses];
GO
IF OBJECT_ID(N'[dbo].[Wilayas]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Wilayas];
GO
IF OBJECT_ID(N'[dbo].[TaxeDouaniers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TaxeDouaniers];
GO
IF OBJECT_ID(N'[dbo].[Connaissements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Connaissements];
GO
IF OBJECT_ID(N'[dbo].[Fichiers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Fichiers];
GO
IF OBJECT_ID(N'[dbo].[Conteneurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Conteneurs];
GO
IF OBJECT_ID(N'[dbo].[ReferenceFournisseurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ReferenceFournisseurs];
GO
IF OBJECT_ID(N'[dbo].[Pays]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pays];
GO
IF OBJECT_ID(N'[dbo].[TypesConteneurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypesConteneurs];
GO
IF OBJECT_ID(N'[dbo].[ModesReglement]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ModesReglement];
GO
IF OBJECT_ID(N'[dbo].[TypesEntreprises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypesEntreprises];
GO
IF OBJECT_ID(N'[dbo].[StatutsJuridiques]', 'U') IS NOT NULL
    DROP TABLE [dbo].[StatutsJuridiques];
GO
IF OBJECT_ID(N'[dbo].[Devises]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Devises];
GO
IF OBJECT_ID(N'[dbo].[MotifFactures]', 'U') IS NOT NULL
    DROP TABLE [dbo].[MotifFactures];
GO
IF OBJECT_ID(N'[dbo].[UQNs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UQNs];
GO
IF OBJECT_ID(N'[dbo].[Activites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Activites];
GO
IF OBJECT_ID(N'[dbo].[Produits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Produits];
GO
IF OBJECT_ID(N'[dbo].[Attributs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Attributs];
GO
IF OBJECT_ID(N'[dbo].[Valeurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Valeurs];
GO
IF OBJECT_ID(N'[dbo].[LigneCommandes]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LigneCommandes];
GO
IF OBJECT_ID(N'[dbo].[Paiements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Paiements];
GO
IF OBJECT_ID(N'[dbo].[Echeances]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Echeances];
GO
IF OBJECT_ID(N'[dbo].[TypeEcheances]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypeEcheances];
GO
IF OBJECT_ID(N'[dbo].[Utilisateurs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Utilisateurs];
GO
IF OBJECT_ID(N'[dbo].[Financements]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Financements];
GO
IF OBJECT_ID(N'[dbo].[DestinationProduits]', 'U') IS NOT NULL
    DROP TABLE [dbo].[DestinationProduits];
GO
IF OBJECT_ID(N'[dbo].[RecetteImpots]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RecetteImpots];
GO
IF OBJECT_ID(N'[dbo].[Documents]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Documents];
GO
IF OBJECT_ID(N'[dbo].[ComptesBancaires]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ComptesBancaires];
GO
IF OBJECT_ID(N'[dbo].[TypesActivites]', 'U') IS NOT NULL
    DROP TABLE [dbo].[TypesActivites];
GO
IF OBJECT_ID(N'[dbo].[Incoterms]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Incoterms];
GO
IF OBJECT_ID(N'[dbo].[Packagings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Packagings];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureFournisseur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureFournisseur];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureProforma]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureProforma];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureDefinitive]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureDefinitive];
GO
IF OBJECT_ID(N'[dbo].[Entreprises_Banque]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entreprises_Banque];
GO
IF OBJECT_ID(N'[dbo].[Adresses_AdresseLocale]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Adresses_AdresseLocale];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureTransit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureTransit];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureFrais]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureFrais];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureNonDeclaree]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureNonDeclaree];
GO
IF OBJECT_ID(N'[dbo].[Factures_FactureDeclaree]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_FactureDeclaree];
GO
IF OBJECT_ID(N'[dbo].[Entreprises_CompagnieMaritime]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entreprises_CompagnieMaritime];
GO
IF OBJECT_ID(N'[dbo].[Entreprises_Importateur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entreprises_Importateur];
GO
IF OBJECT_ID(N'[dbo].[Entreprises_Fournisseur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entreprises_Fournisseur];
GO
IF OBJECT_ID(N'[dbo].[Factures_Commande]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_Commande];
GO
IF OBJECT_ID(N'[dbo].[Factures_Offre]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Factures_Offre];
GO
IF OBJECT_ID(N'[dbo].[Entreprises_Transit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Entreprises_Transit];
GO
IF OBJECT_ID(N'[dbo].[ImportateurActivite]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImportateurActivite];
GO
IF OBJECT_ID(N'[dbo].[AttributsProduit]', 'U') IS NOT NULL
    DROP TABLE [dbo].[AttributsProduit];
GO
IF OBJECT_ID(N'[dbo].[ArticleValeur]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ArticleValeur];
GO
IF OBJECT_ID(N'[dbo].[ImportationFinancement]', 'U') IS NOT NULL
    DROP TABLE [dbo].[ImportationFinancement];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Importations'
CREATE TABLE [dbo].[Importations] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateCreation] datetime  NULL,
    [DateDebarquement] datetime  NULL,
    [DateNegociation] datetime  NULL,
    [DateDomiciliation] datetime  NULL,
    [DateDedouanement] datetime  NULL,
    [DateCloturation] datetime  NULL,
    [DateArrivee] datetime  NULL,
    [CoursDomiciliation] float  NULL,
    [CoursDedouanement] float  NULL,
    [CoursAchat] float  NULL,
    [BanqueImportateur_Id] int  NULL,
    [BanqueFournisseur_Id] int  NULL,
    [Activite_Code] nvarchar(max)  NULL,
    [PaysOrigine_Id] int  NULL,
    [DestinationProduit_Id] int  NULL,
    [RecetteImpots_Id] int  NULL,
    [Importateur_Id] int  NULL,
    [Fournisseur_Id] int  NULL,
    [Transit_Id] int  NULL
);
GO

-- Creating table 'Entreprises'
CREATE TABLE [dbo].[Entreprises] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [RegistreCommerce] nvarchar(max)  NULL,
    [Denomination] nvarchar(max)  NULL,
    [DenominationAR] nvarchar(max)  NULL,
    [Capital] float  NULL,
    [NumArticle] nvarchar(max)  NULL,
    [NIF] nvarchar(max)  NULL,
    [NIS] nvarchar(max)  NULL,
    [Tel] nvarchar(max)  NULL,
    [Fax] nvarchar(max)  NULL,
    [EMail] nvarchar(max)  NULL,
    [SiteWeb] nvarchar(max)  NULL,
    [Type_Id] int  NULL,
    [StatutJuridique_Id] int  NULL,
    [Gerant_Id] int  NULL,
    [TypeActivite_Id] int  NULL
);
GO

-- Creating table 'Factures'
CREATE TABLE [dbo].[Factures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NumFacture] nvarchar(max)  NULL,
    [Date] datetime  NULL
);
GO

-- Creating table 'LigneFactures'
CREATE TABLE [dbo].[LigneFactures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [PoidsUnitaire] float  NULL,
    [PrixUnitaire] float  NULL,
    [Quantite] int  NULL,
    [VolumeUnitaire] float  NULL,
    [Article_Id] int  NULL,
    [LigneFactureFournisseur_LigneFacture_Id] int  NOT NULL
);
GO

-- Creating table 'Personnes'
CREATE TABLE [dbo].[Personnes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nom] nvarchar(max)  NULL,
    [Prenom] nvarchar(max)  NULL,
    [Titre] int  NULL,
    [Fonction] nvarchar(max)  NULL,
    [Tel] nvarchar(max)  NULL,
    [EMail] nvarchar(max)  NULL,
    [NIS] nvarchar(max)  NULL,
    [NIF] nvarchar(max)  NULL,
    [Entreprise_Id] int  NULL
);
GO

-- Creating table 'Ports'
CREATE TABLE [dbo].[Ports] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL,
    [FactureDefinitivePortEmbarquement_Port_Id] int  NULL,
    [FactureDefinitivePortDebarquement_Port_Id] int  NULL,
    [Pays_Id] int  NULL
);
GO

-- Creating table 'AgenceBanques'
CREATE TABLE [dbo].[AgenceBanques] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL,
    [Banque_Id] int  NULL
);
GO

-- Creating table 'Catalogues'
CREATE TABLE [dbo].[Catalogues] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Importateur_Id] int  NULL
);
GO

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Reference] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL,
    [OEM] nvarchar(max)  NULL,
    [PoidsNet] decimal(18,0)  NULL,
    [Volume] decimal(18,0)  NULL,
    [Catalogue_Id] int  NULL,
    [Produit_Id] int  NULL,
    [Packaging_Id] int  NULL
);
GO

-- Creating table 'Sections'
CREATE TABLE [dbo].[Sections] (
    [Code] nvarchar(max)  NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'Chapitres'
CREATE TABLE [dbo].[Chapitres] (
    [Code] nvarchar(max)  NOT NULL,
    [Designation] nvarchar(max)  NULL,
    [Section_Code] nvarchar(max)  NULL
);
GO

-- Creating table 'Positions'
CREATE TABLE [dbo].[Positions] (
    [Code] nvarchar(max)  NOT NULL,
    [Designation] nvarchar(max)  NULL,
    [Chapitre_Code] nvarchar(max)  NULL
);
GO

-- Creating table 'SousPositions'
CREATE TABLE [dbo].[SousPositions] (
    [Code] nvarchar(max)  NOT NULL,
    [Designation] nvarchar(max)  NULL,
    [GU] nvarchar(max)  NULL,
    [TVA] float  NULL,
    [DD] float  NULL,
    [Cle] nvarchar(max)  NULL,
    [Position_Code] nvarchar(max)  NULL,
    [UQN_Id] int  NULL
);
GO

-- Creating table 'Adresses'
CREATE TABLE [dbo].[Adresses] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [LigneAdresse] nvarchar(max)  NULL,
    [CodePostal] nvarchar(max)  NULL,
    [EntrepriseAdresse1_Adresse_Id] int  NULL,
    [EntrepriseAdresse2_Adresse_Id] int  NULL,
    [Pays_Id] int  NULL,
    [PersonneAdresse_Adresse_Id] int  NULL
);
GO

-- Creating table 'Wilayas'
CREATE TABLE [dbo].[Wilayas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'TaxeDouaniers'
CREATE TABLE [dbo].[TaxeDouaniers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NumD10] nvarchar(max)  NULL,
    [Date] datetime  NULL,
    [MontantFactureDA] float  NULL,
    [MontantFretDA] float  NULL,
    [MontantAssurancesDA] float  NULL,
    [MontantFraisDA] float  NULL,
    [TotalRedevances] float  NULL,
    [ImportationD10_D10_Id] int  NOT NULL
);
GO

-- Creating table 'Connaissements'
CREATE TABLE [dbo].[Connaissements] (
    [Id] nvarchar(max)  NOT NULL,
    [NumBL] nvarchar(max)  NULL,
    [NumVoyage] nvarchar(max)  NULL,
    [Date] datetime  NULL,
    [CompagnieMaritime_Id] int  NULL
);
GO

-- Creating table 'Fichiers'
CREATE TABLE [dbo].[Fichiers] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NomFichier] nvarchar(max)  NULL,
    [Description] nvarchar(max)  NULL,
    [Chemin] nvarchar(max)  NULL,
    [ConnaissementFichierJoint_Fichier_Id] nvarchar(max)  NULL,
    [FactureFichier_Fichier_Id] int  NULL,
    [D10Fichier_Fichier_Id] int  NULL,
    [EntrepriseLogo_Fichier_Id] int  NULL,
    [PaiementFichier_Fichier_Id] int  NULL,
    [DocumentFichier_Fichier_Id] int  NULL
);
GO

-- Creating table 'Conteneurs'
CREATE TABLE [dbo].[Conteneurs] (
    [Id] nvarchar(max)  NOT NULL,
    [Ref] nvarchar(max)  NULL,
    [Poids] decimal(18,0)  NULL,
    [Connaissement_Id] nvarchar(max)  NULL,
    [Type_Id] int  NULL
);
GO

-- Creating table 'ReferenceFournisseurs'
CREATE TABLE [dbo].[ReferenceFournisseurs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Reference] nvarchar(max)  NULL,
    [Fournisseur_Id] int  NULL,
    [Article_Id] int  NULL
);
GO

-- Creating table 'Pays'
CREATE TABLE [dbo].[Pays] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL,
    [Devise_Id] int  NULL
);
GO

-- Creating table 'TypesConteneurs'
CREATE TABLE [dbo].[TypesConteneurs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'ModesReglement'
CREATE TABLE [dbo].[ModesReglement] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'TypesEntreprises'
CREATE TABLE [dbo].[TypesEntreprises] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'StatutsJuridiques'
CREATE TABLE [dbo].[StatutsJuridiques] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'Devises'
CREATE TABLE [dbo].[Devises] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'MotifFactures'
CREATE TABLE [dbo].[MotifFactures] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL,
    [EntrepriseMotifFacture_MotifFacture_Id] int  NULL
);
GO

-- Creating table 'UQNs'
CREATE TABLE [dbo].[UQNs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'Activites'
CREATE TABLE [dbo].[Activites] (
    [Code] nvarchar(max)  NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'Produits'
CREATE TABLE [dbo].[Produits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DesignationFR] nvarchar(max)  NULL,
    [DesignationEN] nvarchar(max)  NULL,
    [DesignationAR] nvarchar(max)  NULL,
    [PositionTarifaire_Code] nvarchar(max)  NULL,
    [Catalogue_Id] int  NULL
);
GO

-- Creating table 'Attributs'
CREATE TABLE [dbo].[Attributs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DesignationFR] nvarchar(max)  NULL,
    [DesignationEN] nvarchar(max)  NULL,
    [DesignationAR] nvarchar(max)  NULL,
    [Pere_Id] int  NULL
);
GO

-- Creating table 'Valeurs'
CREATE TABLE [dbo].[Valeurs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ValeurFR] nvarchar(max)  NULL,
    [ValeurAR] nvarchar(max)  NULL,
    [ValeurEN] nvarchar(max)  NULL,
    [Attribut_Id] int  NULL,
    [Pere_Id] int  NULL
);
GO

-- Creating table 'LigneCommandes'
CREATE TABLE [dbo].[LigneCommandes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Quantite] int  NULL,
    [Article_Id] int  NULL,
    [Commande_Id] int  NULL,
    [ImportationArrivage_LigneCommande_Id] int  NULL
);
GO

-- Creating table 'Paiements'
CREATE TABLE [dbo].[Paiements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Montant] decimal(18,0)  NULL,
    [Date] datetime  NULL,
    [ModeReglement_Id] int  NULL,
    [Devise_Id] int  NULL,
    [EcheancePaiement_Paiement_Id] int  NULL,
    [FacturePaiement_Paiement_Id] int  NULL,
    [TaxeDouanierPaiement_Paiement_Id] int  NULL
);
GO

-- Creating table 'Echeances'
CREATE TABLE [dbo].[Echeances] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateEcheance] datetime  NULL,
    [Type_Id] int  NULL,
    [FactureEcheance_Echeance_Id] int  NULL
);
GO

-- Creating table 'TypeEcheances'
CREATE TABLE [dbo].[TypeEcheances] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'Utilisateurs'
CREATE TABLE [dbo].[Utilisateurs] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NomUtilisateur] nvarchar(max)  NULL,
    [MotDePasse] nvarchar(max)  NULL,
    [Type] int  NULL
);
GO

-- Creating table 'Financements'
CREATE TABLE [dbo].[Financements] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'DestinationProduits'
CREATE TABLE [dbo].[DestinationProduits] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'RecetteImpots'
CREATE TABLE [dbo].[RecetteImpots] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL,
    [Designation] nvarchar(max)  NULL,
    [Wilaya_Id] int  NULL
);
GO

-- Creating table 'Documents'
CREATE TABLE [dbo].[Documents] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Num] nvarchar(max)  NULL,
    [Date] datetime  NULL,
    [ImportationCertificatDeConformite_Document_Id] int  NULL,
    [CertificatDOrigine_Document_Id] int  NULL,
    [ImportationListeDeColissage_Document_Id] int  NULL,
    [ImportationConnaissement_Document_Id] int  NULL
);
GO

-- Creating table 'ComptesBancaires'
CREATE TABLE [dbo].[ComptesBancaires] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NumCompte] nvarchar(max)  NULL,
    [Entreprise_Id] int  NULL,
    [Banque_Id] int  NULL
);
GO

-- Creating table 'TypesActivites'
CREATE TABLE [dbo].[TypesActivites] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Designation] nvarchar(max)  NULL
);
GO

-- Creating table 'Incoterms'
CREATE TABLE [dbo].[Incoterms] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Code] nvarchar(max)  NULL
);
GO

-- Creating table 'Packagings'
CREATE TABLE [dbo].[Packagings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Désignation] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Factures_FactureFournisseur'
CREATE TABLE [dbo].[Factures_FactureFournisseur] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Factures_FactureProforma'
CREATE TABLE [dbo].[Factures_FactureProforma] (
    [DateEmbarquement] datetime  NULL,
    [DateDebarquement] datetime  NULL,
    [NPredomiciliation] nvarchar(max)  NULL,
    [DatePredomiciliation] datetime  NULL,
    [Id] int  NOT NULL,
    [Importation_Id] int  NULL,
    [PortEmbarquement_Id] int  NULL,
    [PortDebarquement_Id] int  NULL,
    [ModeReglement_Id] int  NULL,
    [Devise_Id] int  NULL,
    [Incoterm_Id] int  NULL
);
GO

-- Creating table 'Factures_FactureDefinitive'
CREATE TABLE [dbo].[Factures_FactureDefinitive] (
    [NumDomiciliation] nvarchar(max)  NULL,
    [DateDomiciliation] datetime  NULL,
    [DateEmbarquement] datetime  NULL,
    [DateDebarquement] datetime  NULL,
    [Id] int  NOT NULL,
    [Importation_Id] int  NULL,
    [ModeReglement_Id] int  NULL,
    [Devise_Id] int  NULL,
    [Incoterm_Id] int  NULL
);
GO

-- Creating table 'Entreprises_Banque'
CREATE TABLE [dbo].[Entreprises_Banque] (
    [Id] int  NOT NULL,
    [AssocationASupprimer1_Banque_Id] int  NULL,
    [AssociationASupprimer2_Banque_Id] int  NULL
);
GO

-- Creating table 'Adresses_AdresseLocale'
CREATE TABLE [dbo].[Adresses_AdresseLocale] (
    [Daira] nvarchar(max)  NULL,
    [Commune] nvarchar(max)  NULL,
    [Id] int  NOT NULL,
    [Wilaya_Id] int  NULL
);
GO

-- Creating table 'Factures_FactureTransit'
CREATE TABLE [dbo].[Factures_FactureTransit] (
    [NumDossier] nvarchar(max)  NULL,
    [NumRepertoire] nvarchar(max)  NULL,
    [Id] int  NOT NULL,
    [ImportationFactureTransit_FactureTransit_Id] int  NOT NULL
);
GO

-- Creating table 'Factures_FactureFrais'
CREATE TABLE [dbo].[Factures_FactureFrais] (
    [Montant] float  NULL,
    [Remarque] nvarchar(max)  NULL,
    [Id] int  NOT NULL,
    [ImportationFrais_FactureFrais_Id] int  NULL,
    [Motif_Id] int  NULL,
    [Beneficiaire_Id] int  NULL
);
GO

-- Creating table 'Factures_FactureNonDeclaree'
CREATE TABLE [dbo].[Factures_FactureNonDeclaree] (
    [Id] int  NOT NULL,
    [FactureTransitFactureNonDeclaree_FactureNonDeclaree_Id] int  NULL
);
GO

-- Creating table 'Factures_FactureDeclaree'
CREATE TABLE [dbo].[Factures_FactureDeclaree] (
    [TauxTVA] float  NULL,
    [Id] int  NOT NULL,
    [FactureTransitFrais_FactureDeclaree_Id] int  NULL
);
GO

-- Creating table 'Entreprises_CompagnieMaritime'
CREATE TABLE [dbo].[Entreprises_CompagnieMaritime] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Entreprises_Importateur'
CREATE TABLE [dbo].[Entreprises_Importateur] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Entreprises_Fournisseur'
CREATE TABLE [dbo].[Entreprises_Fournisseur] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'Factures_Commande'
CREATE TABLE [dbo].[Factures_Commande] (
    [Id] int  NOT NULL,
    [ImportationCommande_Commande_Id] int  NOT NULL
);
GO

-- Creating table 'Factures_Offre'
CREATE TABLE [dbo].[Factures_Offre] (
    [Id] int  NOT NULL,
    [ImportationOffre_Offre_Id] int  NOT NULL
);
GO

-- Creating table 'Entreprises_Transit'
CREATE TABLE [dbo].[Entreprises_Transit] (
    [Id] int  NOT NULL
);
GO

-- Creating table 'ImportateurActivite'
CREATE TABLE [dbo].[ImportateurActivite] (
    [ImportateurActivite_Activite_Id] int  NOT NULL,
    [Activites_Code] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'AttributsProduit'
CREATE TABLE [dbo].[AttributsProduit] (
    [AttributsProduit_Attribut_Id] int  NOT NULL,
    [Attributs_Id] int  NOT NULL
);
GO

-- Creating table 'ArticleValeur'
CREATE TABLE [dbo].[ArticleValeur] (
    [ArticleValeur_Valeur_Id] int  NOT NULL,
    [ValeursAttributs_Id] int  NOT NULL
);
GO

-- Creating table 'ImportationFinancement'
CREATE TABLE [dbo].[ImportationFinancement] (
    [ImportationFinancement_Financement_Id] int  NOT NULL,
    [Financements_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [PK_Importations]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entreprises'
ALTER TABLE [dbo].[Entreprises]
ADD CONSTRAINT [PK_Entreprises]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures'
ALTER TABLE [dbo].[Factures]
ADD CONSTRAINT [PK_Factures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LigneFactures'
ALTER TABLE [dbo].[LigneFactures]
ADD CONSTRAINT [PK_LigneFactures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Personnes'
ALTER TABLE [dbo].[Personnes]
ADD CONSTRAINT [PK_Personnes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ports'
ALTER TABLE [dbo].[Ports]
ADD CONSTRAINT [PK_Ports]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'AgenceBanques'
ALTER TABLE [dbo].[AgenceBanques]
ADD CONSTRAINT [PK_AgenceBanques]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Catalogues'
ALTER TABLE [dbo].[Catalogues]
ADD CONSTRAINT [PK_Catalogues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Code] in table 'Sections'
ALTER TABLE [dbo].[Sections]
ADD CONSTRAINT [PK_Sections]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [Code] in table 'Chapitres'
ALTER TABLE [dbo].[Chapitres]
ADD CONSTRAINT [PK_Chapitres]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [Code] in table 'Positions'
ALTER TABLE [dbo].[Positions]
ADD CONSTRAINT [PK_Positions]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [Code] in table 'SousPositions'
ALTER TABLE [dbo].[SousPositions]
ADD CONSTRAINT [PK_SousPositions]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [Id] in table 'Adresses'
ALTER TABLE [dbo].[Adresses]
ADD CONSTRAINT [PK_Adresses]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Wilayas'
ALTER TABLE [dbo].[Wilayas]
ADD CONSTRAINT [PK_Wilayas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TaxeDouaniers'
ALTER TABLE [dbo].[TaxeDouaniers]
ADD CONSTRAINT [PK_TaxeDouaniers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Connaissements'
ALTER TABLE [dbo].[Connaissements]
ADD CONSTRAINT [PK_Connaissements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [PK_Fichiers]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Conteneurs'
ALTER TABLE [dbo].[Conteneurs]
ADD CONSTRAINT [PK_Conteneurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ReferenceFournisseurs'
ALTER TABLE [dbo].[ReferenceFournisseurs]
ADD CONSTRAINT [PK_ReferenceFournisseurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pays'
ALTER TABLE [dbo].[Pays]
ADD CONSTRAINT [PK_Pays]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypesConteneurs'
ALTER TABLE [dbo].[TypesConteneurs]
ADD CONSTRAINT [PK_TypesConteneurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ModesReglement'
ALTER TABLE [dbo].[ModesReglement]
ADD CONSTRAINT [PK_ModesReglement]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypesEntreprises'
ALTER TABLE [dbo].[TypesEntreprises]
ADD CONSTRAINT [PK_TypesEntreprises]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'StatutsJuridiques'
ALTER TABLE [dbo].[StatutsJuridiques]
ADD CONSTRAINT [PK_StatutsJuridiques]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Devises'
ALTER TABLE [dbo].[Devises]
ADD CONSTRAINT [PK_Devises]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'MotifFactures'
ALTER TABLE [dbo].[MotifFactures]
ADD CONSTRAINT [PK_MotifFactures]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'UQNs'
ALTER TABLE [dbo].[UQNs]
ADD CONSTRAINT [PK_UQNs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Code] in table 'Activites'
ALTER TABLE [dbo].[Activites]
ADD CONSTRAINT [PK_Activites]
    PRIMARY KEY CLUSTERED ([Code] ASC);
GO

-- Creating primary key on [Id] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [PK_Produits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Attributs'
ALTER TABLE [dbo].[Attributs]
ADD CONSTRAINT [PK_Attributs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Valeurs'
ALTER TABLE [dbo].[Valeurs]
ADD CONSTRAINT [PK_Valeurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LigneCommandes'
ALTER TABLE [dbo].[LigneCommandes]
ADD CONSTRAINT [PK_LigneCommandes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [PK_Paiements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Echeances'
ALTER TABLE [dbo].[Echeances]
ADD CONSTRAINT [PK_Echeances]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypeEcheances'
ALTER TABLE [dbo].[TypeEcheances]
ADD CONSTRAINT [PK_TypeEcheances]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Utilisateurs'
ALTER TABLE [dbo].[Utilisateurs]
ADD CONSTRAINT [PK_Utilisateurs]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Financements'
ALTER TABLE [dbo].[Financements]
ADD CONSTRAINT [PK_Financements]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'DestinationProduits'
ALTER TABLE [dbo].[DestinationProduits]
ADD CONSTRAINT [PK_DestinationProduits]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'RecetteImpots'
ALTER TABLE [dbo].[RecetteImpots]
ADD CONSTRAINT [PK_RecetteImpots]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [PK_Documents]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'ComptesBancaires'
ALTER TABLE [dbo].[ComptesBancaires]
ADD CONSTRAINT [PK_ComptesBancaires]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'TypesActivites'
ALTER TABLE [dbo].[TypesActivites]
ADD CONSTRAINT [PK_TypesActivites]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Incoterms'
ALTER TABLE [dbo].[Incoterms]
ADD CONSTRAINT [PK_Incoterms]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Packagings'
ALTER TABLE [dbo].[Packagings]
ADD CONSTRAINT [PK_Packagings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureFournisseur'
ALTER TABLE [dbo].[Factures_FactureFournisseur]
ADD CONSTRAINT [PK_Factures_FactureFournisseur]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [PK_Factures_FactureProforma]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureDefinitive'
ALTER TABLE [dbo].[Factures_FactureDefinitive]
ADD CONSTRAINT [PK_Factures_FactureDefinitive]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entreprises_Banque'
ALTER TABLE [dbo].[Entreprises_Banque]
ADD CONSTRAINT [PK_Entreprises_Banque]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Adresses_AdresseLocale'
ALTER TABLE [dbo].[Adresses_AdresseLocale]
ADD CONSTRAINT [PK_Adresses_AdresseLocale]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureTransit'
ALTER TABLE [dbo].[Factures_FactureTransit]
ADD CONSTRAINT [PK_Factures_FactureTransit]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureFrais'
ALTER TABLE [dbo].[Factures_FactureFrais]
ADD CONSTRAINT [PK_Factures_FactureFrais]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureNonDeclaree'
ALTER TABLE [dbo].[Factures_FactureNonDeclaree]
ADD CONSTRAINT [PK_Factures_FactureNonDeclaree]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_FactureDeclaree'
ALTER TABLE [dbo].[Factures_FactureDeclaree]
ADD CONSTRAINT [PK_Factures_FactureDeclaree]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entreprises_CompagnieMaritime'
ALTER TABLE [dbo].[Entreprises_CompagnieMaritime]
ADD CONSTRAINT [PK_Entreprises_CompagnieMaritime]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entreprises_Importateur'
ALTER TABLE [dbo].[Entreprises_Importateur]
ADD CONSTRAINT [PK_Entreprises_Importateur]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entreprises_Fournisseur'
ALTER TABLE [dbo].[Entreprises_Fournisseur]
ADD CONSTRAINT [PK_Entreprises_Fournisseur]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_Commande'
ALTER TABLE [dbo].[Factures_Commande]
ADD CONSTRAINT [PK_Factures_Commande]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Factures_Offre'
ALTER TABLE [dbo].[Factures_Offre]
ADD CONSTRAINT [PK_Factures_Offre]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Entreprises_Transit'
ALTER TABLE [dbo].[Entreprises_Transit]
ADD CONSTRAINT [PK_Entreprises_Transit]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [ImportateurActivite_Activite_Id], [Activites_Code] in table 'ImportateurActivite'
ALTER TABLE [dbo].[ImportateurActivite]
ADD CONSTRAINT [PK_ImportateurActivite]
    PRIMARY KEY CLUSTERED ([ImportateurActivite_Activite_Id], [Activites_Code] ASC);
GO

-- Creating primary key on [AttributsProduit_Attribut_Id], [Attributs_Id] in table 'AttributsProduit'
ALTER TABLE [dbo].[AttributsProduit]
ADD CONSTRAINT [PK_AttributsProduit]
    PRIMARY KEY CLUSTERED ([AttributsProduit_Attribut_Id], [Attributs_Id] ASC);
GO

-- Creating primary key on [ArticleValeur_Valeur_Id], [ValeursAttributs_Id] in table 'ArticleValeur'
ALTER TABLE [dbo].[ArticleValeur]
ADD CONSTRAINT [PK_ArticleValeur]
    PRIMARY KEY CLUSTERED ([ArticleValeur_Valeur_Id], [ValeursAttributs_Id] ASC);
GO

-- Creating primary key on [ImportationFinancement_Financement_Id], [Financements_Id] in table 'ImportationFinancement'
ALTER TABLE [dbo].[ImportationFinancement]
ADD CONSTRAINT [PK_ImportationFinancement]
    PRIMARY KEY CLUSTERED ([ImportationFinancement_Financement_Id], [Financements_Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Importation_Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_ImportationFactureProforma]
    FOREIGN KEY ([Importation_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationFactureProforma'
CREATE INDEX [IX_FK_ImportationFactureProforma]
ON [dbo].[Factures_FactureProforma]
    ([Importation_Id]);
GO

-- Creating foreign key on [Importation_Id] in table 'Factures_FactureDefinitive'
ALTER TABLE [dbo].[Factures_FactureDefinitive]
ADD CONSTRAINT [FK_ImportationFactureDefinitive]
    FOREIGN KEY ([Importation_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationFactureDefinitive'
CREATE INDEX [IX_FK_ImportationFactureDefinitive]
ON [dbo].[Factures_FactureDefinitive]
    ([Importation_Id]);
GO

-- Creating foreign key on [AssocationASupprimer1_Banque_Id] in table 'Entreprises_Banque'
ALTER TABLE [dbo].[Entreprises_Banque]
ADD CONSTRAINT [FK_AssocationASupprimer1]
    FOREIGN KEY ([AssocationASupprimer1_Banque_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AssocationASupprimer1'
CREATE INDEX [IX_FK_AssocationASupprimer1]
ON [dbo].[Entreprises_Banque]
    ([AssocationASupprimer1_Banque_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'LigneFactures'
ALTER TABLE [dbo].[LigneFactures]
ADD CONSTRAINT [FK_LigneFactureArticle]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LigneFactureArticle'
CREATE INDEX [IX_FK_LigneFactureArticle]
ON [dbo].[LigneFactures]
    ([Article_Id]);
GO

-- Creating foreign key on [Catalogue_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_CatalogueArticle]
    FOREIGN KEY ([Catalogue_Id])
    REFERENCES [dbo].[Catalogues]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogueArticle'
CREATE INDEX [IX_FK_CatalogueArticle]
ON [dbo].[Articles]
    ([Catalogue_Id]);
GO

-- Creating foreign key on [AssociationASupprimer2_Banque_Id] in table 'Entreprises_Banque'
ALTER TABLE [dbo].[Entreprises_Banque]
ADD CONSTRAINT [FK_AssociationASupprimer2]
    FOREIGN KEY ([AssociationASupprimer2_Banque_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AssociationASupprimer2'
CREATE INDEX [IX_FK_AssociationASupprimer2]
ON [dbo].[Entreprises_Banque]
    ([AssociationASupprimer2_Banque_Id]);
GO

-- Creating foreign key on [Banque_Id] in table 'AgenceBanques'
ALTER TABLE [dbo].[AgenceBanques]
ADD CONSTRAINT [FK_BanqueAgence]
    FOREIGN KEY ([Banque_Id])
    REFERENCES [dbo].[Entreprises_Banque]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BanqueAgence'
CREATE INDEX [IX_FK_BanqueAgence]
ON [dbo].[AgenceBanques]
    ([Banque_Id]);
GO

-- Creating foreign key on [PortEmbarquement_Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_FactureProformaPortEmbarquement]
    FOREIGN KEY ([PortEmbarquement_Id])
    REFERENCES [dbo].[Ports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureProformaPortEmbarquement'
CREATE INDEX [IX_FK_FactureProformaPortEmbarquement]
ON [dbo].[Factures_FactureProforma]
    ([PortEmbarquement_Id]);
GO

-- Creating foreign key on [PortDebarquement_Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_FactureProformaPortDebarquement]
    FOREIGN KEY ([PortDebarquement_Id])
    REFERENCES [dbo].[Ports]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureProformaPortDebarquement'
CREATE INDEX [IX_FK_FactureProformaPortDebarquement]
ON [dbo].[Factures_FactureProforma]
    ([PortDebarquement_Id]);
GO

-- Creating foreign key on [Section_Code] in table 'Chapitres'
ALTER TABLE [dbo].[Chapitres]
ADD CONSTRAINT [FK_SectionChapitre]
    FOREIGN KEY ([Section_Code])
    REFERENCES [dbo].[Sections]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SectionChapitre'
CREATE INDEX [IX_FK_SectionChapitre]
ON [dbo].[Chapitres]
    ([Section_Code]);
GO

-- Creating foreign key on [Wilaya_Id] in table 'Adresses_AdresseLocale'
ALTER TABLE [dbo].[Adresses_AdresseLocale]
ADD CONSTRAINT [FK_AdresseLocaleWilaya]
    FOREIGN KEY ([Wilaya_Id])
    REFERENCES [dbo].[Wilayas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AdresseLocaleWilaya'
CREATE INDEX [IX_FK_AdresseLocaleWilaya]
ON [dbo].[Adresses_AdresseLocale]
    ([Wilaya_Id]);
GO

-- Creating foreign key on [EntrepriseAdresse1_Adresse_Id] in table 'Adresses'
ALTER TABLE [dbo].[Adresses]
ADD CONSTRAINT [FK_EntrepriseAdresse1]
    FOREIGN KEY ([EntrepriseAdresse1_Adresse_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseAdresse1'
CREATE INDEX [IX_FK_EntrepriseAdresse1]
ON [dbo].[Adresses]
    ([EntrepriseAdresse1_Adresse_Id]);
GO

-- Creating foreign key on [EntrepriseAdresse2_Adresse_Id] in table 'Adresses'
ALTER TABLE [dbo].[Adresses]
ADD CONSTRAINT [FK_EntrepriseAdresse2]
    FOREIGN KEY ([EntrepriseAdresse2_Adresse_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseAdresse2'
CREATE INDEX [IX_FK_EntrepriseAdresse2]
ON [dbo].[Adresses]
    ([EntrepriseAdresse2_Adresse_Id]);
GO

-- Creating foreign key on [FactureTransitFactureNonDeclaree_FactureNonDeclaree_Id] in table 'Factures_FactureNonDeclaree'
ALTER TABLE [dbo].[Factures_FactureNonDeclaree]
ADD CONSTRAINT [FK_FactureTransitFactureNonDeclaree]
    FOREIGN KEY ([FactureTransitFactureNonDeclaree_FactureNonDeclaree_Id])
    REFERENCES [dbo].[Factures_FactureTransit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureTransitFactureNonDeclaree'
CREATE INDEX [IX_FK_FactureTransitFactureNonDeclaree]
ON [dbo].[Factures_FactureNonDeclaree]
    ([FactureTransitFactureNonDeclaree_FactureNonDeclaree_Id]);
GO

-- Creating foreign key on [FactureTransitFrais_FactureDeclaree_Id] in table 'Factures_FactureDeclaree'
ALTER TABLE [dbo].[Factures_FactureDeclaree]
ADD CONSTRAINT [FK_FactureTransitFrais]
    FOREIGN KEY ([FactureTransitFrais_FactureDeclaree_Id])
    REFERENCES [dbo].[Factures_FactureTransit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureTransitFrais'
CREATE INDEX [IX_FK_FactureTransitFrais]
ON [dbo].[Factures_FactureDeclaree]
    ([FactureTransitFrais_FactureDeclaree_Id]);
GO

-- Creating foreign key on [ImportationD10_D10_Id] in table 'TaxeDouaniers'
ALTER TABLE [dbo].[TaxeDouaniers]
ADD CONSTRAINT [FK_ImportationD10]
    FOREIGN KEY ([ImportationD10_D10_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationD10'
CREATE INDEX [IX_FK_ImportationD10]
ON [dbo].[TaxeDouaniers]
    ([ImportationD10_D10_Id]);
GO

-- Creating foreign key on [FactureDefinitivePortEmbarquement_Port_Id] in table 'Ports'
ALTER TABLE [dbo].[Ports]
ADD CONSTRAINT [FK_FactureDefinitivePortEmbarquement]
    FOREIGN KEY ([FactureDefinitivePortEmbarquement_Port_Id])
    REFERENCES [dbo].[Factures_FactureDefinitive]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureDefinitivePortEmbarquement'
CREATE INDEX [IX_FK_FactureDefinitivePortEmbarquement]
ON [dbo].[Ports]
    ([FactureDefinitivePortEmbarquement_Port_Id]);
GO

-- Creating foreign key on [FactureDefinitivePortDebarquement_Port_Id] in table 'Ports'
ALTER TABLE [dbo].[Ports]
ADD CONSTRAINT [FK_FactureDefinitivePortDebarquement]
    FOREIGN KEY ([FactureDefinitivePortDebarquement_Port_Id])
    REFERENCES [dbo].[Factures_FactureDefinitive]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureDefinitivePortDebarquement'
CREATE INDEX [IX_FK_FactureDefinitivePortDebarquement]
ON [dbo].[Ports]
    ([FactureDefinitivePortDebarquement_Port_Id]);
GO

-- Creating foreign key on [Chapitre_Code] in table 'Positions'
ALTER TABLE [dbo].[Positions]
ADD CONSTRAINT [FK_ChapitrePosition]
    FOREIGN KEY ([Chapitre_Code])
    REFERENCES [dbo].[Chapitres]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ChapitrePosition'
CREATE INDEX [IX_FK_ChapitrePosition]
ON [dbo].[Positions]
    ([Chapitre_Code]);
GO

-- Creating foreign key on [Position_Code] in table 'SousPositions'
ALTER TABLE [dbo].[SousPositions]
ADD CONSTRAINT [FK_PositionSousPosition]
    FOREIGN KEY ([Position_Code])
    REFERENCES [dbo].[Positions]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PositionSousPosition'
CREATE INDEX [IX_FK_PositionSousPosition]
ON [dbo].[SousPositions]
    ([Position_Code]);
GO

-- Creating foreign key on [Connaissement_Id] in table 'Conteneurs'
ALTER TABLE [dbo].[Conteneurs]
ADD CONSTRAINT [FK_ConnaissementConteneur]
    FOREIGN KEY ([Connaissement_Id])
    REFERENCES [dbo].[Connaissements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConnaissementConteneur'
CREATE INDEX [IX_FK_ConnaissementConteneur]
ON [dbo].[Conteneurs]
    ([Connaissement_Id]);
GO

-- Creating foreign key on [CompagnieMaritime_Id] in table 'Connaissements'
ALTER TABLE [dbo].[Connaissements]
ADD CONSTRAINT [FK_ConnaissementCompagnieMaritime]
    FOREIGN KEY ([CompagnieMaritime_Id])
    REFERENCES [dbo].[Entreprises_CompagnieMaritime]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConnaissementCompagnieMaritime'
CREATE INDEX [IX_FK_ConnaissementCompagnieMaritime]
ON [dbo].[Connaissements]
    ([CompagnieMaritime_Id]);
GO

-- Creating foreign key on [ConnaissementFichierJoint_Fichier_Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [FK_ConnaissementFichierJoint]
    FOREIGN KEY ([ConnaissementFichierJoint_Fichier_Id])
    REFERENCES [dbo].[Connaissements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConnaissementFichierJoint'
CREATE INDEX [IX_FK_ConnaissementFichierJoint]
ON [dbo].[Fichiers]
    ([ConnaissementFichierJoint_Fichier_Id]);
GO

-- Creating foreign key on [FactureFichier_Fichier_Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [FK_FactureFichier]
    FOREIGN KEY ([FactureFichier_Fichier_Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureFichier'
CREATE INDEX [IX_FK_FactureFichier]
ON [dbo].[Fichiers]
    ([FactureFichier_Fichier_Id]);
GO

-- Creating foreign key on [D10Fichier_Fichier_Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [FK_D10Fichier]
    FOREIGN KEY ([D10Fichier_Fichier_Id])
    REFERENCES [dbo].[TaxeDouaniers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_D10Fichier'
CREATE INDEX [IX_FK_D10Fichier]
ON [dbo].[Fichiers]
    ([D10Fichier_Fichier_Id]);
GO

-- Creating foreign key on [EntrepriseLogo_Fichier_Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [FK_EntrepriseLogo]
    FOREIGN KEY ([EntrepriseLogo_Fichier_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseLogo'
CREATE INDEX [IX_FK_EntrepriseLogo]
ON [dbo].[Fichiers]
    ([EntrepriseLogo_Fichier_Id]);
GO

-- Creating foreign key on [Importateur_Id] in table 'Catalogues'
ALTER TABLE [dbo].[Catalogues]
ADD CONSTRAINT [FK_ImportateurCatalogue]
    FOREIGN KEY ([Importateur_Id])
    REFERENCES [dbo].[Entreprises_Importateur]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportateurCatalogue'
CREATE INDEX [IX_FK_ImportateurCatalogue]
ON [dbo].[Catalogues]
    ([Importateur_Id]);
GO

-- Creating foreign key on [ImportationFrais_FactureFrais_Id] in table 'Factures_FactureFrais'
ALTER TABLE [dbo].[Factures_FactureFrais]
ADD CONSTRAINT [FK_ImportationFrais]
    FOREIGN KEY ([ImportationFrais_FactureFrais_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationFrais'
CREATE INDEX [IX_FK_ImportationFrais]
ON [dbo].[Factures_FactureFrais]
    ([ImportationFrais_FactureFrais_Id]);
GO

-- Creating foreign key on [Fournisseur_Id] in table 'ReferenceFournisseurs'
ALTER TABLE [dbo].[ReferenceFournisseurs]
ADD CONSTRAINT [FK_FournisseurReferenceFournisseur]
    FOREIGN KEY ([Fournisseur_Id])
    REFERENCES [dbo].[Entreprises_Fournisseur]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FournisseurReferenceFournisseur'
CREATE INDEX [IX_FK_FournisseurReferenceFournisseur]
ON [dbo].[ReferenceFournisseurs]
    ([Fournisseur_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'ReferenceFournisseurs'
ALTER TABLE [dbo].[ReferenceFournisseurs]
ADD CONSTRAINT [FK_ReferenceFournisseurArticle]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ReferenceFournisseurArticle'
CREATE INDEX [IX_FK_ReferenceFournisseurArticle]
ON [dbo].[ReferenceFournisseurs]
    ([Article_Id]);
GO

-- Creating foreign key on [Pays_Id] in table 'Adresses'
ALTER TABLE [dbo].[Adresses]
ADD CONSTRAINT [FK_PaysAdresse]
    FOREIGN KEY ([Pays_Id])
    REFERENCES [dbo].[Pays]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaysAdresse'
CREATE INDEX [IX_FK_PaysAdresse]
ON [dbo].[Adresses]
    ([Pays_Id]);
GO

-- Creating foreign key on [Type_Id] in table 'Conteneurs'
ALTER TABLE [dbo].[Conteneurs]
ADD CONSTRAINT [FK_ConteneurTypeConteneur]
    FOREIGN KEY ([Type_Id])
    REFERENCES [dbo].[TypesConteneurs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ConteneurTypeConteneur'
CREATE INDEX [IX_FK_ConteneurTypeConteneur]
ON [dbo].[Conteneurs]
    ([Type_Id]);
GO

-- Creating foreign key on [Type_Id] in table 'Entreprises'
ALTER TABLE [dbo].[Entreprises]
ADD CONSTRAINT [FK_RaisonSocialeEntreprise]
    FOREIGN KEY ([Type_Id])
    REFERENCES [dbo].[TypesEntreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RaisonSocialeEntreprise'
CREATE INDEX [IX_FK_RaisonSocialeEntreprise]
ON [dbo].[Entreprises]
    ([Type_Id]);
GO

-- Creating foreign key on [StatutJuridique_Id] in table 'Entreprises'
ALTER TABLE [dbo].[Entreprises]
ADD CONSTRAINT [FK_StatutJuridiqueEntreprise]
    FOREIGN KEY ([StatutJuridique_Id])
    REFERENCES [dbo].[StatutsJuridiques]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_StatutJuridiqueEntreprise'
CREATE INDEX [IX_FK_StatutJuridiqueEntreprise]
ON [dbo].[Entreprises]
    ([StatutJuridique_Id]);
GO

-- Creating foreign key on [Devise_Id] in table 'Pays'
ALTER TABLE [dbo].[Pays]
ADD CONSTRAINT [FK_PaysDevise]
    FOREIGN KEY ([Devise_Id])
    REFERENCES [dbo].[Devises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaysDevise'
CREATE INDEX [IX_FK_PaysDevise]
ON [dbo].[Pays]
    ([Devise_Id]);
GO

-- Creating foreign key on [Motif_Id] in table 'Factures_FactureFrais'
ALTER TABLE [dbo].[Factures_FactureFrais]
ADD CONSTRAINT [FK_FactureFraisMotif]
    FOREIGN KEY ([Motif_Id])
    REFERENCES [dbo].[MotifFactures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureFraisMotif'
CREATE INDEX [IX_FK_FactureFraisMotif]
ON [dbo].[Factures_FactureFrais]
    ([Motif_Id]);
GO

-- Creating foreign key on [Pays_Id] in table 'Ports'
ALTER TABLE [dbo].[Ports]
ADD CONSTRAINT [FK_PortPays]
    FOREIGN KEY ([Pays_Id])
    REFERENCES [dbo].[Pays]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PortPays'
CREATE INDEX [IX_FK_PortPays]
ON [dbo].[Ports]
    ([Pays_Id]);
GO

-- Creating foreign key on [UQN_Id] in table 'SousPositions'
ALTER TABLE [dbo].[SousPositions]
ADD CONSTRAINT [FK_SousPositionUQN]
    FOREIGN KEY ([UQN_Id])
    REFERENCES [dbo].[UQNs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_SousPositionUQN'
CREATE INDEX [IX_FK_SousPositionUQN]
ON [dbo].[SousPositions]
    ([UQN_Id]);
GO

-- Creating foreign key on [BanqueImportateur_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationBanqueImportateur]
    FOREIGN KEY ([BanqueImportateur_Id])
    REFERENCES [dbo].[AgenceBanques]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationBanqueImportateur'
CREATE INDEX [IX_FK_ImportationBanqueImportateur]
ON [dbo].[Importations]
    ([BanqueImportateur_Id]);
GO

-- Creating foreign key on [BanqueFournisseur_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationBanqueFournisseur]
    FOREIGN KEY ([BanqueFournisseur_Id])
    REFERENCES [dbo].[AgenceBanques]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationBanqueFournisseur'
CREATE INDEX [IX_FK_ImportationBanqueFournisseur]
ON [dbo].[Importations]
    ([BanqueFournisseur_Id]);
GO

-- Creating foreign key on [ImportateurActivite_Activite_Id] in table 'ImportateurActivite'
ALTER TABLE [dbo].[ImportateurActivite]
ADD CONSTRAINT [FK_ImportateurActivite_Importateur]
    FOREIGN KEY ([ImportateurActivite_Activite_Id])
    REFERENCES [dbo].[Entreprises_Importateur]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Activites_Code] in table 'ImportateurActivite'
ALTER TABLE [dbo].[ImportateurActivite]
ADD CONSTRAINT [FK_ImportateurActivite_Activite]
    FOREIGN KEY ([Activites_Code])
    REFERENCES [dbo].[Activites]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportateurActivite_Activite'
CREATE INDEX [IX_FK_ImportateurActivite_Activite]
ON [dbo].[ImportateurActivite]
    ([Activites_Code]);
GO

-- Creating foreign key on [Activite_Code] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationActivite]
    FOREIGN KEY ([Activite_Code])
    REFERENCES [dbo].[Activites]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationActivite'
CREATE INDEX [IX_FK_ImportationActivite]
ON [dbo].[Importations]
    ([Activite_Code]);
GO

-- Creating foreign key on [PositionTarifaire_Code] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [FK_PositionProduit]
    FOREIGN KEY ([PositionTarifaire_Code])
    REFERENCES [dbo].[SousPositions]
        ([Code])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PositionProduit'
CREATE INDEX [IX_FK_PositionProduit]
ON [dbo].[Produits]
    ([PositionTarifaire_Code]);
GO

-- Creating foreign key on [AttributsProduit_Attribut_Id] in table 'AttributsProduit'
ALTER TABLE [dbo].[AttributsProduit]
ADD CONSTRAINT [FK_AttributsProduit_Produit]
    FOREIGN KEY ([AttributsProduit_Attribut_Id])
    REFERENCES [dbo].[Produits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Attributs_Id] in table 'AttributsProduit'
ALTER TABLE [dbo].[AttributsProduit]
ADD CONSTRAINT [FK_AttributsProduit_Attribut]
    FOREIGN KEY ([Attributs_Id])
    REFERENCES [dbo].[Attributs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AttributsProduit_Attribut'
CREATE INDEX [IX_FK_AttributsProduit_Attribut]
ON [dbo].[AttributsProduit]
    ([Attributs_Id]);
GO

-- Creating foreign key on [Produit_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_ArticleProduit]
    FOREIGN KEY ([Produit_Id])
    REFERENCES [dbo].[Produits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleProduit'
CREATE INDEX [IX_FK_ArticleProduit]
ON [dbo].[Articles]
    ([Produit_Id]);
GO

-- Creating foreign key on [Attribut_Id] in table 'Valeurs'
ALTER TABLE [dbo].[Valeurs]
ADD CONSTRAINT [FK_ValeursAttribut]
    FOREIGN KEY ([Attribut_Id])
    REFERENCES [dbo].[Attributs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ValeursAttribut'
CREATE INDEX [IX_FK_ValeursAttribut]
ON [dbo].[Valeurs]
    ([Attribut_Id]);
GO

-- Creating foreign key on [ArticleValeur_Valeur_Id] in table 'ArticleValeur'
ALTER TABLE [dbo].[ArticleValeur]
ADD CONSTRAINT [FK_ArticleValeur_Article]
    FOREIGN KEY ([ArticleValeur_Valeur_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [ValeursAttributs_Id] in table 'ArticleValeur'
ALTER TABLE [dbo].[ArticleValeur]
ADD CONSTRAINT [FK_ArticleValeur_Valeur]
    FOREIGN KEY ([ValeursAttributs_Id])
    REFERENCES [dbo].[Valeurs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleValeur_Valeur'
CREATE INDEX [IX_FK_ArticleValeur_Valeur]
ON [dbo].[ArticleValeur]
    ([ValeursAttributs_Id]);
GO

-- Creating foreign key on [Entreprise_Id] in table 'Personnes'
ALTER TABLE [dbo].[Personnes]
ADD CONSTRAINT [FK_ContactEntreprise]
    FOREIGN KEY ([Entreprise_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ContactEntreprise'
CREATE INDEX [IX_FK_ContactEntreprise]
ON [dbo].[Personnes]
    ([Entreprise_Id]);
GO

-- Creating foreign key on [Article_Id] in table 'LigneCommandes'
ALTER TABLE [dbo].[LigneCommandes]
ADD CONSTRAINT [FK_ArticleLigneCommande]
    FOREIGN KEY ([Article_Id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticleLigneCommande'
CREATE INDEX [IX_FK_ArticleLigneCommande]
ON [dbo].[LigneCommandes]
    ([Article_Id]);
GO

-- Creating foreign key on [Commande_Id] in table 'LigneCommandes'
ALTER TABLE [dbo].[LigneCommandes]
ADD CONSTRAINT [FK_CommandeLigneCommande]
    FOREIGN KEY ([Commande_Id])
    REFERENCES [dbo].[Factures_Commande]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CommandeLigneCommande'
CREATE INDEX [IX_FK_CommandeLigneCommande]
ON [dbo].[LigneCommandes]
    ([Commande_Id]);
GO

-- Creating foreign key on [LigneFactureFournisseur_LigneFacture_Id] in table 'LigneFactures'
ALTER TABLE [dbo].[LigneFactures]
ADD CONSTRAINT [FK_LigneFactureFournisseur]
    FOREIGN KEY ([LigneFactureFournisseur_LigneFacture_Id])
    REFERENCES [dbo].[Factures_FactureFournisseur]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_LigneFactureFournisseur'
CREATE INDEX [IX_FK_LigneFactureFournisseur]
ON [dbo].[LigneFactures]
    ([LigneFactureFournisseur_LigneFacture_Id]);
GO

-- Creating foreign key on [ImportationFactureTransit_FactureTransit_Id] in table 'Factures_FactureTransit'
ALTER TABLE [dbo].[Factures_FactureTransit]
ADD CONSTRAINT [FK_ImportationFactureTransit]
    FOREIGN KEY ([ImportationFactureTransit_FactureTransit_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationFactureTransit'
CREATE INDEX [IX_FK_ImportationFactureTransit]
ON [dbo].[Factures_FactureTransit]
    ([ImportationFactureTransit_FactureTransit_Id]);
GO

-- Creating foreign key on [ModeReglement_Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_PaiementModeReglement]
    FOREIGN KEY ([ModeReglement_Id])
    REFERENCES [dbo].[ModesReglement]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaiementModeReglement'
CREATE INDEX [IX_FK_PaiementModeReglement]
ON [dbo].[Paiements]
    ([ModeReglement_Id]);
GO

-- Creating foreign key on [Devise_Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_PaiementDevise]
    FOREIGN KEY ([Devise_Id])
    REFERENCES [dbo].[Devises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaiementDevise'
CREATE INDEX [IX_FK_PaiementDevise]
ON [dbo].[Paiements]
    ([Devise_Id]);
GO

-- Creating foreign key on [Type_Id] in table 'Echeances'
ALTER TABLE [dbo].[Echeances]
ADD CONSTRAINT [FK_EcheanceTypeEcheance]
    FOREIGN KEY ([Type_Id])
    REFERENCES [dbo].[TypeEcheances]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EcheanceTypeEcheance'
CREATE INDEX [IX_FK_EcheanceTypeEcheance]
ON [dbo].[Echeances]
    ([Type_Id]);
GO

-- Creating foreign key on [EcheancePaiement_Paiement_Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_EcheancePaiement]
    FOREIGN KEY ([EcheancePaiement_Paiement_Id])
    REFERENCES [dbo].[Echeances]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EcheancePaiement'
CREATE INDEX [IX_FK_EcheancePaiement]
ON [dbo].[Paiements]
    ([EcheancePaiement_Paiement_Id]);
GO

-- Creating foreign key on [FacturePaiement_Paiement_Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_FacturePaiement]
    FOREIGN KEY ([FacturePaiement_Paiement_Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FacturePaiement'
CREATE INDEX [IX_FK_FacturePaiement]
ON [dbo].[Paiements]
    ([FacturePaiement_Paiement_Id]);
GO

-- Creating foreign key on [FactureEcheance_Echeance_Id] in table 'Echeances'
ALTER TABLE [dbo].[Echeances]
ADD CONSTRAINT [FK_FactureEcheance]
    FOREIGN KEY ([FactureEcheance_Echeance_Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureEcheance'
CREATE INDEX [IX_FK_FactureEcheance]
ON [dbo].[Echeances]
    ([FactureEcheance_Echeance_Id]);
GO

-- Creating foreign key on [PaiementFichier_Fichier_Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [FK_PaiementFichier]
    FOREIGN KEY ([PaiementFichier_Fichier_Id])
    REFERENCES [dbo].[Paiements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PaiementFichier'
CREATE INDEX [IX_FK_PaiementFichier]
ON [dbo].[Fichiers]
    ([PaiementFichier_Fichier_Id]);
GO

-- Creating foreign key on [TaxeDouanierPaiement_Paiement_Id] in table 'Paiements'
ALTER TABLE [dbo].[Paiements]
ADD CONSTRAINT [FK_TaxeDouanierPaiement]
    FOREIGN KEY ([TaxeDouanierPaiement_Paiement_Id])
    REFERENCES [dbo].[TaxeDouaniers]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_TaxeDouanierPaiement'
CREATE INDEX [IX_FK_TaxeDouanierPaiement]
ON [dbo].[Paiements]
    ([TaxeDouanierPaiement_Paiement_Id]);
GO

-- Creating foreign key on [ImportationCommande_Commande_Id] in table 'Factures_Commande'
ALTER TABLE [dbo].[Factures_Commande]
ADD CONSTRAINT [FK_ImportationCommande]
    FOREIGN KEY ([ImportationCommande_Commande_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationCommande'
CREATE INDEX [IX_FK_ImportationCommande]
ON [dbo].[Factures_Commande]
    ([ImportationCommande_Commande_Id]);
GO

-- Creating foreign key on [ImportationOffre_Offre_Id] in table 'Factures_Offre'
ALTER TABLE [dbo].[Factures_Offre]
ADD CONSTRAINT [FK_ImportationOffre]
    FOREIGN KEY ([ImportationOffre_Offre_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationOffre'
CREATE INDEX [IX_FK_ImportationOffre]
ON [dbo].[Factures_Offre]
    ([ImportationOffre_Offre_Id]);
GO

-- Creating foreign key on [Catalogue_Id] in table 'Produits'
ALTER TABLE [dbo].[Produits]
ADD CONSTRAINT [FK_CatalogueProduit]
    FOREIGN KEY ([Catalogue_Id])
    REFERENCES [dbo].[Catalogues]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CatalogueProduit'
CREATE INDEX [IX_FK_CatalogueProduit]
ON [dbo].[Produits]
    ([Catalogue_Id]);
GO

-- Creating foreign key on [PaysOrigine_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationPaysOrigine]
    FOREIGN KEY ([PaysOrigine_Id])
    REFERENCES [dbo].[Pays]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationPaysOrigine'
CREATE INDEX [IX_FK_ImportationPaysOrigine]
ON [dbo].[Importations]
    ([PaysOrigine_Id]);
GO

-- Creating foreign key on [ModeReglement_Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_FactureProformaModeReglement]
    FOREIGN KEY ([ModeReglement_Id])
    REFERENCES [dbo].[ModesReglement]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureProformaModeReglement'
CREATE INDEX [IX_FK_FactureProformaModeReglement]
ON [dbo].[Factures_FactureProforma]
    ([ModeReglement_Id]);
GO

-- Creating foreign key on [Devise_Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_FactureProformaDevise]
    FOREIGN KEY ([Devise_Id])
    REFERENCES [dbo].[Devises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureProformaDevise'
CREATE INDEX [IX_FK_FactureProformaDevise]
ON [dbo].[Factures_FactureProforma]
    ([Devise_Id]);
GO

-- Creating foreign key on [ImportationFinancement_Financement_Id] in table 'ImportationFinancement'
ALTER TABLE [dbo].[ImportationFinancement]
ADD CONSTRAINT [FK_ImportationFinancement_Importation]
    FOREIGN KEY ([ImportationFinancement_Financement_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Financements_Id] in table 'ImportationFinancement'
ALTER TABLE [dbo].[ImportationFinancement]
ADD CONSTRAINT [FK_ImportationFinancement_Financement]
    FOREIGN KEY ([Financements_Id])
    REFERENCES [dbo].[Financements]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationFinancement_Financement'
CREATE INDEX [IX_FK_ImportationFinancement_Financement]
ON [dbo].[ImportationFinancement]
    ([Financements_Id]);
GO

-- Creating foreign key on [DestinationProduit_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationDestinationProduit]
    FOREIGN KEY ([DestinationProduit_Id])
    REFERENCES [dbo].[DestinationProduits]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationDestinationProduit'
CREATE INDEX [IX_FK_ImportationDestinationProduit]
ON [dbo].[Importations]
    ([DestinationProduit_Id]);
GO

-- Creating foreign key on [Wilaya_Id] in table 'RecetteImpots'
ALTER TABLE [dbo].[RecetteImpots]
ADD CONSTRAINT [FK_WilayaRecetteImpots]
    FOREIGN KEY ([Wilaya_Id])
    REFERENCES [dbo].[Wilayas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_WilayaRecetteImpots'
CREATE INDEX [IX_FK_WilayaRecetteImpots]
ON [dbo].[RecetteImpots]
    ([Wilaya_Id]);
GO

-- Creating foreign key on [RecetteImpots_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationRecetteImpots]
    FOREIGN KEY ([RecetteImpots_Id])
    REFERENCES [dbo].[RecetteImpots]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationRecetteImpots'
CREATE INDEX [IX_FK_ImportationRecetteImpots]
ON [dbo].[Importations]
    ([RecetteImpots_Id]);
GO

-- Creating foreign key on [ModeReglement_Id] in table 'Factures_FactureDefinitive'
ALTER TABLE [dbo].[Factures_FactureDefinitive]
ADD CONSTRAINT [FK_FactureDefinitiveModeReglement]
    FOREIGN KEY ([ModeReglement_Id])
    REFERENCES [dbo].[ModesReglement]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureDefinitiveModeReglement'
CREATE INDEX [IX_FK_FactureDefinitiveModeReglement]
ON [dbo].[Factures_FactureDefinitive]
    ([ModeReglement_Id]);
GO

-- Creating foreign key on [Devise_Id] in table 'Factures_FactureDefinitive'
ALTER TABLE [dbo].[Factures_FactureDefinitive]
ADD CONSTRAINT [FK_FactureDefinitiveDevise]
    FOREIGN KEY ([Devise_Id])
    REFERENCES [dbo].[Devises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureDefinitiveDevise'
CREATE INDEX [IX_FK_FactureDefinitiveDevise]
ON [dbo].[Factures_FactureDefinitive]
    ([Devise_Id]);
GO

-- Creating foreign key on [Importateur_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationImportateur]
    FOREIGN KEY ([Importateur_Id])
    REFERENCES [dbo].[Entreprises_Importateur]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationImportateur'
CREATE INDEX [IX_FK_ImportationImportateur]
ON [dbo].[Importations]
    ([Importateur_Id]);
GO

-- Creating foreign key on [Fournisseur_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationFournisseur]
    FOREIGN KEY ([Fournisseur_Id])
    REFERENCES [dbo].[Entreprises_Fournisseur]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationFournisseur'
CREATE INDEX [IX_FK_ImportationFournisseur]
ON [dbo].[Importations]
    ([Fournisseur_Id]);
GO

-- Creating foreign key on [Transit_Id] in table 'Importations'
ALTER TABLE [dbo].[Importations]
ADD CONSTRAINT [FK_ImportationTransit]
    FOREIGN KEY ([Transit_Id])
    REFERENCES [dbo].[Entreprises_Transit]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationTransit'
CREATE INDEX [IX_FK_ImportationTransit]
ON [dbo].[Importations]
    ([Transit_Id]);
GO

-- Creating foreign key on [EntrepriseMotifFacture_MotifFacture_Id] in table 'MotifFactures'
ALTER TABLE [dbo].[MotifFactures]
ADD CONSTRAINT [FK_EntrepriseMotifFacture]
    FOREIGN KEY ([EntrepriseMotifFacture_MotifFacture_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseMotifFacture'
CREATE INDEX [IX_FK_EntrepriseMotifFacture]
ON [dbo].[MotifFactures]
    ([EntrepriseMotifFacture_MotifFacture_Id]);
GO

-- Creating foreign key on [Beneficiaire_Id] in table 'Factures_FactureFrais'
ALTER TABLE [dbo].[Factures_FactureFrais]
ADD CONSTRAINT [FK_FactureFraisEntreprise]
    FOREIGN KEY ([Beneficiaire_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureFraisEntreprise'
CREATE INDEX [IX_FK_FactureFraisEntreprise]
ON [dbo].[Factures_FactureFrais]
    ([Beneficiaire_Id]);
GO

-- Creating foreign key on [ImportationArrivage_LigneCommande_Id] in table 'LigneCommandes'
ALTER TABLE [dbo].[LigneCommandes]
ADD CONSTRAINT [FK_ImportationArrivage]
    FOREIGN KEY ([ImportationArrivage_LigneCommande_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationArrivage'
CREATE INDEX [IX_FK_ImportationArrivage]
ON [dbo].[LigneCommandes]
    ([ImportationArrivage_LigneCommande_Id]);
GO

-- Creating foreign key on [DocumentFichier_Fichier_Id] in table 'Fichiers'
ALTER TABLE [dbo].[Fichiers]
ADD CONSTRAINT [FK_DocumentFichier]
    FOREIGN KEY ([DocumentFichier_Fichier_Id])
    REFERENCES [dbo].[Documents]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DocumentFichier'
CREATE INDEX [IX_FK_DocumentFichier]
ON [dbo].[Fichiers]
    ([DocumentFichier_Fichier_Id]);
GO

-- Creating foreign key on [ImportationCertificatDeConformite_Document_Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_ImportationCertificatDeConformite]
    FOREIGN KEY ([ImportationCertificatDeConformite_Document_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationCertificatDeConformite'
CREATE INDEX [IX_FK_ImportationCertificatDeConformite]
ON [dbo].[Documents]
    ([ImportationCertificatDeConformite_Document_Id]);
GO

-- Creating foreign key on [CertificatDOrigine_Document_Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_CertificatDOrigine]
    FOREIGN KEY ([CertificatDOrigine_Document_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CertificatDOrigine'
CREATE INDEX [IX_FK_CertificatDOrigine]
ON [dbo].[Documents]
    ([CertificatDOrigine_Document_Id]);
GO

-- Creating foreign key on [ImportationListeDeColissage_Document_Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_ImportationListeDeColissage]
    FOREIGN KEY ([ImportationListeDeColissage_Document_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationListeDeColissage'
CREATE INDEX [IX_FK_ImportationListeDeColissage]
ON [dbo].[Documents]
    ([ImportationListeDeColissage_Document_Id]);
GO

-- Creating foreign key on [ImportationConnaissement_Document_Id] in table 'Documents'
ALTER TABLE [dbo].[Documents]
ADD CONSTRAINT [FK_ImportationConnaissement]
    FOREIGN KEY ([ImportationConnaissement_Document_Id])
    REFERENCES [dbo].[Importations]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ImportationConnaissement'
CREATE INDEX [IX_FK_ImportationConnaissement]
ON [dbo].[Documents]
    ([ImportationConnaissement_Document_Id]);
GO

-- Creating foreign key on [Entreprise_Id] in table 'ComptesBancaires'
ALTER TABLE [dbo].[ComptesBancaires]
ADD CONSTRAINT [FK_EntrepriseCompteBancaire]
    FOREIGN KEY ([Entreprise_Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseCompteBancaire'
CREATE INDEX [IX_FK_EntrepriseCompteBancaire]
ON [dbo].[ComptesBancaires]
    ([Entreprise_Id]);
GO

-- Creating foreign key on [Banque_Id] in table 'ComptesBancaires'
ALTER TABLE [dbo].[ComptesBancaires]
ADD CONSTRAINT [FK_BanqueCompteBancaire]
    FOREIGN KEY ([Banque_Id])
    REFERENCES [dbo].[Entreprises_Banque]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BanqueCompteBancaire'
CREATE INDEX [IX_FK_BanqueCompteBancaire]
ON [dbo].[ComptesBancaires]
    ([Banque_Id]);
GO

-- Creating foreign key on [Gerant_Id] in table 'Entreprises'
ALTER TABLE [dbo].[Entreprises]
ADD CONSTRAINT [FK_EntrepriseGerant]
    FOREIGN KEY ([Gerant_Id])
    REFERENCES [dbo].[Personnes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseGerant'
CREATE INDEX [IX_FK_EntrepriseGerant]
ON [dbo].[Entreprises]
    ([Gerant_Id]);
GO

-- Creating foreign key on [PersonneAdresse_Adresse_Id] in table 'Adresses'
ALTER TABLE [dbo].[Adresses]
ADD CONSTRAINT [FK_PersonneAdresse]
    FOREIGN KEY ([PersonneAdresse_Adresse_Id])
    REFERENCES [dbo].[Personnes]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonneAdresse'
CREATE INDEX [IX_FK_PersonneAdresse]
ON [dbo].[Adresses]
    ([PersonneAdresse_Adresse_Id]);
GO

-- Creating foreign key on [TypeActivite_Id] in table 'Entreprises'
ALTER TABLE [dbo].[Entreprises]
ADD CONSTRAINT [FK_EntrepriseTypeActivite]
    FOREIGN KEY ([TypeActivite_Id])
    REFERENCES [dbo].[TypesActivites]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EntrepriseTypeActivite'
CREATE INDEX [IX_FK_EntrepriseTypeActivite]
ON [dbo].[Entreprises]
    ([TypeActivite_Id]);
GO

-- Creating foreign key on [Incoterm_Id] in table 'Factures_FactureDefinitive'
ALTER TABLE [dbo].[Factures_FactureDefinitive]
ADD CONSTRAINT [FK_FactureDefinitiveIncoterm]
    FOREIGN KEY ([Incoterm_Id])
    REFERENCES [dbo].[Incoterms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureDefinitiveIncoterm'
CREATE INDEX [IX_FK_FactureDefinitiveIncoterm]
ON [dbo].[Factures_FactureDefinitive]
    ([Incoterm_Id]);
GO

-- Creating foreign key on [Incoterm_Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_FactureProformaIncoterm]
    FOREIGN KEY ([Incoterm_Id])
    REFERENCES [dbo].[Incoterms]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_FactureProformaIncoterm'
CREATE INDEX [IX_FK_FactureProformaIncoterm]
ON [dbo].[Factures_FactureProforma]
    ([Incoterm_Id]);
GO

-- Creating foreign key on [Pere_Id] in table 'Attributs'
ALTER TABLE [dbo].[Attributs]
ADD CONSTRAINT [FK_AttributPereFils]
    FOREIGN KEY ([Pere_Id])
    REFERENCES [dbo].[Attributs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_AttributPereFils'
CREATE INDEX [IX_FK_AttributPereFils]
ON [dbo].[Attributs]
    ([Pere_Id]);
GO

-- Creating foreign key on [Pere_Id] in table 'Valeurs'
ALTER TABLE [dbo].[Valeurs]
ADD CONSTRAINT [FK_ValeurPereFils]
    FOREIGN KEY ([Pere_Id])
    REFERENCES [dbo].[Valeurs]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ValeurPereFils'
CREATE INDEX [IX_FK_ValeurPereFils]
ON [dbo].[Valeurs]
    ([Pere_Id]);
GO

-- Creating foreign key on [Packaging_Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_ArticlePackaging]
    FOREIGN KEY ([Packaging_Id])
    REFERENCES [dbo].[Packagings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticlePackaging'
CREATE INDEX [IX_FK_ArticlePackaging]
ON [dbo].[Articles]
    ([Packaging_Id]);
GO

-- Creating foreign key on [Id] in table 'Factures_FactureFournisseur'
ALTER TABLE [dbo].[Factures_FactureFournisseur]
ADD CONSTRAINT [FK_FactureFournisseur_inherits_Facture]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_FactureProforma'
ALTER TABLE [dbo].[Factures_FactureProforma]
ADD CONSTRAINT [FK_FactureProforma_inherits_FactureFournisseur]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures_FactureFournisseur]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_FactureDefinitive'
ALTER TABLE [dbo].[Factures_FactureDefinitive]
ADD CONSTRAINT [FK_FactureDefinitive_inherits_FactureFournisseur]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures_FactureFournisseur]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Entreprises_Banque'
ALTER TABLE [dbo].[Entreprises_Banque]
ADD CONSTRAINT [FK_Banque_inherits_Entreprise]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Adresses_AdresseLocale'
ALTER TABLE [dbo].[Adresses_AdresseLocale]
ADD CONSTRAINT [FK_AdresseLocale_inherits_Adresse]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Adresses]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_FactureTransit'
ALTER TABLE [dbo].[Factures_FactureTransit]
ADD CONSTRAINT [FK_FactureTransit_inherits_Facture]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_FactureFrais'
ALTER TABLE [dbo].[Factures_FactureFrais]
ADD CONSTRAINT [FK_FactureFrais_inherits_Facture]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_FactureNonDeclaree'
ALTER TABLE [dbo].[Factures_FactureNonDeclaree]
ADD CONSTRAINT [FK_FactureNonDeclaree_inherits_FactureFrais]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures_FactureFrais]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_FactureDeclaree'
ALTER TABLE [dbo].[Factures_FactureDeclaree]
ADD CONSTRAINT [FK_FactureDeclaree_inherits_FactureFrais]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures_FactureFrais]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Entreprises_CompagnieMaritime'
ALTER TABLE [dbo].[Entreprises_CompagnieMaritime]
ADD CONSTRAINT [FK_CompagnieMaritime_inherits_Entreprise]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Entreprises_Importateur'
ALTER TABLE [dbo].[Entreprises_Importateur]
ADD CONSTRAINT [FK_Importateur_inherits_Entreprise]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Entreprises_Fournisseur'
ALTER TABLE [dbo].[Entreprises_Fournisseur]
ADD CONSTRAINT [FK_Fournisseur_inherits_Entreprise]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_Commande'
ALTER TABLE [dbo].[Factures_Commande]
ADD CONSTRAINT [FK_Commande_inherits_Facture]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Factures_Offre'
ALTER TABLE [dbo].[Factures_Offre]
ADD CONSTRAINT [FK_Offre_inherits_FactureFournisseur]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Factures_FactureFournisseur]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Id] in table 'Entreprises_Transit'
ALTER TABLE [dbo].[Entreprises_Transit]
ADD CONSTRAINT [FK_Transit_inherits_Entreprise]
    FOREIGN KEY ([Id])
    REFERENCES [dbo].[Entreprises]
        ([Id])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------