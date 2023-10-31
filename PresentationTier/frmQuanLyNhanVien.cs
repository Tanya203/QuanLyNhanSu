using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyNhanVien : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBus;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<NhanVienViewModel> danhSachNhanVien;
        private IEnumerable<NhanVienViewModel> danhSachNhanVienTimKiem;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string maNV;
        private readonly string maCV;
        private readonly string maGD;
        private bool checkThaoTac;
        private readonly NhanVien nv;


        public FrmQuanLyNhanVien(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBus = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý nhân viên").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tc => tc.MaGD == maGD).ToList();            
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkThaoTac = false;
            MessageBoxManager.Register_OnceOnly();
        }
        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
        {
            cmbDepartment.DisplayMember = "TenPhongBan";
            cmbDepartment.ValueMember = "MaPB";
            cmbPosition.DisplayMember = "TenChucVu";
            cmbPosition.ValueMember = "MaCV";
            cmbContractType.DisplayMember = "TenLoaiHopDong";
            cmbContractType.ValueMember = "MaLHD";
            InputStatus(false);
            PhanQuyen();
            LoadNhanVien();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbDepartment.SelectedValue.ToString());
            LoadLoaiHopDong();
            LoadThongTinDangNhap();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
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
            foreach (PhanQuyen qh in phanQuyen)
            {
                if(qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    InputStatus(true);
                    checkThaoTac = true;
                    continue;
                }
                if(qh.QuyenHan.TenQuyenHan.Contains("Truy cập") && qh.CapQuyen && checkThaoTac)
                {
                    btnAddAllowance.Visible = true;
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { cmbPosition, cmbContractType, cmbDepartment, txtAccount, txtPassword, txtReEnterPassword,
                                                        txtIDCard, txtLastName, txtMiddleName, txtFirstName, dtpBrithday, txtHouseNumer, txtStreet, txtWard, txtDistrict, 
                                                        txtProvince_City, rbMale, rbFemale, rbOthers, txtPhone, txtEmail, txtEducationLevel, dtpEntryDate, dtpContractDuration, 
                                                        txtStatus, txtDateOffMount, txtBasicSalary};
            if (!value)
                listInput.AddRange(new List<object> { txtStaffID, txtAllowance, txtDateLock, txtDept });
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }               
                else if (listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
                else if(listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
                else if (listInput[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
            }                  
        }
        private void ButtonStatus(bool value)
        {
            List<object> listButtons = new List<object>() { btnAdd, btnEdit, btnDelete, btnCancel, btnUnlock, btnLock, cbShowPassword, rbMale };
            if (!value)
                listButtons.Add(btnAddAllowance);
            for (int i = 0; i < listButtons.Count; i++)
            {
                if (listButtons[i] is Button)
                {
                    typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                    if(value && listButtons[i] != btnCancel)
                        typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
                    continue;
                }
                else if (listButtons[i] is CheckBox)
                {
                    typeof(CheckBox).GetProperty("Visible").SetValue(listButtons[i], value);
                    continue;
                }               
                else if(listButtons[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Checked").SetValue(listButtons[i], true);
                    continue;
                }
            }
        }
        private void LoadNhanVien()
        {
            Enabled = false;
            dgvStaff.Rows.Clear();
            if (checkThaoTac)
                danhSachNhanVien = nhanVienBUS.GetAllNhanVien();
            else
                danhSachNhanVien = nhanVienBUS.GetAllNhanVien().Where(nv => nv.TenPhongBan == this.nv.ChucVu.PhongBan.TenPhongBan);
            int rowAdd;
            foreach (var nv in danhSachNhanVien)
            {
                rowAdd = dgvStaff.Rows.Add();
                dgvStaff.Rows[rowAdd].Cells[0].Value = nv.MaNV;
                dgvStaff.Rows[rowAdd].Cells[1].Value = nv.TenPhongBan;
                dgvStaff.Rows[rowAdd].Cells[2].Value = nv.TenChucVu;
                dgvStaff.Rows[rowAdd].Cells[3].Value = nv.TenLoaiHopDong;
                dgvStaff.Rows[rowAdd].Cells[4].Value = nv.TaiKhoan;
                dgvStaff.Rows[rowAdd].Cells[5].Value = nv.CCCD;
                dgvStaff.Rows[rowAdd].Cells[6].Value = nv.Ho;
                dgvStaff.Rows[rowAdd].Cells[7].Value = nv.TenLot;
                dgvStaff.Rows[rowAdd].Cells[8].Value = nv.Ten;
                dgvStaff.Rows[rowAdd].Cells[9].Value = nv.NTNS.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[10].Value = nv.SoNha;
                dgvStaff.Rows[rowAdd].Cells[11].Value = nv.TenDuong;
                dgvStaff.Rows[rowAdd].Cells[12].Value = nv.Phuong_Xa;
                dgvStaff.Rows[rowAdd].Cells[13].Value = nv.Quan_Huyen;
                dgvStaff.Rows[rowAdd].Cells[14].Value = nv.Tinh_ThanhPho;
                dgvStaff.Rows[rowAdd].Cells[15].Value = nv.GioiTinh;
                dgvStaff.Rows[rowAdd].Cells[16].Value = nv.SDT;
                dgvStaff.Rows[rowAdd].Cells[17].Value = nv.Email;
                dgvStaff.Rows[rowAdd].Cells[18].Value = nv.TrinhDoHocVan;
                dgvStaff.Rows[rowAdd].Cells[19].Value = nv.NgayVaoLam.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[20].Value = nv.ThoiHanHopDong.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[21].Value = nv.TinhTrang;
                dgvStaff.Rows[rowAdd].Cells[22].Value = nv.SoNgayPhep;
                dgvStaff.Rows[rowAdd].Cells[25].Value = nv.NgayKhoa.ToString();
                if (checkThaoTac)
                {
                    dgvStaff.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
                    dgvStaff.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nv.MaNV));
                    if (nv.SoTienNo == null)
                        dgvStaff.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", 0.000);
                    else
                        dgvStaff.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", nv.SoTienNo);
                }
            }
            Enabled = true;
        }
        private void LoadNhanVienTimKiem(string timKiem)
        {
            this.UseWaitCursor = true;
            Enabled = false;            
            dgvStaff.Rows.Clear();
            if (checkThaoTac)
                danhSachNhanVienTimKiem = nhanVienBUS.SearchNhanVien(timKiem);
            else
                danhSachNhanVienTimKiem = nhanVienBUS.SearchNhanVien(timKiem).Where(nv => nv.TenPhongBan == this.nv.ChucVu.PhongBan.TenPhongBan);
            int rowAdd;
            foreach (var nv in danhSachNhanVienTimKiem)
            {
                rowAdd = dgvStaff.Rows.Add();
                dgvStaff.Rows[rowAdd].Cells[0].Value = nv.MaNV;
                dgvStaff.Rows[rowAdd].Cells[1].Value = nv.TenPhongBan;
                dgvStaff.Rows[rowAdd].Cells[2].Value = nv.TenChucVu;
                dgvStaff.Rows[rowAdd].Cells[3].Value = nv.TenLoaiHopDong;
                dgvStaff.Rows[rowAdd].Cells[4].Value = nv.TaiKhoan;
                dgvStaff.Rows[rowAdd].Cells[5].Value = nv.CCCD;
                dgvStaff.Rows[rowAdd].Cells[6].Value = nv.Ho;
                dgvStaff.Rows[rowAdd].Cells[7].Value = nv.TenLot;
                dgvStaff.Rows[rowAdd].Cells[8].Value = nv.Ten;
                dgvStaff.Rows[rowAdd].Cells[9].Value = nv.NTNS.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[10].Value = nv.SoNha;
                dgvStaff.Rows[rowAdd].Cells[11].Value = nv.TenDuong;
                dgvStaff.Rows[rowAdd].Cells[12].Value = nv.Phuong_Xa;
                dgvStaff.Rows[rowAdd].Cells[13].Value = nv.Quan_Huyen;
                dgvStaff.Rows[rowAdd].Cells[14].Value = nv.Tinh_ThanhPho;
                dgvStaff.Rows[rowAdd].Cells[15].Value = nv.GioiTinh;
                dgvStaff.Rows[rowAdd].Cells[16].Value = nv.SDT;
                dgvStaff.Rows[rowAdd].Cells[17].Value = nv.Email;
                dgvStaff.Rows[rowAdd].Cells[18].Value = nv.TrinhDoHocVan;
                dgvStaff.Rows[rowAdd].Cells[19].Value = nv.NgayVaoLam.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[20].Value = nv.ThoiHanHopDong.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[21].Value = nv.TinhTrang;
                dgvStaff.Rows[rowAdd].Cells[22].Value = nv.SoNgayPhep;
                dgvStaff.Rows[rowAdd].Cells[25].Value = nv.NgayKhoa.ToString();
                if (checkThaoTac)
                {
                    dgvStaff.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
                    dgvStaff.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nv.MaNV));
                    if (nv.SoTienNo == null)
                        dgvStaff.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", 0.000);
                    else
                        dgvStaff.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", nv.SoTienNo);
                }
            }
            this.UseWaitCursor = false;
            Enabled = true;
        }
        private void LoadPhongBan()
        {
            cmbDepartment.DataSource = phongBanBus.GetPhongBan();
            AutoAdjustComboBox(cmbDepartment);
        }
        private void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbPosition.DataSource = chucVuBUS.GetChucVu().Where(cv => cv.MaPB == maPB).ToList();
            AutoAdjustComboBox(cmbPosition);
        }
        private void LoadLoaiHopDong()
        {
            cmbContractType.DataSource = loaiHopDongBUS.GetLoaiHopDong();
            AutoAdjustComboBox(cmbContractType);
        }
        private void LoadLuongKhoiDiem(object sender, EventArgs e)
        {
            if ((string.IsNullOrEmpty(txtStaffID.Text) || string.IsNullOrEmpty(txtBasicSalary.Text)) && cmbPosition.Enabled)
                txtBasicSalary.Text = chucVuBUS.GetLuongCoBanCuaChucVu(cmbPosition.SelectedValue.ToString()).ToString();
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbDepartment.SelectedValue.ToString());
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
        ///////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { cmbPosition, cmbContractType, cmbDepartment, txtAccount, txtPassword, txtReEnterPassword,
                                                        txtIDCard, txtLastName, txtMiddleName, txtFirstName, dtpBrithday, txtHouseNumer, txtStreet, txtWard, txtDistrict,
                                                        txtProvince_City, rbMale, txtPhone, txtEmail, txtEducationLevel, dtpEntryDate, dtpContractDuration,
                                                        txtStatus, txtDateOffMount, txtBasicSalary, txtStaffID, txtAllowance, txtDateLock, txtDept,
                                                        btnAdd, btnEdit, btnDelete, btnCancel, btnUnlock, btnChoosePicture, btnAddAllowance ,cbShowPassword};
            for(int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if(listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("SelectedIndex").SetValue(listInput[i], 0);
                    continue;
                }
                else if (listInput[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Checked").SetValue(listInput[i], true);
                    continue;
                }
                else if (listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Text").SetValue(listInput[i], DateTime.Now.ToString());
                    continue;
                }
                else if (listInput[i] is CheckBox)
                {
                    typeof(CheckBox).GetProperty("Enabled").SetValue(listInput[i], true);
                    continue;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private bool CheckMatKhau(string matKhau)
        {
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
            if (!passCheck.IsMatch(matKhau) || matKhau.Length > 20)
                return false;
            return true;
        }
        private string ChonGioiTinh()
        {
            if (rbMale.Checked)
                return rbMale.Text;
            if (rbFemale.Checked)
                return rbFemale.Text;
            else
                return rbOthers.Text;
        }
        private bool CheckSDT(string sdt)
        {
            Regex sdtCheck = new Regex(@"(84|0[3|5|7|8|9])+([0-9]{8})\b");
            if (!sdtCheck.IsMatch(sdt))
                return false;
            return true;
        }
        private bool CheckEmail(string email)
        {
            Regex emailCheck = new Regex("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            if (!emailCheck.IsMatch(email))
                return false;
            return true;                    
        }
        private bool CheckCCCD(string cccd)
        {
            Regex cccdCheck = new Regex(@"^(001|002|004|006|008|010|011|012|014|015|017|019|020|022|024|025|026|027|030|031|033|034|035|036|037|
                                        038|040|042|044|045|046|048|049|051|052|054|056|058|060|062|064|066|067|068|070|072|074|075|077|079|080|
                                        082|083|084|086|087|089|091|092|093|094|095|096)[02-3][0-9]{2}[0-9]{6}$");
            if (!cccdCheck.IsMatch(cccd) || cccd.Length != 12)
                return false;
            return true;
        }
        private void CheckChonGioiTinh(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            BatTatNut();
        }
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> {  txtIDCard, txtLastName, txtFirstName, txtHouseNumer, txtStreet, txtWard, txtDistrict, txtProvince_City,
                                                              txtPhone, txtEmail, txtEducationLevel, txtStatus, txtDateOffMount, txtBasicSalary};
            if (check)
                listTextBox.AddRange(new List<TextBox> { txtAccount, txtPassword, txtReEnterPassword});
            for(int i = 0; i< listTextBox.Count; i++)
            {
                if (string.IsNullOrEmpty(listTextBox[i].Text))
                {
                    if (check)
                    {
                        btnAdd.Enabled = false;
                        return false;
                    }
                    else
                    {
                        btnEdit.Enabled = false;
                        return false;
                    }
                }                   
            }
            return true;
        }        
        private string GetValueAsString(NhanVien nhanVien, string propertyName)
        {
            object value;
            if (propertyName.Contains("."))
            {
                string[] propertyNames = propertyName.Split('.');
                value = nhanVien;
                foreach (string name in propertyNames)
                {
                    value = value?.GetType().GetProperty(name)?.GetValue(value);
                    if (value == null)
                        break;
                }
                return value?.ToString() ?? string.Empty;
            }
            if (propertyName == "NTNS" || propertyName == "NgayVaoLam" || propertyName == "ThoiHanHopDong")
            {
                value = typeof(NhanVien).GetProperty(propertyName)?.GetValue(nhanVien);
                DateTime dateValue = (DateTime)value;
                return dateValue.ToString("yyyy-MM-dd");
            }
            else
                value = typeof(NhanVien).GetProperty(propertyName)?.GetValue(nhanVien);
            return value?.ToString() ?? string.Empty;
        }
        private string CheckChange()
        {            
            List<string> changes = new List<string>();
            NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffID.Text);
            string[] properties = { "ChucVu.PhongBan.TenPhongBan", "ChucVu.TenChucVu", "LoaiHopDong.TenLoaiHopDong", "CCCD", "Ho", "TenLot", "Ten", "NTNS", "GioiTinh", "SDT", "Email", "TrinhDoHocVan", "NgayVaoLam", "ThoiHanHopDong", "TinhTrang", "SoNgayPhep", "LuongCoBan" };
            string[] labels = { "Chức vụ", "Phòng ban", "Loại hợp đồng", "CCCD", "Họ", "Tên lót", "Tên", "NTNS", "Giới tính", "SDT", "Email", "Trình độ học vấn", "Ngày vào làm", "Thời hạn hợp đồng", "Tình trạng", "Số ngày phép", "Lương cơ bản" };
            string[] values = { cmbDepartment.Text, cmbPosition.Text, cmbContractType.Text, txtIDCard.Text, txtLastName.Text, txtMiddleName.Text, txtFirstName.Text, dtpBrithday.Text, ChonGioiTinh(), txtPhone.Text, txtEmail.Text, txtEducationLevel.Text, dtpEntryDate.Text, dtpContractDuration.Text, txtStatus.Text, txtDateOffMount.Text, txtBasicSalary.Text };
            for (int i = 0; i < properties.Length; i++)
            {
                string currentValue = GetValueAsString(nhanVien, properties[i]);
                if (values[i] != currentValue)
                {
                    if (properties[i] == "LuongCoBan")
                        changes.Add($"- {labels[i]}: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(currentValue))} -> {labels[i]}: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(values[i]))}");
                    else
                        changes.Add($"- {labels[i]}: {currentValue} -> {labels[i]}: {values[i]}");
                }

            }
            return string.Join("\n", changes);
        }
        private void BatTatNut()
        {
            bool check;
            if (string.IsNullOrEmpty(txtStaffID.Text))
            {
                cbShowPassword.Enabled = true;
                btnAddAllowance.Enabled = false;
                btnEdit.Enabled = false;
                btnDelete.Enabled = false;
                btnUnlock.Enabled = false;
                btnLock.Enabled = false;
                txtPassword.Enabled = true;
                txtReEnterPassword.Enabled = true;
                txtAccount.ReadOnly = false;
                check = true;
                if (CheckEmptyText(check))
                {
                    btnAdd.Enabled = true;
                    return;
                }
            }
            else
            {
                cbShowPassword.Enabled = false;
                btnAddAllowance.Enabled = true;
                btnDelete.Enabled = true;
                txtPassword.Enabled = false;
                txtReEnterPassword.Enabled = false;
                txtAccount.ReadOnly = true;
                check = false;
                if (!string.IsNullOrEmpty(txtDateLock.Text))
                {
                    btnUnlock.Enabled = true;
                    btnLock.Enabled = false;
                }
                if (string.IsNullOrEmpty(txtDateLock.Text))
                {
                    btnUnlock.Enabled = false;
                    btnLock.Enabled = true;
                }
                if (CheckEmptyText(check))
                {
                    btnEdit.Enabled = true;
                    return;
                }
            }     
        }
        private void EnableButtons(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            BatTatNut();            
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void txtLockDate_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtDateLock.Text))
            {
                btnUnlock.Enabled = false;
                return;
            }
            else
            {
                btnUnlock.Enabled = true;
                return;
            }
        }
        private void txtDateOffAmount_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        private void txtPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        private void txtBasicSalary_KeyPress(object sender, KeyPressEventArgs e)
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
        private void txtIDCard_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        private void OnlyCharHoTen(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetter(e.KeyChar) && !char.IsControl(e.KeyChar))
            {                
                e.Handled = true;
            }
        }       
       
        ///////////////////////////////////////////////////////////////////////////////////////      
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
        private bool CheckInputError(Button button)
        {
            bool flag = true;
            double check;
            errProvider.Clear();
            var validationRules = new Dictionary<Control, Func<bool>>
            {
                { dtpEntryDate, () => DateTime.Parse(dtpEntryDate.Value.ToString(formatDate)) < DateTime.Parse(DateTime.Now.ToString(formatDate)) },
                { txtIDCard, () => !CheckCCCD(txtIDCard.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.CCCD == txtIDCard.Text && nv.MaNV != txtStaffID.Text) != null},
                { dtpBrithday, () => DateTime.Now.Year - dtpBrithday.Value.Year < 18 },
                { txtPhone, () => !CheckSDT(txtPhone.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.SDT == txtPhone.Text && nv.MaNV != txtStaffID.Text) != null},
                { txtEmail, () => !CheckEmail(txtEmail.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.Email == txtEmail.Text && nv.MaNV != txtStaffID.Text) != null},
                { txtBasicSalary, () => double.TryParse(txtBasicSalary.Text, out check) is false },
                { dtpContractDuration, () => dtpContractDuration.Value <= dtpEntryDate.Value },
            };
            if (button == btnAdd)
            {
                validationRules.Add(txtAccount, () => nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.TaiKhoan == txtAccount.Text) != null || txtAccount.Text.Length < 5);
                validationRules.Add(txtPassword, () => !CheckMatKhau(txtPassword.Text));
                validationRules.Add(txtReEnterPassword, () => txtPassword.Text != txtReEnterPassword.Text);
            }
            var errorMessages = new Dictionary<Control, string>
            {
                { txtAccount, "Tài khoản đã tồn tại hoặc ít hơn 5 ký tự" },
                { txtPassword, "Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!" },
                { txtReEnterPassword, "Mật khẩu nhập lại không khớp" },
                { dtpEntryDate, "Ngày vào làm không thể nhỏ hơn ngày hiện tại" },
                { txtIDCard, "Căn cước công dân không đúng định dạng hoặc đã tồn tại" },
                { dtpBrithday, "Tuổi phải lớn hơn hoặc bằng 18" },
                { txtPhone, "Số điện thoại không đúng định dạng hoặc đã tồn tại" },
                { txtEmail, "Email không đúng định dạng hoặc đã tồn tại" },
                { dtpContractDuration, "Thời hạn hợp đồng phải lớn hơn ngày vào làm" },
                { txtBasicSalary, "Lương cơ bản không đúng định dạng số" }
            };
            foreach (var rule in validationRules)
            {
                var control = rule.Key;
                var validate = rule.Value;
                if (control is DateTimePicker && button == btnEdit)
                {
                    if (validate() && dtpEntryDate.Value.ToString(formatDate) != nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffID.Text).NgayVaoLam.ToString(formatDate))
                    {
                        errProvider.SetError(control, errorMessages[control]);
                        flag = false;
                    }
                }
                else
                {
                    if (validate())
                    {
                        errProvider.SetError(control, errorMessages[control]);
                        flag = false;
                    }
                }
            }
            if (flag)
                return true;
            return false;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckInputError(btnAdd))
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string gioiTinh = ChonGioiTinh();
                NhanVien newNhanVien = new NhanVien
                {
                    MaNV = "",
                    MaCV = cmbPosition.SelectedValue.ToString(),
                    MaLHD = cmbContractType.SelectedValue.ToString(),
                    TaiKhoan = txtAccount.Text,
                    MatKhau = txtPassword.Text,
                    CCCD = txtIDCard.Text,
                    Ho = txtLastName.Text,
                    TenLot = txtMiddleName.Text,
                    Ten = txtFirstName.Text,
                    NTNS = dtpBrithday.Value,
                    SoNha = txtHouseNumer.Text,
                    TenDuong = txtStreet.Text,
                    Phuong_Xa = txtWard.Text,
                    Quan_Huyen = txtDistrict.Text,
                    Tinh_ThanhPho = txtProvince_City.Text,
                    GioiTinh = gioiTinh,
                    SDT = txtPhone.Text,
                    Email = txtEmail.Text,
                    TrinhDoHocVan = txtEducationLevel.Text,
                    NgayVaoLam = dtpEntryDate.Value,
                    ThoiHanHopDong = dtpContractDuration.Value,
                    TinhTrang = txtStatus.Text,
                    SoNgayPhep = int.Parse(txtDateOffMount.Text),
                    LuongCoBan = decimal.Parse(txtBasicSalary.Text),
                    //hinh
                };
                if (nhanVienBUS.Save(newNhanVien))
                {
                    string thaoTac = $"Thêm nhân viên {txtLastName.Text} {txtLastName.Text} {txtFirstName.Text}:\n" +
                                    $"- Phòng ban: {cmbDepartment.Text}\n" +
                                    $"- Chức vụ: {cmbPosition.Text}\n" +
                                    $"- Loại hợp đồng: {cmbContractType.Text}\n" +
                                    $"- Tài khoản: {txtAccount.Text}\n" +
                                    $"- CCCD: {txtIDCard.Text}\n" +
                                    $"- NTNS: {dtpBrithday.Text}\n" +
                                    $"- Số nhà: {txtHouseNumer.Text}\n" +
                                    $"- Đường: {txtStreet.Text}\n" +
                                    $"- Phường/xã: {txtWard.Text}\n" +
                                    $"- Quận/huyện: {txtDistrict.Text}\n" +
                                    $"- Tỉnh/Thành Phố: {txtProvince_City.Text}\n" +
                                    $"- Giới tính: {ChonGioiTinh()}\n" +
                                    $"- Số điện thoại: {txtPhone.Text}\n" +
                                    $"- Email: {txtEmail.Text}\n" +
                                    $"- Trình độ học vấn: {txtEducationLevel.Text}\n" +
                                    $"- Ngày vào làm: {dtpEntryDate.Text}\n" +
                                    $"- Thời hạn hợp đồng: {dtpContractDuration.Text}\n" +
                                    $"- Tình trạng: {txtStatus.Text}\n" +
                                    $"- Số ngày phép: {txtDateOffMount.Text}\n" +
                                    $"- Lương cơ bản: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtBasicSalary.Text))}\n";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }                
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }           
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckInputError(btnEdit))
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string gioiTinh = ChonGioiTinh();
                string chiTietSua = CheckChange();
                NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffID.Text);
                nhanVien.MaCV = cmbPosition.SelectedValue.ToString();
                nhanVien.MaLHD = cmbContractType.SelectedValue.ToString();
                /*nhanVien.MatKhau = matKhau;//*/
                nhanVien.CCCD = txtIDCard.Text;
                nhanVien.Ho = txtLastName.Text;
                nhanVien.TenLot = txtMiddleName.Text;
                nhanVien.Ten = txtFirstName.Text;
                nhanVien.NTNS = dtpBrithday.Value;
                nhanVien.SoNha = txtHouseNumer.Text;
                nhanVien.TenDuong = txtStreet.Text;
                nhanVien.Phuong_Xa = txtWard.Text;
                nhanVien.Quan_Huyen = txtDistrict.Text;
                nhanVien.Tinh_ThanhPho = txtProvince_City.Text;
                nhanVien.GioiTinh = gioiTinh;
                nhanVien.SDT = txtPhone.Text;
                nhanVien.Email = txtEmail.Text;
                nhanVien.TrinhDoHocVan = txtEducationLevel.Text;
                nhanVien.NgayVaoLam = dtpEntryDate.Value;
                nhanVien.ThoiHanHopDong = dtpContractDuration.Value;
                nhanVien.TinhTrang = txtStatus.Text;
                nhanVien.SoNgayPhep = int.Parse(txtDateOffMount.Text);
                nhanVien.LuongCoBan = decimal.Parse(txtBasicSalary.Text);
                //hinh
                if (nhanVienBUS.Save(nhanVien))
                {
                    string thaoTac = $"Sửa nhân viên {txtStaffID.Text}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                    if (!string.IsNullOrEmpty(chiTietSua))
                        thaoTac += $":\n{chiTietSua}";
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
                      
        }      
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtStaffID.Text == maNV)
                {
                    MessageBox.Show("Không thể xoá tài khoản đang đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    ClearAllText();
                    return;
                }
                NhanVien newNhanVien = new NhanVien
                {
                    MaNV = txtStaffID.Text,
                };
                if (nhanVienBUS.Delete(newNhanVien.MaNV))
                {
                    string thaoTac = $"Xoá nhân viên {txtLastName.Text} {txtLastName.Text} {txtFirstName.Text}:\n" +
                                    $"- Phòng ban: {cmbDepartment.Text}\n" +
                                    $"- Chức vụ: {cmbPosition.Text}\n" +
                                    $"- Loại hợp đồng: {cmbContractType.Text}\n" +
                                    $"- Tài khoản: {txtAccount.Text}\n" +
                                    $"- CCCD: {txtIDCard.Text}\n" +
                                    $"- NTNS: {dtpBrithday.Text}\n" +
                                    $"- Số nhà: {txtHouseNumer.Text}\n" +
                                    $"- Đường: {txtStreet.Text}\n" +
                                    $"- Phường/xã: {txtWard.Text}\n" +
                                    $"- Quận/huyện: {txtDistrict.Text}\n" +
                                    $"- Tỉnh/Thành Phố: {txtProvince_City.Text}\n" +
                                    $"- Giới tính: {ChonGioiTinh()}\n" +
                                    $"- Số điện thoại: {txtPhone.Text}\n" +
                                    $"- Email: {txtEmail.Text}\n" +
                                    $"- Trình độ học vấn: {txtEducationLevel.Text}\n" +
                                    $"- Ngày vào làm: {dtpEntryDate.Text}\n" +
                                    $"- Thời hạn hợp đồng: {dtpContractDuration.Text}\n" +
                                    $"- Tình trạng: {txtStatus.Text}\n" +
                                    $"- Số ngày phép: {txtDateOffMount.Text}\n" +
                                    $"- Lương cơ bản: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtBasicSalary.Text))}\n" +
                                    $"- Phụ cấp: {String.Format(fVND, "{0:N3} ₫", txtAllowance.Text)}\n" +
                                    $"- Số tiền nợ: {String.Format(fVND, "{0:N3} ₫", txtDept.Text)}\n";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
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
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(lblStaffIDLoginValue.Text);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
            txtPassword.Enabled = txtReEnterPassword.Enabled = true;
            txtAccount.ReadOnly = false;
        }              
        private void btnAddAllowance_Click(object sender, EventArgs e)
        {
            FrmChiTietPhuCapMotNhanVien frmOpen = new FrmChiTietPhuCapMotNhanVien(maNV,txtStaffID.Text,"nhanVien");
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnUnlock_Click(object sender, EventArgs e)
        {
            try
            {
                string hoTen = txtLastName.Text + " " + txtMiddleName.Text + " " + txtFirstName.Text;
                NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffID.Text);
                nhanVien.NgayKhoa = null;
                MessageBoxManager.Yes = "Có";
                MessageBoxManager.No = "Không";
                DialogResult ketQua = MessageBox.Show("Xác nhận mở khoá tài khoản của " + txtStaffID.Text + " - " + hoTen + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ketQua == DialogResult.Yes)
                {
                    if (nhanVienBUS.Save(nhanVien))
                    {
                        string thaoTac = $"Mở khoá tài khoản của nhân viên {txtStaffID.Text}";
                        string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Mở khoá")).MaTT;
                        LichSuThaoTac(thaoTac, maTT);
                        Reload();
                    }
                }
                else
                    return;
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
                       
        }
        private void cbShowpassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowPassword.Checked)            
                txtPassword.UseSystemPasswordChar = txtReEnterPassword.UseSystemPasswordChar = false;
            else
                txtPassword.UseSystemPasswordChar = txtReEnterPassword.UseSystemPasswordChar = true;
        }        
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadNhanVien();
        }
        private void dgvStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtStaffID.Text = dgvStaff.Rows[rowIndex].Cells[0].Value.ToString();
            cmbDepartment.Text = dgvStaff.Rows[rowIndex].Cells[1].Value.ToString();
            cmbPosition.Text = dgvStaff.Rows[rowIndex].Cells[2].Value.ToString();
            cmbContractType.Text = dgvStaff.Rows[rowIndex].Cells[3].Value.ToString();
            txtAccount.Text = dgvStaff.Rows[rowIndex].Cells[4].Value.ToString();
            txtIDCard.Text = dgvStaff.Rows[rowIndex].Cells[5].Value.ToString();
            txtLastName.Text = dgvStaff.Rows[rowIndex].Cells[6].Value.ToString();
            txtMiddleName.Text = dgvStaff.Rows[rowIndex].Cells[7].Value.ToString();
            txtFirstName.Text = dgvStaff.Rows[rowIndex].Cells[8].Value.ToString();
            dtpBrithday.Text = dgvStaff.Rows[rowIndex].Cells[9].Value.ToString();
            txtHouseNumer.Text = dgvStaff.Rows[rowIndex].Cells[10].Value.ToString();
            txtStreet.Text = dgvStaff.Rows[rowIndex].Cells[11].Value.ToString();
            txtWard.Text = dgvStaff.Rows[rowIndex].Cells[12].Value.ToString();
            txtDistrict.Text = dgvStaff.Rows[rowIndex].Cells[13].Value.ToString();
            txtProvince_City.Text = dgvStaff.Rows[rowIndex].Cells[14].Value.ToString();
            string gioiTinh = dgvStaff.Rows[rowIndex].Cells[15].Value.ToString();
            switch (gioiTinh)
            {
                case "Nam":
                    rbMale.Checked = true;
                    break;
                case "Nữ":
                    rbFemale.Checked = true;
                    break;
                case "Khác":
                    rbOthers.Checked = true;
                    break;
            }
            txtPhone.Text = dgvStaff.Rows[rowIndex].Cells[16].Value.ToString();
            txtEmail.Text = dgvStaff.Rows[rowIndex].Cells[17].Value.ToString();
            txtEducationLevel.Text = dgvStaff.Rows[rowIndex].Cells[18].Value.ToString();
            dtpEntryDate.Text = dgvStaff.Rows[rowIndex].Cells[19].Value.ToString();
            dtpContractDuration.Text = dgvStaff.Rows[rowIndex].Cells[20].Value.ToString();
            txtStatus.Text = dgvStaff.Rows[rowIndex].Cells[21].Value.ToString();
            txtDateOffMount.Text = dgvStaff.Rows[rowIndex].Cells[22].Value.ToString();
            txtDateLock.Text = dgvStaff.Rows[rowIndex].Cells[25].Value.ToString();
            if (checkThaoTac)
            {
                txtBasicSalary.Text = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffID.Text).LuongCoBan.ToString();
                txtAllowance.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(txtStaffID.Text));                
                txtDept.Text = dgvStaff.Rows[rowIndex].Cells[26].Value.ToString();
            }            
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadNhanVienTimKiem(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void btnLock_Click(object sender, EventArgs e)
        {
            try
            {
                string maNV_Khoa = txtStaffID.Text;
                if (maNV_Khoa == maNV)
                {
                    MessageBox.Show($"Không thể khoá tài khoản hiện đang đăng nhập", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                FrmKhoaTaiKhoan open = new FrmKhoaTaiKhoan(maNV, maNV_Khoa);
                open.ShowDialog();
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }            
        }
    }
}
