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
    public partial class FrmAllowanceDetail : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly DepartmentBUS departmentBUS;
        private readonly PositionBUS positionBUS;
        private readonly StaffBUS staffBUS;
        private readonly AllowanceBUS allowanceBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        private readonly SalaryHandle salary;
        private readonly string formatMonth = "yyyy-MM";
        private Staff staff;
        private Allowance allowance;

        public FrmAllowanceDetail(string staffID, string alID)
        {
            InitializeComponent();
            history = new SaveOperateHistory("Chi tiết phụ cấp");
            redirect = new FormHandle();
            allowanceBUS = new AllowanceBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            departmentBUS = new DepartmentBUS();
            positionBUS = new PositionBUS();
            staffBUS = new StaffBUS();
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
            salary = new SalaryHandle();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            allowance = allowanceBUS.GetAllowance().FirstOrDefault(al => al.AL_ID == alID);
            authorizations = new Authorizations("Chi tiết phụ cấp", staff);
        }

        private void FrmChiTietPhuCap_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            InputStatus(false);
            LoadAllowanceInfo();
            if (Authorizations())
            {
                LoadDepartment();
                DeleteButton();
            }            
            LoadAllowanceDetail();
            
        }
        private bool Authorizations()
        {
            List<object> input = new List<object> { cmbPosition, cmbStaffID, cmbDepartment };
            List<object> function = new List<object> { btnAdd };
            if(authorizations.AuthorizeForm(input, function) == "operate")
                return true;
            return false;
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput= new List<object> { txtAllowanceID, txtAllowamceName, txtAmount, txtStaffAmount, txtTotalAmount, txtFullName, cmbPosition, cmbStaffID, cmbDepartment };
            for (int i = 0; i < listInput.Count; i++)
            {
                if(listInput[i] is ComboBox)
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listInput[i], value);
                if (listInput[i] is TextBox)
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButton = new List<Button> { btnAdd };
            for (int i = 0; i < listButton.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
            }
        }
        private void LoadAllowanceInfo()
        {
            txtAllowanceID.Text = allowance.AL_ID;
            txtAllowamceName.Text = allowance.AllowanceName;
            txtAmount.Text = String.Format(fVND, "{0:N3} ₫", allowance.Amount);
            txtStaffAmount.Text = allowanceDetailBUS.AllowanceTotalStaff(allowance.AL_ID).ToString();
            txtTotalAmount.Text = String.Format(fVND, "{0:N3} ₫", allowanceDetailBUS.AllowanceTotalAmount(allowance.AL_ID));
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
            pbStaffPicture.Image = Properties.Resources.image;
            cmbStaffID.DisplayMember = "StaffID";
            cmbStaffID.ValueMember = "StaffID";
            List<Staff> staffList = staffBUS.GetStaff().Where(s => s.PS_ID == psID).ToList();
            List<AllowanceDetail> allowanceDetails = allowanceDetailBUS.GetAllowanceDetail().Where(al => al.AL_ID == allowance.AL_ID).ToList();
            foreach (var staff in allowanceDetails)
                staffList.RemoveAll(s => s.StaffID == staff.StaffID);
            cmbStaffID.DataSource = staffList;
            if (string.IsNullOrEmpty(cmbStaffID.Text))
            {
                cmbStaffID.Enabled = false;
                txtFullName.Text = string.Empty;
                btnAdd.Enabled = false;
            }
            else
            {
                cmbStaffID.Enabled = true;
                btnAdd.Enabled = true;
            }                
            AutoAdjustComboBox.Adjust(cmbStaffID);
        }
        private void cmbPositionSelectedIndexChanged(object sender, EventArgs e)
        {
            LoadStaffByPosition(cmbPosition.SelectedValue.ToString());
        }

        private void cmbDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            LoadPositionByDepartment(cmbDepartment.SelectedValue.ToString());
        }
        private void cmbStaffID_SelectedIndexChanged(object sender, EventArgs e)
        {
            pbStaffPicture.Image = Properties.Resources.image;
            if (string.IsNullOrEmpty(cmbStaffID.Text))
            {
                btnAdd.Enabled = false;
                txtFullName.Text = string.Empty;                
            }
            else
            {
                btnAdd.Enabled = true;
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == cmbStaffID.Text);
                txtFullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staff.LastName}{staff.MiddleName}{staff.FirstName}");
                ImageHandle.LoadImage(pbStaffPicture, staff.Picture);
            }
        }
        
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmAllowanceDetail open = new FrmAllowanceDetail(staff.StaffID, allowance.AL_ID);
            redirect.RedirectForm(open, this);
        }
        ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void LoadAllowanceDetail()
        {
            Enabled = false;
            dgvAllowanceDetail.Rows.Clear();
            IEnumerable<AllowanceDetailViewModels> allowanceDetails = allowanceDetailBUS.GetAllAllowanceDetail(allowance.AL_ID);
            int row;
            foreach (AllowanceDetailViewModels s in allowanceDetails)
            {
                row = dgvAllowanceDetail.Rows.Add();
                dgvAllowanceDetail.Rows[row].Cells[0].Value = s.AL_ID;
                dgvAllowanceDetail.Rows[row].Cells[1].Value = s.StaffID;
                dgvAllowanceDetail.Rows[row].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(s.FullName);
                dgvAllowanceDetail.Rows[row].Cells[3].Value = s.Department;
                dgvAllowanceDetail.Rows[row].Cells[4].Value = s.Position;
            };
            Enabled = true;
        }
        private void LoadAllowanceDetailSearch(string search)
        {
            Enabled = false;
            dgvAllowanceDetail.Rows.Clear();
            IEnumerable<AllowanceDetailViewModels> allowanceDetails = allowanceDetailBUS.GetAllAllowanceDetailSearch(allowance.AL_ID, search);
            int row;
            foreach (AllowanceDetailViewModels s in allowanceDetails)
            {
                row = dgvAllowanceDetail.Rows.Add();
                dgvAllowanceDetail.Rows[row].Cells[0].Value = s.AL_ID;
                dgvAllowanceDetail.Rows[row].Cells[1].Value = s.StaffID;
                dgvAllowanceDetail.Rows[row].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(s.FullName);
                dgvAllowanceDetail.Rows[row].Cells[3].Value = s.Department;
                dgvAllowanceDetail.Rows[row].Cells[4].Value = s.Position;
            };
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void btnAdd_Click(object sender, EventArgs e)
        {
            AllowanceDetail allowanceDetail = new AllowanceDetail
            {
                AL_ID = allowance.AL_ID,
                StaffID = staff.StaffID,
            };            
            if (allowanceDetailBUS.Save(allowanceDetail))
            {
                allowanceDetail.Allowance = allowance;
                string operate = "Thêm";
                string operationDetail = $"Thêm phụ cấp {allowance.AllowanceName} cho nhân viên {cmbStaffID.SelectedValue}";
                history.Save(staff.StaffID, operate, operationDetail);
                MonthSalaryDetail salaryDetail = salary.GetStaffMonthSalary(allowanceDetail.StaffID); 
                salaryDetail.TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(allowanceDetail.StaffID);
                monthSalaryDetailBUS.Save(salaryDetail);
            }
            Reload();
            
        }
        private void DeleteButton()
        {
            DataGridViewButtonColumn btnDelete = new DataGridViewButtonColumn();
            {
                btnDelete.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnDelete.Text = "Xoá";
                btnDelete.UseColumnTextForButtonValue = true;
                btnDelete.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnDelete.DefaultCellStyle = buttonCellStyle;
                dgvAllowanceDetail.Columns.Add(btnDelete);
            }
        }
        private void DeleteStaff(string staffID)
        {
            AllowanceDetail staff = allowanceDetailBUS.GetAllowanceDetail().FirstOrDefault(s => s.AL_ID == allowance.AL_ID && s.StaffID == staffID);
            if (allowanceDetailBUS.Delete(staff))
            {
                string operate = "Xoá";
                string operationDetail = $"Xoá phụ cấp {allowance.AllowanceName} của nhân viên {staff.StaffID}";
                history.Save(staff.StaffID, operate, operationDetail);
                MonthSalaryDetail salaryDetail = salary.GetStaffMonthSalary(staff.StaffID);
                salaryDetail.TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(staff.StaffID);
                monthSalaryDetailBUS.Save(salaryDetail);
                Reload();
            }
        }
        private void dgvCardDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            string maNV = dgvAllowanceDetail.Rows[row].Cells[1].Value.ToString();
            if (e.ColumnIndex == 5)
                DeleteStaff(maNV);
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadAllowanceDetailSearch(txtSearch.Text);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmAllowance open = new FrmAllowance(staff.StaffID);
            redirect.RedirectForm(open, this);
            staff = null;
            allowance = null;
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

    }
}
