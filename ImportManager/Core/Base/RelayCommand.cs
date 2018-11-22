using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace ImportManager
{
    public class RelayCommand : ICommand
    {
        #region Private Members

        private Action _action;

        #endregion

        #region Public Events

        public event EventHandler CanExecuteChanged = (sender, o) => { };

        #endregion

        #region Constructor

        public RelayCommand(Action action)
        {
            _action = action;
        }
        #endregion

        #region Public Methods

        public bool CanExecute(object parameter)
        {
            return true;
        }

        public void Execute(object parameter)
        {
            _action();
        }

        #endregion
    }
}
