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
    public partial class FrmPhieuThuong : Form
    {
        Thread currentForm;
        public FrmPhieuThuong()
        {
            InitializeComponent();
        }

        private void pnlMenu_Paint(object sender, PaintEventArgs e)
        {

        }       
        private void btnTroVe_Click(object sender, EventArgs e)
        {
           /* FrmManHinhChinh frmOpen = new FrmManHinhChinh();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;*/
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void lblThongTinPhieuThuong_Click(object sender, EventArgs e)
        {

        }
    }
}
