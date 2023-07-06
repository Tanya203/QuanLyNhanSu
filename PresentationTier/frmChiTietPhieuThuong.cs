using QuanLyNhanSu.LogicTier;
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
    public partial class FrmChiTietPhieuThuong : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly string maNV;
        public FrmChiTietPhieuThuong()
        {
            InitializeComponent();
        }
        private void FrmChiTietPhieuThuong_Load(object sender, EventArgs e)
        {

        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmPhieuThuong frmOpen = new FrmPhieuThuong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
