using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChiTietPhieu : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly PhieuBUS phieuBUS;
        private readonly ChiTietPhieuBUS chiTietPhieuBus;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<ChiTietPhieuViewModels> danhSachChiTietPhieu;
        private IEnumerable<ChiTietPhieuViewModels> danhSachChiTietPhieuTimKiem;
        private IEnumerable<ChiTietPhieu> ctp;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly Phieu phieu;
        private readonly string maNV;
        private readonly string maP;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmChiTietPhieu(string maNV, string maP)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            phieuBUS = new PhieuBUS();
            chiTietPhieuBus = new ChiTietPhieuBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý chi tiết phiếu").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD  == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            phieu = phieuBUS.GetPhieu().FirstOrDefault(p => p.MaP == maP);
            ctp = chiTietPhieuBus.GetChiTietPhieu().Where(ctp => ctp.MaP == maP);
            this.maNV = maNV;
            this.maP = maP;
            checkThaoTac = false;
        }
        private void FrmChiTietPhieuThuong_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            LoadThongTinDangNhap();
            DisableDisplay();
            LoadThongTinPhieuThuong();
            InputStatus(false);
            PhanQuyen();
            if (checkThaoTac)
            {
                LoadPhongBan();
                LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
                LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            }
            LoadChiTietPhieuThuong();           
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
        private void PhanQuyen()
        {
            foreach(PhanQuyen qh in phanQuyen)
            {
                if (qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    checkThaoTac = true;
                    InputStatus(true);
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { cmbPhongBan, cmbChucVu, cmbNhanVien, txtSoTien, rtxtGhiChu};
            for(int i = 0; i < listInput.Count; i++)
            {
                if(listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
                else if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                else if (listInput[i] is RichTextBox)
                {
                    typeof(RichTextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButton = new List<Button> { btnThem, btnSua, btnHuy};
            if (value)
                XoaButton();
            for(int i =  0; i < listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                if (value && listButton[i] != btnHuy)
                    typeof(Button).GetProperty("Enabled").SetValue(listButton[i], !value);
            }
        }
        private void DisableDisplay()
        {
            List<object> listDisplay = new List<object> { txtMaP, txtLoaiPhieu, txtHoTenTT, txtPhongBan, txtChucVu, dtpNgayLapPhieu, txtTongTien, txtMaNV_Sua, txtHoTenNV, txtMaNV };
            for(int i = 0;i < listDisplay.Count; i++)
            {
                if (listDisplay[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
                    continue;
                }
                else if (listDisplay[i] is DateTimePicker) 
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listDisplay[i], false);
                    continue;
                }
            }
        }
        private void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBUS.GetPhongBan();
            AutoAdjustComboBox(cmbPhongBan);
        }
        private void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVu().Where(cv => cv.MaPB == maPB).ToList();
            AutoAdjustComboBox(cmbChucVu);
        }
        private void LoadNhanVienTheoChucVu(string maCV)
        {
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVien().Where(nv => nv.MaCV == maCV).ToList();
            foreach (var pt in ctp)
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
        private void LoadChucVu(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbNhanVien.Text) && string.IsNullOrEmpty(txtMaNV_Sua.Text))            
                txtHoTenNV.Text = string.Empty;            
            else
                txtSoTien.Text = string.Empty;
        }
        private void LoadNhanVien(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
        }
        public void LoadThongTinPhieuThuong()
        {
            txtMaP.Text = phieu.MaP;
            txtLoaiPhieu.Text = phieu.LoaiPhieu.TenLoaiPhieu;
            txtMaNV.Text = phieu.MaNV;
            txtHoTenTT.Text = $"{phieu.NhanVien.Ho} {phieu.NhanVien.TenLot} {phieu.NhanVien.Ten}";
            txtPhongBan.Text = phieu.NhanVien.ChucVu.PhongBan.TenPhongBan;
            txtChucVu.Text = phieu.NhanVien.ChucVu.TenChucVu;
            dtpNgayLapPhieu.Text = phieu.NgayLap.ToString();
            txtTongTien.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhieuBus.TongTienPhieu(maP));
        }
        private void LoadChiTietPhieuThuong()
        {
            Enabled = false;
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieu = chiTietPhieuBus.GetAllChiTietPhieu(maP);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhieu)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = phieu.MaP;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = phieu.TenLoaiPhieu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = phieu.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = phieu.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = phieu.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = phieu.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", phieu.SoTien);
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[7].Value = phieu.GhiChu;
            }
            Enabled = true;
        }
        private void LoadChiTietPhieuThuongTimKiem(string timKiem)
        {
            Enabled = false;
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieuTimKiem = chiTietPhieuBus.SearchChiTietPhieu(maP, timKiem);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhieuTimKiem)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = phieu.MaP;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = phieu.TenLoaiPhieu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = phieu.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = phieu.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = phieu.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = phieu.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", phieu.SoTien);
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[7].Value = phieu.GhiChu;
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
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {            
            NhanVien nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nhanVien => nhanVien.MaNV == cmbNhanVien.Text);
            txtHoTenNV.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            txtMaNV_Sua.Text = string.Empty;
            txtSoTien.Text = string.Empty;
            rtxtGhiChu.Text = string.Empty;
        }
        private void EnableButton()
        {
            if (string.IsNullOrEmpty(cmbNhanVien.Text) && string.IsNullOrEmpty(txtSoTien.Text) || string.IsNullOrEmpty(txtSoTien.Text))
            {
                btnThem.Enabled = btnSua.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(cmbNhanVien.Text) && !string.IsNullOrEmpty(txtSoTien.Text) && string.IsNullOrEmpty(txtMaNV_Sua.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtMaNV_Sua.Text) && !string.IsNullOrEmpty(txtSoTien.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                return;
            }
        }
        private void BatTatBut(object sender, EventArgs e)
        {
            EnableButton();
        }
        private void dgvThongTinPhieuThuong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;            
            cmbPhongBan.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[4].Value.ToString();
            cmbChucVu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[5].Value.ToString();
            txtHoTenNV.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[3].Value.ToString();            
            txtMaNV_Sua.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[2].Value.ToString();
            txtSoTien.Text = chiTietPhieuBus.SoTienNhanVienTrongPhieu(txtMaNV_Sua.Text, txtMaP.Text).ToString();
            if (dgvThongTinPhieuThuong.Rows[rowIndex].Cells[7].Value is null)
                rtxtGhiChu.Text = string.Empty;
            else
                rtxtGhiChu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[7].Value.ToString();
            if (e.ColumnIndex == 8)            
                XoaNhanVien();                         
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtSoTien, txtHoTenNV, rtxtGhiChu, cmbPhongBan, txtMaNV_Sua};
            for(int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if(listInput[i] is RichTextBox)
                {
                    typeof(RichTextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if(listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("SelectedIndex").SetValue(listInput[i], 0);
                    continue;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////   
        private void Reload()
        {
            FrmChiTietPhieu frmOpen = new FrmChiTietPhieu(maNV,phieu.MaP);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void txtTienThuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
            {
                e.Handled = true;
            }
            if (e.KeyChar == '-' && (sender as TextBox).Text.Length > 0)
            {
                e.Handled = true;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
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
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            ChiTietPhieu nhanVien = chiTietPhieuBus.GetChiTietPhieu().FirstOrDefault(phieu => phieu.MaNV == txtMaNV_Sua.Text);
            string soTienCu = string.Format(fVND, "{0:N3} ₫", nhanVien.SoTien);
            string soTienMoi = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtSoTien.Text));
            if (soTienCu != soTienMoi)
                changes.Add($"- Số tiền: {soTienCu} -> Số tiền: {soTienMoi}");
            if (rtxtGhiChu.Text != nhanVien.GhiChu)
                changes.Add($"- Ghi chú: {nhanVien.GhiChu} -> Ghi chú: {rtxtGhiChu.Text}");  
            return string.Join("\n", changes);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
            {
                MaP = maP,                
                MaNV = cmbNhanVien.SelectedValue.ToString(),
                SoTien = decimal.Parse(txtSoTien.Text),
                GhiChu = rtxtGhiChu.Text,
            };
            if (chiTietPhieuBus.Save(newChiTietPhieu))
            {
                string soTien = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtSoTien.Text));
                string maNV = cmbNhanVien.SelectedValue.ToString();
                string thaoTac = $"Thêm nhân viên {maNV} vào {txtLoaiPhieu.Text} {maP}:\n - Số tiền: {soTien}\n - Ghi chú: {rtxtGhiChu.Text}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            if(phieu.LoaiPhieu.MaLP == "LP0000000003")
            {
                List<NhanVien> listNhanVien = new List<NhanVien>();
                NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == cmbNhanVien.SelectedValue.ToString());  
                if(nhanVien.SoTienNo == null)
                    nhanVien.SoTienNo = decimal.Parse(txtSoTien.Text);
                else
                    nhanVien.SoTienNo += decimal.Parse(txtSoTien.Text);
                listNhanVien.Add(nhanVien);
                nhanVienBUS.CapNhatSoTienNo(listNhanVien);
            }
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            decimal soTienNoCu = chiTietPhieuBus.GetChiTietPhieu().FirstOrDefault(ctp => ctp.MaP == this.phieu.MaP && ctp.MaNV == txtMaNV_Sua.Text).SoTien;
            decimal soTienNoMoi = decimal.Parse(txtSoTien.Text);
            ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
            {
                MaP = maP,
                MaNV = txtMaNV_Sua.Text,
                SoTien = decimal.Parse(txtSoTien.Text),
                GhiChu = rtxtGhiChu.Text,
            };            
            if (chiTietPhieuBus.Save(newChiTietPhieu))
            {
                string maNV = txtMaNV_Sua.Text;
                string thaoTac = $"Sửa nhân viên {maNV} trong {txtLoaiPhieu.Text} {maP}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += $":\n{chiTietSua}";
                LichSuThaoTac(thaoTac, maTT);               
                if (this.phieu.LoaiPhieu.MaLP == "LP0000000003" && soTienNoCu != soTienNoMoi)
                {
                    List<NhanVien> listNhanVien = new List<NhanVien>();
                    NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV_Sua.Text);
                    if (nhanVien.SoTienNo == soTienNoCu)
                        nhanVien.SoTienNo = soTienNoMoi;
                    else if (soTienNoCu > soTienNoMoi)
                        nhanVien.SoTienNo -= (soTienNoCu - soTienNoMoi);
                    else if (soTienNoCu < soTienNoMoi)
                        nhanVien.SoTienNo += (soTienNoMoi - soTienNoCu);
                    listNhanVien.Add(nhanVien);
                    nhanVienBUS.CapNhatSoTienNo(listNhanVien);
                }
                Reload();
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
                dgvThongTinPhieuThuong.Columns.Add(btnXoa);
            }            
        }
        public void XoaNhanVien()
        {            
            decimal soTienNo = chiTietPhieuBus.GetChiTietPhieu().FirstOrDefault(ctp => ctp.MaP == this.phieu.MaP && ctp.MaNV == txtMaNV_Sua.Text).SoTien;
            ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
            {
                MaP = txtMaP.Text,
                MaNV = txtMaNV_Sua.Text,
            };
            if (chiTietPhieuBus.Delete(newChiTietPhieu))
            {
                string maNV = txtMaNV_Sua.Text;
                string soTien = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtSoTien.Text));
                string ghiChu = rtxtGhiChu.Text;
                string thaoTac = $"Xoá nhân viên {maNV} khỏi {txtLoaiPhieu.Text} {maP}:\n - Số tiền: {soTien}\n - Ghi chú: {ghiChu}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                LichSuThaoTac(thaoTac, maTT);               
                if (this.phieu.LoaiPhieu.MaLP == "LP0000000003")
                {
                    List<NhanVien> listNhanVien = new List<NhanVien>();
                    NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV_Sua.Text);                   
                    nhanVien.SoTienNo -= soTienNo;
                    listNhanVien.Add(nhanVien);
                    nhanVienBUS.CapNhatSoTienNo(listNhanVien);
                }
                Reload();
            }                      
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadChiTietPhieuThuong();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadChiTietPhieuThuongTimKiem(txtTimKiem.Text);
            }

        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
