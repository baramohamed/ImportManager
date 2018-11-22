using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    class OffreVM : FactureVM
    {

        public OffreVM(FactureFournisseur facture) : base(facture)
        {

        }

        public ObservableCollection<FichierVM> Fichiers => new ObservableCollection<FichierVM>((Facture as Offre).FichiersJoints.Select(f => new FichierVM(f)));

        public bool IsDialogOpen { get; set; } = false;

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

                var destinationFile = destination + @"\" + (length+1) + ext;

                System.IO.File.Copy(fullPath, destinationFile);

                (Facture as Offre).FichiersJoints.Add(new Fichier() { NomFichier = "Fichier N° " + (Fichiers.Count+1) , Chemin = destinationFile});
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Fichiers));
            }
        });

        public RelayCommand OpenDialog => new RelayCommand(() => 
        {
            IsDialogOpen = true;
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public RelayCommand CloseDialog => new RelayCommand(() =>
        {
            IsDialogOpen = false;
            OnPropertyChanged(nameof(IsDialogOpen));
        });

        public override string ToString()
        {
            return "Offre " + InvoiceN;
        }
    }

    public class FichierVM
    {
        public Fichier Fichier;

        public FichierVM(Fichier fichier)
        {
            Fichier = fichier;
        }

        public string NomFichier
        {
            get => Fichier.NomFichier;
            set
            {
                Fichier.NomFichier = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Description
        {
            get => Fichier.Description;
            set
            {
                Fichier.Description = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string Chemin
        {
            get => Fichier.Chemin;
            set
            {
                Fichier.Chemin = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public RelayCommand OpenFile => new RelayCommand(() => 
        {
            System.Diagnostics.Process.Start(Chemin);
        });
    }
}
