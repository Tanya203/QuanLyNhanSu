using Microsoft.Reporting.Map.WebForms.BingMaps;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmShift : Form
    {
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly ShiftBUS shiftBUS;
        private readonly CheckExist checkExist;
        private Staff staff;
        public FrmShift(string staffID)
        {
            InitializeComponent();
            history = new SaveOperateHistory("Ca");
            redirect = new FormHandle();
            shiftBUS = new ShiftBUS();
            staffBUS = new StaffBUS();
            checkExist = new CheckExist();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Ca", staff);
            dtpStartTime.Text = "00:00";
            dtpEndTime.Text = "00:00";
            nudFontSize.Value = (decimal)dgvShift.RowsDefaultCellStyle.Font.Size;
        }
        private void frmQuanLyCa_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            if (Authorizations())
                btnShiftType.Visible = true;
            LoadShift();
        }
        private bool Authorizations()
        {
            List<object> input = new List<object> { txtShiftName, dtpStartTime, dtpEndTime };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            if(authorizations.AuthorizeForm(input, function) == "access" || authorizations.AuthorizeForm(input, function) == "full")
                return true;
            return false;
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { txtShiftID, txtShiftName, dtpStartTime, dtpEndTime };
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                if (listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnAdd, btnEdit, btnDelete, btnCancel, btnShiftType };
            if (!value)
                listButtons.Add(btnShiftType);
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnCancel && listButtons[i] != btnShiftType)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadShift()
        {
            Enabled = false;
            dgvShift.Rows.Clear();
            IEnumerable<ShiftViewModels> shiftList = shiftBUS.GetAllShifts();
            int rowAdd;
            foreach (var s in shiftList)
            {
                rowAdd = dgvShift.Rows.Add();
                dgvShift.Rows[rowAdd].Cells[0].Value = s.ShiftID;
                dgvShift.Rows[rowAdd].Cells[1].Value = s.ShiftName;
                dgvShift.Rows[rowAdd].Cells[2].Value = s.BeginTime;
                dgvShift.Rows[rowAdd].Cells[3].Value = s.EndTime;
            }
            Enabled = true;
        }
        private void LoadShiftSearch(string search)
        {
            Enabled = false;
            dgvShift.Rows.Clear();
            IEnumerable<ShiftViewModels> shiftList = shiftBUS.GetAllShiftsSearch(search);
            int rowAdd;
            foreach (var s in shiftList)
            {
                rowAdd = dgvShift.Rows.Add();
                dgvShift.Rows[rowAdd].Cells[0].Value = s.ShiftID;
                dgvShift.Rows[rowAdd].Cells[1].Value = s.ShiftName;
                dgvShift.Rows[rowAdd].Cells[2].Value = s.BeginTime;
                dgvShift.Rows[rowAdd].Cells[3].Value = s.EndTime;
            }
            Enabled = true;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtShiftID, txtShiftName, dtpStartTime, dtpEndTime };
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if (listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Text").SetValue(listInput[i], "00:00");
                    continue;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////       
        private void Reload()
        {
            FrmShift open = new FrmShift(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtShiftName };
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
            if (string.IsNullOrEmpty(txtShiftID.Text))
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
        ///////////////////////////////////////////////////////////////////////////////////////
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            Shift shift = shiftBUS.GetShift().FirstOrDefault(s => s.ShiftID == txtShiftID.Text);
            TimeSpan beginTime = TimeSpan.Parse(dtpStartTime.Text);
            TimeSpan endTime = TimeSpan.Parse(dtpEndTime.Text);
            if (txtShiftName.Text != shift.ShiftName)
                changes.Add($"- Tên ca: {shift.ShiftName} -> Tên ca: {txtShiftName.Text}");
            if (beginTime != shift.BeginTime)
                changes.Add($"- Giờ bắt đầu: {shift.BeginTime} -> Giờ bắt đầu: {beginTime}");
            if (endTime != shift.EndTime)
                changes.Add($"- Giờ kết thúc: {shift.EndTime} -> Giờ kết thúc: {endTime}");
            return string.Join("\n", changes);
        }        
        private bool CheckCa()
        {
            bool checkBegin = true;
            bool checkEnd = true;
            TimeSpan beginTime = TimeSpan.Parse(dtpStartTime.Text);
            TimeSpan endTime = TimeSpan.Parse(dtpEndTime.Text);

            if (beginTime == endTime)
            {
                errProvider.SetError(dtpStartTime, "Giờ bắt đầu và giờ kết thúc trùng nhau");
                errProvider.SetError(dtpEndTime, "Giờ bắt đầu và giờ kết thúc trùng nhau");
                return false;
            }
            foreach (Shift shift in shiftBUS.GetShift().Where(s => s.ShiftID != txtShiftID.Text))
            {
                if (!checkBegin && !checkEnd)
                    break;
                if (shift.BeginTime == endTime && checkBegin)
                {
                    checkBegin = false;
                    errProvider.SetError(dtpStartTime, $"Giờ bắt đầu trùng với ca {shift.ShiftName}");
                }
                if (shift.EndTime == endTime && checkEnd)
                {
                    checkBegin = false;
                    errProvider.SetError(dtpEndTime, $"Giờ kết thúc trùng với ca {shift.ShiftName}");
                }
                if ((beginTime > shift.BeginTime && beginTime < shift.EndTime ||
                    shift.BeginTime > shift.EndTime && (beginTime > shift.BeginTime || beginTime < shift.EndTime))&& checkBegin)
                {
                    checkBegin = false;
                    errProvider.SetError(dtpStartTime, $"Giờ bắt đầu nằm giữa ca {shift.ShiftName}");
                }
                if ((endTime > shift.BeginTime && endTime < shift.EndTime ||
                    shift.BeginTime > shift.EndTime && (endTime > shift.BeginTime || endTime < shift.EndTime)) && checkEnd)
                {
                    checkEnd = false;
                    errProvider.SetError(dtpEndTime, $"Giờ kết thúc nằm giữa ca {shift.ShiftName}");
                }
                if ((shift.BeginTime < shift.EndTime && beginTime < shift.BeginTime && endTime > shift.EndTime) ||
                    (shift.BeginTime > shift.EndTime && beginTime > endTime && beginTime < shift.BeginTime && endTime > shift.EndTime))
                {
                    checkBegin = checkEnd = false;
                    errProvider.SetError(dtpStartTime, $"Giờ bắt đầu và kết thúc chồng qua ca {shift.ShiftName}");
                    errProvider.SetError(dtpEndTime, $"Giờ bắt đầu và kết thúc chồng qua ca {shift.ShiftName}");
                    break;
                }
            }

            if (!checkBegin || !checkEnd)
                return false;
            return true;
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtShiftName, shiftBUS.GetShift().FirstOrDefault(s => s.ShiftName == txtShiftName.Text && s.ShiftID != txtShiftID.Text) != null ? "Tên ca đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtShiftName) != string.Empty || !CheckCa())
                return false;
            return true;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                Shift shift = new Shift
                {
                    ShiftID = "",
                    ShiftName = txtShiftName.Text,
                    BeginTime = TimeSpan.Parse(dtpStartTime.Text),
                    EndTime = TimeSpan.Parse(dtpEndTime.Text),
                };
                if (shiftBUS.Save(shift))
                {
                    string operate = "Thêm";
                    string operationDetail = $"Thêm ca {shift.ShiftName}:\n - Giờ bắt đầu: {shift.BeginTime}\n - Giờ kết thúc: {shift.EndTime}";
                    history.Save(staff.StaffID, operate, operationDetail);
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
                if (!checkExist.CheckShift(txtShiftID.Text))
                {
                    Reload();
                    return;
                }
                if (!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string editDetail = CheckChange();
                Shift shift = new Shift
                {
                    ShiftID = txtShiftID.Text,
                    ShiftName = txtShiftName.Text,
                    BeginTime = TimeSpan.Parse(dtpStartTime.Text),
                    EndTime = TimeSpan.Parse(dtpEndTime.Text),
                };
                if (shiftBUS.Save(shift))
                {
                    string operate = "Sửa";
                    string operationDetail = $"Sửa ca {txtShiftID.Text}";
                    if (!string.IsNullOrEmpty(editDetail))
                        operationDetail += ":\n" + editDetail;
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
                if (!checkExist.CheckShift(txtShiftID.Text))
                {
                    Reload();
                    return;
                }
                Shift shift = new Shift
                {
                    ShiftID = txtShiftID.Text,
                };
                if (shiftBUS.Delete(shift.ShiftID))
                {
                    string operate = "Xoá";
                    string operationDetail = $"Xoá ca {txtShiftName.Text}:\n - Giờ bắt đầu: {dtpStartTime.Text}\n - Giờ kết thúc: {dtpEndTime.Text}";
                    history.Save(this.staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void btnShiftType_Click(object sender, EventArgs e)
        {
            FrmShiftType open = new FrmShiftType(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadShift();
        }
        private void dgvShift_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtShiftID.Text = dgvShift.Rows[rowIndex].Cells[0].Value.ToString();
            txtShiftName.Text = dgvShift.Rows[rowIndex].Cells[1].Value.ToString();
            dtpStartTime.Text = dgvShift.Rows[rowIndex].Cells[2].Value.ToString();
            dtpEndTime.Text = dgvShift.Rows[rowIndex].Cells[3].Value.ToString();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadShiftSearch(txtSearch.Text);
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void nudFontSize_ValueChanged(object sender, EventArgs e)
        {
            int fontSize = (int)nudFontSize.Value;
            dgvShift.RowsDefaultCellStyle.Font = new Font(dgvShift.Font.FontFamily, fontSize);
        }
    }
}
