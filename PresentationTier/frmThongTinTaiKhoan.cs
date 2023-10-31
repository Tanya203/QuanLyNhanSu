using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using WECPOFLogic;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmThongTinTaiKhoan : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBus;
        private readonly List<ThaoTac> listThaoTac;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string formatDate = "dd/MM/yyyy";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmThongTinTaiKhoan(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBus = new ThaoTacBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Tài khoản").MaGD;
            listThaoTac = thaoTacBus.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            this.maNV = maNV;
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            btnChangePassword.Enabled = false;
        }
        private void FrmThongTinTaiKhoan_Load(object sender, EventArgs e)
        {
            DisableDisplay();
            btnChangePassword.Enabled = false;
            LoadThongTinTaiKhoan();
            LoadThongTinDangNhap();
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
        private void DisableDisplay()
        {
            List<TextBox> listDisplay = new List<TextBox> { txtStaffID, txtDepartment, txtPosition, txtContractType, txtAccount, txtEducationLevel, txtEntryDate, txtContractDuration, txtStatus, txtDateOffAmount, txtBasicSalary, txtAllowance};
            for(int i =0; i< listDisplay.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
            }
        }
        private void LoadThongTinTaiKhoan()
        {
            Enabled = false;
            txtStaffID.Text = nv.MaNV;
            txtDepartment.Text = nv.ChucVu.PhongBan.TenPhongBan;
            txtPosition.Text = nv.ChucVu.TenChucVu;
            txtContractType.Text = nv.LoaiHopDong.TenLoaiHopDong;
            txtAccount.Text = nv.TaiKhoan;
            txtIDCard.Text = nv.CCCD;
            txtLastName.Text = nv.Ho;
            txtMiddleName.Text = nv.TenLot;
            txtFirstName.Text = nv.Ten;
            dtpBrithday.Text = nv.NTNS.ToString(formatDate);
            txtHouseNumber.Text = nv.SoNha;
            txtStreet.Text = nv.TenDuong;
            txtWard.Text = nv.Phuong_Xa;
            txtDistrict.Text = nv.Quan_Huyen;
            txtProvince_City.Text = nv.Tinh_ThanhPho;
            string gioiTinh = nv.GioiTinh;
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
            txtPhone.Text = nv.SDT;
            txtEmail.Text = nv.Email;
            txtEducationLevel.Text = nv.TrinhDoHocVan;
            txtEntryDate.Text = nv.NgayVaoLam.ToString(formatDate);
            txtContractDuration.Text = nv.ThoiHanHopDong.ToString(formatDate);
            txtStatus.Text = nv.TinhTrang;
            txtDateOffAmount.Text = nv.SoNgayPhep.ToString();
            txtBasicSalary.Text = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
            txtAllowance.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(maNV));
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////   
        private void Reload()
        {
            FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void DangXuat()
        {
            FrmDangNhap frmOpen = new FrmDangNhap();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        //////////////////////////////////////////////////////////////////////////////
        private bool CheckMatKhau()
        {
            errProvider.Clear();
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
            errProvider.SetError(txtOldPassword, !BCrypt.Net.BCrypt.Verify(txtNewPassword.Text, nv.MatKhau) ? "Mật khẩu cũ không hợp lệ" : string.Empty);
            errProvider.SetError(txtNewPassword, !passCheck.IsMatch(txtNewPassword.Text) || txtNewPassword.Text.Length > 20 ? "Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!" : string.Empty);
            errProvider.SetError(txtReEnterNewPassword, txtReEnterNewPassword.Text != txtNewPassword.Text ? "Mật khẩu nhập lại không khớp" : string.Empty);
            if (errProvider.GetError(txtNewPassword) != string.Empty || errProvider.GetError(txtReEnterNewPassword) != string.Empty || errProvider.GetError(txtOldPassword) != string.Empty)
                return false;
            return true;
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
            if (!cccdCheck.IsMatch(cccd))
                return false;
            return true;
        }
        private void CheckTextMatKhau(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtNewPassword.Text) || string.IsNullOrEmpty(txtNewPassword.Text) || string.IsNullOrEmpty(txtReEnterNewPassword.Text))
                btnChangePassword.Enabled = false;
            else
                btnChangePassword.Enabled = true;
        }   
        //////////////////////////////////////////////////////////////////////////////
        private void txtIDCard_KeyPress(object sender, KeyPressEventArgs e)
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
        private string ChonGioiTinh()
        {
            if (rbMale.Checked)
                return rbMale.Text;
            if (rbFemale.Checked)
                return rbFemale.Text;
            else
                return rbOthers.Text;
        }
        private bool CheckEmptyText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtIDCard, txtLastName, txtFirstName, txtHouseNumber, txtStreet, txtWard, txtDistrict, txtProvince_City, txtPhone, txtEmail};
            for (int i = 0; i < listTextBox.Count; i++)
            {
                if (string.IsNullOrEmpty(listTextBox[i].Text))
                {
                    btnSave.Enabled = false;
                    return false;
                }
            }
            return true;
        }
        private void EnableButton(object sender, EventArgs e)
        {
            if (CheckEmptyText())
            {
                btnSave.Enabled = true;
                return;
            }
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
        private string GetValueAsString(NhanVien nhanVien, string propertyName)
        {
            object value = typeof(NhanVien).GetProperty(propertyName)?.GetValue(nhanVien);
            if (propertyName == "NTNS")
            {
                DateTime dateValue = (DateTime)value;
                return dateValue.ToString("yyyy-MM-dd");
            }
            return value?.ToString() ?? string.Empty;
        }
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            string[] properties = { "CCCD", "Ho", "TenLot", "Ten", "NTNS", "GioiTinh", "SDT", "Email" };
            string[] labels = { "CCCD", "Họ", "Tên lót", "Tên", "NTNS", "Giới tính", "SDT", "Email" };
            string[] values = { txtIDCard.Text, txtLastName.Text, txtMiddleName.Text, txtFirstName.Text, dtpBrithday.Text, ChonGioiTinh(), txtPhone.Text, txtEmail.Text };
            for (int i = 0; i < properties.Length; i++)
            {
                string currentValue = GetValueAsString(nhanVien, properties[i]);
                if (values[i] != currentValue)
                    changes.Add($"- {labels[i]}: {currentValue} -> {labels[i]}: {values[i]}");
            }
            return string.Join("\n", changes);
        }
        private void btnDatLaiThongTin_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            LoadThongTinTaiKhoan();
        }
        private bool CheckInputError()
        {
            bool flag = true;
            errProvider.Clear();
            var validationRules = new Dictionary<Control, Func<bool>>
            {
                { txtIDCard, () => !CheckCCCD(txtIDCard.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.CCCD == txtIDCard.Text && nv.MaNV != txtStaffID.Text) != null},
                { dtpBrithday, () => DateTime.Now.Year - dtpBrithday.Value.Year < 18 },
                { txtPhone, () => !CheckSDT(txtPhone.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.SDT == txtPhone.Text && nv.MaNV != txtStaffID.Text) != null},
                { txtEmail, () => !CheckEmail(txtEmail.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.Email == txtEmail.Text && nv.MaNV != txtStaffID.Text) != null},               
            };
            var errorMessages = new Dictionary<Control, string>
            {               
                { txtIDCard, "Căn cước công dân không đúng định dạng hoặc đã tồn tại" },
                { dtpBrithday, "Tuổi phải lớn hơn hoặc bằng 18" },
                { txtPhone, "Số điện thoại không đúng định dạng hoặc đã tồn tại" },
                { txtEmail, "Email không đúng định dạng hoặc đã tồn tại" },
               
            };
            foreach (var rule in validationRules)
            {
                var control = rule.Key;
                var validate = rule.Value;
                if (validate())
                {
                    errProvider.SetError(control, errorMessages[control]);
                    flag = false;
                }                
            }
            if (flag)
                return true;
            return false;
        }
        private void ErrorMessage(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
                MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!CheckInputError())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                string gioiTinh = ChonGioiTinh();
                string chiTietSua = CheckChange();
                nv.CCCD = txtIDCard.Text;
                nv.Ho = txtLastName.Text;
                nv.TenLot = txtMiddleName.Text;
                nv.Ten = txtFirstName.Text;
                nv.NTNS = DateTime.Parse(dtpBrithday.Text);
                nv.SoNha = txtHouseNumber.Text;
                nv.TenDuong = txtStreet.Text;
                nv.Phuong_Xa = txtWard.Text;
                nv.Quan_Huyen = txtDistrict.Text;
                nv.Tinh_ThanhPho = txtProvince_City.Text;
                nv.GioiTinh = gioiTinh;
                nv.SDT = txtPhone.Text;
                nv.Email = txtEmail.Text;
                if (nhanVienBUS.Save(nv))
                {
                    string thaoTac = "Cập nhật thông tin cá nhân";
                    if (!string.IsNullOrEmpty(chiTietSua))
                        thaoTac += $":\n{chiTietSua}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
        }
        private void cbShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            if(cbShowPassword.Checked)
            {
                txtOldPassword.UseSystemPasswordChar = false;
                txtNewPassword.UseSystemPasswordChar = false;
                txtReEnterNewPassword.UseSystemPasswordChar = false;
            }
            else
            {
                txtOldPassword.UseSystemPasswordChar = true;
                txtNewPassword.UseSystemPasswordChar = true;
                txtReEnterNewPassword.UseSystemPasswordChar = true;
            }
        }        
        private void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (!CheckMatKhau())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }                
            try
            {
                NhanVien nhanVien = new NhanVien
                {
                    MaNV = txtStaffID.Text,
                    MatKhau = txtNewPassword.Text,
                };
                if (nhanVienBUS.Save(nhanVien))
                {
                    string thaoTac = $"Nhân viên {txtStaffID.Text} đổi mật khẩu";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Đổi mật khẩu")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    DangXuat();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }            
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void btnShowAllowance_Click(object sender, EventArgs e)
        {
            FrmChiTietPhuCapMotNhanVien frmOpen = new FrmChiTietPhuCapMotNhanVien(maNV,maNV,"thongTin");
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
    }
}
