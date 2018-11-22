using Model;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public class InitialisationPageVM : OperationVM
    {
        
        public InitialisationPageVM()
        {

        }

        #region Public Properties

        public override string Titre { get => "Initialisation"; }

        public override EtatOperation Etat => EtatOperation.EnCours;

        #endregion

        public override void Cloturer()
        {
        }
    }

}
