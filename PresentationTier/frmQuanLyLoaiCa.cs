using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class frmQuanLyLoaiCa : Form
    {
        Thread currentForm;
        public frmQuanLyLoaiCa()
        {
            InitializeComponent();
        }
        public void ReturnQLC()
        {
            this.Close();
            Application.Run(new frmQuanLyCa());
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(ReturnQLC);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
