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
        private readonly PhanQuyenBUS phanQuyenBUS;
        private readonly NhanVien nv;
        private readonly PhuCap phuCap;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachchiTietPhuCap;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachchiTietPhuCapTimKiem;
        private readonly IEnumerable<ChiTietPhuCap> chiTietPhuCap;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly string maNV;
        private readonly string maPC;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
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
            phanQuyenBUS = new PhanQuyenBUS();
            this.maPC = maPC;
            this.maNV = maNV;
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(dg => dg.TenGiaoDien == "Chi tiết phụ cấp").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            checkThaoTac = false;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            phuCap = phuCapBUS.GetPhuCap().FirstOrDefault(pc => pc.MaPC == maPC);
            chiTietPhuCap = chiTietPhuCapBUS.GetChiTIetPhuCap().Where(pc => pc.MaPC == maPC).ToList();
        }

        private void FrmChiTietPhuCap_Load(object sender, EventArgs e)
        {
            cmbDepartment.DisplayMember = "TenPhongBan";
            cmbDepartment.ValueMember = "MaPB";
            cmbPosition.DisplayMember = "TenChucVu";
            cmbPosition.ValueMember = "MaCV";
            cmbStaffID.DisplayMember = "MaNV";
            cmbStaffID.ValueMember = "MaNV";            
            LoadThongTinDangNhap();
            LoadThongTinPhuCap();
            DisableTextBox();
            InputStatus(false);
            PhanQuyen();
            if (checkThaoTac)
            {
                LoadPhongBan();
                LoadChucVuTheoPhongBan(cmbDepartment.SelectedValue.ToString());
                LoadNhanVienTheoChucVu(cmbPosition.SelectedValue.ToString());
            }            
            LoadThongTinChiTietMotPhuCap();
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
        private void PhanQuyen()
        {
            foreach(PhanQuyen qh in phanQuyen)
            {
                if (qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    InputStatus(true);
                    checkThaoTac = true;
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<ComboBox> listComboBox = new List<ComboBox> { cmbPosition, cmbStaffID, cmbDepartment};
            for(int i = 0; i < listComboBox.Count; i++)
            {
                typeof(ComboBox).GetProperty("Enabled").SetValue(listComboBox[i], value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButton = new List<Button> { btnAdd};
            if (value)
                XoaButton();
            for(int i = 0; i < listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                typeof(Button).GetProperty("Enabled").SetValue(listButton[i], false);
            }
        }
        private void DisableTextBox()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceID, txtAllowamceName, txtAmount, txtStaffAmount, txtTotalAmount, txtFullName};
            for(int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i],true);
            }
        }
        private void LoadThongTinPhuCap()
        {
            txtAllowanceID.Text = maPC;
            txtAllowamceName.Text = phuCap.TenPhuCap;
            txtAmount.Text = String.Format(fVND, "{0:N3} ₫", phuCap.TienPhuCap);
            txtStaffAmount.Text = chiTietPhuCapBUS.TongSoNhanVienTrongPhuCap(maPC).ToString();
            txtTotalAmount.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongTienMotPhuCap(maPC)); 
        }
        private void LoadPhongBan()
        {
            cmbDepartment.DataSource = phongBanBUS.GetPhongBan();
            AutoAdjustComboBox(cmbDepartment);
        }
        private void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbPosition.DataSource = chucVuBUS.GetChucVu().Where(cv => cv.MaPB == maPB).ToList();
            AutoAdjustComboBox(cmbPosition);
        }
        private void LoadNhanVienTheoChucVu(string maCV)
        {
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVien().Where(nv => nv.MaCV == maCV).ToList();
            foreach (var pt in chiTietPhuCap)
                nhanVienList = nhanVienList.Where(nv => nv.MaNV != pt.MaNV).ToList();
            cmbStaffID.DataSource = nhanVienList;
            if (string.IsNullOrEmpty(cmbStaffID.Text))
            {
                cmbStaffID.Enabled = false;
                txtFullName.Text = string.Empty;
            }
            else
                cmbStaffID.Enabled = true;
            AutoAdjustComboBox(cmbStaffID);
        }
        private void cmbPositionSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbPosition.SelectedValue.ToString());
        }

        private void cmbDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbDepartment.SelectedValue.ToString());
        }
        private void cmbStaffID_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbPosition.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbStaffID.Text))
            {
                btnAdd.Enabled = false;
                txtFullName.Text = string.Empty;
            }
            else
            {
                btnAdd.Enabled = true;
                NhanVien nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nhanVien => nhanVien.MaNV == cmbStaffID.Text);
                txtFullName.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            }                
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
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
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
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
            dgvAllowanceDetail.Rows.Clear();
            danhSachchiTietPhuCap = chiTietPhuCapBUS.GetAllChiTietPhuCap(maPC);
            int row;
            foreach(ChiTietPhuCapViewModels nv in danhSachchiTietPhuCap)
            {
                row = dgvAllowanceDetail.Rows.Add();
                dgvAllowanceDetail.Rows[row].Cells[0].Value = nv.MaPC;
                dgvAllowanceDetail.Rows[row].Cells[1].Value = nv.MaNV;
                dgvAllowanceDetail.Rows[row].Cells[2].Value = nv.HoTen;
                dgvAllowanceDetail.Rows[row].Cells[3].Value = nv.PhongBan;
                dgvAllowanceDetail.Rows[row].Cells[4].Value = nv.ChucVu;
            };
            Enabled = true;
        }
        private void LoadThongTinChiTietMotPhuCapTimKiem(string timKiem)
        {
            Enabled = false;
            dgvAllowanceDetail.Rows.Clear();
            danhSachchiTietPhuCapTimKiem = chiTietPhuCapBUS.SearchChiTietPhuCap(maPC, timKiem);
            int row;
            foreach (ChiTietPhuCapViewModels nv in danhSachchiTietPhuCapTimKiem)
            {
                row = dgvAllowanceDetail.Rows.Add();
                dgvAllowanceDetail.Rows[row].Cells[0].Value = nv.MaPC;
                dgvAllowanceDetail.Rows[row].Cells[1].Value = nv.MaNV;
                dgvAllowanceDetail.Rows[row].Cells[2].Value = nv.HoTen;
                dgvAllowanceDetail.Rows[row].Cells[3].Value = nv.PhongBan;
                dgvAllowanceDetail.Rows[row].Cells[4].Value = nv.ChucVu;
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
        private void btnAdd_Click(object sender, EventArgs e)
        {
            ChiTietPhuCap chiTietPhuCap = new ChiTietPhuCap
            {
                MaPC = maPC,
                MaNV = cmbStaffID.SelectedValue.ToString(),
            };
            if (chiTietPhuCapBUS.Save(chiTietPhuCap))
            {
                string thaoTac = $"Thêm phụ cấp {phuCap.TenPhuCap} cho nhân viên {cmbStaffID.SelectedValue}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            Reload();
        }
        private void XoaButton()
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
                dgvAllowanceDetail.Columns.Add(btnXoa);
            }
        }
        private void XoaNhanVien(string maNV)
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
        private void dgvCardDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            string maNV = dgvAllowanceDetail.Rows[row].Cells[1].Value.ToString();
            if (e.ColumnIndex == 5)
                XoaNhanVien(maNV);
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadThongTinChiTietMotPhuCapTimKiem(txtSearch.Text);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
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
