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
using System.Security.Principal;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmCard : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly CardBUS cardBUS;
        private readonly CardTypeBUS cardTypeBUS;
        private readonly CardDetailBUS cardDetailBUS;
        private Staff staff;
        private readonly string formatDate = "yyyy-MM-dd";
        public FrmCard(string staffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Phiếu");
            redirect = new FormHandle();
            cardBUS = new CardBUS();
            cardTypeBUS = new CardTypeBUS();
            cardDetailBUS = new CardDetailBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Phiếu", staff);
        }
        private void FrmPhieuThuong_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);            
            InputStatus(false);
            DetaillButton();
            if (Authorizations() == "access")
                btnCardType.Visible = true;
            else if (Authorizations() == "operate")
                DeleteButton();
            else if (Authorizations() == "full")
            {
                btnCardType.Visible = true;
                DeleteButton();
            }
            LoadCard();
            LoadCardType();
        }
        private string Authorizations()
        {
            List<object> input = new List<object> { cmbCardType };
            List<object> function = new List<object> { btnAdd };
            return authorizations.AuthorizeForm(input, function);
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listObject = new List<object> { cmbCardType };
            for (int i = 0; i < listObject.Count; i++)
            {
                if (listObject[i] is ComboBox)
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listObject[i], value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButton = new List<Button> { btnAdd, btnCardType };            
            for (int i = 0; i < listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
            }
        }
        private void LoadCard()
        {
            Enabled = false;
            dgvCard.Rows.Clear();
            IEnumerable<CardViewModels> cards = cardBUS.GetAllCard();
            int rowAdd;
            foreach (var c in cards)
            {
                rowAdd = dgvCard.Rows.Add();
                dgvCard.Rows[rowAdd].Cells[0].Value = c.CardID;
                dgvCard.Rows[rowAdd].Cells[1].Value = c.CardTypeName;
                dgvCard.Rows[rowAdd].Cells[2].Value = c.StaffID;
                dgvCard.Rows[rowAdd].Cells[3].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(c.FullName);
                dgvCard.Rows[rowAdd].Cells[4].Value = c.Department;
                dgvCard.Rows[rowAdd].Cells[5].Value = c.Position;
                dgvCard.Rows[rowAdd].Cells[6].Value = c.CreateDate.ToString(formatDate);
                dgvCard.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.TotalAmount(c.CardID));
                dgvCard.Rows[rowAdd].Cells[8].Value = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.TotalDeliver(c.CardID));
            }
            Enabled = true;
        }        
        private void LoadCardSearch(string search)
        {
            Enabled = false;
            dgvCard.Rows.Clear();
            IEnumerable<CardViewModels> cards = cardBUS.GetAllCardSearch(search);
            int rowAdd;
            foreach (var c in cards)
            {
                rowAdd = dgvCard.Rows.Add();
                dgvCard.Rows[rowAdd].Cells[0].Value = c.CardID;
                dgvCard.Rows[rowAdd].Cells[1].Value = c.CardTypeName;
                dgvCard.Rows[rowAdd].Cells[2].Value = c.StaffID;
                dgvCard.Rows[rowAdd].Cells[3].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(c.FullName);
                dgvCard.Rows[rowAdd].Cells[4].Value = c.Department;
                dgvCard.Rows[rowAdd].Cells[5].Value = c.Position;
                dgvCard.Rows[rowAdd].Cells[6].Value = c.CreateDate.ToString(formatDate);
                dgvCard.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.TotalAmount(c.CardID));
                dgvCard.Rows[rowAdd].Cells[8].Value = String.Format(fVND, "{0:N3} ₫", cardDetailBUS.TotalDeliver(c.CardID));
            }
            Enabled = true;
        }
        private void LoadCardType()
        {
            cmbCardType.DisplayMember = "CardTypeName";
            cmbCardType.ValueMember = "CT_ID";
            cmbCardType.DataSource = cardTypeBUS.GetCardType();
            AutoAdjustComboBox.Adjust(cmbCardType);
        }
        //////////////////////////////////////////////////////////////////////////////
        private void DetaillButton()
        {
            DataGridViewButtonColumn btnChiTiet = new DataGridViewButtonColumn();
            {
                btnChiTiet.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnChiTiet.Text = "Chi tiết";
                btnChiTiet.UseColumnTextForButtonValue = true;
                btnChiTiet.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnChiTiet.DefaultCellStyle = buttonCellStyle;
                dgvCard.Columns.Add(btnChiTiet);
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
                dgvCard.Columns.Add(btnXoa);
            }
        }
        private void OpenCardDetail(string staffID, string cardID)
        {
            FrmCardDetail open = new FrmCardDetail(staffID, cardID);
            redirect.RedirectForm(open);
        }
        private void DeleteCard(string cardID, string cardType, string dateCreate)
        {
            try
            {
                string caculate = cardTypeBUS.GetCardType().FirstOrDefault(ct => ct.CardTypeName == cardType).CaculateMethod;
                List<CardDetail> cardDetails = cardDetailBUS.GetCardDetail().Where(cd => cd.CardID == cardID).ToList();
                List<Staff> staffs = new List<Staff>();
                Card card = new Card()
                {
                    CardID = cardID,
                };
                if (cardBUS.Delete(card))
                {
                    string operate = "Xoá";
                    string operateDetail = $"Xoá {cardType} lập ngày {dateCreate}";
                    history.Save(staff.StaffID, operate, operateDetail);
                    if (caculate == "Trừ")
                    {
                        foreach (CardDetail staff in cardDetails)
                        {
                            staff.Staff.Dept -= staff.Amount;
                            staffs.Add(staff.Staff);
                        }
                        staffBUS.UpdateDept(staffs);
                    }
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        //////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmCard open = new FrmCard(staff.StaffID);
            redirect.RedirectForm(open);
        }
        ///////////////////////////////////////////////////////////////////////
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadCard();
        }
        //////////////////////////////////////////////////////////////////////////////
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                Card card = new Card
                {
                    CardID = "",
                    CT_ID = cmbCardType.SelectedValue.ToString(),
                    StaffID = staff.StaffID,
                    DateCreated = DateTime.Now,
                };
                if (cardBUS.Save(card))
                {
                    string operate = "Thêm";
                    string operationDetail = "Thêm phiếu thưởng";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }                
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void dgvCard_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            string cardID = dgvCard.Rows[rowIndex].Cells[0].Value.ToString();
            string cardType = dgvCard.Rows[rowIndex].Cells[1].Value.ToString();
            string dateCreate = dgvCard.Rows[rowIndex].Cells[6].Value.ToString();
            if (e.ColumnIndex == 9)
                OpenCardDetail(staff.StaffID, cardID);
            if (e.ColumnIndex == 10)
                DeleteCard(cardID, cardType, dateCreate);
            
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadCardSearch(txtSearch.Text);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnCardType_Click(object sender, EventArgs e)
        {
            FrmCardType open = new FrmCardType(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void cmbCardType_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cmbCardType.Text))
                btnAdd.Enabled = true;
            else
                btnAdd.Enabled = false;
        }
    }
}
