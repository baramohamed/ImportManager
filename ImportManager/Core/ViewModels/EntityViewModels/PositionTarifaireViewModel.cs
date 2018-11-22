using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ImportManager
{
    public class PositionTarifaireVM
    {
        public PositionTarifaireVM()
        {
            Chapitres = new ObservableCollection<string>() { "Chapitre 1", "Chapitre 2", "Chapitre 3", "Chapitre 4", };
            Sections = new ObservableCollection<string>() { "Section 1", "Section 2", "Section 3", "Section 4", };
            Positions = new ObservableCollection<string>() { "Position 1", "Position 2", "Position 3", "Position 4", };
            SousPositions = new ObservableCollection<string>() { "Sous-Position 1", "Sous-Position 2", "Sous-Position 3", "Sous-Position 4", };

        }
        public string SelectedChapitre { get; set; }

        public string SelectedSection { get; set; }

        public string SelectedPosition { get; set; }

        public string SelectedSousPosition { get; set; }

        public ObservableCollection<string> Chapitres { get; set; }

        public ObservableCollection<string> Sections { get; set; }

        public ObservableCollection<string> Positions { get; set; }

        public ObservableCollection<string> SousPositions { get; set; }
    }
}
