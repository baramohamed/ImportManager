using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class UtilisateursPageVM : BaseVM
    {
        private bool _isFicheUtilisateurVisible;

        public UtilisateursPageVM()
        {
            Utilisateurs = new ObservableCollection<UtilisateurVM>()
            {
                new UtilisateurVM() {Nom = "Bara", Prenom = "Mohammed Imame", EMail = "fm_bara@esi.dz", NomUtilisateur ="baramohamed" },
                new UtilisateurVM() {Nom = "Bara", Prenom = "Ahmed Rached", EMail = "fm_bara@esi.dz", NomUtilisateur ="rachedrached" },
                new UtilisateurVM() {Nom = "Bara", Prenom = "Bachir", EMail = "fm_bara@esi.dz", NomUtilisateur ="bachir123" },
            };

            DeleteUtilisateur = new RelayCommand(() => {
                Utilisateurs.Remove(SelectedUtilisateur);
            });

            EditUtilisateur = new RelayCommand(() => {
                IsFicheUtilisateurVisible = true;
            });

            AddUtilisateur = new RelayCommand(() => {
                IsFicheUtilisateurVisible = true;
            });

            CancelCommand = new RelayCommand(() => {
                IsFicheUtilisateurVisible = false;
            });

            OkCommand = new RelayCommand(() => {
                IsFicheUtilisateurVisible = false;
            });
    }

        #region Public Properties

        public ObservableCollection<UtilisateurVM> Utilisateurs { get; set; }

        public UtilisateurVM SelectedUtilisateur { get; set; }

        public bool IsFicheUtilisateurVisible {
            get { return _isFicheUtilisateurVisible; }
            set
            {
                _isFicheUtilisateurVisible = value;
                OnPropertyChanged(nameof(IsFicheUtilisateurVisible));
            }
        }

        public RelayCommand DeleteUtilisateur { get; set; }

        public RelayCommand EditUtilisateur { get; set; }

        public RelayCommand AddUtilisateur { get; set; }

        public RelayCommand CancelCommand { get; set; }

        public RelayCommand OkCommand { get; set; }

        #endregion
    }

    public class UtilisateurVM
    {
        public string NomUtilisateur { get; set; }

        public string MotDePasse { get; set; }

        public string Nom { get; set; }

        public string Prenom { get; set; }

        public string EMail { get; set; }

        public string Telephone { get; set; }

        public override string ToString()
        {
            return Nom + " " + Prenom;
        }
    }
}
