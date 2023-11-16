using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmShiftType : Form
    {

        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly ShiftTypeBUS shiftTypeBUS;
        private Staff staff;
        public FrmShiftType(string staffID)
        {
            InitializeComponent();
            history = new SaveOperateHistory("Loại ca");
            redirect = new FormHandle();
            shiftTypeBUS = new ShiftTypeBUS();
            staffBUS = new StaffBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Loại ca", staff);

        }
        private void frmQuanLyLoaiCa_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            Authorizations();
            LoadShiftType();
        }
        private void Authorizations()
        {
            List<object> input = new List<object> { txtShiftTypeName, txtSalaryCoefficient };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            authorizations.AuthorizeForm(input, function);
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<TextBox> listTextBox = new List<TextBox> { txtShiftTypeID, txtShiftTypeName, txtSalaryCoefficient };
            if (!value)
                listTextBox.Add(txtShiftTypeID);
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i], !value);
                continue;
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
        private void LoadShiftType()
        {
            Enabled = false;
            dgvShiftType.Rows.Clear();
            IEnumerable<ShiftTypeViewModels> shiftTypes = shiftTypeBUS.GetAllShiftType();
            int rowAdd;
            foreach (var st in shiftTypes)
            {
                rowAdd = dgvShiftType.Rows.Add();
                dgvShiftType.Rows[rowAdd].Cells[0].Value = st.ST_ID;
                dgvShiftType.Rows[rowAdd].Cells[1].Value = st.ShiftTypeName;
                dgvShiftType.Rows[rowAdd].Cells[2].Value = st.SalaryCoefficient;
            }
            Enabled = true;
        }
        private void LoadShiftTypeSearch(string search)
        {
            Enabled = false;
            dgvShiftType.Rows.Clear();
            IEnumerable<ShiftTypeViewModels> shiftTypes = shiftTypeBUS.GetAllShiftTypeSearch(search);
            int rowAdd;
            foreach (var st in shiftTypes)
            {
                rowAdd = dgvShiftType.Rows.Add();
                dgvShiftType.Rows[rowAdd].Cells[0].Value = st.ST_ID;
                dgvShiftType.Rows[rowAdd].Cells[1].Value = st.ShiftTypeName;
                dgvShiftType.Rows[rowAdd].Cells[2].Value = st.SalaryCoefficient;
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtShiftTypeID, txtShiftTypeName, txtSalaryCoefficient };
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmShiftType open = new FrmShiftType(staff.StaffID);
            redirect.RedirectForm(open);
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtShiftTypeName, txtSalaryCoefficient };
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
            if (string.IsNullOrEmpty(txtShiftTypeID.Text))
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
        private void txtSalaryCoefficient_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyRealNumber(sender, e);
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////        
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            ShiftType shiftType = shiftTypeBUS.GetShiftType().FirstOrDefault(st => st.ST_ID == txtShiftTypeID.Text);
            if (txtShiftTypeName.Text != shiftType.ShiftTypeName)
                changes.Add($"- Tên loại ca: {shiftType.ShiftTypeName} -> Tên loại ca: {txtShiftTypeName}");
            if (decimal.Parse(txtSalaryCoefficient.Text) != shiftType.SalaryCoefficient)
                changes.Add($"- Hệ số lương: {shiftType.SalaryCoefficient} -> Hệ số lương: {txtSalaryCoefficient.Text}");
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtShiftTypeName, shiftTypeBUS.GetShiftType().FirstOrDefault(st => st.ShiftTypeName == txtShiftTypeName.Text && st.ST_ID != txtShiftTypeID.Text) != null ? "Tên loại ca đã tồn tại" : string.Empty);
            errProvider.SetError(txtSalaryCoefficient, double.TryParse(txtSalaryCoefficient.Text, out double check) is false ? "Hệ số lương không đúng định dạng số" : string.Empty);
            if (errProvider.GetError(txtShiftTypeName) != string.Empty || errProvider.GetError(txtSalaryCoefficient) != string.Empty)
                return false;
            return true;
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
                ShiftType shiftType = new ShiftType
                {
                    ST_ID = "",
                    ShiftTypeName = txtShiftTypeName.Text,
                    SalaryCoefficient = decimal.Parse(txtSalaryCoefficient.Text)
                };
                if (shiftTypeBUS.Save(shiftType))
                {
                    string operate =  "Thêm";
                    string operationDetail = $"Thêm loại ca {txtShiftTypeName.Text}\n - Hệ số lương: {txtSalaryCoefficient.Text}";
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
            if (!CheckErrorInput())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                ShiftType shiftType = new ShiftType
                {
                    ST_ID = txtShiftTypeID.Text,
                    ShiftTypeName = txtShiftTypeName.Text,
                    SalaryCoefficient = decimal.Parse(txtSalaryCoefficient.Text)
                };
                string editDetail = CheckChange();
                if (shiftTypeBUS.Save(shiftType))
                {
                    string operate = "Sửa";
                    string operationDetail = $"Sửa loại ca {txtShiftTypeID.Text}";
                    if (!string.IsNullOrEmpty(editDetail))
                        operationDetail += ":\n" + editDetail;
                    history.Save(staff.StaffID, operate, operationDetail);
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
                ShiftType shiftType = new ShiftType
                {
                    ST_ID = txtShiftTypeID.Text
                };
                if (shiftTypeBUS.Delete(shiftType))
                {
                    string operate = "Xoá";
                    string operationDetail = $"Xoá loại ca {txtShiftTypeName.Text}\n    - Hệ số lương: {txtSalaryCoefficient.Text}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmShift open = new FrmShift(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void dgvShiftType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtShiftTypeID.Text = dgvShiftType.Rows[rowIndex].Cells[0].Value.ToString();
            txtShiftTypeName.Text = dgvShiftType.Rows[rowIndex].Cells[1].Value.ToString();
            txtSalaryCoefficient.Text = dgvShiftType.Rows[rowIndex].Cells[2].Value.ToString();
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadShiftType();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadShiftTypeSearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
