using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmContractType : Form
    {
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly ContractTypeBUS contractTypeBUS;
        private readonly TimeKeepingMethodBUS timeKeepingMethodBUS;
        private Staff staff;
        public FrmContractType(string staffID)
        {
            InitializeComponent();            
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Loại hợp đồng");
            redirect = new FormHandle();
            contractTypeBUS = new ContractTypeBUS();
            timeKeepingMethodBUS = new TimeKeepingMethodBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Loại hợp đồng", staff);
        }
        private void frmQuanLyLoaiHopDong_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            Aithorizations();
            LoadTimeKeepingMethod();            
            LoadContractType();
        }

        private void Aithorizations()
        {
            List<object> input = new List<object> { txtContractTypeName, cmbTimekeepingMethod };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            authorizations.AuthorizeForm(input, function);
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { txtContractTypeName, cmbTimekeepingMethod, txtContractTypeID, txtStaffAmount };
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
        private void LoadTimeKeepingMethod()
        {
            cmbTimekeepingMethod.DisplayMember = "TimeKeepingMethodName";
            cmbTimekeepingMethod.ValueMember = "TKM_ID";
            cmbTimekeepingMethod.DataSource = timeKeepingMethodBUS.GetTimeKeepingMethod();
            AutoAdjustComboBox.Adjust(cmbTimekeepingMethod);
        }
        private void LoadContractType()
        {
            Enabled = false;
            dgvContractType.Rows.Clear();
            IEnumerable<ContractTypeViewModels> contractTypes = contractTypeBUS.GetAllContractType();
            int rowAdd;
            foreach (var ct in contractTypes)
            {
                rowAdd = dgvContractType.Rows.Add();
                dgvContractType.Rows[rowAdd].Cells[0].Value = ct.CT_ID;
                dgvContractType.Rows[rowAdd].Cells[1].Value = ct.ContractTypeName;
                dgvContractType.Rows[rowAdd].Cells[2].Value = ct.TimeKeepingMethod;
                dgvContractType.Rows[rowAdd].Cells[3].Value = contractTypeBUS.TotalContractTypeStaff(ct.CT_ID).ToString();
            }
            Enabled = true;
        }        
        private void LoadContractTypeSearch(string search)
        {
            Enabled = false;
            dgvContractType.Rows.Clear();
            IEnumerable<ContractTypeViewModels> contractTypes = contractTypeBUS.GetAllContractTypeSearch(search);
            int rowAdd;
            foreach (var ct in contractTypes)
            {
                rowAdd = dgvContractType.Rows.Add();
                dgvContractType.Rows[rowAdd].Cells[0].Value = ct.CT_ID;
                dgvContractType.Rows[rowAdd].Cells[1].Value = ct.ContractTypeName;
                dgvContractType.Rows[rowAdd].Cells[2].Value = ct.TimeKeepingMethod;
                dgvContractType.Rows[rowAdd].Cells[3].Value = contractTypeBUS.TotalContractTypeStaff(ct.CT_ID).ToString();
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtContractTypeID, txtContractTypeName, txtStaffAmount, cmbTimekeepingMethod };
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmContractType open = new FrmContractType(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtContractTypeName };
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
            if (string.IsNullOrEmpty(txtContractTypeID.Text))
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            ContractType ct = contractTypeBUS.GetContractType().FirstOrDefault(c => c.CT_ID == txtContractTypeID.Text);
            string contractTypeName = txtContractTypeName.Text;
            string timeKeepingMethod = cmbTimekeepingMethod.Text;
            if (contractTypeName != ct.ContractTypeName)
                changes.Add($"- Tên loại hợp đồng {ct.ContractTypeName} -> Tên loại hợp đồng: {contractTypeName}");
            if (timeKeepingMethod != ct.TimeKeepingMethod.TimeKeepingMethodName)
                changes.Add($"- Hình thức chấm công: {ct.TimeKeepingMethod.TimeKeepingMethodName} -> Hình thức chấm công: {timeKeepingMethod}");
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtContractTypeName, contractTypeBUS.GetContractType().FirstOrDefault(ct => ct.ContractTypeName == txtContractTypeName.Text) != null ? "Tên loại hợp đồng đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtContractTypeName) != string.Empty)
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
                ContractType contractType = new ContractType
                {
                    CT_ID = "",
                    ContractTypeName = txtContractTypeName.Text,
                    TKM_ID = cmbTimekeepingMethod.SelectedValue.ToString(),
                };
                if (contractTypeBUS.Save(contractType))
                {
                    string operate = "Thêm";
                    string operationDetail = $"Thêm loại hợp đồng: {txtContractTypeName.Text}\n - Phòng ban: {cmbTimekeepingMethod.Text}";
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
                if (!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string editDetail = CheckChange();
                ContractType contractType = new ContractType
                {
                    CT_ID = txtContractTypeID.Text,
                    ContractTypeName = txtContractTypeName.Text,
                    TKM_ID = cmbTimekeepingMethod.SelectedValue.ToString(),
                };
                if (contractTypeBUS.Save(contractType))
                {
                    string operationDetail = $"Sửa loại hợp đồng {txtContractTypeID.Text}";
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
                ContractType contractType = new ContractType
                {
                    CT_ID = txtContractTypeID.Text
                };
                if (contractTypeBUS.Delete(contractType))
                {
                    string operationDetail = $"Xoá loại hợp đồng {txtContractTypeName.Text}:\n - Phòng ban: {cmbTimekeepingMethod.Text}";
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
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
        }
        private void dgvContractType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtContractTypeID.Text = dgvContractType.Rows[rowIndex].Cells[0].Value.ToString();
            txtContractTypeName.Text = dgvContractType.Rows[rowIndex].Cells[1].Value.ToString();
            cmbTimekeepingMethod.Text = dgvContractType.Rows[rowIndex].Cells[2].Value.ToString();
            txtStaffAmount.Text = dgvContractType.Rows[rowIndex].Cells[3].Value.ToString();
        }
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadContractType();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadContractTypeSearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
