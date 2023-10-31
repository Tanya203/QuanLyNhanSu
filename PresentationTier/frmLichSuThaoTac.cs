using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
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
        private int check;
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
            check = 0; 
            this.maNV = maNV;
        }
        private void frmLichSuThaoTac_Load(object sender, EventArgs e)
        {
            rbDate.Checked = true;
            rbAllInterface.Checked = true;
            rbAllOperation.Checked = true;
            dtpMonth.Enabled = false;
            dtpYear.Enabled = false;
            cmbInterface.Enabled = false;
            cmbOperation.Enabled = false;
            thoiGian = dtpDate.Text;
            giaoDien = null;
            thaoTac = null;
            LoadThongTinDangNhap();
            LoadGiaoDien();
            LoadThaoTac();
        }
        private void LoadThongTinDangNhap()
        {
            lblStaffIDLoginValue.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblFullNameLoginValue.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblFullNameLoginValue.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblDepartmentLoginValue.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblPositionLoginValue.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadGiaoDien()
        { 
            cmbInterface.ValueMember = "MaGD";
            cmbInterface.DisplayMember = "TenGiaoDien";
            cmbInterface.DataSource = giaoDienBUS.GetGiaoDiens();
            AutoAdjustComboBox(cmbInterface);
        }
        private void LoadThaoTac()
        {
            cmbOperation.ValueMember = "MaTT";
            cmbOperation.DisplayMember = "TenThaoTac";
            if(rbSortInterface.Checked)
                cmbOperation.DataSource = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == cmbInterface.SelectedValue.ToString()).ToList();
            if(rbAllInterface.Checked)
                cmbOperation.DataSource = thaoTacBUS.GetThaoTac();
            AutoAdjustComboBox(cmbOperation);
        }
        private void LoadLichSuThaoTac()
        {
            Enabled = false;
            dgvOperateHistory.Rows.Clear();
            lichSuThaoTac = lichSuThaoTacBUS.GetLichSuThaoTac(thoiGian, giaoDien, thaoTac);
            foreach (var tt in lichSuThaoTac)
            {
                int rowAdd = dgvOperateHistory.Rows.Add();
                string maNV = tt.MaNV;
                if (maNV == null)
                    maNV = "Đã xoá";
                else
                    maNV = tt.MaNV;
                dgvOperateHistory.Rows[rowAdd].Cells[0].Value = tt.NgayGio;
                dgvOperateHistory.Rows[rowAdd].Cells[1].Value = maNV;
                dgvOperateHistory.Rows[rowAdd].Cells[2].Value = tt.HoTen;
                dgvOperateHistory.Rows[rowAdd].Cells[3].Value = tt.PhongBan;
                dgvOperateHistory.Rows[rowAdd].Cells[4].Value = tt.ChucVu;
                dgvOperateHistory.Rows[rowAdd].Cells[5].Value = tt.GiaoDien;
                dgvOperateHistory.Rows[rowAdd].Cells[6].Value = tt.ThaoTac;
                dgvOperateHistory.Rows[rowAdd].Cells[7].Value = tt.ThaoTacThucHien;
            }
            Enabled = true;
        }
        private void LoadLichSuThaoTacTimKiem(string timKiem)
        {
            Enabled = false;
            dgvOperateHistory.Rows.Clear();
            lichSuThaoTacTimKiem = lichSuThaoTacBUS.LichSuThaoTacTimKiem(thoiGian, giaoDien, thaoTac, timKiem);
            int rowAdd;
            foreach (var tt in lichSuThaoTacTimKiem)
            {
                rowAdd = dgvOperateHistory.Rows.Add();
                string maNV = tt.MaNV;
                if (maNV == null)
                    maNV = "Đã xoá";
                else
                    maNV = tt.MaNV;
                dgvOperateHistory.Rows[rowAdd].Cells[0].Value = tt.NgayGio;
                dgvOperateHistory.Rows[rowAdd].Cells[1].Value = maNV;
                dgvOperateHistory.Rows[rowAdd].Cells[2].Value = tt.HoTen;
                dgvOperateHistory.Rows[rowAdd].Cells[3].Value = tt.PhongBan;
                dgvOperateHistory.Rows[rowAdd].Cells[4].Value = tt.ChucVu;
                dgvOperateHistory.Rows[rowAdd].Cells[5].Value = tt.GiaoDien;
                dgvOperateHistory.Rows[rowAdd].Cells[6].Value = tt.ThaoTac;
                dgvOperateHistory.Rows[rowAdd].Cells[7].Value = tt.ThaoTacThucHien;
            }
            Enabled = true;
        }
        private void AutoAdjustComboBox(ComboBox comboBox)
        {
            int maxWidth = 0;
            foreach (var items in comboBox.Items)
            {
                int itemWidth = TextRenderer.MeasureText(comboBox.GetItemText(items), comboBox.Font).Width;
                maxWidth = Math.Max(maxWidth, itemWidth);
            }
            comboBox.DropDownWidth = maxWidth + SystemInformation.VerticalScrollBarWidth;
        }
        /////////////////////////////////////////////////////////////////////////////////////////    
        private void rbDate_CheckedChanged(object sender, EventArgs e)
        {
            if (rbDate.Checked)
            {
                thoiGian = dtpDate.Text;
                dtpDate.Enabled = true;
                dtpMonth.Enabled = false;
                dtpYear.Enabled = false;
                LoadLichSuThaoTac();
            }
        }
        private void rbMonth_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMonth.Checked)
            {
                thoiGian = dtpMonth.Text;
                dtpMonth.Enabled = true;
                dtpDate.Enabled = false;
                dtpYear.Enabled = false;
                LoadLichSuThaoTac();                
            }
        }
        private void rbYear_CheckedChanged(object sender, EventArgs e)
        {
            if (rbYear.Checked)
            {
                thoiGian = dtpYear.Text;
                dtpYear.Enabled = true;
                dtpMonth.Enabled = false;
                dtpDate.Enabled = false;
                LoadLichSuThaoTac();
            }
        }
        private void rbAllInterface_Click(object sender, EventArgs e)
        {   
            if (rbAllInterface.Checked)
            {
                giaoDien = null;                
                cmbInterface.Enabled = false;
                LoadThaoTac();                
            }
        }
        private void rbSortInterface_CheckedChanged(object sender, EventArgs e)
        {                      
            if (rbSortInterface.Checked)
            {
                cmbInterface.Enabled = true;                
                giaoDien = cmbInterface.Text;
                LoadThaoTac();
                if(!rbLSortOperation.Checked)
                    LoadLichSuThaoTac();
            }
        }
        private void rbAllOperation_Click(object sender, EventArgs e)
        {
            if (rbAllOperation.Checked)
            {
                thaoTac = null;
                cmbOperation.Enabled = false;
                LoadLichSuThaoTac();
            }
        }        
        private void rbSortOperation_CheckedChanged(object sender, EventArgs e)
        {
            if (rbLSortOperation.Checked)
            {                
                cmbOperation.Enabled = true;
                thaoTac = cmbOperation.Text;
                LoadLichSuThaoTac();
            }
        }
        private void dtpDate_ValueChanged(object sender, EventArgs e)
        {
            thoiGian = dtpDate.Text;
            LoadLichSuThaoTac();
        }
        private void dtpMonth_ValueChanged(object sender, EventArgs e)
        {
            thoiGian = dtpMonth.Text;
            LoadLichSuThaoTac();
        }
        private void dtpYear_ValueChanged(object sender, EventArgs e)
        {
            thoiGian = dtpYear.Text;
            LoadLichSuThaoTac();
        }
        private void cmbInterface_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (check == 0)
            {
                check++;
                return;
            }            
            if (rbSortInterface.Checked)
            {
                giaoDien = cmbInterface.Text;
                LoadThaoTac();
                if(!rbLSortOperation.Checked)
                    LoadLichSuThaoTac();
                return;
            }                
            LoadLichSuThaoTac();
        }
        private void cmbOperation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (check == 1)
            {
                check++;
                return;
            }
            if (rbLSortOperation.Checked)
            {
                thaoTac = cmbOperation.Text;
                LoadLichSuThaoTac();
            }            
        }
        /////////////////////////////////////////////////////////////////////////////////////////        
        private void Reload()
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
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void txtSearchTextChanged(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtSearch.Text))
                LoadLichSuThaoTac();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLichSuThaoTacTimKiem(txtSearch.Text);            
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
