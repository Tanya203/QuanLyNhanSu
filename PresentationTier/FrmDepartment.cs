using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmDepartment : Form
    {
        private readonly DepartmentBUS departmentBUS;
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly CheckExist checkExist;
        private Staff staff;
        public FrmDepartment(string staffID)
        {
            InitializeComponent();
            departmentBUS = new DepartmentBUS();
            history = new SaveOperateHistory("Phòng ban");
            redirect = new FormHandle();           
            staffBUS = new StaffBUS();
            checkExist = new CheckExist();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Phòng ban", staff);
        }
        private void frmQuanLyPhongBan_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            Authorize();
            LoadDepartment();
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<TextBox> listTextBox = new List<TextBox> { txtDepartmentName, txtDepartmentID, txtStaffAmount };
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
        private void Authorize()
        {
            List<object> input = new List<object> { txtDepartmentName };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            authorizations.AuthorizeForm(input, function);
        }
        private void LoadDepartment()
        {
            Enabled = false;
            dgvDepartment.Rows.Clear();
            IEnumerable<DepartmentViewModel> departments = departmentBUS.GetAllDepartment();
            int rowAdd;
            foreach (var dp in departments)
            {
                rowAdd = dgvDepartment.Rows.Add();
                dgvDepartment.Rows[rowAdd].Cells[0].Value = dp.DP_ID;
                dgvDepartment.Rows[rowAdd].Cells[1].Value = dp.DepartmentName;
                dgvDepartment.Rows[rowAdd].Cells[2].Value = departmentBUS.TotalStaffDepartment(dp.DP_ID).ToString();
            }
            Enabled = true;
        }
        private void LoadDepartmentSearch(string search)
        {
            Enabled = false;
            dgvDepartment.Rows.Clear();
            IEnumerable<DepartmentViewModel> departments = departmentBUS.GetAllDepartmentSearch(search);
            int rowAdd;
            foreach (var dp in departments)
            {
                rowAdd = dgvDepartment.Rows.Add();
                dgvDepartment.Rows[rowAdd].Cells[0].Value = dp.DP_ID;
                dgvDepartment.Rows[rowAdd].Cells[1].Value = dp.DepartmentName;
                dgvDepartment.Rows[rowAdd].Cells[2].Value = departmentBUS.TotalStaffDepartment(dp.DP_ID).ToString();
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtDepartmentID, txtDepartmentName, txtStaffAmount };
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmDepartment open = new FrmDepartment(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtDepartmentName };
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
            if (string.IsNullOrEmpty(txtDepartmentID.Text))
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

        //////////////////////////////////////////////////////////////////////////////////////////////////       
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            Department department = departmentBUS.GetDepartment().FirstOrDefault(dp => dp.DP_ID == txtDepartmentID.Text);
            string departmentName = txtDepartmentName.Text;
            if (departmentName != department.DepartmentName)
                changes.Add($"- Tên phòng ban {department.DepartmentName} -> Tên phòng ban: {departmentName}");
            return string.Join("\n", changes);
        }      
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtDepartmentName, departmentBUS.GetDepartment().FirstOrDefault(dp => dp.DepartmentName == txtDepartmentName.Text && dp.DP_ID != txtDepartmentID.Text) != null ? "Tên phòng ban đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtDepartmentName) != string.Empty)
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
                Department department = new Department
                {
                    DP_ID = "",
                    DepartmentName = txtDepartmentName.Text
                };
                if (departmentBUS.Save(department))
                {
                    string operate = "Thêm";
                    string operationDetail = $"Thêm phòng ban: {txtDepartmentName.Text}";
                    history.Save(staff.StaffID, operate, operationDetail);                    
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
        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if(!checkExist.CheckDepartment(txtDepartmentID.Text))
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
                Department department = departmentBUS.GetDepartment().FirstOrDefault(dp => dp.DP_ID == txtDepartmentID.Text);
                department.DepartmentName = txtDepartmentName.Text;
                if (departmentBUS.Save(department))
                {
                    string operationDetail = $"Sửa phòng ban {txtDepartmentID.Text}";
                    string operate = "Sửa";
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
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckDepartment(txtDepartmentID.Text))
                {
                    Reload();
                    return;
                }
                Department department = new Department
                {
                    DP_ID = txtDepartmentID.Text
                };
                if (departmentBUS.Delete(department))
                {
                    string operationDetail = $"Xoá phòng ban {txtDepartmentName.Text}";
                    string operate = "Xoá";
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
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }

        private void dgvDepartment_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtDepartmentID.Text = dgvDepartment.Rows[rowIndex].Cells[0].Value.ToString();
            txtDepartmentName.Text = dgvDepartment.Rows[rowIndex].Cells[1].Value.ToString();
            txtStaffAmount.Text = dgvDepartment.Rows[rowIndex].Cells[2].Value.ToString();
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadDepartment();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadDepartmentSearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
