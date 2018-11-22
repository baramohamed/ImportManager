using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager
{
    public enum EtatImportation
    {
        Negociation=0,
        Domiciliation=1,
        Dedouanement=2,
        Cloturation=3,
        Cloturee=4,
    }

    public enum CoteH
    {
        None = 0,
        Droite = 1,
        Gauche = 2,
    }

    public enum CoteV
    {
        None = 0,
        Avant = 1,
        Arriere = 2,
    }
}
