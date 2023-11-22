using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmAllowance : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly AllowanceBUS allowanceBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        private readonly string formatMonth = "MM/yyyy";
        private Staff staff;
        public FrmAllowance(string staffID)
        {
            InitializeComponent();
            history = new SaveOperateHistory("Phụ cấp");
            redirect = new FormHandle();
            allowanceBUS = new AllowanceBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
            staffBUS = new StaffBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Phụ cấp", staff);
        }
        private void frmQuanLyPhuCap_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            if(Authorizations())
                DetailButton();
            LoadAllowance();            
        }
        private bool Authorizations()
        {
            List<object> input = new List<object> { txtAllowanceName, txtAmount };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            if(authorizations.AuthorizeForm(input, function) == "access" || authorizations.AuthorizeForm(input, function) == "full")
                return true;
            return false;
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceID, txtStaffAmount, txtAllowanceName, txtAmount };
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i], !value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnAdd, btnEdit, btnDelete, btnCancel };
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnCancel)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }        
        private void LoadAllowance()
        {
            Enabled = false;
            dgvAllowance.Rows.Clear();
            IEnumerable<AllowanceViewModels> allowanceList = allowanceBUS.GetAllAllowance();
            int rowAdd;
            foreach (var al in allowanceList)
            {
                rowAdd = dgvAllowance.Rows.Add();
                dgvAllowance.Rows[rowAdd].Cells[0].Value = al.AL_ID;
                dgvAllowance.Rows[rowAdd].Cells[1].Value = al.AllowanceName;
                dgvAllowance.Rows[rowAdd].Cells[2].Value = String.Format(fVND, "{0:N3} ₫", al.Amount);
                dgvAllowance.Rows[rowAdd].Cells[3].Value = allowanceDetailBUS.AllowanceTotalStaff(al.AL_ID);
            }
            Enabled = true;
        }
        private void LoadAllowanceSearch(string search)
        {
            Enabled = false;
            dgvAllowance.Rows.Clear();
            IEnumerable<AllowanceViewModels> allowanceList = allowanceBUS.GetAllAllowanceSearch(search);
            int rowAdd;
            foreach (var al in allowanceList)
            {
                rowAdd = dgvAllowance.Rows.Add();
                dgvAllowance.Rows[rowAdd].Cells[0].Value = al.AL_ID;
                dgvAllowance.Rows[rowAdd].Cells[1].Value = al.AllowanceName;
                dgvAllowance.Rows[rowAdd].Cells[2].Value = String.Format(fVND, "{0:N3} ₫", al.Amount);
                dgvAllowance.Rows[rowAdd].Cells[3].Value = allowanceDetailBUS.AllowanceTotalStaff(al.AL_ID);
            }
            Enabled = true;
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceID, txtAllowanceName, txtAmount, txtStaffAmount };
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmAllowance open = new FrmAllowance(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceName, txtAmount };
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
        private void EnableButtons(object sender, EventArgs e)
        {
            bool check;
            if (string.IsNullOrEmpty(txtAllowanceID.Text))
            {
                btnEdit.Enabled = false;
                btnDelete.Enabled = false;
                check = true;
                if (CheckEmptyText(check))
                {
                    btnAdd.Enabled = true;
                    return;
                }
            }
            else
            {
                btnAdd.Enabled = false;
                btnDelete.Enabled = true;
                check = false;
                if (CheckEmptyText(check))
                {
                    btnEdit.Enabled = true;
                    return;
                }
            }
        }
        private void txtAmount_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyRealNumber(sender, e);
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            Allowance allowance = allowanceBUS.GetAllowance().FirstOrDefault(al => al.AL_ID == txtAllowanceID.Text);
            string oldAmount = String.Format(fVND, "{0:N3} ₫", allowance.Amount);
            string newAmount = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
            if (txtAllowanceName.Text != allowance.AllowanceName)
                changes.Add($"- Tên phụ cấp: {allowance.AllowanceName} -> Tên phụ cấp: {txtAllowanceName.Text}");
            if (oldAmount != newAmount)
                changes.Add($"- Số tiền: {oldAmount} -> Số tiền : {newAmount}");
            return string.Join("\n", changes);
        }
        public void DetailButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Chi tiết";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvAllowance.Columns.Add(btnXoa);
            }
        }
        public void AllowanceDetailOpen(string AL_ID)
        {
            FrmAllowanceDetail open = new FrmAllowanceDetail(staff.StaffID, AL_ID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            Allowance allowance = new Allowance
            {
                AL_ID = "",
                AllowanceName = txtAllowanceName.Text,
                Amount = decimal.Parse(txtAmount.Text)
            };
            if (allowanceBUS.Save(allowance))
            {
                string operate = "Thêm";
                string operationDetail = $"Thêm phụ cấp {txtAllowanceName.Text}:\n  - Số tiền: {txtAmount.Text}";
                history.Save(staff.StaffID, operate, operationDetail);
                Reload();
            }           
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {            
            decimal oldAmount = allowanceBUS.GetAllowance().FirstOrDefault(al => al.AL_ID == txtAllowanceID.Text).Amount;
            decimal newAmount = decimal.Parse(txtAmount.Text);
            Allowance allowance = new Allowance
            {
                AL_ID = txtAllowanceID.Text,
                AllowanceName = txtAllowanceName.Text,               
                Amount = decimal.Parse(txtAmount.Text)
            };
            string editDetail = CheckChange();
            if (allowanceBUS.Save(allowance))
            {
                string operate = "Sửa";
                string operationDetail = $"Sửa phụ cấp {txtAllowanceID.Text}";
                if (!string.IsNullOrEmpty(editDetail))
                    operationDetail += $":\n{editDetail}";
                history.Save(staff.StaffID, operate, operationDetail);
                if(oldAmount != newAmount)
                {
                    List<MonthSalaryDetail> salaryDetails = monthSalaryDetailBUS.GetMonthSalaryDetails().Where(m => m.MonthID == DateTime.Now.ToString(formatMonth)).ToList();
                    if(salaryDetails.Count() != 0)
                    {
                        foreach(MonthSalaryDetail staff in salaryDetails)
                        {
                            staff.TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(staff.StaffID);
                            monthSalaryDetailBUS.Save(staff);
                        }
                    }
                }
                Reload();
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            Allowance allowance = new Allowance
            {
                AL_ID = txtAllowanceID.Text,
            };
            if (allowanceBUS.Delete(allowance))
            {
                string operate = "Xoá";
                string amount = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
                string operationDetail = $"Xoá phụ cấp {txtAllowanceName.Text}:\n  - Số tiền: {amount}";
                history.Save(staff.StaffID, operate, operationDetail);
                List<MonthSalaryDetail> salaryDetails = monthSalaryDetailBUS.GetMonthSalaryDetails().Where(m => m.MonthID == DateTime.Now.ToString(formatMonth)).ToList();
                if (salaryDetails.Count() != 0)
                {
                    foreach (MonthSalaryDetail staff in salaryDetails)
                    {
                        staff.TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(staff.StaffID);
                        monthSalaryDetailBUS.Save(staff);
                    }
                    Reload();
                }
            }
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void dgvAllowance_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtAllowanceID.Text = dgvAllowance.Rows[rowIndex].Cells[0].Value.ToString();
            txtAllowanceName.Text = dgvAllowance.Rows[rowIndex].Cells[1].Value.ToString();
            txtAmount.Text = double.Parse(StringAdjust.AdjustNumber(dgvAllowance.Rows[rowIndex].Cells[2].Value.ToString())).ToString("F3");
            txtStaffAmount.Text = dgvAllowance.Rows[rowIndex].Cells[3].Value.ToString();
            if (e.ColumnIndex == 4)
            {
                AllowanceDetailOpen(txtAllowanceID.Text);
                staff = null;
            }                
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadAllowance();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadAllowanceSearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
