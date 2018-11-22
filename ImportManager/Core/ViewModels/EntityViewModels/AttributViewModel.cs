using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class AttributVM : BaseVM
    {
        public Attribut Attribut;
        private Valeur _selectedValeurPere;

        public AttributVM(Attribut attribut)
        {
            Attribut = attribut;

            AddValeur = new RelayCommand(() =>
            {
                if (Pere != null)
                {
                    if (SelectedValeurPere == null) return;
                    Attribut.Valeurs.Add(new Valeur() { Pere = SelectedValeurPere });
                }
                else Attribut.Valeurs.Add(new Valeur());
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Valeurs));
                
                OnPropertyChanged(nameof(SelectedValeur));
            });

            DeleteValeur = new RelayCommand(() =>
            {
                if (SelectedValeur == null) return;
                Attribut.Valeurs.Remove(SelectedValeur.Valeur);
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(Valeurs));
                SelectedValeur = Valeurs.Last();
                OnPropertyChanged(nameof(SelectedValeur));
            });
        }

        public string DesignationFR
        {
            get => Attribut.DesignationFR;
            set
            {
                Attribut.DesignationFR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DesignationFR));
            }
        }

        public string DesignationEN
        {
            get => Attribut.DesignationEN;
            set
            {
                Attribut.DesignationEN = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string DesignationAR
        {
            get => Attribut.DesignationAR;
            set
            {
                Attribut.DesignationAR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public ObservableCollection<Attribut> Peres { get; set; }

        public Attribut Pere
        {
            get => Attribut.Pere;
            set
            {
                Attribut.Pere = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(ValeursPere));
                OnPropertyChanged(nameof(IsPereSelected));
            }
        }

        public bool IsPereSelected => (Pere != null);

        public ObservableCollection<Valeur> ValeursPere
        {
            get
            {
                if (Pere == null) return null;
                return new ObservableCollection<Valeur>(Pere.Valeurs);
            }
        }

        public Valeur SelectedValeurPere
        {
            get => _selectedValeurPere;
            set
            {
                _selectedValeurPere = value;
                OnPropertyChanged(nameof(Valeurs));
            }
        }

        public ObservableCollection<ValeurAttributVM> Valeurs
        {
            get
            {
                if (Pere!= null)
                {
                    if (SelectedValeurPere == null) return null;
                    var valeurs = SelectedValeurPere.Fils.Where(v => v.Attribut == Attribut).Select(val => new ValeurAttributVM(val));
                    return new ObservableCollection<ValeurAttributVM>(valeurs);
                }
                else return new ObservableCollection<ValeurAttributVM>(Attribut.Valeurs.Select(v => new ValeurAttributVM(v)));
            }
        }

        public ValeurAttributVM SelectedValeur { get; set; }

        public ObservableCollection<AttributVM> Fils { get; set; }

        public RelayCommand AddValeur { get; set; }

        public RelayCommand DeleteValeur { get; set; }

    }

}
