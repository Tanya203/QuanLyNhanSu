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
    public partial class frmChiTietPhieuPhat : Form
    {
        Thread currentForm;
        public frmChiTietPhieuPhat()
        {
            InitializeComponent();
        }
        public void ReturnQLPP()
        {
            this.Close();
            Application.Run(new frmPhieuPhat());
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(ReturnQLPP);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
