using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChiTietPhuCap : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyPhuCapBUS phuCapBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly NhanVien nv;
        private readonly PhuCap phuCap;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachchiTietPhuCap;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachchiTietPhuCapTimKiem;
        private readonly List<ChiTietPhuCap> chiTietPhuCap;
        private readonly List<ThaoTac> listThaoTac;
        private readonly string maNV;
        private readonly string maPC;
        private readonly string maGD;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmChiTietPhuCap(string maNV ,string maPC)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            phuCapBUS = new QuanLyPhuCapBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            this.maPC = maPC;
            this.maNV = maNV;
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(dg => dg.TenGiaoDien == "Chi tiết phụ cấp").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            phuCap = phuCapBUS.GetPhuCap().FirstOrDefault(pc => pc.MaPC == maPC);
            chiTietPhuCap = chiTietPhuCapBUS.GetChiTIetPhuCap().Where(pc => pc.MaPC == maPC).ToList();
        }

        private void FrmChiTietPhuCap_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            txtMaPC.ReadOnly = true;
            txtTenPhuCap.ReadOnly = true;
            txtTienPhuCap.ReadOnly = true;
            txtSoLuongNhanVien.ReadOnly = true;
            txtTongTien.ReadOnly = true;
            txtHoTenNV.ReadOnly = true;
            LoadThongTinDangNhap();
            LoadThongTinPhuCap();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            LoadThongTinChiTietMotPhuCap();
            XoaButton();
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
        public void LoadThongTinPhuCap()
        {
            txtMaPC.Text = maPC;
            txtTenPhuCap.Text = phuCap.TenPhuCap;
            txtTienPhuCap.Text = String.Format(fVND, "{0:N3} ₫", phuCap.TienPhuCap);
            txtSoLuongNhanVien.Text = chiTietPhuCapBUS.TongSoNhanVienTrongPhuCap(maPC).ToString();
            txtTongTien.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongTienMotPhuCap(maPC)); 
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBUS.GetPhongBan();
            AutoAdjustComboBox(cmbPhongBan);
        }
        public void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVu().Where(cv => cv.MaPB == maPB).ToList();
            AutoAdjustComboBox(cmbChucVu);
        }
        public void LoadNhanVienTheoChucVu(string maCV)
        {
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVien().Where(nv => nv.MaCV == maCV).ToList();
            foreach (var pt in chiTietPhuCap)
                nhanVienList = nhanVienList.Where(nv => nv.MaNV != pt.MaNV).ToList();
            cmbNhanVien.DataSource = nhanVienList;
            if (string.IsNullOrEmpty(cmbNhanVien.Text))
            {
                cmbNhanVien.Enabled = false;
                txtHoTenNV.Text = string.Empty;
            }
            else
                cmbNhanVien.Enabled = true;
            AutoAdjustComboBox(cmbNhanVien);
        }
        private void cmbChucVu_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
        }

        private void cmbPhongBan_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
        }
        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbNhanVien.Text))
            {
                btnThem.Enabled = false;
                txtHoTenNV.Text = string.Empty;
            }
            else
            {
                btnThem.Enabled = true;
                NhanVien nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nhanVien => nhanVien.MaNV == cmbNhanVien.Text);
                txtHoTenNV.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            }
                
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        public void Reload()
        {
            FrmChiTietPhuCap frmOpen = new FrmChiTietPhuCap(maNV, maPC);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void LoadThongTinChiTietMotPhuCap()
        {
            Enabled = false;
            dgvChiTietMotPhuCap.Rows.Clear();
            danhSachchiTietPhuCap = chiTietPhuCapBUS.GetAllChiTietPhuCap(maPC);
            int row;
            foreach(ChiTietPhuCapViewModels nv in danhSachchiTietPhuCap)
            {
                row = dgvChiTietMotPhuCap.Rows.Add();
                dgvChiTietMotPhuCap.Rows[row].Cells[0].Value = nv.MaPC;
                dgvChiTietMotPhuCap.Rows[row].Cells[1].Value = nv.MaNV;
                dgvChiTietMotPhuCap.Rows[row].Cells[2].Value = nv.HoTen;
                dgvChiTietMotPhuCap.Rows[row].Cells[3].Value = nv.PhongBan;
                dgvChiTietMotPhuCap.Rows[row].Cells[4].Value = nv.ChucVu;
            };
            Enabled = true;
        }
        private void LoadThongTinChiTietMotPhuCapTimKiem(string timKiem)
        {
            Enabled = false;
            dgvChiTietMotPhuCap.Rows.Clear();
            danhSachchiTietPhuCapTimKiem = chiTietPhuCapBUS.SearchChiTietPhuCap(maPC, timKiem);
            int row;
            foreach (ChiTietPhuCapViewModels nv in danhSachchiTietPhuCapTimKiem)
            {
                row = dgvChiTietMotPhuCap.Rows.Add();
                dgvChiTietMotPhuCap.Rows[row].Cells[0].Value = nv.MaPC;
                dgvChiTietMotPhuCap.Rows[row].Cells[1].Value = nv.MaNV;
                dgvChiTietMotPhuCap.Rows[row].Cells[2].Value = nv.HoTen;
                dgvChiTietMotPhuCap.Rows[row].Cells[3].Value = nv.PhongBan;
                dgvChiTietMotPhuCap.Rows[row].Cells[4].Value = nv.ChucVu;
            };
            Enabled = true;
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac, string maTT)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = this.maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChiTietPhuCap chiTietPhuCap = new ChiTietPhuCap
            {
                MaPC = maPC,
                MaNV = cmbNhanVien.SelectedValue.ToString(),
            };
            if (chiTietPhuCapBUS.Save(chiTietPhuCap))
            {
                string thaoTac = $"Thêm phụ cấp {phuCap.TenPhuCap} cho nhân viên {cmbNhanVien.SelectedValue}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            Reload();
        }
        public void XoaButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Xoá";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvChiTietMotPhuCap.Columns.Add(btnXoa);
            }
        }
        public void XoaNhanVien(string maNV)
        {
            ChiTietPhuCap nv = chiTietPhuCap.FirstOrDefault(pc => pc.MaNV == maNV);
            if (chiTietPhuCapBUS.Delete(nv))
            {
                string thaoTac = $"Xoá phụ cấp {phuCap.TenPhuCap} của nhân viên {maNV}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }
        }
        private void dgvChiTietMotPhuCap_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            string maNV = dgvChiTietMotPhuCap.Rows[row].Cells[1].Value.ToString();
            if (e.ColumnIndex == 5)
                XoaNhanVien(maNV);
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadThongTinChiTietMotPhuCapTimKiem(txtTimKiem.Text);
            }
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhuCap frmOpen = new FrmQuanLyPhuCap(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        
    }
}
