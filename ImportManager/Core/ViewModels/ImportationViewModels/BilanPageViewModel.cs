using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class BilanPageVM : OperationVM
    {
        private NegociationPageVM _etatNegociation => new NegociationPageVM();
        private DomiciliationPageVM _etatDomiciliation => new DomiciliationPageVM();
        private DedouanementPageVM _etatDedouanement => new DedouanementPageVM();
        private CloturationPageVM _etatCloturation => new CloturationPageVM();

        private Importation Importation => IoCContainer.Get<Importation>();

        public BilanPageVM()
        {

        }

        #region Public Properties

        public double? ValeurDA => _etatDedouanement.MontantFactureDA;

        public double? TotalCharges =>
            _etatDedouanement.TotalTaxes
            + _etatDedouanement.FactureTransit?.TotalFraisDeclare 
            + _etatDedouanement.FactureTransit?.TotalFraisNonDeclare 
            + _etatCloturation.FactureFrais?.TotalFraisDeclare 
            + _etatCloturation.FactureFrais?.TotalFraisNonDeclare;

        public double? CoutTotal => ValeurDA + TotalCharges;

        public double? Cours => CoutTotal / _etatDomiciliation.FactureDefinitive.TotalPrix;

        public ObservableCollection<LigneListePrixVM> ListePrix
        {
            get
            {
                var importation = IoCContainer.Get<Importation>();
                return new ObservableCollection<LigneListePrixVM>(importation.FactureDefinitive.LignesFacture.Select(l => new LigneListePrixVM(importation.CoursAchat ?? 0) { LigneFacture = new LigneFactureVM(l) }));
            }
        }

        public override string Titre { get => "Bilan"; }

        public override EtatOperation Etat => EtatOperation.EnCours;

        #endregion

        public override void Cloturer()
        {
        }
    }

    public class LigneListePrixVM : BaseVM
    {
        private double _cours;

        private double? _margeTaux;

        public LigneListePrixVM(double Cours)
        {
            _cours = Cours;
        }

        public Article Article => LigneFacture.Article;

        public LigneFactureVM LigneFacture { get; set; }

        public int Index { get; set; }

        public string OEM => LigneFacture.OEM;

        public string RefFournisseur => LigneFacture.RefFournisseur;

        public string Designation => LigneFacture.Designation;

        public double? PrixRevient => LigneFacture.PrixUnit * _cours;

        public double? PrixVente
        {
            get { return PrixRevient * (1 + _margeTaux); }
            set
            {
                _margeTaux = (value - PrixRevient) / PrixRevient;
                OnPropertyChanged(nameof(PrixVente));
                OnPropertyChanged(nameof(MargeTaux));
                OnPropertyChanged(nameof(MargeValeur));
            }
        }

        public double? MargeTaux
        {
            get { return _margeTaux * 100; }
            set
            {
                _margeTaux = value / 100;
                OnPropertyChanged(nameof(PrixVente));
                OnPropertyChanged(nameof(MargeTaux));
                OnPropertyChanged(nameof(MargeValeur));
            }
        }

        public double? MargeValeur
        {
            get { return PrixRevient * _margeTaux; }
            set
            {
                _margeTaux = value / PrixRevient;
                OnPropertyChanged(nameof(PrixVente));
                OnPropertyChanged(nameof(MargeTaux));
                OnPropertyChanged(nameof(MargeValeur));
            }
        }

    }
}
