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
    public partial class FrmChiTietPhuCapMotNhanVien : Form
    {
        Thread currentForm;
        public FrmChiTietPhuCapMotNhanVien()
        {
            InitializeComponent();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            /*FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;*/
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void lblTongPhuCapCuaNhanVien_Click(object sender, EventArgs e)
        {

        }
    }
}
