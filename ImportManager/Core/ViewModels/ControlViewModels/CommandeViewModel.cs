using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Diagnostics;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Documents;

namespace ImportManager.Core
{
    class CommandeVM : BaseVM
    {

        public Commande Commande;
        private Article _selectedArticle;
        #region Constructor

        public CommandeVM(Commande commande)
        {
            Commande = commande;

            Print = new RelayCommand(() =>
            {
                string directory = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\ImportManager\Assets";

                if (!Directory.Exists(directory))
                {
                    Directory.CreateDirectory(directory);
                }

                var fullPath = directory + @"\Commande.xlsx";
                var newFile = directory + @"\Commande_New.xlsx";
                File.Copy(fullPath, newFile, true);

                var app = new Microsoft.Office.Interop.Excel.Application();
                app.Visible = false;
                var workbook = app.Workbooks.Open(newFile);
                var sheet = (Microsoft.Office.Interop.Excel.Worksheet) workbook.Sheets[1];
                sheet.Range["Fournisseur"].Value = IoCContainer.Get<Importation>().Fournisseur.Denomination;
                sheet.Range["NumCommande"].Value = Commande.NumFacture;
                sheet.Range["Date"].Value = Commande.Date.ToString();
                var com = sheet.ListObjects.Item["Commande"];

                foreach (LigneCommandeVM l in Lignes)
                {
                    com.ListRows.Add();
                    com.Range[com.Range.Rows.Count, 2] = l.Designation;
                    com.Range[com.Range.Rows.Count, 3] = l.Quantite;
                }
                app.Visible = true;
                var path = Environment.GetFolderPath(Environment.SpecialFolder.Desktop) + @"\" + Commande.NumFacture.Replace("/","_") + ".xlsx";
                app.Dialogs.Item[Microsoft.Office.Interop.Excel.XlBuiltInDialog.xlDialogSaveAs].Show(path);
                workbook.Save();
                workbook.Close();
                app.Quit();

            });
        }



        #endregion


        #region Public Properties

        public DateTime? DateCommande
        {
            get => Commande.Date;
            set
            {
                Commande.Date = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DateCommande));
            }
        }

        public string InvoiceN
        {
            get => Commande.NumFacture;
            set
            {
                Commande.NumFacture = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(InvoiceN));
            }
        }


        public Article SelectedArticle
        {
            get => _selectedArticle;
            set
            {
                _selectedArticle = value;
            }
        }

        public ObservableCollection<LigneCommandeVM> Lignes
        {
            get
            {
                return new ObservableCollection<LigneCommandeVM>(Commande.LignesCommande.Select(l => new LigneCommandeVM(l) { Update = UpdateTotal }));
            }
        }

        public LigneCommandeVM SelectedLigne { get; set; }

        public int? TotalQuantite => Lignes?.Select(l => l.Quantite).Sum();

        #region Other Properties

        public ObservableCollection<Article> Articles
        {
            get
            {
                var articles = IoCContainer.Get<Importateur>().Catalogue.Articles.ToList();
                return new ObservableCollection<Article>(articles);
            }
        }

        #endregion

        #endregion

        #region Public Commands

        public RelayCommand Select => new RelayCommand(() =>
        {
            if (SelectedArticle == null || Lignes.Where(l => l.Article == SelectedArticle).Count()>0) return;

            Commande.LignesCommande.Add(new LigneCommande() { Article = SelectedArticle, Quantite = 0 });
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Lignes));
        });

        public RelayCommand Edit { get; set; }

        public RelayCommand Delete => new RelayCommand(() =>
        {
            if (SelectedLigne == null) return;
            Commande.LignesCommande.Remove(SelectedLigne.Ligne);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Lignes));
        });

        public RelayCommand Print { get; set; }

        #endregion

        #region Helpers

        protected int UpdateTotal()
        {
            OnPropertyChanged(nameof(TotalQuantite));
            return 0;
        }

        #endregion

        public override string ToString()
        {
            return "Commande " + InvoiceN;
        }
    }

    public class ValeurAttributVM
    {
        public Valeur Valeur;
        public ValeurAttributVM(Valeur valeur)
        {
            Valeur = valeur;
        }

        public string ValeurFR
        {
            get => Valeur.ValeurFR;
            set
            {
                Valeur.ValeurFR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string ValeurAR
        {
            get => Valeur.ValeurAR;
            set
            {
                Valeur.ValeurAR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
        public string ValeurEN
        {
            get => Valeur.ValeurEN;
            set
            {
                Valeur.ValeurEN = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }
    }

    public class Tuple<TKey, TValue> : BaseVM
    {
        private TValue _value;

        public TKey Key { get; set; }

        public TValue Value
        {
            get => _value;
            set
            {
                _value = value;
                OnPropertyChanged(nameof(Value));
            }
        }
    }
}
