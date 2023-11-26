using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmCardDetail : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly DepartmentBUS departmentBUS;
        private readonly PositionBUS positionBUS;
        private readonly CardBUS cardBUS;
        private readonly CardDetailBUS cardDetailBUS;
        private readonly CheckExist checkExist;
        private Staff staff;
        private Card card;
        public FrmCardDetail(string staffID, string cardID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Chi tiết phiếu");
            redirect = new FormHandle();
            cardBUS = new CardBUS();
            cardDetailBUS = new CardDetailBUS();
            departmentBUS = new DepartmentBUS();
            positionBUS = new PositionBUS();
            checkExist = new CheckExist();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            card = cardBUS.GetCard().FirstOrDefault(c => c.CardID == cardID);
            authorizations = new Authorizations("Chi tiết phiếu", staff);
        }
        private void FrmChiTietPhieuThuong_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            DisableDisplay();
            InputStatus(false);
            if (Authorizations())                
                DeleteButton();
            LoadDepartment();
            LoadCardInfo();
            LoadCardDetail();
        }
        private bool Authorizations()
        {
            List<object> input = new List<object> { cmbPosition, cmbStaff, cmbDepartment, txtAmount, rtxtNote, txtDeliver };
            List<object> function = new List<object> { btnAdd, btnEdit, btnCancel };
            if (authorizations.AuthorizeForm(input, function) == "operate")
                return true;
            return false;
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { cmbDepartment, cmbPosition, cmbStaff, txtAmount, rtxtNote, txtDeliver };
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
                else if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                else if (listInput[i] is RichTextBox)
                {
                    typeof(RichTextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButton = new List<Button> { btnAdd, btnEdit, btnCancel };
            for (int i = 0; i < listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                if (value && listButton[i] != btnCancel)
                    typeof(Button).GetProperty("Enabled").SetValue(listButton[i], !value);
            }
        }
        private void DisableDisplay()
        {
            List<object> listDisplay = new List<object> { txtCardID, txtCardType, txtFullNameCreate, txtPosition, txtPosition, dtpDateCreate, txtTotalAmount, txtStaffIDEdit, txtFullName, txtStaffIDCreate, txtDepartment, txtTotalDeliver };
            for (int i = 0; i < listDisplay.Count; i++)
            {
                if (listDisplay[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
                    continue;
                }
                else if (listDisplay[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listDisplay[i], false);
                    continue;
                }
            }
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
            List<Staff> staffList = staffBUS.GetStaff().Where(s => s.PS_ID == psID).ToList();
            List<CardDetail> cardDetails = cardDetailBUS.GetCardDetail().Where(c => c.CardID == card.CardID).ToList();
            foreach (var c in cardDetails)
                staffList.RemoveAll(s => s.StaffID == c.StaffID);
            cmbStaff.DataSource = staffList;
            if (string.IsNullOrEmpty(cmbStaff.Text))
            {
                cmbStaff.Enabled = false;             
                txtFullName.Text = string.Empty;
            }
            else
            {
                cmbStaff.Enabled = true;
                txtFullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staffList[0].LastName}{staffList[0].MiddleName}{staffList[0].FirstName}");
            }
            AutoAdjustComboBox.Adjust(cmbStaff);
        }
        private void cmbDepartment_TextChanged(object sender, EventArgs e)
        {
            LoadPositionByDepartment(cmbDepartment.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbStaff.Text) && string.IsNullOrEmpty(txtStaffIDEdit.Text))
                txtFullName.Text = string.Empty;
            else
                txtAmount.Text = string.Empty;
        }
        private void cmbPosition_TextChanged(object sender, EventArgs e)
        {
            LoadStaffByPosition(cmbPosition.SelectedValue.ToString());
        }
        public void LoadCardInfo()
        {
            txtCardID.Text = card.CardID;
            txtCardType.Text = card.CardType.CardTypeName;
            txtStaffIDCreate.Text = card.StaffID;
            txtFullNameCreate.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{card.Staff.LastName}{card.Staff.MiddleName}{card.Staff.FirstName}");
            txtDepartment.Text = card.Staff.Position.Department.DepartmentName;
            txtPosition.Text = card.Staff.Position.PositionName;
            dtpDateCreate.Text = card.DateCreated.ToString();
            txtTotalAmount.Text = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.TotalAmount(card.CardID));
            txtTotalDeliver.Text = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.TotalDeliver(card.CardID));
        }
        private void LoadCardDetail()
        {
            Enabled = false;
            dgvCardDetail.Rows.Clear();
            IEnumerable<CardDetailViewModels> cardDetails = cardDetailBUS.GetAllCardDetail(card.CardID);
            int rowAdd;
            foreach (var c in cardDetails)
            {
                rowAdd = dgvCardDetail.Rows.Add();
                dgvCardDetail.Rows[rowAdd].Cells[0].Value = c.CardID;
                dgvCardDetail.Rows[rowAdd].Cells[1].Value = c.CardTypeName;
                dgvCardDetail.Rows[rowAdd].Cells[2].Value = c.StaffID;
                dgvCardDetail.Rows[rowAdd].Cells[3].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(c.FullName);
                dgvCardDetail.Rows[rowAdd].Cells[4].Value = c.Department;
                dgvCardDetail.Rows[rowAdd].Cells[5].Value = c.Position;
                dgvCardDetail.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", c.Amount);
                dgvCardDetail.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", c.Deliver);
                dgvCardDetail.Rows[rowAdd].Cells[8].Value = c.Note;
            }
            Enabled = true;
        }
        private void LoadCardDetailSearch(string search)
        {
            Enabled = false;
            dgvCardDetail.Rows.Clear();
            IEnumerable<CardDetailViewModels> cardDetails = cardDetailBUS.GetAllCardDetailSearch(card.CardID, search);
            int rowAdd;
            foreach (var c in cardDetails)
            {
                rowAdd = dgvCardDetail.Rows.Add();
                dgvCardDetail.Rows[rowAdd].Cells[0].Value = c.CardID;
                dgvCardDetail.Rows[rowAdd].Cells[1].Value = c.CardTypeName;
                dgvCardDetail.Rows[rowAdd].Cells[2].Value = c.StaffID;
                dgvCardDetail.Rows[rowAdd].Cells[3].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(c.FullName);
                dgvCardDetail.Rows[rowAdd].Cells[4].Value = c.Department;
                dgvCardDetail.Rows[rowAdd].Cells[5].Value = c.Position;
                dgvCardDetail.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", c.Amount);
                dgvCardDetail.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", c.Deliver);
                dgvCardDetail.Rows[rowAdd].Cells[8].Value = c.Note;
            }
            Enabled = true;
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void cmbStaffID_SelectedIndexChanged(object sender, EventArgs e)
        {
            pbStaffPicture.Image = Properties.Resources.image;
            if (string.IsNullOrEmpty(cmbStaff.Text))
            {
                btnAdd.Enabled = false;
                txtFullName.Text = string.Empty;
                txtStaffIDEdit.Text = string.Empty;
                txtAmount.Text = string.Empty;
                rtxtNote.Text = string.Empty;
            }
            else
            {
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == cmbStaff.Text);
                txtStaffIDEdit.Text = string.Empty;
                txtAmount.Text = string.Empty;
                rtxtNote.Text = string.Empty;
                txtDeliver.Text = string.Empty;
                txtFullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staff.LastName}{staff.MiddleName}{staff.FirstName}");
                ImageHandle.LoadImage(pbStaffPicture, staff.Picture);
            }
        }
        private void EnableButton()
        {
            if (string.IsNullOrEmpty(cmbStaff.Text) && string.IsNullOrEmpty(txtAmount.Text) || string.IsNullOrEmpty(txtAmount.Text))
            {
                btnAdd.Enabled = btnEdit.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(cmbStaff.Text) && !string.IsNullOrEmpty(txtAmount.Text) && string.IsNullOrEmpty(txtStaffIDEdit.Text))
            {
                btnAdd.Enabled = true;
                btnEdit.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtStaffIDEdit.Text) && !string.IsNullOrEmpty(txtAmount.Text))
            {
                btnAdd.Enabled = false;
                btnEdit.Enabled = true;
                return;
            }
        }
        private void OnOffButton(object sender, EventArgs e)
        {
            EnableButton();
        }
        private void dgvCardDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            pbStaffPicture.Image = Properties.Resources.image;
            cmbDepartment.Text = dgvCardDetail.Rows[rowIndex].Cells[4].Value.ToString();
            cmbPosition.Text = dgvCardDetail.Rows[rowIndex].Cells[5].Value.ToString();
            txtFullName.Text = dgvCardDetail.Rows[rowIndex].Cells[3].Value.ToString();
            txtStaffIDEdit.Text = dgvCardDetail.Rows[rowIndex].Cells[2].Value.ToString();
            txtAmount.Text = cardDetailBUS.StaffAmount(txtStaffIDEdit.Text, txtCardID.Text).ToString();
            txtDeliver.Text = cardDetailBUS.StaffDeliver(txtStaffIDEdit.Text, txtCardID.Text).ToString();
            rtxtNote.Text = dgvCardDetail.Rows[rowIndex].Cells[8].Value is null ? string.Empty : dgvCardDetail.Rows[rowIndex].Cells[8].Value.ToString();
            if (e.ColumnIndex == 9)
                DeleteStaff(txtStaffIDEdit.Text);
            byte[] imageBytes = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffIDEdit.Text).Picture;
            ImageHandle.LoadImage(pbStaffPicture, imageBytes);
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            pbStaffPicture.Image = Properties.Resources.image;
            List<object> listInput = new List<object> { txtAmount, txtFullName, rtxtNote, cmbDepartment, txtStaffIDEdit, txtDeliver };
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if (listInput[i] is RichTextBox)
                {
                    typeof(RichTextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if (listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("SelectedIndex").SetValue(listInput[i], 0);
                    continue;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////   
        private void Reload()
        {
            FrmCardDetail open = new FrmCardDetail(staff.StaffID, card.CardID);
            redirect.RedirectForm(open, this);
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void txtAmount_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyRealNumber(sender, e);
        }
        private void txtDeliver_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyRealNumber(sender, e);
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            CardDetail staff = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.StaffID == txtStaffIDEdit.Text && c.CardID == card.CardID);
            string oldAmount = string.Format(fVND, "{0:N3} ₫", staff.Amount);
            string newAmount = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
            string oldDeliver = string.Format(fVND, "{0:N3} ₫", staff.Deliver);
            string newDeliver  = string.IsNullOrEmpty(txtDeliver.Text) ? string.Format(fVND, "{0:N3} ₫", 0) : string.Format(fVND, "{0:N3} ₫", txtDeliver.Text);
            if (oldAmount != newAmount)
                changes.Add($"- Số tiền: {oldAmount} -> Số tiền: {newAmount}");
            if (rtxtNote.Text != staff.Note)
                changes.Add($"- Ghi chú: {staff.Note} -> Ghi chú: {rtxtNote.Text}");
            if(oldDeliver != txtDeliver.Text)
                changes.Add($"- Đã giao: {oldDeliver} -> Đã giao: {rtxtNote.Text}");
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            decimal deliver = decimal.TryParse(txtDeliver.Text, out _) ? decimal.Parse(txtDeliver.Text) : 0;
            decimal amount = decimal.TryParse(txtAmount.Text, out _) ? decimal.Parse(txtAmount.Text) : 0;
            errProvider.SetError(txtAmount, double.TryParse(txtAmount.Text, out _) is false ? "Định dạng tiền không hợp lệ" : string.Empty);
            errProvider.SetError(txtDeliver, double.TryParse(txtDeliver.Text, out _) is false && string.IsNullOrEmpty(txtTotalDeliver.Text) ? "Định dạng tiền không hợp lệ" : string.Empty);
            errProvider.SetError(txtDeliver, deliver > amount ? "Tiền giao phải nhỏ hơn hoặc bằng số tiền trong phiếu" : string.Empty);
            errProvider.SetError(txtAmount, amount <= 0 ? "Số tiền phải lớn hơn 0" : string.Empty);
            if (errProvider.GetError(txtAmount) != string.Empty || errProvider.GetError(txtDeliver) != string.Empty)
                return false;
            return true;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckCard(txtCardID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                if (!checkExist.CheckStaff(cmbStaff.SelectedValue.ToString()) || !checkExist.CheckCardDetailInserted(txtCardID.Text, cmbStaff.SelectedValue.ToString()))
                {
                    Reload();
                    return;
                }
                if (!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                decimal deliver = string.IsNullOrEmpty(txtDeliver.Text) ? 0 : decimal.Parse(txtDeliver.Text);
                CardDetail cardDetail = new CardDetail
                {
                    CardID = card.CardID,
                    StaffID = cmbStaff.SelectedValue.ToString(),
                    Amount = decimal.Parse(txtAmount.Text),
                    Deliver = deliver,
                    Note = rtxtNote.Text,
                };
                if (cardDetailBUS.Save(cardDetail))
                {
                    string amount = string.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
                    string staffID = cmbStaff.SelectedValue.ToString();
                    string operate = "Thêm";
                    string operationDetail = $"Thêm nhân viên {staffID} vào {txtCardType.Text} {card.CardID}:\n - Số tiền: {amount}\n - Ghi chú: {rtxtNote.Text}";
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
                if (!checkExist.CheckCard(txtCardID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                if(!checkExist.CheckCardDetail(txtCardID.Text, txtStaffIDEdit.Text))
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
                decimal oldAmount = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == card.CardID && c.StaffID == txtStaffIDEdit.Text).Amount;
                decimal oldDeliver = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == card.CardID && c.StaffID == txtStaffIDEdit.Text).Deliver;
                decimal newAmount = decimal.Parse(txtAmount.Text);
                decimal newDeliver = decimal.Parse(txtDeliver.Text);
                decimal deliver = string.IsNullOrEmpty(txtDeliver.Text) ? 0 : decimal.Parse(txtDeliver.Text);
                CardDetail cardDetail = new CardDetail
                {
                    CardID = card.CardID,
                    StaffID = txtStaffIDEdit.Text,
                    Amount = decimal.Parse(txtAmount.Text),
                    Deliver = deliver,
                    Note = rtxtNote.Text,
                };
                if (cardDetailBUS.Save(cardDetail))
                {
                    string operate = "Sửa";
                    string operationDetail = $"Sửa nhân viên {cardDetail.StaffID} trong {txtCardType.Text} {card.CardID}";
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
        private void DeleteButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Xoá";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvCardDetail.Columns.Add(btnXoa);
            }
        }
        public void DeleteStaff(string staffID)
        {
            try
            {
                if (!checkExist.CheckCard(txtCardID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                if (!checkExist.CheckCardDetail(txtCardID.Text, txtStaffIDEdit.Text))
                {
                    Reload();
                    return;
                }
                decimal amount = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == card.CardID && c.StaffID == txtStaffIDEdit.Text).Amount;
                decimal deliver = cardDetailBUS.GetCardDetail().FirstOrDefault(c => c.CardID == card.CardID && c.StaffID == txtStaffIDEdit.Text).Deliver;
                CardDetail cardDetail = new CardDetail()
                {
                    CardID = txtCardID.Text,
                    StaffID = staffID,
                };
                if (cardDetailBUS.Delete(cardDetail))
                {
                    string amountString = string.Format(fVND, "{0:N3} ₫", amount);
                    string operate = "Xoá";
                    string operationDetail = $"Xoá nhân viên {staffID} khỏi {txtCardType.Text} {card.CardID}:\n - Số tiền: {amountString}\n - Ghi chú: {rtxtNote.Text}";
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
            FrmCard open = new FrmCard(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }

        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadCardDetail();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadCardDetailSearch(txtSearch.Text);
            }

        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        
    }
}
