using System;
using System.Threading;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{

    public class FormHandle
    {
        private Form open;
        public bool RedirectForm(Form open)
        {
            try
            {
                this.open = open;
                Application.Exit();
                Thread newThread = new Thread(OpenForm);
                newThread.SetApartmentState(ApartmentState.STA);
                newThread.Start();  return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
        private void OpenForm()
        {
            Application.Run(open);
        }       
    }    
}