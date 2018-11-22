using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class FraisVM : BaseVM
    {

        public FactureFrais Facture;

        public FraisVM(FactureFrais facture)
        {
            Facture = facture;
        }

        #region Public Properties

        public string FactureN
        {
            get => Facture.NumFacture;
            set
            {
                Facture.NumFacture = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public DateTime? DateFacture
        {
            get => Facture.Date;
            set
            {
                Facture.Date = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public Entreprise Beneficiaire
        {
            get => Facture.Beneficiaire;
            set
            {
                Facture.Beneficiaire = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public MotifFacture Motif
        {
            get => Facture.Motif;
            set
            {
                Facture.Motif = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Remarque
        {
            get => Facture.Remarque;
            set
            {
                Facture.Remarque = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public double? Total
        {
            get => Facture.Montant;
            set
            {
                Facture.Montant = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                Update();
            }
        }

        public bool IsDeclare => Facture is FactureDeclaree;

        #region Other Properties

        public ObservableCollection<Entreprise> Beneficiaires => new ObservableCollection<Entreprise>(IoCContainer.Get<ModelContainer>().Entreprises.Where(e => !(e is Importateur)));

        //public ObservableCollection<MotifFacture> Motifs => new ObservableCollection<MotifFacture>(IoCContainer.Get<ModelContainer>().MotifFactures);

        public ObservableCollection<FichierVM> Fichiers => new ObservableCollection<FichierVM>((Facture).FichiersJoints.Select(f => new FichierVM(f)));

        public RelayCommand AjouterFichier => new RelayCommand(() =>
        {
            Microsoft.Win32.OpenFileDialog dlg = new Microsoft.Win32.OpenFileDialog();
            var result = dlg.ShowDialog();
            if (result == true)
            {
                var fullPath = dlg.FileName;

                //var fileName = fullPath.Substring(fullPath.LastIndexOf('\\') + 1);
                //var source = fullPath.Remove(fullPath.LastIndexOf('\\'));

                var destination = Environment.GetFolderPath(Environment.SpecialFolder.ApplicationData) + @"\ImportManager\Documents";
                if (!System.IO.Directory.Exists(destination))
                {
                    System.IO.Directory.CreateDirectory(destination);
                }
                var length = System.IO.Directory.GetFiles(destination).Length;
                var ext = fullPath.Substring(fullPath.LastIndexOf('.'));

                var destinationFile = destination + @"\" + (length + 1) + ext;

                System.IO.File.Copy(fullPath, destinationFile);

                (Facture).FichiersJoints.Add(new Fichier() { NomFichier = "Fichier N° " + (Fichiers.Count + 1), Chemin = destinationFile });
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Fichiers));
            }
        });


        #endregion

        #endregion

        #region Helpers

        public Func<int> Update { get; set; } = () => { return 0; };

        #endregion

    }
}
