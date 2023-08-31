using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyChucVu : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly NhanVien nv;
        private IEnumerable<ChucVuViewModels> danhSachChucVu;
        private IEnumerable<ChucVuViewModels> danhSachChucVuTimKiem;
        private readonly string maNV;
        private readonly string hoTen;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyChucVu(string maNV)
        {
            InitializeComponent();            
            chucVuBUS = new QuanLyChucVuBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            txtMaCV.ReadOnly = true;
            txtTongSoNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyChucVu_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            LoadPhongBan();
            LoadChucVu();
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
        private void LoadChucVu()
        {
            Enabled = false;
            dgvThongTinChucVu.Rows.Clear();
            danhSachChucVu = chucVuBUS.GetAllChucVu();
            int rowAdd;
            foreach (var cv in danhSachChucVu)
            {
                rowAdd = dgvThongTinChucVu.Rows.Add();
                dgvThongTinChucVu.Rows[rowAdd].Cells[0].Value = cv.MaCV;
                dgvThongTinChucVu.Rows[rowAdd].Cells[1].Value = cv.TenPhongBan;
                dgvThongTinChucVu.Rows[rowAdd].Cells[2].Value = cv.TenChucVu;
                dgvThongTinChucVu.Rows[rowAdd].Cells[3].Value = String.Format(fVND, "{0:N3} ₫", cv.LuongKhoiDiem);
                dgvThongTinChucVu.Rows[rowAdd].Cells[4].Value = chucVuBUS.TongSoNhanVienThuocChucVu(cv.MaCV);
            }
            Enabled = true;
        }
        private void LoadChucVuTimKiem(string timKiem)
        {    
            Enabled = false;
            dgvThongTinChucVu.Rows.Clear();
            danhSachChucVuTimKiem = chucVuBUS.SearchChucVu(timKiem);
            int rowAdd;
            foreach (var cv in danhSachChucVuTimKiem)
            {
                rowAdd = dgvThongTinChucVu.Rows.Add();
                dgvThongTinChucVu.Rows[rowAdd].Cells[0].Value = cv.MaCV;
                dgvThongTinChucVu.Rows[rowAdd].Cells[1].Value = cv.TenPhongBan;
                dgvThongTinChucVu.Rows[rowAdd].Cells[2].Value = cv.TenChucVu;
                dgvThongTinChucVu.Rows[rowAdd].Cells[3].Value = String.Format(fVND, "{0:N3} ₫", cv.LuongKhoiDiem);
                dgvThongTinChucVu.Rows[rowAdd].Cells[4].Value = chucVuBUS.TongSoNhanVienThuocChucVu(cv.MaCV);
            }
            Enabled = true;
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBUS.GetPhongBan();
            AutoAdjustComboBox(cmbPhongBan);
        }
        public void AutoAdjustComboBox(ComboBox comboBox)
        {
            int maxWidth = 0;
            foreach (var items in comboBox.Items)
            {
                int itemWidth = TextRenderer.MeasureText(comboBox.GetItemText(items), comboBox.Font).Width;
                maxWidth = Math.Max(maxWidth, itemWidth);
            }
            comboBox.DropDownWidth = maxWidth + SystemInformation.VerticalScrollBarWidth;
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaCV.Text = string.Empty;
            cmbPhongBan.SelectedIndex = 0;
            txtTenCV.Text = string.Empty;
            txtTongSoNhanVien.Text = string.Empty;
            txtLuongKhoiDiem.Text = string.Empty;
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        public void Reload()
        {
            FrmQuanLyChucVu frmOpen = new FrmQuanLyChucVu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaCV.Text) && string.IsNullOrEmpty(txtTenCV.Text) && string.IsNullOrEmpty(txtLuongKhoiDiem.Text) ||
                string.IsNullOrEmpty(txtTenCV.Text) && string.IsNullOrEmpty(txtLuongKhoiDiem.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            if (string.IsNullOrEmpty(txtMaCV.Text) && !string.IsNullOrEmpty(txtTenCV.Text) && !string.IsNullOrEmpty(txtLuongKhoiDiem.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtMaCV.Text) && !string.IsNullOrEmpty(txtTenCV.Text) && !string.IsNullOrEmpty(txtLuongKhoiDiem.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void txtLuongKhoiDiem_KeyPress(object sender, KeyPressEventArgs e)
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
        /////////////////////////////////////////////////////////////////////////////////////////////
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
            ChucVu chucVu = chucVuBUS.GetChucVu().Where(cv => cv.MaCV == txtMaCV.Text).FirstOrDefault();
            string luongKhoiDiemCu = String.Format(fVND, "{0:N3} ₫", chucVu.LuongKhoiDiem);
            string luongKhoiDiemMoi = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtLuongKhoiDiem.Text));
            if (txtTenCV.Text != chucVu.TenChucVu)
                changes.Add($"- Tên chức vụ: {chucVu.TenChucVu} -> Tên chức vụ: {txtTenCV.Text}");
            if (cmbPhongBan.ValueMember != chucVu.MaPB)
                changes.Add($"- Phòng ban: {chucVu.PhongBan.TenPhongBan} -> Phòng ban: {cmbPhongBan.Text}");
            if (luongKhoiDiemCu != luongKhoiDiemMoi)
                changes.Add($"- Lương khởi điểm: : {luongKhoiDiemCu} -> Lương khởi điểm: {luongKhoiDiemMoi}");
            return string.Join("\n", changes);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChucVu chucVu = new ChucVu
            {
                MaCV = "",
                MaPB = cmbPhongBan.SelectedValue.ToString(),
                TenChucVu = txtTenCV.Text,
                LuongKhoiDiem = decimal.Parse(txtLuongKhoiDiem.Text),
            };
            if (chucVuBUS.Save(chucVu))
            {
                string tenChucVu = txtTenCV.Text;
                string phongBan = cmbPhongBan.Text;
                string luongKhoiDiem = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtLuongKhoiDiem.Text));
                string thaoTac = $"Thêm chức vụ: {tenChucVu}\n - Phòng ban: {phongBan}\n - Lương khỏi điểm: {luongKhoiDiem}";
                LichSuThaoTac(thaoTac);
            }
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            ChucVu chucVu = new ChucVu
            {
                MaCV = txtMaCV.Text,
                MaPB = cmbPhongBan.ValueMember,
                TenChucVu = txtTenCV.Text,
                LuongKhoiDiem = decimal.Parse(txtLuongKhoiDiem.Text),
            };
            if (chucVuBUS.Save(chucVu))
            {
                string thaoTac = "Sửa chức vụ " + txtMaCV.Text;
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += ":\n" + chiTietSua;
                LichSuThaoTac(thaoTac);
                Reload();
            }                     
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            ChucVu chucVu = new ChucVu
            {
                MaCV = txtMaCV.Text                
            };
            if (chucVuBUS.Delete(chucVu))
            {
                string tenChucVu = txtTenCV.Text;
                string phongBan = cmbPhongBan.Text;
                string luongKhoiDiem = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtLuongKhoiDiem.Text));
                string thaoTac = $"Xoá chức vụ {tenChucVu}:\n - Phòng ban: {phongBan}\n - Lương khởi điểm: {luongKhoiDiem}";
                LichSuThaoTac(thaoTac);
                Reload();
            }            
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }      
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void dgvThongTinChucVu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaCV.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[0].Value.ToString();
            cmbPhongBan.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[1].Value.ToString();
            txtTenCV.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[2].Value.ToString();
            txtLuongKhoiDiem.Text = chucVuBUS.GetLuongCoBanCuaChucVu(txtMaCV.Text).ToString();
            txtTongSoNhanVien.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[4].Value.ToString();

        }       
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))            
                LoadChucVu();       
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadChucVuTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
