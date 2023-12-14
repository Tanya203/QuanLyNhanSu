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
    public partial class FrmPosition : Form
    {
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;        
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly AuthorityBUS authorityBUS;
        private readonly PositionBUS positionBUS;
        private readonly DepartmentBUS departmentBUS;       
        private readonly AuthorizationBUS authorizationBUS;
        private readonly CheckExist checkExist;
        private readonly IEnumerable<Authority> authoritiesList;
        private Staff staff;
        public FrmPosition(string staffID)
        {
            InitializeComponent();
            positionBUS = new PositionBUS();
            departmentBUS = new DepartmentBUS();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Chức vụ");
            redirect = new FormHandle();
            authorizationBUS = new AuthorizationBUS();
            authorityBUS = new AuthorityBUS();
            checkExist = new CheckExist();
            authoritiesList = authorityBUS.GetAuthority();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Chức vụ", staff);
            nudFontSize.Value = (decimal)dgvPosition.RowsDefaultCellStyle.Font.Size;
        }
        private void frmQuanLyChucVu_Load(object sender, EventArgs e)
        {            
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);            
            InputStatus(false);
            Authorizations();
            LoadDepartment();
            LoadPosition();
        }

        private void Authorizations()
        {
            List<object> input = new List<object> { txtPositionName, cmbDepartment };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            authorizations.AuthorizeForm(input, function);
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { txtPositionName, cmbDepartment, txtPositionID, txtTotalStaff };
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                if (listInput[i] is ComboBox)
                {
                    typeof(TextBox).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
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
        private void LoadPosition()
        {
            Enabled = false;
            dgvPosition.Rows.Clear();
            IEnumerable<PositionViewModels> positionList = positionBUS.GetAllPosition();
            int rowAdd;
            foreach (var ps in positionList)
            {
                rowAdd = dgvPosition.Rows.Add();
                dgvPosition.Rows[rowAdd].Cells[0].Value = ps.PS_ID;
                dgvPosition.Rows[rowAdd].Cells[1].Value = ps.DepartmentName;
                dgvPosition.Rows[rowAdd].Cells[2].Value = ps.PositionName;
                dgvPosition.Rows[rowAdd].Cells[3].Value = positionBUS.PositionTotalStaff(ps.PS_ID);
            }
            Enabled = true;
        }
        private void LoadPositionSearch(string search)
        {
            Enabled = false;
            dgvPosition.Rows.Clear();
            IEnumerable<PositionViewModels> positionList = positionBUS.GetAllPositionSearch(search);
            int rowAdd;
            foreach (var ps in positionList)
            {
                rowAdd = dgvPosition.Rows.Add();
                dgvPosition.Rows[rowAdd].Cells[0].Value = ps.PS_ID;
                dgvPosition.Rows[rowAdd].Cells[1].Value = ps.DepartmentName;
                dgvPosition.Rows[rowAdd].Cells[2].Value = ps.PositionName;
                dgvPosition.Rows[rowAdd].Cells[3].Value = positionBUS.PositionTotalStaff(ps.PS_ID);
            }
            Enabled = true;
        }
        private void LoadDepartment()
        {
            cmbDepartment.DisplayMember = "DepartmentName";
            cmbDepartment.ValueMember = "DP_ID";
            cmbDepartment.DataSource = departmentBUS.GetDepartment();
            AutoAdjustComboBox.Adjust(cmbDepartment);
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtPositionID, cmbDepartment, txtPositionName, txtTotalStaff };
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
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmPosition open = new FrmPosition(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtPositionName };
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
            if (string.IsNullOrEmpty(txtPositionID.Text))
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
        /////////////////////////////////////////////////////////////////////////////////////////////
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            Position position = positionBUS.GetPosition().Where(ps => ps.PS_ID == txtPositionID.Text).FirstOrDefault();
            if (txtPositionName.Text != position.PositionName)
                changes.Add($"- Tên chức vụ: {position.PositionName} -> Tên chức vụ: {txtPositionName.Text}");
            if (cmbDepartment.SelectedValue.ToString() != position.DP_ID)
                changes.Add($"- Phòng ban: {position.Department.DepartmentName} -> Phòng ban: {cmbDepartment.Text}");
            return string.Join("\n", changes);
        }
        private bool CheckInputError()
        {
            errProvider.Clear();
            errProvider.SetError(txtPositionName, positionBUS.GetPosition().FirstOrDefault(ps => ps.PositionName == txtPositionName.Text && ps.PS_ID != txtPositionID.Text) != null ? "Tên chức vụ đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtPositionName) != string.Empty)
                return false;
            return true;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckDepartment(cmbDepartment.SelectedValue.ToString()))
                {
                    Reload();
                    return;
                }
                if (!CheckInputError())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                Position position = new Position
                {
                    PS_ID = "",
                    DP_ID = cmbDepartment.SelectedValue.ToString(),
                    PositionName = txtPositionName.Text,
                };
                if (positionBUS.Save(position))
                {
                    string operate = "Thêm";
                    string operationDetail = $"Thêm chức vụ: {txtPositionName.Text}\n - Phòng ban: {cmbDepartment.Text}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    string psID = positionBUS.GetPosition().FirstOrDefault(ps => ps.PositionName == txtPositionName.Text).PS_ID;
                    List<Authorization> authorizations = new List<Authorization>();
                    foreach (Authority auth in authoritiesList)
                    {
                            Authorization au = new Authorization()
                            {
                                AU_ID = auth.AU_ID,
                                PS_ID = psID,
                                Authorize = false,
                            };
                            authorizations.Add(au);                        
                    }
                    authorizationBUS.AddPosition(authorizations);
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
                if(!checkExist.CheckPosition(txtPositionID.Text))
                {
                    Reload();
                    return;
                }
                if (!CheckInputError())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string editDetail = CheckChange();
                Position position = positionBUS.GetPosition().FirstOrDefault(ps => ps.PS_ID == txtPositionID.Text);
                position.PositionName = txtPositionName.Text;
                position.DP_ID = cmbDepartment.SelectedValue.ToString();
                if (positionBUS.Save(position))
                {
                    string operationDetail = $"Sửa chức vụ {txtPositionID.Text}";
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
                if (!checkExist.CheckPosition(txtPositionID.Text))
                {
                    Reload();
                    return;
                }
                Position position = new Position
                {
                    PS_ID = txtPositionID.Text
                };
                if (positionBUS.Delete(position))
                {
                    string operationDetail = $"Xoá chức vụ {txtPositionName.Text}:\n - Phòng ban: {cmbDepartment.Text}";
                    string operate = "Xoá";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch(Exception ex)
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
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void dgvPosition_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtPositionID.Text = dgvPosition.Rows[rowIndex].Cells[0].Value.ToString();
            cmbDepartment.Text = dgvPosition.Rows[rowIndex].Cells[1].Value.ToString();
            txtPositionName.Text = dgvPosition.Rows[rowIndex].Cells[2].Value.ToString();
            txtTotalStaff.Text = dgvPosition.Rows[rowIndex].Cells[3].Value.ToString();
        }
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadPosition();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadPositionSearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void nudFontSize_ValueChanged(object sender, EventArgs e)
        {
            int fontSize = (int)nudFontSize.Value;
            dgvPosition.RowsDefaultCellStyle.Font = new Font(dgvPosition.Font.FontFamily, fontSize);
        }
    }
}
