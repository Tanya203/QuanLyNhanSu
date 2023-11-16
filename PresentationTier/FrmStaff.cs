using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Runtime.Serialization.Formatters.Binary;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmStaff : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly DepartmentBUS departmentBUS;
        private readonly PositionBUS positionBUS;
        private readonly ContractTypeBUS contractTypeBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly string formatDate = "yyyy-MM-dd";
        private Staff staff;
        public FrmStaff(string staffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Nhân viên");
            redirect = new FormHandle();
            departmentBUS = new DepartmentBUS();
            positionBUS = new PositionBUS();
            contractTypeBUS = new ContractTypeBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Nhân viên",staff);            
        }
        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            Authorizations();
            LoadStaff();
            LoadDeapartment();
            LoadPositionByDepartment(cmbDepartment.SelectedValue.ToString());
            LoadContractType();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void Authorizations()
        {
            List<object> input = new List<object> { cmbPosition, cmbContractType, cmbDepartment, txtAccount, txtPassword, txtReEnterPassword,
                                                    txtIDCard, txtLastName, txtMiddleName, txtFirstName, dtpBrithday, txtHouseNumer, txtStreet, txtWard, txtDistrict,
                                                    txtProvince_City, rbMale, rbFemale, rbOthers, txtPhone, txtEmail, txtEducationLevel, dtpEntryDate, dtpContractDuration,
                                                    txtStatus, txtDateOffMount, txtBasicSalary};
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel, btnUnlock, btnLock, btnAddAllowance, btnChoosePicture, cbShowPassword };
            authorizations.AuthorizeForm(input, function);
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { txtStaffID ,cmbPosition, cmbContractType, cmbDepartment, txtAccount, txtPassword, txtReEnterPassword,
                                                        txtIDCard, txtLastName, txtMiddleName, txtFirstName, dtpBrithday, txtHouseNumer, txtStreet, txtWard, txtDistrict,
                                                        txtProvince_City, rbMale, rbFemale, rbOthers, txtPhone, txtEmail, txtEducationLevel, dtpEntryDate, dtpContractDuration,
                                                        txtStatus, txtDateOffMount, txtBasicSalary, txtStaffID, txtAllowance, txtDateLock, txtDept};
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
                else if (listInput[i] is DateTimePicker)
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
            List<object> listButtons = new List<object>() { btnAdd, btnEdit, btnDelete, btnCancel, btnUnlock, btnLock, btnAddAllowance, btnChoosePicture, cbShowPassword };
            for (int i = 0; i < listButtons.Count; i++)
            {
                if (listButtons[i] is Button)
                {
                    typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                    continue;
                }
                else if (listButtons[i] is CheckBox)
                {
                    typeof(CheckBox).GetProperty("Visible").SetValue(listButtons[i], value);
                    continue;
                }
                else if (listButtons[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Checked").SetValue(listButtons[i], true);
                    continue;
                }
            }
        }
        private void LoadStaff()
        {
            Enabled = false;
            dgvStaff.Rows.Clear();
            IEnumerable<StaffViewModel> staffList = staffBUS.GetAllStaff();
            int rowAdd;
            foreach (var s in staffList)
            {
                rowAdd = dgvStaff.Rows.Add();
                dgvStaff.Rows[rowAdd].Cells[0].Value = s.StaffID;
                dgvStaff.Rows[rowAdd].Cells[1].Value = s.DepartmentName;
                dgvStaff.Rows[rowAdd].Cells[2].Value = s.PositionName;
                dgvStaff.Rows[rowAdd].Cells[3].Value = s.ContractTypeName;
                dgvStaff.Rows[rowAdd].Cells[4].Value = s.Account;
                dgvStaff.Rows[rowAdd].Cells[5].Value = s.CardID;
                dgvStaff.Rows[rowAdd].Cells[6].Value = s.LastName;
                dgvStaff.Rows[rowAdd].Cells[7].Value = s.MiddleName;
                dgvStaff.Rows[rowAdd].Cells[8].Value = s.FirstName;
                dgvStaff.Rows[rowAdd].Cells[9].Value = s.Brithday.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[10].Value = s.HouseNumber;
                dgvStaff.Rows[rowAdd].Cells[11].Value = s.Street;
                dgvStaff.Rows[rowAdd].Cells[12].Value = s.Ward;
                dgvStaff.Rows[rowAdd].Cells[13].Value = s.District;
                dgvStaff.Rows[rowAdd].Cells[14].Value = s.Province_City;
                dgvStaff.Rows[rowAdd].Cells[15].Value = s.Gender;
                dgvStaff.Rows[rowAdd].Cells[16].Value = s.Phone;
                dgvStaff.Rows[rowAdd].Cells[17].Value = s.Email;
                dgvStaff.Rows[rowAdd].Cells[18].Value = s.EducationLevel;
                dgvStaff.Rows[rowAdd].Cells[19].Value = s.EntryDate.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[20].Value = s.ContractDuration.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[21].Value = s.Status;
                dgvStaff.Rows[rowAdd].Cells[22].Value = s.DayOffAmount;
                dgvStaff.Rows[rowAdd].Cells[25].Value = s.LockDate.ToString();            
                dgvStaff.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", s.BasicSalary);
                dgvStaff.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", allowanceDetailBUS.StaffTotalAllowance(s.StaffID));
                dgvStaff.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", staff.Dept);
                
            }
            Enabled = true;
        }
        private void LoadStaffSearch(string search)
        {
            Enabled = false;
            dgvStaff.Rows.Clear();
            IEnumerable<StaffViewModel> staffList = staffBUS.GetAllStaffSearch(search);
            int rowAdd;
            foreach (var s in staffList)
            {
                rowAdd = dgvStaff.Rows.Add();
                dgvStaff.Rows[rowAdd].Cells[0].Value = s.StaffID;
                dgvStaff.Rows[rowAdd].Cells[1].Value = s.DepartmentName;
                dgvStaff.Rows[rowAdd].Cells[2].Value = s.PositionName;
                dgvStaff.Rows[rowAdd].Cells[3].Value = s.ContractTypeName;
                dgvStaff.Rows[rowAdd].Cells[4].Value = s.Account;
                dgvStaff.Rows[rowAdd].Cells[5].Value = s.CardID;
                dgvStaff.Rows[rowAdd].Cells[6].Value = s.LastName;
                dgvStaff.Rows[rowAdd].Cells[7].Value = s.MiddleName;
                dgvStaff.Rows[rowAdd].Cells[8].Value = s.FirstName;
                dgvStaff.Rows[rowAdd].Cells[9].Value = s.Brithday.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[10].Value = s.HouseNumber;
                dgvStaff.Rows[rowAdd].Cells[11].Value = s.Street;
                dgvStaff.Rows[rowAdd].Cells[12].Value = s.Ward;
                dgvStaff.Rows[rowAdd].Cells[13].Value = s.District;
                dgvStaff.Rows[rowAdd].Cells[14].Value = s.Province_City;
                dgvStaff.Rows[rowAdd].Cells[15].Value = s.Gender;
                dgvStaff.Rows[rowAdd].Cells[16].Value = s.Phone;
                dgvStaff.Rows[rowAdd].Cells[17].Value = s.Email;
                dgvStaff.Rows[rowAdd].Cells[18].Value = s.EducationLevel;
                dgvStaff.Rows[rowAdd].Cells[19].Value = s.EntryDate.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[20].Value = s.ContractDuration.ToString(formatDate);
                dgvStaff.Rows[rowAdd].Cells[21].Value = s.Status;
                dgvStaff.Rows[rowAdd].Cells[22].Value = s.DayOffAmount;
                dgvStaff.Rows[rowAdd].Cells[25].Value = s.LockDate.ToString();
                dgvStaff.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", s.BasicSalary);
                dgvStaff.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", allowanceDetailBUS.StaffTotalAllowance(s.StaffID));
                dgvStaff.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", staff.Dept);

            }
            Enabled = true;
        }
        private void LoadDeapartment()
        {
            cmbDepartment.DisplayMember = "DepartmentName";
            cmbDepartment.ValueMember = "DP_ID";
            cmbDepartment.DataSource = departmentBUS.GetDepartment();
            AutoAdjustComboBox.Adjust(cmbDepartment);
        }
        private void LoadPositionByDepartment(string dpID)
        {
            cmbPosition.DisplayMember = "PositionName";
            cmbPosition.ValueMember = "PS_ID";
            cmbPosition.DataSource = positionBUS.GetPosition().Where(ps => ps.DP_ID == dpID).ToList();
            AutoAdjustComboBox.Adjust(cmbPosition);
        }
        private void LoadContractType()
        {
            cmbContractType.DisplayMember = "ContractTypeName";
            cmbContractType.ValueMember = "CT_ID";
            cmbContractType.DataSource = contractTypeBUS.GetContractType();
            AutoAdjustComboBox.Adjust(cmbContractType);
        }
        private void cmbDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPositionByDepartment(cmbDepartment.SelectedValue.ToString());
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { cmbPosition, cmbContractType, cmbDepartment, txtAccount, txtPassword, txtReEnterPassword,
                                                        txtIDCard, txtLastName, txtMiddleName, txtFirstName, dtpBrithday, txtHouseNumer, txtStreet, txtWard, txtDistrict,
                                                        txtProvince_City, rbMale, txtPhone, txtEmail, txtEducationLevel, dtpEntryDate, dtpContractDuration,
                                                        txtStatus, txtDateOffMount, txtBasicSalary, txtStaffID, txtAllowance, txtDateLock, txtDept};
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if (listInput[i] is ComboBox)
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
        private void Reload()
        {
            FrmStaff open = new FrmStaff(staff.StaffID);
            redirect.RedirectForm(open);
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private string ChooseGender()
        {
            if (rbMale.Checked)
                return rbMale.Text;
            if (rbFemale.Checked)
                return rbFemale.Text;
            else
                return rbOthers.Text;
        }
        private void CheckChonGioiTinh(object sender, EventArgs e)
        {
            OnOffButton();
        }
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> {  txtIDCard, txtLastName, txtFirstName, txtHouseNumer, txtStreet, txtWard, txtDistrict, txtProvince_City,
                                                              txtPhone, txtEmail, txtEducationLevel, txtStatus, txtDateOffMount, txtBasicSalary};
            if (check)
                listTextBox.AddRange(new List<TextBox> { txtAccount, txtPassword, txtReEnterPassword });
            for (int i = 0; i < listTextBox.Count; i++)
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
        private string GetValueAsString(Staff staff, string propertyName)
        {
            object value;
            if (propertyName.Contains("."))
            {
                string[] propertyNames = propertyName.Split('.');
                value = staff;
                foreach (string name in propertyNames)
                {
                    value = value?.GetType().GetProperty(name)?.GetValue(value);
                    if (value == null)
                        break;
                }
                return value?.ToString() ?? string.Empty;
            }
            if (propertyName == "Brithday" || propertyName == "EntryDate" || propertyName == "ContractDuration")
            {
                value = typeof(Staff).GetProperty(propertyName)?.GetValue(staff);
                DateTime dateValue = (DateTime)value;
                return dateValue.ToString("yyyy-MM-dd");
            }
            if(propertyName == "Pictrue")
            {
                value = typeof(Staff).GetProperty(propertyName)?.GetValue(staff);
                using (MemoryStream stream = new MemoryStream())
                {
                    BinaryFormatter formatter = new BinaryFormatter();
                    formatter.Serialize(stream, value);
                    return System.Text.Encoding.UTF8.GetString(stream.ToArray());
                }               
            }                
            else
                value = typeof(Staff).GetProperty(propertyName)?.GetValue(staff);
            return value?.ToString() ?? string.Empty;
        }
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffID.Text);
            string[] properties = { "Position.Department.DepartmentName", "Position.PositionName", "ContractType.ContractTypeName", "CardID", "LastName", "MiddleName", "FirstName", "Brithday", "Gender", "Phone", "Email", "EducationLevel", "EntryDate", "ContractDuration", "Status", "DayOffAmount", "BasicSalary", "Picture" };
            string[] labels = { "Chức vụ", "Phòng ban", "Loại hợp đồng", "CCCD", "Họ", "Tên lót", "Tên", "NTNS", "Giới tính", "SDT", "Email", "Trình độ học vấn", "Ngày vào làm", "Thời hạn hợp đồng", "Tình trạng", "Số ngày phép", "Lương cơ bản"};
            string[] values = { cmbDepartment.Text, cmbPosition.Text, cmbContractType.Text, txtIDCard.Text, txtLastName.Text, txtMiddleName.Text, txtFirstName.Text, dtpBrithday.Text, ChooseGender(), txtPhone.Text, txtEmail.Text, txtEducationLevel.Text, dtpEntryDate.Text, dtpContractDuration.Text, txtStatus.Text, txtDateOffMount.Text, txtBasicSalary.Text, System.Text.Encoding.UTF8.GetString(ImageHandle.GetImageBytes(pbStaffPicture)) };
            for (int i = 0; i < properties.Length; i++)
            {
                string currentValue = GetValueAsString(staff, properties[i]);
                if (values[i] != currentValue)
                {
                    if (properties[i] == "BasicSalary")
                        changes.Add($"- {labels[i]}: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(currentValue))} -> {labels[i]}: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(values[i]))}");
                    if (properties[i] == "Picture")
                        changes.Add("- Đổi hình");
                    else
                        changes.Add($"- {labels[i]}: {currentValue} -> {labels[i]}: {values[i]}");
                }

            }
            return string.Join("\n", changes);
        }
        private void OnOffButton()
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
            OnOffButton();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void txtLockDate_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtDateLock.Text))
            {
                btnUnlock.Enabled = false;
                btnLock.Enabled = true;
                return;
            }
            else
            {
                btnUnlock.Enabled = true;
                btnLock.Enabled = false;
                return;
            }
        }
        private void txtDateOffAmount_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyNatrualNumber(sender, e);
        }
        private void txtPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyNatrualNumber(sender, e);
        }
        private void txtBasicSalary_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyRealNumber(sender, e);
        }
        private void txtIDCard_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyNatrualNumber(sender, e);
        }
        private void OnlyCharName(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyString(sender, e);            
        }

        ///////////////////////////////////////////////////////////////////////////////////////      
        private bool CheckInputError(Button button)
        {
            bool flag = true;
            double check;
            errProvider.Clear();
            var validationRules = new Dictionary<Control, Func<bool>>
            {
                { dtpEntryDate, () => DateTime.Parse(dtpEntryDate.Value.ToString(formatDate)) < DateTime.Parse(DateTime.Now.ToString(formatDate)) },
                { txtIDCard, () => !InputCheck.CheckCardID(txtIDCard.Text) || staffBUS.GetStaff().FirstOrDefault(s => s.CardID == txtIDCard.Text && s.StaffID != txtStaffID.Text) != null},
                { dtpBrithday, () => DateTime.Now.Year - dtpBrithday.Value.Year < 18 },
                { txtPhone, () => !InputCheck.CheckPhone(txtPhone.Text) || staffBUS.GetStaff().FirstOrDefault(s => s.Phone == txtPhone.Text && s.StaffID != txtStaffID.Text) != null},
                { txtEmail, () => !InputCheck.CheckEmail(txtEmail.Text) || staffBUS.GetStaff().FirstOrDefault(s => s.Email == txtEmail.Text && s.StaffID != txtStaffID.Text) != null},
                { txtBasicSalary, () => double.TryParse(txtBasicSalary.Text, out check) is false },
                { dtpContractDuration, () => dtpContractDuration.Value <= dtpEntryDate.Value },
            };
            if (button == btnAdd)
            {
                validationRules.Add(txtAccount, () => staffBUS.GetStaff().FirstOrDefault(s => s.Account == txtAccount.Text) != null || txtAccount.Text.Length < 5);
                validationRules.Add(txtPassword, () => !InputCheck.CheckPassword(txtPassword.Text));
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
                    if (validate() && dtpEntryDate.Value.ToString(formatDate) != staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffID.Text).EntryDate.ToString(formatDate))
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
                string gender = ChooseGender();
                Staff staff = new Staff
                {
                    StaffID = "",
                    PS_ID = cmbPosition.SelectedValue.ToString(),
                    CT_ID = cmbContractType.SelectedValue.ToString(),
                    Account = txtAccount.Text,
                    Password = txtPassword.Text,
                    CardID = txtIDCard.Text,
                    LastName = txtLastName.Text,
                    MiddleName = txtMiddleName.Text,
                    FirstName = txtFirstName.Text,
                    Brithday = dtpBrithday.Value,
                    HouseNumber = txtHouseNumer.Text,
                    Street = txtStreet.Text,
                    Ward = txtWard.Text,
                    District = txtDistrict.Text,
                    Province_City = txtProvince_City.Text,
                    Gender = gender,
                    Phone = txtPhone.Text,
                    Email = txtEmail.Text,
                    EducationLevel = txtEducationLevel.Text,
                    EntryDate = dtpEntryDate.Value,
                    ContractDuration = dtpContractDuration.Value,
                    Status = txtStatus.Text,
                    DayOffAmount = int.Parse(txtDateOffMount.Text),
                    BasicSalary = decimal.Parse(txtBasicSalary.Text),
                    Dept = 0,
                    Picture = ImageHandle.GetImageBytes(pbStaffPicture)
                };
                if (staffBUS.Save(staff))
                {
                    string operate = "Thêm";
                    string fullName = StringAdjust.AddSpacesBetweenUppercaseLetters($"{txtLastName.Text}{txtLastName.Text}{txtFirstName.Text}");
                    string operationDetail = $"Thêm nhân viên {fullName}:\n" +
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
                                    $"- Giới tính: {ChooseGender()}\n" +
                                    $"- Số điện thoại: {txtPhone.Text}\n" +
                                    $"- Email: {txtEmail.Text}\n" +
                                    $"- Trình độ học vấn: {txtEducationLevel.Text}\n" +
                                    $"- Ngày vào làm: {dtpEntryDate.Text}\n" +
                                    $"- Thời hạn hợp đồng: {dtpContractDuration.Text}\n" +
                                    $"- Tình trạng: {txtStatus.Text}\n" +
                                    $"- Số ngày phép: {txtDateOffMount.Text}\n" +
                                    $"- Lương cơ bản: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtBasicSalary.Text))}\n";                    
                    history.Save(this.staff.StaffID, operate, operationDetail);                    
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
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
                string editDetail = CheckChange();
                string gender = ChooseGender();                
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffID.Text);
                staff.PS_ID = cmbPosition.SelectedValue.ToString();
                staff.CT_ID = cmbContractType.SelectedValue.ToString();
                staff.CardID = txtIDCard.Text;
                staff.LastName = txtLastName.Text;
                staff.MiddleName = txtMiddleName.Text;
                staff.FirstName = txtFirstName.Text;
                staff.Brithday = dtpBrithday.Value;
                staff.HouseNumber = txtHouseNumer.Text;
                staff.Street = txtStreet.Text;
                staff.Ward = txtWard.Text;
                staff.District = txtDistrict.Text;
                staff.Province_City = txtProvince_City.Text;
                staff.Gender = gender;
                staff.Phone = txtPhone.Text;
                staff.Email = txtEmail.Text;
                staff.EducationLevel = txtEducationLevel.Text;
                staff.EntryDate = dtpEntryDate.Value;
                staff.ContractDuration = dtpContractDuration.Value;
                staff.Status = txtStatus.Text;
                staff.DayOffAmount = int.Parse(txtDateOffMount.Text);
                staff.BasicSalary = decimal.Parse(txtBasicSalary.Text);
                staff.Picture = ImageHandle.GetImageBytes(pbStaffPicture);
                if (staffBUS.Save(staff))
                {
                    string operationDetail = $"Sửa nhân viên {txtStaffID.Text}";
                    string operate = "Sửa";
                    if (!string.IsNullOrEmpty(editDetail))
                        operationDetail += $":\n{editDetail}";
                    history.Save(this.staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtStaffID.Text == staff.StaffID)
                {
                    MessageBox.Show("Không thể xoá tài khoản đang đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    ClearAllText();
                    return;
                }
                CustomMessage.YesNoCustom("Xác nhận", "Huỷ");
                DialogResult result = MessageBox.Show($"Xác nhận xoá nhân viên {txtStaffID.Text}? Sau khi xoá dữ liệu của nhân viên trên hệ thống không thể khôi phục!!!", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);
                if (result == DialogResult.Yes)
                {
                    FrmConfirmPassword open = new FrmConfirmPassword(staff.StaffID);
                    open.ShowDialog();
                    if (open.Check == true)
                    {
                        open.Check = false;
                        Staff deleteStaff = new Staff
                        {
                            StaffID = txtStaffID.Text,
                        };
                        if(staffBUS.Delete(deleteStaff))
                        {
                            string fullName = StringAdjust.AddSpacesBetweenUppercaseLetters($"{txtLastName.Text}{txtLastName.Text}{txtFirstName.Text}");
                            string operate = "Xoá";
                            string operationDetail = $"Xoá nhân viên {fullName}:\n" +
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
                                            $"- Giới tính: {ChooseGender()}\n" +
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
                            history.Save(staff.StaffID, operate, operationDetail);
                            Reload();
                        }                        
                    }      
                }           
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open);
            staff = null;
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
            FrmStaffAllowanceDetail open = new FrmStaffAllowanceDetail(staff.StaffID, txtStaffID.Text, "Nhân viên");
            redirect.RedirectForm(open);
        }
        private void btnUnlock_Click(object sender, EventArgs e)
        {
            try
            {
                FrmConfirmPassword open = new FrmConfirmPassword(staff.StaffID);
                open.ShowDialog();
                if (open.Check == true)
                {
                    open.Check = false;
                    Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffID.Text);
                    staff.LockDate = null;
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult result = MessageBox.Show($"Xác nhận mở khoá tài khoản của nhân viên {txtStaffID.Text} ?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (result == DialogResult.Yes)
                    {
                        if (staffBUS.Save(staff))
                        {
                            string operate = "Mở khoá";
                            string operationDetail = $"Mở khoá tài khoản của nhân viên {txtStaffID.Text}";
                            history.Save(staff.StaffID, operate, operationDetail);
                            Reload();
                        }
                    }
                    else
                        return;
                }                    
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void cbShowpassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowPassword.Checked)
                txtPassword.UseSystemPasswordChar = txtReEnterPassword.UseSystemPasswordChar = false;
            else
                txtPassword.UseSystemPasswordChar = txtReEnterPassword.UseSystemPasswordChar = true;
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadStaff();
        }
        private void dgvStaff_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            pbStaffPicture.Image = Properties.Resources.image;
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
            txtBasicSalary.Text = double.Parse(StringAdjust.AdjustNumber(dgvStaff.Rows[rowIndex].Cells[23].Value.ToString())).ToString("F3");
            txtAllowance.Text = double.Parse(StringAdjust.AdjustNumber(dgvStaff.Rows[rowIndex].Cells[24].Value.ToString())).ToString("F3");
            txtDateLock.Text = dgvStaff.Rows[rowIndex].Cells[25].Value.ToString();            
            txtDept.Text = double.Parse(StringAdjust.AdjustNumber(dgvStaff.Rows[rowIndex].Cells[26].Value.ToString())).ToString("F3");
            byte[] image = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffID.Text).Picture;
            if (image != null)
            {
                ImageHandle.LoadImage(pbStaffPicture, image);
            }            
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadStaffSearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void btnLock_Click(object sender, EventArgs e)
        {
            try
            {
                FrmConfirmPassword open = new FrmConfirmPassword(staff.StaffID);
                open.ShowDialog();
                if (open.Check == true)
                {
                    open.Check = false;
                    string lockStaff = txtStaffID.Text;
                    if (lockStaff == staff.StaffID)
                    {
                        MessageBox.Show($"Không thể khoá tài khoản hiện đang đăng nhập", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    FrmLockAccount lockAccount = new FrmLockAccount(staff.StaffID, lockStaff);
                    lockAccount.ShowDialog();
                    Reload();
                }
                   
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }

        private void btnChoosePicture_Click(object sender, EventArgs e)
        {
            ImageHandle.ChooseIamge(pbStaffPicture);
        }
    }
}
