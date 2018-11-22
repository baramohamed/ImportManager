using Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager.Test
{
    public class AttributVM
    {
        public Attribut attribut;

        public AttributVM Pere;

        public List<AttributVM> Fils;

        public Valeur SelectedValeur;

        public List<Valeur> Valeurs => attribut.Valeurs.Where(v => v.Pere == Pere.SelectedValeur).ToList();
    }
}
