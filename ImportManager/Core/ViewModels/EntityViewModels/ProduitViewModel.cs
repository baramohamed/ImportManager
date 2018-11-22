using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class ProduitVM : BaseVM
    {
        public Produit Produit;
        public ProduitVM(Produit produit)
        {
            Produit = produit;
        }

        public string DesignationFR
        {
            get => Produit.DesignationFR;
            set
            {
                Produit.DesignationFR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
                OnPropertyChanged(nameof(DesignationFR));
            }
        }

        public string DesignationEN
        {
            get => Produit.DesignationEN;
            set
            {
                Produit.DesignationEN = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public string DesignationAR
        {
            get => Produit.DesignationAR;
            set
            {
                Produit.DesignationAR = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public ObservableCollection<Section> Sections
        {
            get
            {
                var sections = IoCContainer.Get<ModelContainer>().Sections.ToList();
                return new ObservableCollection<Section>(sections);
            }
        }

        public SousPosition PositionTarifaire
        {
            get => Produit.PositionTarifaire;
            set
            {
                Produit.PositionTarifaire = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public ObservableCollection<AttributVM> Attributs => new ObservableCollection<AttributVM>(Produit.Attributs.Select(a => new AttributVM(a) { Peres = new ObservableCollection<Attribut>(Produit.Attributs.Where(x => x != a)) }));

        public AttributVM SelectedAttribut { get; set; }

        public ObservableCollection<AttributVM> AttributsDisponibles
        {
            get
            {
                var list = IoCContainer.Get<ModelContainer>().Attributs.ToList();
                return new ObservableCollection<AttributVM>(list.Select(a => new AttributVM(a)));
            }
        }

        public AttributVM SelectedAttributDisponible { get; set; }

        public RelayCommand SelectAttribut => new RelayCommand(() =>
        {
            if (SelectedAttributDisponible == null) return;
            Produit.Attributs.Add(SelectedAttributDisponible.Attribut);
            foreach(Attribut a in SelectedAttributDisponible.Attribut.Fils)
            {
                Produit.Attributs.Add(a);
            }
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Attributs));
            SelectedAttribut = Attributs.Last();
            OnPropertyChanged(nameof(SelectedAttribut));
        });

        public RelayCommand AddAttribut => new RelayCommand(() => 
        {
            Produit.Attributs.Add(new Attribut() { DesignationFR = "Nouveau" });
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Attributs));
            SelectedAttribut = Attributs.Last();
            OnPropertyChanged(nameof(SelectedAttribut));
        });

        public RelayCommand DeleteAttribut => new RelayCommand(() =>
        {
            Produit.Attributs.Remove(SelectedAttribut.Attribut);
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Attributs));
            SelectedAttribut = Attributs.Last();
            OnPropertyChanged(nameof(SelectedAttribut));
        });

    }
}
