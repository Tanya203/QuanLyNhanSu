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
    public partial class frmChiTietPhieuThuong : Form
    {
        Thread currentForm;
        public frmChiTietPhieuThuong()
        {
            InitializeComponent();
        }
        public void ReturnQLPT()
        {
            this.Close();
            Application.Run(new frmPhieuThuong());
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(ReturnQLPT);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
