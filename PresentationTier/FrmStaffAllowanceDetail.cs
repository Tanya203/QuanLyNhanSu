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
    public partial class FrmStaffAllowanceDetail : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly AllowanceBUS allowanceBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly CheckExist checkExist;
        private readonly SalaryHandle salary;
        private Staff staff;
        private string staffID_AL;
        private string check;
        public FrmStaffAllowanceDetail(string staffID, string staffID_AL, string check)
        {
            InitializeComponent();
            history = new SaveOperateHistory("Chi tiết phụ cấp nhân viên");
            redirect = new FormHandle();
            allowanceBUS = new AllowanceBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            staffBUS = new StaffBUS();
            salary = new SalaryHandle();
            checkExist = new CheckExist();;
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            this.check = check;
            this.staffID_AL = staffID_AL;
            nudFontSize.Value = (decimal)dgvAllowanceDetail.RowsDefaultCellStyle.Font.Size;
        }
        private void FrmStaffAllowanceDetail_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);  
            txtStaffID.ReadOnly = true;
            txtAmount.ReadOnly = true;
            txtTotalAllowance.ReadOnly = true;
            pnlMenu.Visible = false;
            lblAllowanceText.Visible = false;
            if (check == "Staff")
            {
                LoadAllowance();
                lblAllowanceText.Visible = false;
                pnlMenu.Visible = true;
                DeleteButton();
                LoadStaffAllowance();
            }
            else
            {
                lblStaffTotalAllowance.Location = new Point(650, 125);
                lblTotalAllowance.Location = new Point(1000, 125);
                txtTotalAllowance.Location = new Point(1150, 125);
                lblFontSỉze.Location = new Point(1380, 125);
                nudFontSize.Location = new Point(1480, 125);
                dgvAllowanceDetail.Size = new Size(1924, 634);
                LoadStaffAllowance();
            }
            
        }
        private void LoadAllowance()
        {
            cmbAllowance.DisplayMember = "AllowanceName";
            cmbAllowance.ValueMember = "AL_ID";
            List<Allowance> allowances = allowanceBUS.GetAllowance().ToList();
            List<AllowanceDetail> allowanceDetails = allowanceDetailBUS.GetAllowanceDetail().Where(al => al.StaffID == staffID_AL).ToList();
            foreach (var al in allowanceDetails)
                allowances.RemoveAll(s => s.AL_ID == al.AL_ID);
            if (allowances.Count() == 0)
                btnAdd.Enabled = false;
            cmbAllowance.DataSource = allowances;
            AutoAdjustComboBox.Adjust(cmbAllowance);
        }
        private void LoadStaffAllowance()
        {
            Enabled = false;
            dgvAllowanceDetail.Rows.Clear();
            IEnumerable<AllowanceDetailViewModels> staffAllowawance = allowanceDetailBUS.GetStaffAllowanceDetail(staffID_AL);
            int rowAdd;
            foreach (var al in staffAllowawance)
            {
                rowAdd = dgvAllowanceDetail.Rows.Add();
                dgvAllowanceDetail.Rows[rowAdd].Cells[0].Value = al.StaffID;
                dgvAllowanceDetail.Rows[rowAdd].Cells[1].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(al.FullName);
                dgvAllowanceDetail.Rows[rowAdd].Cells[2].Value = al.Department;
                dgvAllowanceDetail.Rows[rowAdd].Cells[3].Value = al.Position;
                dgvAllowanceDetail.Rows[rowAdd].Cells[4].Value = al.AL_ID;
                dgvAllowanceDetail.Rows[rowAdd].Cells[5].Value = al.AllowanceName;
                dgvAllowanceDetail.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", al.Amount);
            }
            txtStaffID.Text = staffID_AL;
            txtTotalAllowance.Text = String.Format(fVND, "{0:N3} ₫", allowanceDetailBUS.StaffTotalAllowance(staffID_AL));            
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////        
        private void Reload()
        {
            FrmStaffAllowanceDetail open = new FrmStaffAllowanceDetail(staff.StaffID, staffID_AL, check);
            redirect.RedirectForm(open, this);
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmbAllowance_TextChanged(object sender, EventArgs e)
        {
            Allowance allowance = allowanceBUS.GetAllowance().FirstOrDefault( al => al.AL_ID == cmbAllowance.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbAllowance.Text))
                btnAdd.Enabled = false;
            else
            {
                btnAdd.Enabled = true;
                txtAmount.Text = String.Format(fVND, "{0:N3} ₫", allowance.Amount);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckStaff(staffID_AL))
                {
                    btnBack.PerformClick();
                    return;
                }
                if(!checkExist.CheckAllowance(cmbAllowance.SelectedValue.ToString()))
                {
                    Reload();
                    return;
                }
                AllowanceDetail allowanceDetail = new AllowanceDetail
                {
                    StaffID = staffID_AL,
                    AL_ID = cmbAllowance.SelectedValue.ToString(),
                };
                List<AllowanceDetail> allowanceDetails = new List<AllowanceDetail>() { allowanceDetail };
                if (allowanceDetailBUS.Save(allowanceDetails))
                {
                    allowanceDetail.Allowance = allowanceBUS.GetAllowance().FirstOrDefault(al => al.AL_ID == cmbAllowance.SelectedValue.ToString());
                    string operate = "Thêm";
                    string operationDetail = $"Thêm phụ cấp {cmbAllowance.Text} cho nhân viên {staffID_AL}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    salary.UpdateStaffMonthSalary(allowanceDetail.StaffID);
                    Reload();
                }
                txtAmount.Text = string.Empty;
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
                dgvAllowanceDetail.Columns.Add(btnXoa);
            }
        }
        private void DeleteAllowance(string alID, string alName)
        {
            try
            {
                if (!checkExist.CheckStaff(staffID_AL))
                {
                    btnBack.PerformClick();
                    return;
                }
                if (!checkExist.CheckAllowanceDetail(alID ,staffID_AL))
                {
                    Reload();
                    return;
                }
                CustomMessage.YesNoCustom("Có", "Không");
                DialogResult ketQua = MessageBox.Show($"Xác nhận phụ cấp {alName} của nhân viên {txtStaffID.Text}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ketQua == DialogResult.Yes)
                {
                    AllowanceDetail allowanceDetail = new AllowanceDetail
                    {
                        StaffID = staffID_AL,
                        AL_ID = alID,
                    };
                    List<AllowanceDetail> allowanceDetails = new List<AllowanceDetail>() { allowanceDetail };
                    if (allowanceDetailBUS.Delete(allowanceDetails))
                    {
                        string operate = "Xoá";
                        string operationDetail = $"Xoá phụ cấp {alName} của nhân viên {staffID_AL}";
                        history.Save(staff.StaffID, operate, operationDetail);
                        salary.UpdateStaffMonthSalary(allowanceDetail.StaffID);
                        MessageBox.Show("Đã lưu", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Reload();
                    }
                }
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void dgvAllowanceDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            if (e.ColumnIndex == 7)
            {
                string alID = dgvAllowanceDetail.Rows[rowIndex].Cells[4].Value.ToString();
                string alName = dgvAllowanceDetail.Rows[rowIndex].Cells[5].Value.ToString();
                DeleteAllowance(alID, alName);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            if (check == "Tài khoản")
            {
                FrmAccountInfo open = new FrmAccountInfo(staff.StaffID);
                redirect.RedirectForm(open, this);
            }
            else
            {
                FrmStaff open = new FrmStaff(staff.StaffID);
                redirect.RedirectForm(open, this);
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            if (!checkExist.CheckStaff(txtStaffID.Text))
            {
                btnBack.PerformClick();
                return;
            }
            Reload();
        }

        private void nudFontSize_ValueChanged(object sender, EventArgs e)
        {
            int fontSize = (int)nudFontSize.Value;
            dgvAllowanceDetail.RowsDefaultCellStyle.Font = new Font(dgvAllowanceDetail.Font.FontFamily, fontSize);
        }
    }
}
