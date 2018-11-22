using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{

    public class CloturationPageVM : OperationVM
    {
        public CloturationPageVM()
        {

        }

        #region Public Properties

        public DateTime? DateArrivee
        {
            get => IoCContainer.Get<Importation>().DateArrivee;
            set
            {
                IoCContainer.Get<Importation>().DateArrivee = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public double? Cours
        {
            get => IoCContainer.Get<Importation>().CoursAchat;
            set
            {
                IoCContainer.Get<Importation>().CoursAchat = value;
                IoCContainer.Get<ModelContainer>().SaveChanges();
            }
        }

        public FactureFraisVM FactureFrais => new FactureFraisVM();

        public ArrivageVM Arrivage => new ArrivageVM(IoCContainer.Get<Importation>().Arrivage.ToList());

        public override string Titre { get => "Cloturation"; }

        public override EtatOperation Etat => (IoCContainer.Get<Importation>().Arrivage == null) ? EtatOperation.EnCours : EtatOperation.Cloturee;

        public override void Cloturer()
        {
            var arrivage = new List<LigneCommande>();
            arrivage.AddRange(IoCContainer.Get<Importation>().FactureDefinitive.LignesFacture.Select(l => new LigneCommande() { Article = l.Article }));
            IoCContainer.Get<Importation>().Arrivage = arrivage;
            IoCContainer.Get<ModelContainer>().SaveChanges();
            OnPropertyChanged(nameof(Arrivage));
        }

        #endregion

        #region Public Commands

        #endregion

    }
}
