using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmWorkSchedule : Form
    {
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly WorkScheduleBUS workScheduleBUS;
        private readonly StaffBUS staffBUS;
        private Staff staff;
        private readonly string formatDate = "yyyy-MM-dd";
        public FrmWorkSchedule(string staffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Lịch làm việc");
            redirect = new FormHandle();
            workScheduleBUS = new WorkScheduleBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Lịch làm việc", staff);
        }
        private void FrmLichLamViec_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            ButtonStatus(false);
            DetailButton();
            if(Authorizartions())
                DeleteButton();
            LoadWorkSchedule();
        }
        
        private bool Authorizartions()
        {
            List<object> input = new List<object> { dtpWorkDate };
            List<object> funtion = new List<object> { btnAdd };
            if (authorizations.AuthorizeForm(input, funtion) == "operate")
                return true;
            return false;
        }
        private void ButtonStatus(bool value)
        {
            List<object> listButtons = new List<object> { btnAdd, dtpWorkDate };
    
            for (int i = 0; i < listButtons.Count; i++)
            {
                if (listButtons[i] is Button)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], value);
                if (listButtons[i] is DateTimePicker)
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listButtons[i], value);
            }
        }
        private void LoadWorkSchedule()
        {
            Enabled = false;
            dgvWorkSchedule.Rows.Clear();
            IEnumerable<WorkScheduleViewModels> workSchedules = workScheduleBUS.GetAllWorkScheduleDepartment(staff.Position.Department.DP_ID);
            int rowAdd;
            foreach (var ws in workSchedules)
            {
                rowAdd = dgvWorkSchedule.Rows.Add();
                dgvWorkSchedule.Rows[rowAdd].Cells[0].Value = ws.WS_ID;
                dgvWorkSchedule.Rows[rowAdd].Cells[1].Value = ws.StaffID;
                dgvWorkSchedule.Rows[rowAdd].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters( ws.FullName);
                dgvWorkSchedule.Rows[rowAdd].Cells[3].Value = ws.Department;
                dgvWorkSchedule.Rows[rowAdd].Cells[4].Value = ws.Position;
                dgvWorkSchedule.Rows[rowAdd].Cells[5].Value = ws.WorkDate.ToString(formatDate);
            }
            Enabled = true;
        }
        private void LoadWorkScheduleSearch(string search)
        {
            Enabled = false;
            dgvWorkSchedule.Rows.Clear();
            IEnumerable<WorkScheduleViewModels> workSchedules = workScheduleBUS.GetAllWorkScheduleDepartmentSearch(staff.Position.Department.DP_ID, search);
            int rowAdd;
            foreach (var ws in workSchedules)
            {
                rowAdd = dgvWorkSchedule.Rows.Add();
                dgvWorkSchedule.Rows[rowAdd].Cells[0].Value = ws.WS_ID;
                dgvWorkSchedule.Rows[rowAdd].Cells[1].Value = ws.StaffID;
                dgvWorkSchedule.Rows[rowAdd].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(ws.FullName);
                dgvWorkSchedule.Rows[rowAdd].Cells[3].Value = ws.Department;
                dgvWorkSchedule.Rows[rowAdd].Cells[4].Value = ws.Position;
                dgvWorkSchedule.Rows[rowAdd].Cells[5].Value = ws.WorkDate.ToString(formatDate);
            }
            Enabled = true;
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmWorkSchedule open = new FrmWorkSchedule(staff.StaffID);
            redirect.RedirectForm(open);
            
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void DetailButton()
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
                dgvWorkSchedule.Columns.Add(btnChiTiet);
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
                dgvWorkSchedule.Columns.Add(btnXoa);
            }
        }
        private void OpenWorkScheduleDetail(string staffID, string wsID)
        {
            FrmWorkScheduleDetail open = new FrmWorkScheduleDetail(staffID, wsID);
            redirect.RedirectForm(open);
        }
        private void DeleteWorkSchedule(string wsID, string department, string workDate)
        {
            try
            {
                WorkSchedule workSchedule = new WorkSchedule
                {
                    WS_ID = wsID,
                };
                if (workScheduleBUS.Delete(workSchedule))
                {
                    string operate = "Xoá";
                    string detailOperation = $"Xoá lịch làm việc ngày {workDate} - phòng ban {department}";
                    history.Save(staff.StaffID, operate, detailOperation);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                WorkSchedule workSchedule = new WorkSchedule
                {
                    WS_ID = "",
                    StaffID = staff.StaffID,
                    WorkDate = dtpWorkDate.Value,
                };
                if (workScheduleBUS.Save(workSchedule))
                {
                    string operate = "Thêm";
                    string detailOperation = $"Thêm lịch làm việc ngày {dtpWorkDate.Text} - phòng ban {staff.Position.Department.DepartmentName}";
                    history.Save(staff.StaffID, operate, detailOperation);
                    Reload();
                }
                
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void dgvWorkSchedule_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            string wsID = dgvWorkSchedule.Rows[rowIndex].Cells[0].Value.ToString();
            string department = dgvWorkSchedule.Rows[rowIndex].Cells[3].Value.ToString();
            string workDate = dgvWorkSchedule.Rows[rowIndex].Cells[5].Value.ToString();
            string date = DateTime.Now.ToString(formatDate);
            if (e.ColumnIndex == 6)
                OpenWorkScheduleDetail(staff.StaffID, wsID);
            if (e.ColumnIndex == 7)
            {
                if (DateTime.Parse(workDate) < DateTime.Parse(date))
                {
                    MessageBox.Show("Không thể xoá lịch trong quá khứ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                DeleteWorkSchedule(wsID, department, workDate);
            }                
        }          
        
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadWorkSchedule();
        }

        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadWorkScheduleSearch(txtSearch.Text);
            }
        }
        private void dtpWorkDate_ValueChanged(object sender, EventArgs e)
        {
            int check = 0;
            DateTime workDate = DateTime.Parse(dtpWorkDate.Text);
            IEnumerable<WorkSchedule> sort = workScheduleBUS.GetWorkSchedule().Where(ws => ws.Staff.Position.Department.DP_ID == staff.Position.Department.DP_ID && ws.WorkDate == workDate);
            foreach (var s in sort)
            if (s.WorkDate.ToString(formatDate) == dtpWorkDate.Text)
            {
                check = 1;
                break;
            }
            if (DateTime.Parse(dtpWorkDate.Text) < DateTime.Parse(DateTime.Now.ToString(formatDate)) || check == 1)
                btnAdd.Enabled = false;
            else
                btnAdd.Enabled = true;
        }
    }
}
