using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmLichSuThaoTac : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private IEnumerable<LichSuThaoTacViewModels> lichSuThaoTac;
        private IEnumerable<LichSuThaoTacViewModels> lichSuThaoTacTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        private string thoiGian;
        private string giaoDien;
        private string thaoTac;
        public FrmLichSuThaoTac(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);   
            this.maNV = maNV;
        }
        private void frmLichSuThaoTac_Load(object sender, EventArgs e)
        {
            rbNgay.Checked = true;
            rbToanBoGiaoDien.Checked = true;
            rbToanBoThaoTac.Checked = true;
            dtpThang.Enabled = false;
            dtpNam.Enabled = false;
            cmbGiaoDien.Enabled = false;
            cmbThaoTac.Enabled = false;
            thoiGian = dtpNgay.Text;
            giaoDien = null;
            thaoTac = null;
            LoadThongTinDangNhap();     
        }
        public void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadGiaoDien()
        { 
            cmbGiaoDien.ValueMember = "MaGD";
            cmbGiaoDien.DisplayMember = "TenGiaoDien";
            cmbGiaoDien.
            cmbGiaoDien.DataSource = giaoDienBUS.GetGiaoDiens();
        }
        private void LoadThaoTac()
        {
            cmbThaoTac.ValueMember = "MaTT";
            cmbThaoTac.DisplayMember = "TenThaoTac";
            if(rbLocTheoGiaoDien.Checked)
                cmbThaoTac.DataSource = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == cmbGiaoDien.SelectedValue.ToString()).ToList();
            if(rbToanBoGiaoDien.Checked)
                cmbThaoTac.DataSource = thaoTacBUS.GetThaoTac();
        }
        public void LoadLichSuThaoTac()
        {
            Enabled = false;
            dgvLichSuThaoTac.Rows.Clear();
            lichSuThaoTac = lichSuThaoTacBUS.GetLichSuThaoTac(thoiGian, giaoDien, thaoTac);
            foreach (var tt in lichSuThaoTac)
            {
                int rowAdd = dgvLichSuThaoTac.Rows.Add();
                string maNV = tt.MaNV;
                if (maNV == null)
                    maNV = "Đã xoá";
                else
                    maNV = tt.MaNV;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[0].Value = tt.NgayGio;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[1].Value = maNV;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[2].Value = tt.HoTen;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[3].Value = tt.PhongBan;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[4].Value = tt.ChucVu;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[5].Value = tt.GiaoDien;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[6].Value = tt.ThaoTac;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[7].Value = tt.ThaoTacThucHien;
            }
            Enabled = true;
            return;
        }
        public void LoadLichSuThaoTacTimKiem(string timKiem)
        {
            Enabled = false;
            dgvLichSuThaoTac.Rows.Clear();
            lichSuThaoTacTimKiem = lichSuThaoTacBUS.LichSuThaoTacTimKiem(thoiGian, giaoDien, thaoTac, timKiem);
            int rowAdd;
            foreach (var tt in lichSuThaoTacTimKiem)
            {
                rowAdd = dgvLichSuThaoTac.Rows.Add();
                string maNV = tt.MaNV;
                if (maNV == null)
                    maNV = "Đã xoá";
                else
                    maNV = tt.MaNV;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[0].Value = tt.NgayGio;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[1].Value = maNV;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[2].Value = tt.HoTen;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[3].Value = tt.PhongBan;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[4].Value = tt.ChucVu;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[5].Value = tt.GiaoDien;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[6].Value = tt.ThaoTac;
                dgvLichSuThaoTac.Rows[rowAdd].Cells[7].Value = tt.ThaoTacThucHien;
            }
            Enabled = true;
        }
        /////////////////////////////////////////////////////////////////////////////////////////    
        private void rbNgay_CheckedChanged(object sender, EventArgs e)
        {
            if (rbNgay.Checked)
            {
                thoiGian = dtpNgay.Text;
                dtpNgay.Enabled = true;
                dtpThang.Enabled = false;
                dtpNam.Enabled = false;
                LoadLichSuThaoTac();
            }
        }
        private void rbThang_CheckedChanged(object sender, EventArgs e)
        {
            if (rbThang.Checked)
            {
                thoiGian = dtpThang.Text;
                dtpThang.Enabled = true;
                dtpNgay.Enabled = false;
                dtpNam.Enabled = false;
                LoadLichSuThaoTac();                
            }
        }
        private void rbNam_CheckedChanged(object sender, EventArgs e)
        {
            if (rbNam.Checked)
            {
                thoiGian = dtpNam.Text;
                dtpNam.Enabled = true;
                dtpThang.Enabled = false;
                dtpNgay.Enabled = false;
                LoadLichSuThaoTac();
            }
        }
        private void rbToanBoGiaoDien_Click(object sender, EventArgs e)
        {
            if (rbToanBoGiaoDien.Checked)
            {
                giaoDien = null;
                //cmbGiaoDien.DataSource = null;
                cmbGiaoDien.Enabled = false;
                LoadThaoTac();
                LoadLichSuThaoTac();
            }
        }
        private void rbLocTheoGiaoDien_CheckedChanged(object sender, EventArgs e)
        {
            if(cmbGiaoDien.DataSource == null)
                LoadGiaoDien();            
            if (rbLocTheoGiaoDien.Checked)
            {
                cmbGiaoDien.Enabled = true;                
                giaoDien = cmbGiaoDien.Text;
                LoadThaoTac();
                LoadLichSuThaoTac();
            }
        }
        private void rbToanBoThaoTac_Click(object sender, EventArgs e)
        {
            if (rbToanBoThaoTac.Checked)
            {
                thaoTac = null;
                //cmbThaoTac.DataSource = null;
                cmbThaoTac.Enabled = false;
                LoadLichSuThaoTac();
            }
        }        
        private void rbLocTheoThaoTac_CheckedChanged(object sender, EventArgs e)
        {
            if(cmbThaoTac.DataSource == null)
                LoadThaoTac();
            if (rbLocTheoThaoTac.Checked)
            {                
                cmbThaoTac.Enabled = true;
                thaoTac = cmbThaoTac.Text;
                LoadLichSuThaoTac();
            }
        }
        private void dtpNgay_ValueChanged(object sender, EventArgs e)
        {
            thoiGian = dtpNgay.Text;
            LoadLichSuThaoTac();
        }
        private void dtpThang_ValueChanged(object sender, EventArgs e)
        {
            thoiGian = dtpThang.Text;
            LoadLichSuThaoTac();
        }
        private void dtpNam_ValueChanged(object sender, EventArgs e)
        {
            thoiGian = dtpNam.Text;
            LoadLichSuThaoTac();
        }
        private void cmbGiaoDien_SelectedIndexChanged(object sender, EventArgs e)
        {
            giaoDien = cmbGiaoDien.Text;
            if (rbLocTheoThaoTac.Checked)
            {
                LoadThaoTac();
                return;
            }                
            LoadLichSuThaoTac();
        }
        private void cmbThaoTac_SelectedIndexChanged(object sender, EventArgs e)
        {
            thaoTac = cmbThaoTac.Text;
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
                LoadLichSuThaoTacTimKiem(txtTimKiem.Text);            
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        
    }
}
