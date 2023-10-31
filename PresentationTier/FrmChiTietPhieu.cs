using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Windows.Forms;
using WECPOFLogic;

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
            cmbDepartment.DisplayMember = "TenPhongBan";
            cmbDepartment.ValueMember = "MaPB";
            cmbPosition.DisplayMember = "TenChucVu";
            cmbPosition.ValueMember = "MaCV";
            cmbStaff.DisplayMember = "MaNV";
            cmbStaff.ValueMember = "MaNV";
            LoadThongTinDangNhap();
            DisableDisplay();
            LoadThongTinPhieuThuong();
            InputStatus(false);
            PhanQuyen();
            if (checkThaoTac)
            {
                LoadPhongBan();
                LoadChucVuTheoPhongBan(cmbDepartment.SelectedValue.ToString());
                LoadNhanVienTheoChucVu(cmbPosition.SelectedValue.ToString());
            }
            LoadChiTietPhieuThuong();           
        }
        public void LoadThongTinDangNhap()
        {
            lblStaffLoginValue.Text = nv.MaNV;
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
                    checkThaoTac = true;
                    InputStatus(true);
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { cmbDepartment, cmbPosition, cmbStaff, txtAmount, rtxtNote};
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
            List<Button> listButton = new List<Button> { btnAdd, btnEdit, btnCancel};
            if (value)
                XoaButton();
            for(int i =  0; i < listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                if (value && listButton[i] != btnCancel)
                    typeof(Button).GetProperty("Enabled").SetValue(listButton[i], !value);
            }
        }
        private void DisableDisplay()
        {
            List<object> listDisplay = new List<object> { txtCardID, txtCardType, txtFullNameCreate, txtPosition, txtPosition, dtpDateCreate, txtTotalAmount, txtStaffIDEdit, txtFullName, txtStaffIDCreate };
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
            foreach (var pt in ctp)
                nhanVienList = nhanVienList.Where(nv => nv.MaNV != pt.MaNV).ToList();
            cmbStaff.DataSource = nhanVienList;
            if (string.IsNullOrEmpty(cmbStaff.Text))
            {
                cmbStaff.Enabled = false;
                txtFullName.Text = string.Empty;
            }                
            else 
                cmbStaff.Enabled = true;
            AutoAdjustComboBox(cmbStaff);
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            LoadChucVuTheoPhongBan(cmbDepartment.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbStaff.Text) && string.IsNullOrEmpty(txtStaffIDEdit.Text))            
                txtFullName.Text = string.Empty;            
            else
                txtAmount.Text = string.Empty;
        }
        private void LoadNhanVien(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            LoadNhanVienTheoChucVu(cmbPosition.SelectedValue.ToString());
        }
        public void LoadThongTinPhieuThuong()
        {
            txtCardID.Text = phieu.MaP;
            txtCardType.Text = phieu.LoaiPhieu.TenLoaiPhieu;
            txtStaffIDCreate.Text = phieu.MaNV;
            txtFullNameCreate.Text = $"{phieu.NhanVien.Ho} {phieu.NhanVien.TenLot} {phieu.NhanVien.Ten}";
            txtPosition.Text = phieu.NhanVien.ChucVu.PhongBan.TenPhongBan;
            txtPosition.Text = phieu.NhanVien.ChucVu.TenChucVu;
            dtpDateCreate.Text = phieu.NgayLap.ToString();
            txtTotalAmount.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhieuBus.TongTienPhieu(maP));
        }
        private void LoadChiTietPhieuThuong()
        {
            Enabled = false;
            dgvCardDetail.Rows.Clear();
            danhSachChiTietPhieu = chiTietPhieuBus.GetAllChiTietPhieu(maP);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhieu)
            {
                rowAdd = dgvCardDetail.Rows.Add();
                dgvCardDetail.Rows[rowAdd].Cells[0].Value = phieu.MaP;
                dgvCardDetail.Rows[rowAdd].Cells[1].Value = phieu.TenLoaiPhieu;
                dgvCardDetail.Rows[rowAdd].Cells[2].Value = phieu.MaNV;
                dgvCardDetail.Rows[rowAdd].Cells[3].Value = phieu.HoTen;
                dgvCardDetail.Rows[rowAdd].Cells[4].Value = phieu.PhongBan;
                dgvCardDetail.Rows[rowAdd].Cells[5].Value = phieu.ChucVu;
                dgvCardDetail.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", phieu.SoTien);
                dgvCardDetail.Rows[rowAdd].Cells[7].Value = phieu.GhiChu;
            }
            Enabled = true;
        }
        private void LoadChiTietPhieuThuongTimKiem(string timKiem)
        {
            Enabled = false;
            dgvCardDetail.Rows.Clear();
            danhSachChiTietPhieuTimKiem = chiTietPhieuBus.SearchChiTietPhieu(maP, timKiem);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhieuTimKiem)
            {
                rowAdd = dgvCardDetail.Rows.Add();
                dgvCardDetail.Rows[rowAdd].Cells[0].Value = phieu.MaP;
                dgvCardDetail.Rows[rowAdd].Cells[1].Value = phieu.TenLoaiPhieu;
                dgvCardDetail.Rows[rowAdd].Cells[2].Value = phieu.MaNV;
                dgvCardDetail.Rows[rowAdd].Cells[3].Value = phieu.HoTen;
                dgvCardDetail.Rows[rowAdd].Cells[4].Value = phieu.PhongBan;
                dgvCardDetail.Rows[rowAdd].Cells[5].Value = phieu.ChucVu;
                dgvCardDetail.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", phieu.SoTien);
                dgvCardDetail.Rows[rowAdd].Cells[7].Value = phieu.GhiChu;
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
        private void cmbStaffID_SelectedIndexChanged(object sender, EventArgs e)
        {            
            NhanVien nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nhanVien => nhanVien.MaNV == cmbStaff.Text);
            txtFullName.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            txtStaffIDEdit.Text = string.Empty;
            txtAmount.Text = string.Empty;
            rtxtNote.Text = string.Empty;
        }
        private void EnableButton()
        {
            if (string.IsNullOrEmpty(cmbStaff.Text) && string.IsNullOrEmpty(txtAmount.Text) || string.IsNullOrEmpty(txtAmount.Text))
            {
                btnAdd.Enabled = btnEdit.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(cmbStaff.Text) && !string.IsNullOrEmpty(txtAmount.Text) && string.IsNullOrEmpty(txtStaffIDEdit.Text))
            {
                btnAdd.Enabled = true;
                btnEdit.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtStaffIDEdit.Text) && !string.IsNullOrEmpty(txtAmount.Text))
            {
                btnAdd.Enabled = false;
                btnEdit.Enabled = true;
                return;
            }
        }
        private void BatTatBut(object sender, EventArgs e)
        {
            EnableButton();
        }
        private void dgvCardDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;            
            cmbDepartment.Text = dgvCardDetail.Rows[rowIndex].Cells[4].Value.ToString();
            cmbPosition.Text = dgvCardDetail.Rows[rowIndex].Cells[5].Value.ToString();
            txtFullName.Text = dgvCardDetail.Rows[rowIndex].Cells[3].Value.ToString();            
            txtStaffIDEdit.Text = dgvCardDetail.Rows[rowIndex].Cells[2].Value.ToString();
            txtAmount.Text = chiTietPhieuBus.SoTienNhanVienTrongPhieu(txtStaffIDEdit.Text, txtCardID.Text).ToString();
            if (dgvCardDetail.Rows[rowIndex].Cells[7].Value is null)
                rtxtNote.Text = string.Empty;
            else
                rtxtNote.Text = dgvCardDetail.Rows[rowIndex].Cells[7].Value.ToString();
            if (e.ColumnIndex == 8)            
                XoaNhanVien();                         
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtAmount, txtFullName, rtxtNote, cmbDepartment, txtStaffIDEdit};
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
        private void txtAmount_KeyPress(object sender, KeyPressEventArgs e)
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
            ChiTietPhieu nhanVien = chiTietPhieuBus.GetChiTietPhieu().FirstOrDefault(phieu => phieu.MaNV == txtStaffIDEdit.Text);
            string soTienCu = string.Format(fVND, "{0:N3} ₫", nhanVien.SoTien);
            string soTienMoi = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
            if (soTienCu != soTienMoi)
                changes.Add($"- Số tiền: {soTienCu} -> Số tiền: {soTienMoi}");
            if (rtxtNote.Text != nhanVien.GhiChu)
                changes.Add($"- Ghi chú: {nhanVien.GhiChu} -> Ghi chú: {rtxtNote.Text}");  
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtAmount, double.TryParse(txtAmount.Text, out double check) is false ? "Định dạng tiền không hợp lệ" : string.Empty);
            if (errProvider.GetError(txtAmount) != string.Empty)
                return false;
            return true;
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
            if (!CheckErrorInput())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
                {
                    MaP = maP,
                    MaNV = cmbStaff.SelectedValue.ToString(),
                    SoTien = decimal.Parse(txtAmount.Text),
                    GhiChu = rtxtNote.Text,
                };
                if (chiTietPhieuBus.Save(newChiTietPhieu))
                {
                    string soTien = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
                    string maNV = cmbStaff.SelectedValue.ToString();
                    string thaoTac = $"Thêm nhân viên {maNV} vào {txtCardType.Text} {maP}:\n - Số tiền: {soTien}\n - Ghi chú: {rtxtNote.Text}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                }
                if (phieu.LoaiPhieu.MaLP == "LP0000000003")
                {
                    List<NhanVien> listNhanVien = new List<NhanVien>();
                    NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == cmbStaff.SelectedValue.ToString());
                    if (nhanVien.SoTienNo == null)
                        nhanVien.SoTienNo = decimal.Parse(txtAmount.Text);
                    else
                        nhanVien.SoTienNo += decimal.Parse(txtAmount.Text);
                    listNhanVien.Add(nhanVien);
                    nhanVienBUS.CapNhatSoTienNo(listNhanVien);
                }
                Reload();
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
            
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!CheckErrorInput())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                string chiTietSua = CheckChange();
                decimal soTienNoCu = chiTietPhieuBus.GetChiTietPhieu().FirstOrDefault(ctp => ctp.MaP == this.phieu.MaP && ctp.MaNV == txtStaffIDEdit.Text).SoTien;
                decimal soTienNoMoi = decimal.Parse(txtAmount.Text);
                ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
                {
                    MaP = maP,
                    MaNV = txtStaffIDEdit.Text,
                    SoTien = decimal.Parse(txtAmount.Text),
                    GhiChu = rtxtNote.Text,
                };
                if (chiTietPhieuBus.Save(newChiTietPhieu))
                {
                    string maNV = txtStaffIDEdit.Text;
                    string thaoTac = $"Sửa nhân viên {maNV} trong {txtCardType.Text} {maP}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                    if (!string.IsNullOrEmpty(chiTietSua))
                        thaoTac += $":\n{chiTietSua}";
                    LichSuThaoTac(thaoTac, maTT);
                    if (this.phieu.LoaiPhieu.MaLP == "LP0000000003" && soTienNoCu != soTienNoMoi)
                    {
                        List<NhanVien> listNhanVien = new List<NhanVien>();
                        NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffIDEdit.Text);
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
            catch(Exception ex)
            {
                ErrorMessage(ex);
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
                dgvCardDetail.Columns.Add(btnXoa);
            }            
        }
        public void XoaNhanVien()
        {
            try
            {
                decimal soTienNo = chiTietPhieuBus.GetChiTietPhieu().FirstOrDefault(ctp => ctp.MaP == this.phieu.MaP && ctp.MaNV == txtStaffIDEdit.Text).SoTien;
                ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
                {
                    MaP = txtCardID.Text,
                    MaNV = txtStaffIDEdit.Text,
                };
                if (chiTietPhieuBus.Delete(newChiTietPhieu))
                {
                    string maNV = txtStaffIDEdit.Text;
                    string soTien = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
                    string ghiChu = rtxtNote.Text;
                    string thaoTac = $"Xoá nhân viên {maNV} khỏi {txtCardType.Text} {maP}:\n - Số tiền: {soTien}\n - Ghi chú: {ghiChu}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    if (this.phieu.LoaiPhieu.MaLP == "LP0000000003")
                    {
                        List<NhanVien> listNhanVien = new List<NhanVien>();
                        NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffIDEdit.Text);
                        nhanVien.SoTienNo -= soTienNo;
                        listNhanVien.Add(nhanVien);
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
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadChiTietPhieuThuong();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadChiTietPhieuThuongTimKiem(txtSearch.Text);
            }

        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
