using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows.Forms;
using WECPOFLogic;
using static System.Net.Mime.MediaTypeNames;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmAccountInfo : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");       
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly StaffBUS staffBUS;
        private readonly CardDetailBUS cardDetailBUS;
        private Staff staff;
        private readonly string formatDate = "dd/MM/yyyy";
        public FrmAccountInfo(string staffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Tài khoản");
            redirect = new FormHandle();
            allowanceDetailBUS = new AllowanceDetailBUS();
            cardDetailBUS = new CardDetailBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            btnChangePassword.Enabled = false;
        }
        private void FrmAccountInfo_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            DisableDisplay();
            btnChangePassword.Enabled = false;
            LoadAccountInfo();
        }
        private void DisableDisplay()
        {
            List<TextBox> listDisplay = new List<TextBox> { txtStaffID, txtDepartment, txtPosition, txtContractType, txtAccount, txtEducationLevel, txtEntryDate, txtContractDuration, txtStatus, txtDateOffAmount, txtBasicSalary, txtAllowance, txtDebt };
            for (int i = 0; i < listDisplay.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
            }
        }
        private void LoadAccountInfo()
        {
            Enabled = false;
            txtStaffID.Text = staff.StaffID;
            txtDepartment.Text = staff.Position.Department.DepartmentName;
            txtPosition.Text = staff.Position.PositionName;
            txtContractType.Text = staff.ContractType.ContractTypeName;
            txtAccount.Text = staff.Account;
            txtIDCard.Text = staff.CardID;
            txtLastName.Text = staff.LastName;
            txtMiddleName.Text = staff.MiddleName;
            txtFirstName.Text = staff.FirstName;
            dtpBrithday.Value = staff.Brithday;
            txtHouseNumber.Text = staff.HouseNumber;
            txtStreet.Text = staff.Street;
            txtWard.Text = staff.Ward;
            txtDistrict.Text = staff.District;
            txtProvince_City.Text = staff.Province_City;
            switch (staff.Gender)
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
            txtPhone.Text = staff.Phone;
            txtEmail.Text = staff.Email;
            txtEducationLevel.Text = staff.EducationLevel;
            txtEntryDate.Text = staff.EntryDate.ToString(formatDate);
            txtContractDuration.Text = staff.ContractDuration.ToString(formatDate);
            txtStatus.Text = staff.Status;
            txtDateOffAmount.Text = staff.DayOffAmount.ToString();
            txtBasicSalary.Text = String.Format(fVND, "{0:N3} ₫", staff.BasicSalary);
            txtAllowance.Text = String.Format(fVND, "{0:N3} ₫", allowanceDetailBUS.StaffTotalAllowance(staff.StaffID));
            txtDebt.Text  = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.StaffDebt(staff.StaffID));
            ImageHandle.LoadImage(pbStaffPicture, staff.Picture);
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////   
        private void Reload()
        {
            FrmAccountInfo open = new FrmAccountInfo(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void LogOut()
        {
            FrmLogin open = new FrmLogin();
            redirect.RedirectForm(open, this);
            staff = null;
        }
        //////////////////////////////////////////////////////////////////////////////
        private bool CheckPassword()
        {
            errProvider.Clear();
            errProvider.SetError(txtOldPassword, !BCrypt.Net.BCrypt.Verify(txtOldPassword.Text, staff.Password) ? "Mật khẩu cũ không hợp lệ" : string.Empty);
            errProvider.SetError(txtNewPassword, !InputCheck.CheckPassword(txtNewPassword.Text) || txtNewPassword.Text.Length > 20 ? "Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!" : string.Empty);
            errProvider.SetError(txtReEnterNewPassword, txtReEnterNewPassword.Text != txtNewPassword.Text ? "Mật khẩu nhập lại không khớp" : string.Empty);
            if (errProvider.GetError(txtNewPassword) != string.Empty || errProvider.GetError(txtReEnterNewPassword) != string.Empty || errProvider.GetError(txtOldPassword) != string.Empty)
                return false;
            return true;
        }
        private void CheckTextPassword(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtNewPassword.Text) || string.IsNullOrEmpty(txtOldPassword.Text) || string.IsNullOrEmpty(txtReEnterNewPassword.Text))
                btnChangePassword.Enabled = false;
            else
                btnChangePassword.Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////
        private void txtIDCard_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyNatrualNumber(sender, e);
        }
        private void txtPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyNatrualNumber(sender, e);
        }
        private string ChooseGender()
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
            List<TextBox> listTextBox = new List<TextBox> { txtIDCard, txtLastName, txtFirstName, txtHouseNumber, txtStreet, txtWard, txtDistrict, txtProvince_City, txtPhone, txtEmail };
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

        private string GetValueAsString(Staff staff, string propertyName)
        {
            object value = typeof(Staff).GetProperty(propertyName)?.GetValue(staff);
            if (propertyName == "Brithday")
            {
                DateTime dateValue = (DateTime)value;
                return dateValue.ToString("yyyy-MM-dd");
            }
            if (propertyName == "Pictrue")
            {
                value = typeof(Staff).GetProperty(propertyName)?.GetValue(staff);
                using (MemoryStream stream = new MemoryStream())
                {
                    BinaryFormatter formatter = new BinaryFormatter();
                    formatter.Serialize(stream, value);
                    return System.Text.Encoding.UTF8.GetString(stream.ToArray());
                }
            }
            return value?.ToString() ?? string.Empty;
        }
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            string[] properties = { "CardID", "LastName", "MiddleName", "FirstName", "Brithday", "Gender", "Phone", "Email", "Picture" };
            string[] labels = { "CCCD", "Họ", "Tên lót", "Tên", "NTNS", "Giới tính", "SDT", "Email" };
            string[] values = { txtIDCard.Text, txtLastName.Text, txtMiddleName.Text, txtFirstName.Text, dtpBrithday.Text, ChooseGender(), txtPhone.Text, txtEmail.Text, System.Text.Encoding.UTF8.GetString(ImageHandle.GetImageBytes(pbStaffPicture)) };
            for (int i = 0; i < properties.Length; i++)
            {
                string currentValue = GetValueAsString(staff, properties[i]);
                if (values[i] != currentValue)
                {                    
                    if (properties[i] == "Picture")
                        changes.Add("- Đổi hình");
                    else
                        changes.Add($"- {labels[i]}: {currentValue} -> {labels[i]}: {values[i]}");
                }
                    
            }
            return string.Join("\n", changes);
        }
        private void btnRefreshInfo_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            LoadAccountInfo();
        }
        private bool CheckInputError()
        {
            bool flag = true;
            errProvider.Clear();
            var validationRules = new Dictionary<Control, Func<bool>>
            {
                { txtIDCard, () => !InputCheck.CheckCardID(txtIDCard.Text) || staffBUS.GetStaff().FirstOrDefault(s => s.CardID == txtIDCard.Text && s.StaffID != txtStaffID.Text) != null},
                { dtpBrithday, () => DateTime.Now.Year - dtpBrithday.Value.Year < 18 },
                { txtPhone, () => ! InputCheck.CheckPhone(txtPhone.Text) || staffBUS.GetStaff().FirstOrDefault(s => s.Phone == txtPhone.Text && s.StaffID != txtStaffID.Text) != null},
                { txtEmail, () => !InputCheck.CheckEmail(txtEmail.Text) || staffBUS.GetStaff().FirstOrDefault(s => s.Email == txtEmail.Text && s.StaffID != txtStaffID.Text) != null},
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
        private void btnSave_Click(object sender, EventArgs e)
        {
            if (!CheckInputError())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                string gender = ChooseGender();
                string editDetail = CheckChange();
                staff.CardID = txtIDCard.Text;
                staff.LastName = txtLastName.Text;
                staff.MiddleName = txtMiddleName.Text;
                staff.FirstName = txtFirstName.Text;
                staff.Brithday = DateTime.Parse(dtpBrithday.Text);
                staff.HouseNumber = txtHouseNumber.Text;
                staff.Street = txtStreet.Text;
                staff.Ward = txtWard.Text;
                staff.District = txtDistrict.Text;
                staff.Province_City = txtProvince_City.Text;
                staff.Gender = gender;
                staff.Phone = txtPhone.Text;
                staff.Email = txtEmail.Text;
                staff.Picture = ImageHandle.GetImageBytes(pbStaffPicture);
                if (staffBUS.Save(staff))
                {
                    string operate = "Sửa";
                    string operationDetail = "Sửa thông tin cá nhân";
                    if (!string.IsNullOrEmpty(editDetail))
                        operationDetail += $":\n{editDetail}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void cbShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowPassword.Checked)
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
            if (!CheckPassword())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                Staff staff = new Staff
                {
                    StaffID = txtStaffID.Text,
                    Password = txtNewPassword.Text,
                };
                if (staffBUS.Save(staff))
                {
                    string operate = "Đổi mật khẩu";
                    string operationDetail = "Đổi mật khẩu";
                    history.Save(staff.StaffID, operate, operationDetail);
                    LogOut();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void btnShowAllowance_Click(object sender, EventArgs e)
        {
            FrmStaffAllowanceDetail open = new FrmStaffAllowanceDetail(staff.StaffID, staff.StaffID, "Tài khoản");
            redirect.RedirectForm(open, this);
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
        }

        private void btnChoosePicture_Click(object sender, EventArgs e)
        {
            ImageHandle.ChooseIamge(pbStaffPicture);
        }
    }
}
