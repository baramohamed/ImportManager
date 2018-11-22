using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class ParametresAvancesPageVM : BaseVM
    {
        private PaysVM _selectedPays;

        #region Devises

        public ObservableCollection<DeviseVM> Devises => new ObservableCollection<DeviseVM>(IoCContainer.Get<ModelContainer>().Devises.ToList().Select(d => new DeviseVM(d)));

        public DeviseVM SelectedDevise { get; set; }

        public RelayCommand AddDevise => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().Devises.Add(new Devise());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Devises));
        });

        public RelayCommand DeleteDevise => new RelayCommand(() =>
        {
            if (SelectedDevise == null) return;
            IoCContainer.Get<ModelContainer>().Devises.Remove(SelectedDevise.Devise);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Devises));
        });

        #endregion

        #region Pays

        public ObservableCollection<PaysVM> Pays => new ObservableCollection<PaysVM>(IoCContainer.Get<ModelContainer>().Pays.ToList().Select(p => new PaysVM(p)));

        public PaysVM SelectedPays
        {
            get => _selectedPays;
            set
            {
                _selectedPays = value;
                OnPropertyChanged(nameof(SelectedPays));
                OnPropertyChanged(nameof(Ports));
            }
        }

        public RelayCommand AddPays => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().Pays.Add(new Pays());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Pays));
        });

        public RelayCommand DeletePays => new RelayCommand(() =>
        {
            if (SelectedPays == null) return;
            IoCContainer.Get<ModelContainer>().Pays.Remove(SelectedPays.Pays);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Pays));
        });

        #endregion

        #region Ports

        public ObservableCollection<PortVM> Ports
        {
            get
            {
                if (SelectedPays?.Ports == null) return null;
                return new ObservableCollection<PortVM>(SelectedPays.Ports);
            }
        }

        public PortVM SelectedPort { get; set; }

        public RelayCommand AddPort => new RelayCommand(() =>
        {
            if (SelectedPays?.Ports == null) return;
            SelectedPays.Pays.Ports.Add(new Port());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Ports));
        });

        public RelayCommand DeletePort => new RelayCommand(() =>
        {
            if (SelectedPays?.Ports == null) return;
            SelectedPays.Pays.Ports.Remove(SelectedPort.Port);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Ports));
        });

        #endregion

        #region Wilayas

        public ObservableCollection<WilayaVM> Wilayas => new ObservableCollection<WilayaVM>(IoCContainer.Get<ModelContainer>().Wilayas.ToList().Select(d => new WilayaVM(d)));

        public WilayaVM SelectedWilaya { get; set; }

        public RelayCommand AddWilaya => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().Wilayas.Add(new Wilaya());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Wilayas));
        });

        public RelayCommand DeleteWilaya => new RelayCommand(() =>
        {
            if (SelectedWilaya == null) return;
            IoCContainer.Get<ModelContainer>().Wilayas.Remove(SelectedWilaya.Wilaya);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Wilayas));
        });

        #endregion

        #region RecettesImpots

        public ObservableCollection<RecetteImpotsVM> RecettesImpots => new ObservableCollection<RecetteImpotsVM>(IoCContainer.Get<ModelContainer>().RecetteImpots.ToList().Select(d => new RecetteImpotsVM(d)));

        public RecetteImpotsVM SelectedRecette { get; set; }

        public RelayCommand AddRecette => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().RecetteImpots.Add(new RecetteImpots());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(RecettesImpots));
        });

        public RelayCommand DeleteRecette => new RelayCommand(() =>
        {
            if (SelectedRecette == null) return;
            IoCContainer.Get<ModelContainer>().RecetteImpots.Remove(SelectedRecette.RecetteImpots);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(RecettesImpots));
        });

        #endregion

        #region Incoterms

        public ObservableCollection<IncotermVM> Incoterms => new ObservableCollection<IncotermVM>(IoCContainer.Get<ModelContainer>().Incoterms.ToList().Select(d => new IncotermVM(d)));

        public IncotermVM SelectedIncoterm { get; set; }

        public RelayCommand AddIncoterm => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().Incoterms.Add(new Incoterm());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Incoterms));
        });

        public RelayCommand DeleteIncoterm => new RelayCommand(() =>
        {
            if (SelectedIncoterm == null) return;
            IoCContainer.Get<ModelContainer>().Incoterms.Remove(SelectedIncoterm.Incoterm);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Incoterms));
        });

        #endregion

        #region Statuts Juridiques

        public ObservableCollection<StatutJuridiqueVM> StatutsJuridiques => new ObservableCollection<StatutJuridiqueVM>(IoCContainer.Get<ModelContainer>().StatutsJuridiques.ToList().Select(d => new StatutJuridiqueVM(d)));

        public StatutJuridiqueVM SelectedStatut { get; set; }

        public RelayCommand AddStatut => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().StatutsJuridiques.Add(new StatutJuridique());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(StatutsJuridiques));
        });

        public RelayCommand DeleteStatut => new RelayCommand(() =>
        {
            if (SelectedStatut == null) return;
            IoCContainer.Get<ModelContainer>().StatutsJuridiques.Remove(SelectedStatut.StatutJuridique);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(StatutsJuridiques));
        });

        #endregion

        #region TypeEntreprises

        public ObservableCollection<TypeEntrepriseVM> TypesEntreprises => new ObservableCollection<TypeEntrepriseVM>(IoCContainer.Get<ModelContainer>().TypesEntreprises.ToList().Select(d => new TypeEntrepriseVM(d)));

        public TypeEntrepriseVM SelectedTypeEntreprise { get; set; }

        public RelayCommand AddTypeEntreprise => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().TypesEntreprises.Add(new TypeEntreprise());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(TypesEntreprises));
        });

        public RelayCommand DeleteTypeEntreprise => new RelayCommand(() =>
        {
            if (SelectedTypeEntreprise == null) return;
            IoCContainer.Get<ModelContainer>().TypesEntreprises.Remove(SelectedTypeEntreprise.TypeEntreprise);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(TypesEntreprises));
        });

        #endregion

        #region Modes Règlement

        public ObservableCollection<ModeReglementVM> ModesReglement => new ObservableCollection<ModeReglementVM>(IoCContainer.Get<ModelContainer>().ModesReglement.ToList().Select(d => new ModeReglementVM(d)));

        public ModeReglementVM SelectedModeReglement { get; set; }

        public RelayCommand AddModeReglement => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().ModesReglement.Add(new ModeReglement());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(ModesReglement));
        });

        public RelayCommand DeleteModeReglement => new RelayCommand(() =>
        {
            if (SelectedModeReglement == null) return;
            IoCContainer.Get<ModelContainer>().ModesReglement.Remove(SelectedModeReglement.ModeReglement);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(ModesReglement));
        });

        #endregion

        #region Unités de Quantités Normalisées

        public ObservableCollection<UQNVM> UQNs => new ObservableCollection<UQNVM>(IoCContainer.Get<ModelContainer>().UQNs.ToList().Select(d => new UQNVM(d)));

        public UQNVM SelectedUQN { get; set; }

        public RelayCommand AddUQN => new RelayCommand(() =>
        {
            IoCContainer.Get<ModelContainer>().UQNs.Add(new UQN());
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(UQNs));
        });

        public RelayCommand DeleteUQN => new RelayCommand(() =>
        {
            if (SelectedUQN == null) return;
            IoCContainer.Get<ModelContainer>().UQNs.Remove(SelectedUQN.UQN);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(UQNs));
        });

        #endregion

    }

    public class DeviseVM : BaseVM
    {
        public Devise Devise;

        public DeviseVM(Devise devise)
        {
            Devise = devise;
        }

        public string Code
        {
            get => Devise.Code;
            set
            {
                Devise.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }

        public string Designation
        {
            get => Devise.Designation;
            set
            {
                Devise.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }

    public class PaysVM : BaseVM
    {
        public Pays Pays;

        public PaysVM(Pays pays)
        {
            Pays = pays;
        }

        public string Code
        {
            get => Pays.Code;
            set
            {
                Pays.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }

        public string Designation
        {
            get => Pays.Designation;
            set
            {
                Pays.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }

        public ObservableCollection<Devise> Devises => new ObservableCollection<Devise>(IoCContainer.Get<ModelContainer>().Devises);

        public Devise Devise
        {
            get => Pays.Devise;
            set
            {
                Pays.Devise = value;
                OnPropertyChanged(nameof(Devise));
            }
        }

        public ObservableCollection<PortVM> Ports
        {
            get
            {
                if (Pays == null) return null;
                if (Pays.Ports == null) Pays.Ports = new Collection<Port>();
                return new ObservableCollection<PortVM>(Pays.Ports.Select(p => new PortVM(p)));
            }
        }
    }

    public class PortVM : BaseVM
    {
        public Port Port;

        public PortVM(Port port)
        {
            Port = port;
        }

        public string Code
        {
            get => Port.Code;
            set
            {
                Port.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }

        public string Designation
        {
            get => Port.Designation;
            set
            {
                Port.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }

    public class WilayaVM : BaseVM
    {
        public Wilaya Wilaya;

        public WilayaVM(Wilaya wilaya)
        {
            Wilaya = wilaya;
        }

        public string Code
        {
            get => Wilaya.Code;
            set
            {
                Wilaya.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }

        public string Designation
        {
            get => Wilaya.Designation;
            set
            {
                Wilaya.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }

    public class RecetteImpotsVM : BaseVM
    {
        public RecetteImpots RecetteImpots;

        public RecetteImpotsVM(RecetteImpots recetteImpots)
        {
            RecetteImpots = recetteImpots;
        }

        public string Code
        {
            get => RecetteImpots.Code;
            set
            {
                RecetteImpots.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }

        public string Designation
        {
            get => RecetteImpots.Designation;
            set
            {
                RecetteImpots.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }

        public ObservableCollection<Wilaya> Wilayas => new ObservableCollection<Wilaya>(IoCContainer.Get<ModelContainer>().Wilayas);


        public Wilaya Wilaya
        {
            get => RecetteImpots.Wilaya;
            set
            {
                RecetteImpots.Wilaya = value;
                OnPropertyChanged(nameof(Wilaya));
            }
        }
    }

    public class IncotermVM : BaseVM
    {
        public Incoterm Incoterm;

        public IncotermVM(Incoterm incoterm)
        {
            Incoterm = incoterm;
        }

        public string Code
        {
            get => Incoterm.Code;
            set
            {
                Incoterm.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }
    }

    public class StatutJuridiqueVM : BaseVM
    {
        public StatutJuridique StatutJuridique;

        public StatutJuridiqueVM(StatutJuridique statutJuridique)
        {
            StatutJuridique = statutJuridique;
        }

        public string Designation
        {
            get => StatutJuridique.Designation;
            set
            {
                StatutJuridique.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }

    public class TypeEntrepriseVM : BaseVM
    {
        public TypeEntreprise TypeEntreprise;

        public TypeEntrepriseVM(TypeEntreprise typeEntreprise)
        {
            TypeEntreprise = typeEntreprise;
        }

        public string Designation
        {
            get => TypeEntreprise.Designation;
            set
            {
                TypeEntreprise.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }

    public class ModeReglementVM : BaseVM
    {
        public ModeReglement ModeReglement;

        public ModeReglementVM(ModeReglement modeReglement)
        {
            ModeReglement = modeReglement;
        }

        public string Designation
        {
            get => ModeReglement.Designation;
            set
            {
                ModeReglement.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }

    public class UQNVM : BaseVM
    {
        public UQN UQN;

        public UQNVM(UQN uqn)
        {
            UQN = uqn;
        }

        public string Code
        {
            get => UQN.Code;
            set
            {
                UQN.Code = value;
                OnPropertyChanged(nameof(Code));
            }
        }

        public string Designation
        {
            get => UQN.Designation;
            set
            {
                UQN.Designation = value;
                OnPropertyChanged(nameof(Designation));
            }
        }
    }
}
