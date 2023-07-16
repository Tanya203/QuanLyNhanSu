using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
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
    public partial class FrmLichSuThaoTac : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<LichSuThaoTacViewModels> lichSuThaoTac;
        private IEnumerable<LichSuThaoTacViewModels> lichSuThaoTacTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        

        public FrmLichSuThaoTac(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            this.maNV = maNV;
        }
        private void frmLichSuThaoTac_Load(object sender, EventArgs e)
        {
            LoadLichSuThaoTac();
            LoadThongTinDangNhap();
        }
        public void LoadThongTinDangNhap()
        {            
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        public void LoadLichSuThaoTac()
        {
            dgvLichSuThaoTac.Rows.Clear();
            lichSuThaoTac = lichSuThaoTacBUS.GetAllLichSuTThaoTac(dtpNgay.Text);
            int rowAdd;
            foreach(var tt in lichSuThaoTac)
            {
                rowAdd = dgvLichSuThaoTac.Rows.Add();
                dgvLichSuThaoTac.Rows[rowAdd].Cells[0].Value = tt.NgayGio;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[1].Value = tt.MaNV;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[2].Value = tt.HoTen;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[3].Value = tt.PhongBan;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[4].Value = tt.ChucVu;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[5].Value = tt.ThaoTacThucHien;
            }
        }
        public void LoadLichSuThaoTacTimKiem(string timKiem)
        {
            dgvLichSuThaoTac.Rows.Clear();
            lichSuThaoTacTimKiem = lichSuThaoTacBUS.LichSuThaoTacTimKiem(dtpNgay.Text,timKiem);
            int rowAdd;
            foreach (var tt in lichSuThaoTacTimKiem)
            {
                rowAdd = dgvLichSuThaoTac.Rows.Add();
                dgvLichSuThaoTac.Rows[rowAdd].Cells[0].Value = tt.NgayGio;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[1].Value = tt.MaNV;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[2].Value = tt.HoTen;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[3].Value = tt.PhongBan;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[4].Value = tt.ChucVu;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[5].Value = tt.ThaoTacThucHien;
            }
        }
        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            txtTimKiem.Text = txtTimKiem.Text;
            LoadLichSuThaoTac();
        }
        /////////////////////////////////////////////////////////////////////////////////////////        
        public void Reload()
        {
            FrmLichSuThaoTac frmOpen = new FrmLichSuThaoTac(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtTimKiem.Text))
                LoadLichSuThaoTac();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadLichSuThaoTacTimKiem(txtTimKiem.Text);
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        
    }
}
