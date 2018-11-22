using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Core
{
    public abstract class OperationVM : BaseVM
    {

        public abstract EtatOperation Etat { get; }

        public abstract string Titre { get; }

        public bool NotEnCours => Etat != EtatOperation.EnCours;

        public bool NonCloturee => Etat != EtatOperation.Cloturee;

        public abstract void Cloturer();

        public void Refresh()
        {
            OnPropertyChanged(nameof(NotEnCours));
            OnPropertyChanged(nameof(NonCloturee));
        }
    }

    public enum EtatOperation
    {
        EnCours = 0,
        Cloturation = 1,
        Cloturee = 2,
    }
}
