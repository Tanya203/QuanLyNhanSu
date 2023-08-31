using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyLoaiCa : Form
    {
        private readonly QuanLyLoaiCaBUS loaiCaBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<LoaiCaViewModels> danhSachLoaiCa;
        private IEnumerable<LoaiCaViewModels> danhSachLoaiCaTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiCa(string maNV)
        {
            InitializeComponent();
            loaiCaBUS = new QuanLyLoaiCaBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            txtMaLC.ReadOnly = true;           
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyLoaiCa_Load(object sender, EventArgs e)
        {
            LoadLoaiCa();
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
        private void LoadLoaiCa()
        {
            Enabled = false;
            dgvThongTinLoaiCa.Rows.Clear();
            danhSachLoaiCa = loaiCaBUS.GetAllLoaiCa();
            int rowAdd;
            foreach (var lc in danhSachLoaiCa)
            {
                rowAdd = dgvThongTinLoaiCa.Rows.Add();
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[0].Value = lc.MaLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[1].Value = lc.TenLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[2].Value = lc.HeSoLuong;
            }
            Enabled = true;
        }
        private void LoadLoaiCaTimKiem(string timKiem)
        {            
            Enabled = false;
            dgvThongTinLoaiCa.Rows.Clear();
            danhSachLoaiCaTimKiem = loaiCaBUS.SearchLoaiCa(timKiem);
            int rowAdd;
            foreach (var lc in danhSachLoaiCaTimKiem)
            {
                rowAdd = dgvThongTinLoaiCa.Rows.Add();
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[0].Value = lc.MaLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[1].Value = lc.TenLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[2].Value = lc.HeSoLuong;
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaLC.Text = string.Empty;
            txtTenLC.Text = string.Empty;
            txtHeSoLuong.Text = string.Empty;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        public void Reload()
        {
            FrmQuanLyLoaiCa frmOpen = new FrmQuanLyLoaiCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaLC.Text) && string.IsNullOrEmpty(txtTenLC.Text) && string.IsNullOrEmpty(txtHeSoLuong.Text) ||
                string.IsNullOrEmpty(txtTenLC.Text) && string.IsNullOrEmpty(txtHeSoLuong.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrEmpty(txtMaLC.Text) && !string.IsNullOrEmpty(txtTenLC.Text) && !string.IsNullOrEmpty(txtHeSoLuong.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrEmpty(txtMaLC.Text) && !string.IsNullOrEmpty(txtTenLC.Text) && !string.IsNullOrEmpty(txtHeSoLuong.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        private void txtHeSoLuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
            {
                e.Handled = true;
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            LoaiCa loaiCa = loaiCaBUS.GetLoaiCa().FirstOrDefault(lc => lc.MaLC == txtMaLC.Text);
            string tenLoaiCa = txtTenLC.Text;
            string heSoLuong = txtHeSoLuong.Text;
            if (tenLoaiCa != loaiCa.TenLoaiCa)
                changes.Add($"- Tên loại ca: {loaiCa.TenLoaiCa} -> Tên loại ca: {tenLoaiCa}");
            if (decimal.Parse(txtHeSoLuong.Text) != loaiCa.HeSoLuong)
                changes.Add($"- Hệ số lương: {loaiCa.HeSoLuong} -> Hệ số lương: {heSoLuong}");
            return string.Join("\n", changes);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiCa newLoaiCa = new LoaiCa
            {
                MaLC = "",
                TenLoaiCa = txtTenLC.Text,
                HeSoLuong = decimal.Parse(txtHeSoLuong.Text)
            };
            if (loaiCaBUS.Save(newLoaiCa))
            {
                string loaiCa = txtTenLC.Text;
                decimal heSoLuong = decimal.Parse(txtHeSoLuong.Text);
                string thaoTac = $"Thêm loại ca {loaiCa}\n - Hệ số lương: {heSoLuong}";
                LichSuThaoTac(thaoTac);
            }
            Reload();          
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            LoaiCa newLoaiCa = new LoaiCa
            {
                MaLC = txtMaLC.Text,
                TenLoaiCa = txtTenLC.Text,
                HeSoLuong = decimal.Parse(txtHeSoLuong.Text)
            };
            if (loaiCaBUS.Save(newLoaiCa))
            {
                string thaoTac = $"Sửa loại ca {txtMaLC.Text}";                
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += ":\n" + chiTietSua;
                LichSuThaoTac(thaoTac);
                Reload();
            }
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiCa loaiCa = new LoaiCa
            {
                MaLC = txtMaLC.Text                
            };
            if (loaiCaBUS.Delete(loaiCa))
            {
                string tenLoaiCa = txtTenLC.Text;
                string heSoLuong = txtHeSoLuong.Text;
                string thaoTac = $"Xoá loại ca {tenLoaiCa}\n    - Hệ số lương: {heSoLuong}";
                LichSuThaoTac(thaoTac);
                Reload();
            }
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmQuanLyCa frmOpen = new FrmQuanLyCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinLoaiCa_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLC.Text = dgvThongTinLoaiCa.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLC.Text = dgvThongTinLoaiCa.Rows[rowIndex].Cells[1].Value.ToString();
            txtHeSoLuong.Text = dgvThongTinLoaiCa.Rows[rowIndex].Cells[2].Value.ToString();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }       
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))            
                LoadLoaiCa();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiCaTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
