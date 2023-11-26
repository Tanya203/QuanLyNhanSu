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
    public partial class FrmCardType : Form
    {
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly CardTypeBUS cardTypeBUS;
        private readonly CheckExist checkExist;
        private Staff staff;
        public FrmCardType(string staffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Loại phiếu");
            redirect = new FormHandle();
            cardTypeBUS = new CardTypeBUS();
            checkExist = new CheckExist();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Loại phiếu", staff);
        }
        private void FrmQuanLyLoaiPhieu_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            LoadCaculateMethod();
            Authorizations();
            LoadCardType();
        }
        private void Authorizations()
        {
            List<object> input = new List<object> { txtCardTypeName, cmbCaculateMethod };
            List<object> function = new List<object> { btnAdd, btnEdit, btnDelete, btnCancel };
            authorizations.AuthorizeForm(input, function);
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listoObject = new List<object> { txtCardTypeID, txtCardTypeCreateAmount, txtCardTypeName, cmbCaculateMethod };
            for (int i = 0; i < listoObject.Count; i++)
            {
                if (listoObject[i] is TextBox)
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listoObject[i], !value);
                if (listoObject[i] is ComboBox)
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listoObject[i], value);
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
        private void LoadCardType()
        {
            Enabled = false;
            dgvCardType.Rows.Clear();
            IEnumerable<CardTypeViewModels> cardTypes = cardTypeBUS.GetAllCardType();
            int rowAdd;
            foreach (var ct in cardTypes)
            {
                rowAdd = dgvCardType.Rows.Add();
                dgvCardType.Rows[rowAdd].Cells[0].Value = ct.CT_ID;
                dgvCardType.Rows[rowAdd].Cells[1].Value = ct.CardTypeName;
                dgvCardType.Rows[rowAdd].Cells[2].Value = ct.CaculateMethod;
                dgvCardType.Rows[rowAdd].Cells[3].Value = cardTypeBUS.CardTypeAmount(ct.CT_ID).ToString();
            }
            Enabled = true;
        }
        private void LoadCardTypeSearch(string search)
        {
            Enabled = false;
            dgvCardType.Rows.Clear();
            IEnumerable<CardTypeViewModels> cardTypes = cardTypeBUS.GetAllCardTypeSearch(search);
            int rowAdd;
            foreach (var ct in cardTypes)
            {
                rowAdd = dgvCardType.Rows.Add();
                dgvCardType.Rows[rowAdd].Cells[0].Value = ct.CT_ID;
                dgvCardType.Rows[rowAdd].Cells[1].Value = ct.CardTypeName;
                dgvCardType.Rows[rowAdd].Cells[2].Value = ct.CaculateMethod;
                dgvCardType.Rows[rowAdd].Cells[3].Value = cardTypeBUS.CardTypeAmount(ct.CT_ID).ToString();
            }
            Enabled = true;
        }
        /////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listObject = new List<object> { txtCardTypeID, txtCardTypeName, txtCardTypeName, cmbCaculateMethod };
            for (int i = 0; i < listObject.Count; i++)
            {
                if (listObject[i] is TextBox)   
                    typeof(TextBox).GetProperty("Text").SetValue(listObject[i], string.Empty);
                if (listObject[i] is ComboBox)
                    typeof(ComboBox).GetProperty("SelectedIndex").SetValue(listObject[i], 0);
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////s
        private void Reload()
        {
            FrmCardType open = new FrmCardType(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        //////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtCardTypeName };
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
        private void LoadCaculateMethod()
        {
            cmbCaculateMethod.Items.Add("Cộng");
            cmbCaculateMethod.Items.Add("Trừ");
            AutoAdjustComboBox.Adjust(cmbCaculateMethod);
            cmbCaculateMethod.SelectedIndex = 0;
        }
        private void EnableButton(object sender, EventArgs e)
        {
            bool check;
            if (string.IsNullOrEmpty(txtCardTypeID.Text))
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
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadCardType();
        }
        //////////////////////////////////////////////////////////////////////////////////////////
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            CardType cardType = cardTypeBUS.GetCardType().FirstOrDefault(ct => ct.CT_ID == txtCardTypeID.Text);
            if (txtCardTypeName.Text != cardType.CardTypeName)
                changes.Add($"- Tên loại phiếu: {cardType.CardTypeName} -> {txtCardTypeName.Text}");
            if(cmbCaculateMethod.Text != cardType.CaculateMethod)
                changes.Add($"- Hình thức tính: {cardType.CaculateMethod} -> {cmbCaculateMethod.Text}");
            return string.Join("\n", changes);
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                string cacualte = cmbCaculateMethod.Text;
                CardType cardType = new CardType
                {
                    CT_ID = "",
                    CardTypeName = txtCardTypeName.Text,
                    CaculateMethod = cacualte,
                };
                if (cardTypeBUS.Save(cardType))
                {
                    string operate = "Thêm";
                    string operationDetail = $"Thêm loại phiếu {txtCardTypeName.Text}:\n    - Hình thức tính: {cmbCaculateMethod.Text}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
            
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if(!checkExist.CheckCardType(txtCardTypeID.Text))
                {
                    Reload();
                    return;
                }
                string editDetail = CheckChange();
                CardType cardType = new CardType
                {
                    CT_ID = txtCardTypeID.Text,
                    CardTypeName = txtCardTypeName.Text,
                    CaculateMethod = cmbCaculateMethod.Text,
                };
                if (cardTypeBUS.Save(cardType))
                {
                    string operate = "Sửa";
                    string operationDetail = $"Sửa loại phiếu {txtCardTypeID.Text}";
                    if (!string.IsNullOrEmpty(editDetail))
                        operationDetail += $":\n{editDetail}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch(Exception ex) 
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckCardType(txtCardTypeID.Text))
                {
                    Reload();
                    return;
                }
                CardType cardType = new CardType
                {
                    CT_ID = txtCardTypeID.Text
                };
                if (cardTypeBUS.Delete(cardType))
                {
                    string operate = "Xoá";
                    string operationDetail = $"Xoá loại phiếu {txtCardTypeName.Text}:\n  - Hình thức tính: {cmbCaculateMethod.Text}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }

        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmCard open = new FrmCard(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void dgvCardType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtCardTypeID.Text = dgvCardType.Rows[rowIndex].Cells[0].Value.ToString();
            txtCardTypeName.Text = dgvCardType.Rows[rowIndex].Cells[1].Value.ToString();
            cmbCaculateMethod.Text = dgvCardType.Rows[rowIndex].Cells[2].Value.ToString();
            txtCardTypeCreateAmount.Text = dgvCardType.Rows[rowIndex].Cells[3].Value.ToString();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadCardTypeSearch(txtSearch.Text);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
