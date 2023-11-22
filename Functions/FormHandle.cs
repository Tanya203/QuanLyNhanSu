using System;
using System.Drawing;
using System.Threading;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolTip;

namespace QuanLyNhanSu.Functions
{
    
    public class FormHandle
    {
        private Form open;
        public bool RedirectForm(Form open, Form close)
        {
            try
            {
                this.open = open;
                close.Close();
                Thread newThread = new Thread(OpenForm);
                newThread.SetApartmentState(ApartmentState.STA);
                newThread.Start();
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
        private void OpenForm()
        {
            Form form = new Form();
            form = open;
            Application.Run(form);
        }       
    }    
}