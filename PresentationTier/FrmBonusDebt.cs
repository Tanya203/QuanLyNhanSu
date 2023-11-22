using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmBonusDebt : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly CardDetailBUS cardDetailBUS;
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        private readonly PositionBUS positionBUS;
        private readonly DepartmentBUS departmentBUS;
        private readonly BonusDebtBUS bonusDebtBUS;
        private Staff staff;
        private bool checkLoad;
        private readonly string formatMonth = "MM/yyyy";
        public FrmBonusDebt(string staffID)
        {
            InitializeComponent();
            redirect = new FormHandle();
            staffBUS = new StaffBUS();
            cardDetailBUS = new CardDetailBUS();
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
            positionBUS = new PositionBUS();
            departmentBUS = new DepartmentBUS();
            bonusDebtBUS = new BonusDebtBUS();
            history = new SaveOperateHistory("Thưởng - nợ");
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Thưởng - nợ", staff);
            checkLoad = false;
        }

        private void FrmBonusDebt_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            DisableDisplay();
            InputStatus(false);
            Authorizations();
            LoadType();
            LoadDepartment();
        }
        private bool Authorizations()
        {
            List<object> input = new List<object> { txtDeliver, rtxtNote };
            List<object> function = new List<object> { btnUpdate };
            if (authorizations.AuthorizeForm(input, function) == "operate" || authorizations.AuthorizeForm(input, function) == "full")
                return true;
            return false;
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> {  txtDeliver, rtxtNote };
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                if (listInput[i] is RichTextBox)
                {
                    typeof(RichTextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnUpdate };
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
            }
        }
        private void DisableDisplay()
        {
            List<object> listDisplay = new List<object> { txtFullName, txtCardID, txtCardType, txtAmount };
            for (int i = 0; i < listDisplay.Count; i++)
            {
                if (listDisplay[i] is TextBox)
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
            }
        }
        private void LoadBonusDebtStaff(string staffID, string type)
        {
            Enabled = false;
            dgvBonusDebt.Rows.Clear();
            IEnumerable<BonusDebtViewModels> bonusDebt = bonusDebtBUS.GetAllBonusDebt(staffID, type);
            int rowAdd;
            foreach (var bd in bonusDebt)
            {
                rowAdd = dgvBonusDebt.Rows.Add();
                dgvBonusDebt.Rows[rowAdd].Cells[0].Value = bd.StaffID;
                dgvBonusDebt.Rows[rowAdd].Cells[1].Value = bd.CardID;
                dgvBonusDebt.Rows[rowAdd].Cells[2].Value = bd.CardType;
                dgvBonusDebt.Rows[rowAdd].Cells[3].Value = bd.Department;
                dgvBonusDebt.Rows[rowAdd].Cells[4].Value = bd.Position;
                dgvBonusDebt.Rows[rowAdd].Cells[5].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(bd.FullName);
                dgvBonusDebt.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", bd.Amount);
                dgvBonusDebt.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", bd.Deliver);
                dgvBonusDebt.Rows[rowAdd].Cells[8].Value = bd.Note;
            }
            Enabled = true;
        }
        private void LoadBonusDebtStaffSearch(string staffID, string type ,string search)
        {
            Enabled = false;
            dgvBonusDebt.Rows.Clear();
            IEnumerable<BonusDebtViewModels> bonusDebt = bonusDebtBUS.GetAllBonusDebtSearch(staffID, type ,search);
            int rowAdd;
            foreach (var bd in bonusDebt)
            {
                rowAdd = dgvBonusDebt.Rows.Add();
                dgvBonusDebt.Rows[rowAdd].Cells[0].Value = bd.StaffID;
                dgvBonusDebt.Rows[rowAdd].Cells[1].Value = bd.CardID;
                dgvBonusDebt.Rows[rowAdd].Cells[2].Value = bd.CardType;
                dgvBonusDebt.Rows[rowAdd].Cells[3].Value = bd.Department;
                dgvBonusDebt.Rows[rowAdd].Cells[4].Value = bd.Position;
                dgvBonusDebt.Rows[rowAdd].Cells[5].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(bd.FullName);
                dgvBonusDebt.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", bd.Amount);
                dgvBonusDebt.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", bd.Deliver);
                dgvBonusDebt.Rows[rowAdd].Cells[8].Value = bd.Note;
            }
            Enabled = true;
        }
        private void Reload()
        {
            FrmBonusDebt open = new FrmBonusDebt(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void LoadType()
        {
            cmbType.Items.Add("Cộng");
            cmbType.Items.Add("Trừ");
            cmbType.SelectedIndex = 0;
        }
        private void LoadDepartment()
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
        private void LoadStaffByPosition(string psID)
        {
            cmbStaff.DisplayMember = "StaffID";
            cmbStaff.ValueMember = "StaffID";
            cmbStaff.DataSource = staffBUS.GetStaff().Where(s => s.PS_ID == psID).ToList();
            pbStaffPicture.Image = Properties.Resources.image;
            if (string.IsNullOrEmpty(cmbStaff.Text))
            {
                cmbStaff.Enabled = false;
                btnUpdate.Enabled = false;
            }
            else
            {
                cmbStaff.Enabled = true;
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == cmbStaff.Text);
                txtFullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staff.LastName}{staff.MiddleName}{staff.FirstName}");
                ImageHandle.LoadImage(pbStaffPicture, staff.Picture);
            }
            LoadBonusDebtStaff(cmbStaff.Text, cmbType.Text);
            AutoAdjustComboBox.Adjust(cmbStaff);
        }
        private void cmbType_TextChanged(object sender, EventArgs e)
        {
            ClearText();
            if (checkLoad)
                LoadBonusDebtStaff(cmbStaff.Text, cmbType.Text);
            else
                checkLoad = true;
        }
        private void cmbDepartment_TextChanged(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearText();
            LoadPositionByDepartment(cmbDepartment.SelectedValue.ToString());
        }

        private void cmbPosition_TextChanged(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearText();
            LoadStaffByPosition(cmbPosition.SelectedValue.ToString());
        }

        private void cmbStaff_TextChanged(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearText();
            pbStaffPicture.Image = Properties.Resources.image;
            LoadBonusDebtStaff(cmbStaff.Text, cmbType.Text);
        }
        private void MoneyInput(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyRealNumber(sender, e);
        }
        public void ClearText()
        {
            txtCardID.Text = string.Empty;
            txtCardType.Text = string.Empty;
            txtAmount.Text = string.Empty;
            txtDeliver.Text = string.Empty;
        }
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            CardDetail cardDetail = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == txtCardID.Text && c.StaffID == cmbStaff.Text);
            string oldDeliver = String.Format(fVND, "{0:N3} ₫", cardDetail.Deliver);
            string newDeliver = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtDeliver.Text));
            if (oldDeliver != newDeliver)
                changes.Add($"- Đã giao: {oldDeliver} -> Đã giao : {newDeliver}");
            if (cardDetail.Note != rtxtNote.Text)
                changes.Add($"- Ghi chú: {cardDetail.Note} -> Ghi chú : {rtxtNote.Text}");
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            decimal deliver = decimal.TryParse(txtDeliver.Text, out _) ? decimal.Parse(txtDeliver.Text) : 0;
            decimal amount = decimal.Parse(txtAmount.Text);
            errProvider.SetError(txtDeliver, double.TryParse(txtDeliver.Text, out _) is false && string.IsNullOrEmpty(txtDeliver.Text) ? "Định dạng tiền không hợp lệ" : string.Empty);
            errProvider.SetError(txtDeliver, deliver > amount ? "Tiền giao phải nhỏ hơn hoặc bằng số tiền trong phiếu" : string.Empty);
            if (errProvider.GetError(txtDeliver) != string.Empty)
                return false;
            return true;
        }
        private void dgvBonusDebt_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtCardID.Text = dgvBonusDebt.Rows[rowIndex].Cells[1].Value.ToString();
            txtCardType.Text = dgvBonusDebt.Rows[rowIndex].Cells[2].Value.ToString();
            txtAmount.Text = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == txtCardID.Text && c.StaffID == cmbStaff.Text).Amount.ToString();
            txtDeliver.Text = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == txtCardID.Text && c.StaffID == cmbStaff.Text).Deliver.ToString();
            rtxtNote.Text = dgvBonusDebt.Rows[rowIndex].Cells[8].Value.ToString();
        }
        private bool CheckEmptyText()
        {
            if(string.IsNullOrEmpty(txtCardID.Text) || string.IsNullOrEmpty(txtCardType.Text) || string.IsNullOrEmpty(txtAmount.Text) || string.IsNullOrEmpty(txtDeliver.Text))
                return false;
            return true;
        }
        private void OnOffButton(object sender, EventArgs e)
        {
            if (CheckEmptyText())
                btnUpdate.Enabled = true;
            else
                btnUpdate.Enabled = false;
        }
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (!CheckErrorInput())
            {
                MessageBox.Show("Lỗi","Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                CardDetail cardDetail = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == txtCardID.Text && c.StaffID == cmbStaff.Text);
                decimal oldDeliver = cardDetail.Deliver;
                decimal newDeliver = decimal.Parse(txtDeliver.Text);
                cardDetail.Amount = decimal.Parse(txtAmount.Text);
                cardDetail.Deliver = decimal.Parse(txtDeliver.Text);
                cardDetail.Note = rtxtNote.Text;
                string editDetail = CheckChange();
                if (cardDetailBUS.Save(cardDetail))
                {
                    string operate = "Cập nhật";
                    string operationDetail = $"Cập nhật số tiền giao nhân viên {cardDetail.StaffID} trong phiếu {cardDetail.Card.CardType.CardTypeName} {cardDetail.CardID}";
                    if (editDetail != null)
                        operationDetail += $":\n{editDetail}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    if(oldDeliver != newDeliver)
                    {
                        MonthSalaryDetail salaryDetails = monthSalaryDetailBUS.GetMonthSalaryDetails().FirstOrDefault(m => m.MonthID == DateTime.Now.ToString(formatMonth));
                        if(cmbType.Text == "Trừ")
                        {
                            if(oldDeliver > newDeliver)
                                salaryDetails.TotalDebtPaid -= oldDeliver - newDeliver;
                            else if(oldDeliver < newDeliver)
                                salaryDetails.TotalDebtPaid += newDeliver - oldDeliver;
                            monthSalaryDetailBUS.Save(salaryDetails);
                        }
                    }
                    Reload();
                }
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadBonusDebtStaffSearch(cmbStaff.SelectedValue.ToString(), cmbType.Text, txtSearch.Text);
        }

        
    }
}
