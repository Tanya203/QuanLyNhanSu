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
    public partial class FrmThongTinTaiKhoan : Form
    {
        Thread currentForm;
        public FrmThongTinTaiKhoan()
        {
            InitializeComponent();
        }
        public void ReturnHome()
        {
            /*this.Close();
            Application.Run(new FrmManHinhChinh());*/
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            /*FrmManHinhChinh frmOpen = new FrmManHinhChinh();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;*/
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void pnlMenu_Paint(object sender, PaintEventArgs e)
        {

        }

        private void lblNgayVaoLam_Click(object sender, EventArgs e)
        {

        }

        private void dtpNgayVaoLam_ValueChanged(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void lblThongTinTaiKhoan_Click(object sender, EventArgs e)
        {

        }
    }
}
