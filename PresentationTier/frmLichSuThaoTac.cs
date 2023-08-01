using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
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
            dtpThang.Checked = false;
            dtpNam.Checked = false;           
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
            if (dtpNgay.Checked)
                lichSuThaoTac = lichSuThaoTacBUS.GetAllLichSuThaoTacTheoNgay(dtpNgay.Text);
            if (dtpThang.Checked)
                lichSuThaoTac = lichSuThaoTacBUS.GetAllLichSuThaoTacTheoThang(dtpThang.Text);
            if (dtpNam.Checked)
                lichSuThaoTac = lichSuThaoTacBUS.GetAllLichSuThaoTacTheoNam(dtpNam.Text);
            foreach (var tt in lichSuThaoTac)
            {
                int rowAdd = dgvLichSuThaoTac.Rows.Add();
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
            if(dtpNgay.Checked)
                lichSuThaoTacTimKiem = lichSuThaoTacBUS.LichSuThaoTacTimKiemNgay(dtpNgay.Text,timKiem);
            if(dtpThang.Checked)
                lichSuThaoTacTimKiem = lichSuThaoTacBUS.LichSuThaoTacTimKiemThang(dtpThang.Text, timKiem);
            if(dtpNam.Checked)
                lichSuThaoTacTimKiem = lichSuThaoTacBUS.LichSuThaoTacTimKiemNam(dtpNam.Text, timKiem);
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
        /////////////////////////////////////////////////////////////////////////////////////////    
        private void CheckChangeNgay(object sender, EventArgs e)
        {
            if (Check(dtpNgay))
                return;
            if (dtpNgay.Checked)
            {
                dtpThang.Checked = false;
                dtpNam.Checked = false;
                txtTimKiem.Text = string.Empty;
                LoadLichSuThaoTac();
            }
            LoadLichSuThaoTac();
        }
        private void CheckThangChange(object sender, EventArgs e)
        {
            if (Check(dtpThang))
                return;
            if (dtpThang.Checked)
            {
                dtpNgay.Checked = false;
                dtpNam.Checked = false;
                txtTimKiem.Text = string.Empty;
                LoadLichSuThaoTac();
            }
        }
        private void CheckChangeNam(object sender, EventArgs e)
        {
            if (Check(dtpNam))
                return;
            if (dtpNam.Checked)
            {
                dtpNgay.Checked = false;
                dtpThang.Checked = false;
                txtTimKiem.Text = string.Empty;
                LoadLichSuThaoTac();                
            }
        }
        public bool Check(DateTimePicker dtp)
        {
            if (!dtpNgay.Checked && !dtpThang.Checked && !dtpNam.Checked)
            {
                dtp.Checked = true;                
                return true;
            }            
            return false;
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
                LoadLichSuThaoTacTimKiem(txtTimKiem.Text);            
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        
    }
}
