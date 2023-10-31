using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhieu : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly PhieuBUS phieuBus;
        private readonly ChiTietPhieuBUS chiTietPhieuBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly QuanLyLoaiPhieuBUS quanLyLoaiPhieuBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<PhieuViewModels> danhSachPhieuThuong;
        private IEnumerable<PhieuViewModels> danhSachPhieuThuongTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyPhieu(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phieuBus = new PhieuBUS();
            chiTietPhieuBUS = new ChiTietPhieuBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            quanLyLoaiPhieuBUS = new QuanLyLoaiPhieuBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý phiếu").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD  == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            checkThaoTac = false;
            this.maNV = maNV;
        }
        private void FrmPhieuThuong_Load(object sender, EventArgs e)
        {
            cmbCardType.DisplayMember = "TenLoaiPhieu";
            cmbCardType.ValueMember = "MaLP";
            LoadThongTinDangNhap();
            LoadLoaiPhieu();
            InputStatus(false);
            PhanQuyen();
            LoadPhieu();
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
                if(qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    checkThaoTac = true;
                    InputStatus(true);
                    continue;
                }
                else if (qh.QuyenHan.TenQuyenHan.Contains("Truy cập chi tiết phiếu") && qh.CapQuyen)
                {
                    ChiTietPhieuButton();
                    continue;
                }
                else if (qh.QuyenHan.TenQuyenHan.Contains("Truy cập quản lý loại phiếu") && qh.CapQuyen)
                {
                    btnCardType.Visible = true;
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<ComboBox> listComboBox = new List<ComboBox> { cmbCardType};
            for(int i = 0; i < listComboBox.Count; i++)
            {
                typeof(Button).GetProperty("Enabled").SetValue(listComboBox[i], value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButton = new List<Button> { btnAdd , btnCardType};
            if (value)
                XoaButton();
            for(int i = 0; i <  listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                if (listButton[i] == btnCardType)
                    typeof(Button).GetProperty("Visible").SetValue(listButton[i], false);
            }
        }
        private void LoadPhieu()
        {
            Enabled = false;
            dgvCard.Rows.Clear();
            danhSachPhieuThuong = phieuBus.GetAllPhieu();
            int rowAdd;
            foreach(var pt in danhSachPhieuThuong)
            {
                rowAdd = dgvCard.Rows.Add();
                dgvCard.Rows[rowAdd].Cells[0].Value = pt.MaP;
                dgvCard.Rows[rowAdd].Cells[1].Value = pt.TenLoaiPhieu;
                dgvCard.Rows[rowAdd].Cells[2].Value = pt.MaNV;
                dgvCard.Rows[rowAdd].Cells[3].Value = pt.HoTen;
                dgvCard.Rows[rowAdd].Cells[4].Value = pt.PhongBan;
                dgvCard.Rows[rowAdd].Cells[5].Value = pt.ChucVu;
                dgvCard.Rows[rowAdd].Cells[6].Value = pt.NgayLap.ToString(formatDate);
                dgvCard.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhieuBUS.TongTienPhieu(pt.MaP));
            }
            Enabled = true;
        }
        private void LoadLoaiPhieu()
        {
            cmbCardType.DataSource = quanLyLoaiPhieuBUS.GetLoaiPhieu();
            AutoAdjustComboBox(cmbCardType);
        }
        private void LoadPhieuTimKiem(string timKiem)
        {
            Enabled = false;
            dgvCard.Rows.Clear();
            danhSachPhieuThuongTimKiem = phieuBus.SearchPhieu(timKiem);
            int rowAdd;
            foreach (var pt in danhSachPhieuThuongTimKiem)
            {
                rowAdd = dgvCard.Rows.Add();
                dgvCard.Rows[rowAdd].Cells[0].Value = pt.MaP;
                dgvCard.Rows[rowAdd].Cells[1].Value = pt.TenLoaiPhieu;
                dgvCard.Rows[rowAdd].Cells[2].Value = pt.MaNV;
                dgvCard.Rows[rowAdd].Cells[3].Value = pt.HoTen;
                dgvCard.Rows[rowAdd].Cells[4].Value = pt.PhongBan;
                dgvCard.Rows[rowAdd].Cells[5].Value = pt.ChucVu;
                dgvCard.Rows[rowAdd].Cells[6].Value = pt.NgayLap.ToString(formatDate);
                dgvCard.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhieuBUS.TongTienPhieu(pt.MaP));                
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
        //////////////////////////////////////////////////////////////////////////////
        private void ChiTietPhieuButton()
        {
            DataGridViewButtonColumn btnChiTiet = new DataGridViewButtonColumn();
            {                           
                btnChiTiet.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;                
                btnChiTiet.Text = "Chi tiết";
                btnChiTiet.UseColumnTextForButtonValue = true;
                btnChiTiet.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnChiTiet.DefaultCellStyle = buttonCellStyle;
                dgvCard.Columns.Add(btnChiTiet);                 
            }
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
                dgvCard.Columns.Add(btnXoa);
            }
        }
        private void OpenChiTietPhieu(string maNV, string maPT)
        {
            FrmChiTietPhieu frmOpen = new FrmChiTietPhieu(maNV,maPT);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void XoaPhieu(string maP, string loaiPhieu, string ngayLap)
        {
            try
            {
                string maLoaiPhieu = phieuBus.GetPhieu().FirstOrDefault(p => p.MaP == maP).MaLP;
                List<ChiTietPhieu> listChiTietPhieu = chiTietPhieuBUS.GetChiTietPhieu().Where(ctp => ctp.MaP == maP).ToList();
                List<NhanVien> listNhanVien = new List<NhanVien>();
                Phieu phieu = new Phieu()
                {
                    MaP = maP,
                };
                if (phieuBus.Delete(phieu))
                {
                    string thaoTac = $"Xoá {loaiPhieu} được lập ngày {ngayLap}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    if (maLoaiPhieu == "LP0000000003")
                    {
                        foreach (ChiTietPhieu nv in listChiTietPhieu)
                        {
                            nv.NhanVien.SoTienNo -= nv.SoTien;
                            listNhanVien.Add(nv.NhanVien);
                        }
                        nhanVienBUS.CapNhatSoTienNo(listNhanVien);
                    }
                    Reload();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
            
        }
        //////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadPhieu();
        }
        //////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac, string maTT)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private void ErrorMessage(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
                MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Phieu newPhieu = new Phieu
                {
                    MaP = "",
                    MaLP = cmbCardType.SelectedValue.ToString(),
                    MaNV = maNV,
                    NgayLap = DateTime.Now,
                };
                if (phieuBus.Save(newPhieu))
                {
                    string thaoTac = $"Thêm {cmbCardType.Text}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                }
                Reload();
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
                        
        }       
        private void dgvCard_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;            
            if (rowIndex < 0)
                return;
            string maP = dgvCard.Rows[rowIndex].Cells[0].Value.ToString();
            string loaiPhieu = dgvCard.Rows[rowIndex].Cells[1].Value.ToString();
            string ngayLap = dgvCard.Rows[rowIndex].Cells[6].Value.ToString();
            if (checkThaoTac)
            {
                if (e.ColumnIndex == 8)
                    XoaPhieu(maP, loaiPhieu, ngayLap);
                if (e.ColumnIndex == 9)
                    OpenChiTietPhieu(maNV, maP);
            }
            else
            {
                if (e.ColumnIndex == 8)
                    OpenChiTietPhieu(maNV, maP);
            }
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadPhieuTimKiem(txtSearch.Text);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnCardType_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiPhieu frmOpen = new FrmQuanLyLoaiPhieu(maNV);
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
