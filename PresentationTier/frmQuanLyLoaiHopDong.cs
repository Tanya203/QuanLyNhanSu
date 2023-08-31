using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyLoaiHopDong : Form
    {
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;  
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly HinhThucChamCongBUS hinhThucChamCongBUS;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDong;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDongTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiHopDong(string maNV)
        {
            InitializeComponent();
            this.Load += frmQuanLyLoaiHopDong_Load;
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            hinhThucChamCongBUS = new HinhThucChamCongBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            txtMaLHD.ReadOnly = true;
            txtSoLuongNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyLoaiHopDong_Load(object sender, EventArgs e)
        {
            cmbHinhThucChamCong.DisplayMember = "TenHinhThucChamCong";
            cmbHinhThucChamCong.ValueMember = "MaHTCC";
            LoadLoaiHopDong();
            LoadThongTinDangNhap();
            LoadHinhThucChamCong();
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
        private void LoadLoaiHopDong()
        {
            Enabled = false;
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDong = loaiHopDongBUS.GetAllLoaiHopDong();
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDong)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = lhd.TenHinhThucChamCong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[3].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
            Enabled = true;
        }
        private void LoadHinhThucChamCong()
        {
            cmbHinhThucChamCong.DataSource = hinhThucChamCongBUS.GetAllHinhThucChamCong();
            AutoAdjustComboBox(cmbHinhThucChamCong);
        }
        private void LoadLoaiHopDongTimKiem(string timKiem)
        {
            Enabled = false;
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDongTimKiem = loaiHopDongBUS.SearchLoaiHopDong(timKiem);           
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDongTimKiem)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = lhd.TenHinhThucChamCong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[3].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
            Enabled = true;
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaLHD.Text = string.Empty;
            txtTenLHD.Text = string.Empty;
            txtSoLuongNhanVien.Text = string.Empty;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        public void Reload()
        {
            FrmQuanLyLoaiHopDong frmOpen = new FrmQuanLyLoaiHopDong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaLHD.Text) && string.IsNullOrEmpty(txtTenLHD.Text) || string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrEmpty(txtMaLHD.Text) && !string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrEmpty(txtMaLHD.Text) && !string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
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
            LoaiHopDong lhd = loaiHopDongBUS.GetLoaiHopDong().FirstOrDefault(hd => hd.MaLHD == txtMaLHD.Text);
            string tenLoaiHopDong = txtTenLHD.Text;
            string hinhThucChamCong = cmbHinhThucChamCong.Text;
            if (tenLoaiHopDong != lhd.TenLoaiHopDong)
                changes.Add($"- Tên loại hợp đồng {lhd.TenLoaiHopDong} -> Tên loại hợp đồng: {tenLoaiHopDong}");
            if (hinhThucChamCong != lhd.HinhThucChamCong.TenHinhThucChamCong)
                changes.Add($"- Hình thức chấm công: {lhd.HinhThucChamCong.TenHinhThucChamCong} -> Hình thức chấm công: {hinhThucChamCong}");
            return string.Join("\n", changes);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = "",
                TenLoaiHopDong = txtTenLHD.Text,
                MaHTCC = cmbHinhThucChamCong.SelectedValue.ToString(),
            };
            if (loaiHopDongBUS.Save(newLoaiHopDong))
            {
                string tenLoaiHopDong = txtTenLHD.Text;
                string hinhThucChamCong = cmbHinhThucChamCong.Text;
                string thaoTac = $"Thêm loại hợp đông {tenLoaiHopDong}: \n  - Hình thức chấm công: {hinhThucChamCong}";
                LichSuThaoTac(thaoTac);
            }
            Reload();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text,
                TenLoaiHopDong = txtTenLHD.Text,
                MaHTCC = cmbHinhThucChamCong.SelectedValue.ToString(),
            };
            if (loaiHopDongBUS.Save(newLoaiHopDong))
            {
                string thaoTac = $"Sửa loại hợp đồng {txtMaLHD.Text}";                
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += $":\n{chiTietSua}";
                LichSuThaoTac(thaoTac);
                Reload();
            }            
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiHopDong loaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text
            };
            if (loaiHopDongBUS.Delete(loaiHopDong))
            {
                string tenLoaiHopDong = txtTenLHD.Text;
                string hinhThucChamCong = cmbHinhThucChamCong.Text;
                string thaoTac = $"Xoá loại hợp đồng {tenLoaiHopDong}:\n    - Hình thức chấm công: {hinhThucChamCong}";
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
        private void dgvThongTinLoaiHopDong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[1].Value.ToString();
            cmbHinhThucChamCong.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[2].Value.ToString();
            txtSoLuongNhanVien.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[3].Value.ToString();
        }           
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadLoaiHopDong();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiHopDongTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
