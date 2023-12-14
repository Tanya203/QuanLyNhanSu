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

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmWorkScheduleDetail : Form
    {
        private readonly Authorizations authorizations;
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly WorkScheduleBUS workScheduleBUS;
        private readonly WorkScheduleDetailBUS workScheduleDetailBUS;
        private readonly ShiftBUS shiftBUS;
        private readonly ShiftTypeBUS shiftTypeBUS;
        private readonly StaffBUS staffBUS;
        private readonly SalaryHandle salary;
        private readonly CheckExist checkExist;
        private Staff staff;
        private WorkSchedule workSchedule;
        private readonly List<TimeKeeping> timeKeepings;
        private bool checkOperate;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatHour = "HH:mm:ss";

        public FrmWorkScheduleDetail(string staffID, string wsID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Chi tiết lịch làm việc");
            redirect = new FormHandle();
            workScheduleBUS = new WorkScheduleBUS();
            workScheduleDetailBUS = new WorkScheduleDetailBUS();
            shiftBUS = new ShiftBUS();
            shiftTypeBUS = new ShiftTypeBUS();
            salary = new SalaryHandle();
            checkExist = new CheckExist();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            workSchedule = workScheduleBUS.GetWorkSchedule().FirstOrDefault(ws => ws.WS_ID == wsID);
            timeKeepings = workScheduleDetailBUS.GetWorkSchduleDetail().Where(ws => ws.WS_ID == wsID).ToList();
            authorizations = new Authorizations("Chi tiết lịch làm việc", staff);
            checkOperate = false;
            nudFontSize.Value = (decimal)dgvWorkScheduleDetail.RowsDefaultCellStyle.Font.Size;
        }
        private void FrmChiTietLichLamViec_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);           
            DisableDisplay();
            InputStatus(false);
            LoadWorkScheduleInfo();
            if (DateTime.Parse(dtpWorkDate.Text) >= DateTime.Parse(DateTime.Now.ToString(formatDate)))
            {
                Authorizaations();
                {
                    checkOperate = true;
                    DeleteButton();
                    LoadStaffByDepartment();
                    LoadShift(cmbStaffID.SelectedValue.ToString());
                    LoadShiftType();
                }
            }
            LoadWorkScheduleDetail();
        }
        private bool Authorizaations()
        {
            List<object> input = new List<object> { cmbShift, cmbShiftType, cmbStaffID };
            List<object> funtion = new List<object> { btnAdd };
            if (authorizations.AuthorizeForm(input, funtion) == "operate")
                return true;
            return false;
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<ComboBox> listComboBox = new List<ComboBox> { cmbShift, cmbShiftType, cmbStaffID };
            for (int i = 0; i < listComboBox.Count; i++)
            {
                typeof(Button).GetProperty("Enabled").SetValue(listComboBox[i], value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<object> listButton = new List<object> { btnAdd };
            for (int i = 0; i < listButton.Count; i++)
            {
                if (listButton[i] is Button)
                {
                    typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                    continue;
                }
            }
        }
        private void DisableDisplay()
        {
            List<object> listDisplay = new List<object> { txtWorkScheduleID, txtStaffCreateID, txtDepartment, dtpWorkDate, txtFullName, txtPosition };
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
        private void LoadWorkScheduleInfo()
        {
            txtWorkScheduleID.Text = workSchedule.WS_ID;
            txtStaffCreateID.Text = workSchedule.StaffID;
            txtDepartment.Text = workSchedule.Staff.Position.Department.DepartmentName;
            dtpWorkDate.Text = workSchedule.WorkDate.ToString();
        }
        private void LoadStaffByDepartment()
        {
            cmbStaffID.DisplayMember = "StaffID";
            cmbStaffID.ValueMember = "StaffID";
            int maxShift = shiftBUS.GetShift().Count();
            int countShift = 0;
            string check = null;
            List<Staff> staffList = staffBUS.GetStaff().Where(s => s.Position.Department.DP_ID == staff.Position.DP_ID).ToList();
            foreach (TimeKeeping s in timeKeepings)
            {
                if (check == null || check != s.StaffID)
                    countShift = 1;
                else
                    countShift++;
                if (countShift == maxShift)
                    staffList.RemoveAll(staff => staff.StaffID == s.StaffID);                
            }
            cmbStaffID.DataSource = staffList;
            if (string.IsNullOrEmpty(cmbStaffID.Text))
            {
                cmbStaffID.Enabled = false;
                txtFullName.Text = string.Empty;
                txtPosition.Text = string.Empty;
                btnAdd.Enabled = false;
            }
            else
                cmbStaffID.Enabled = true;
            AutoAdjustComboBox.Adjust(cmbStaffID);
        }
        private void LoadShift(string staffID)
        {
            cmbShift.DisplayMember = "ShiftName";
            cmbShift.ValueMember = "ShiftID";
            List<Shift> shifts = shiftBUS.GetShift().ToList();
            List<TimeKeeping> staffWorkSchedule = timeKeepings.Where(s => s.StaffID == staffID).ToList();
            if (staffWorkSchedule.Count() == 0)
                cmbShift.DataSource = shifts;
            else
                foreach(TimeKeeping s in staffWorkSchedule)
                    shifts.RemoveAll(shift => shift.ShiftID == s.ShiftID);
            if(DateTime.Parse(dtpWorkDate.Text) == DateTime.Now.Date)
            {
                TimeSpan now = TimeSpan.Parse(DateTime.Now.ToString(formatHour));
                shifts = shifts.Where(sh => sh.BeginTime > now || sh.EndTime > now).ToList();
            }
            cmbShift.DataSource = shifts;
            if (string.IsNullOrEmpty(cmbShift.Text))
            {
                cmbShift.Enabled = false;
                btnAdd.Enabled = false;
            }
            else
            {
                cmbShift.Enabled = true;
                btnAdd.Enabled = true;
            }
            AutoAdjustComboBox.Adjust(cmbShift);
        }
        private void LoadShiftType()
        {
            cmbShiftType.DisplayMember = "ShiftTypeName";
            cmbShiftType.ValueMember = "ST_ID";
            cmbShiftType.DataSource = shiftTypeBUS.GetShiftType();
            AutoAdjustComboBox.Adjust(cmbShiftType);
        }
        private void LoadWorkScheduleDetail()
        {
            Enabled = false;
            dgvWorkScheduleDetail.Rows.Clear();
            IEnumerable<WorkScheduleDetailViewModels> worKScheduleDetail = workScheduleDetailBUS.GetAllWorkSchduleDetail(workSchedule.WS_ID);
            int rowAdd;
            foreach (var s in worKScheduleDetail)
            {
                rowAdd = dgvWorkScheduleDetail.Rows.Add();
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[0].Value = s.WS_ID;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[1].Value = s.StaffID;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(s.FullName);
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[3].Value = s.Department;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[4].Value = s.Position;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[5].Value = s.Shift;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[6].Value = s.ShiftType;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[7].Value = s.CheckInTime;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[8].Value = s.CheckOutTime;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[9].Value = s.AbsenceUse;
            }
            Enabled = true;
        }
        private void LoadWorkScheduleDetailSearch(string search)
        {
            Enabled = false;
            dgvWorkScheduleDetail.Rows.Clear();
            IEnumerable<WorkScheduleDetailViewModels> worKScheduleDetail = workScheduleDetailBUS.GetAllWorkSchduleDetailSearch(workSchedule.WS_ID, search);
            int rowAdd;
            foreach (var s in worKScheduleDetail)
            {
                rowAdd = dgvWorkScheduleDetail.Rows.Add();
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[0].Value = s.WS_ID;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[1].Value = s.StaffID;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(s.FullName);
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[3].Value = s.Department;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[4].Value = s.Position;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[5].Value = s.Shift;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[6].Value = s.ShiftType;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[7].Value = s.CheckInTime;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[8].Value = s.CheckOutTime;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[9].Value = s.AbsenceUse;
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmStaffID_TextChanged(object sender, EventArgs e)
        {
            pbStaffPicture.Image = Properties.Resources.image;
            if (!string.IsNullOrEmpty(cmbStaffID.Text))
            {
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == cmbStaffID.Text);
                txtFullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staff.LastName}{staff.MiddleName}{staff.FirstName}");
                txtPosition.Text = staff.Position.PositionName;
                btnAdd.Enabled = true;
                ImageHandle.LoadImage(pbStaffPicture, staff.Picture);
                LoadShift(cmbStaffID.SelectedValue.ToString());
            }
            else
            {
                txtFullName.Text = string.Empty;
                txtPosition.Text = string.Empty;
                btnAdd.Enabled = false;
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmWorkScheduleDetail open = new FrmWorkScheduleDetail(staff.StaffID, workSchedule.WS_ID);
            redirect.RedirectForm(open, this);
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckWorkSchedule(txtWorkScheduleID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                if( !checkExist.CheckWorkScheduleDetailInserted(txtWorkScheduleID.Text, cmbStaffID.SelectedValue.ToString(), cmbShift.SelectedValue.ToString())
                    ||!checkExist.CheckShift(cmbShift.SelectedValue.ToString()) || 
                    !checkExist.CheckShiftType(cmbShiftType.SelectedValue.ToString()) || !checkExist.CheckStaff(cmbStaffID.SelectedValue.ToString()))
                {
                    Reload();
                    return;
                }
                TimeKeeping timeKeeping = new TimeKeeping
                {
                    WS_ID = workSchedule.WS_ID,
                    StaffID = cmbStaffID.SelectedValue.ToString(),
                    ShiftID = cmbShift.SelectedValue.ToString(),
                    ST_ID = cmbShiftType.SelectedValue.ToString(),
                    AbsenceUse = false,
                };
                if (workScheduleDetailBUS.Save(timeKeeping))
                {
                    MonthSalaryDetail monthSalary = salary.GetStaffMonthSalary(timeKeeping.StaffID);
                    string operate = "Thêm nhân viên";
                    string operationDetail = $"Thêm nhân viên {cmbStaffID.Text} vào lịch làm việc ngày {dtpWorkDate.Text} - phòng ban {txtDepartment.Text}";
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
                dgvWorkScheduleDetail.Columns.Add(btnXoa);
            }
        }
        private void DeleteStaff(string staffID)
        {
            try
            {
                if (!checkExist.CheckWorkSchedule(txtWorkScheduleID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                if(!checkExist.CheckWorkScheduleDetail(txtWorkScheduleID.Text, staffID))
                {
                    Reload();
                    return;
                }
                TimeKeeping timeKeeping = new TimeKeeping
                {
                    WS_ID = txtWorkScheduleID.Text,
                    StaffID = staffID,
                };
                if (workScheduleDetailBUS.Delete(timeKeeping))
                {
                    string operate = "Xoá nhân viên";
                    string operationDetail = $"Xoá nhân viên {staffID} khỏi lịch làm việc ngày {dtpWorkDate.Text} - phòng ban {txtDepartment.Text}";
                    history.Save(staff.StaffID, operate, operationDetail);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void dgvWorkScheduleDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            string staffID = dgvWorkScheduleDetail.Rows[row].Cells[1].Value.ToString();
            if (e.ColumnIndex == 9 && checkOperate)
                UpdateAbsence(staffID);
            if (e.ColumnIndex == 10)
                DeleteStaff(staffID);
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmWorkSchedule open = new FrmWorkSchedule(staff.StaffID);
            redirect.RedirectForm(open, this);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cmbStaffID.Text))
                LoadWorkScheduleDetail();
        }

        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadWorkScheduleDetailSearch(txtSearch.Text);
        }
        public void UpdateAbsence(string staffID)
        {
            try
            {
                if (!checkExist.CheckWorkSchedule(txtWorkScheduleID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                if(!checkExist.CheckWorkScheduleDetail(txtWorkScheduleID.Text, staffID))
                {
                    Reload();
                    return;
                }
                TimeKeeping staff = timeKeepings.FirstOrDefault(s => s.StaffID == staffID);
                string announce;
                if (!staff.AbsenceUse)
                {
                    staff.AbsenceUse = true;
                    announce = "Thêm phép cho nhân viên";
                }
                else
                {
                    staff.AbsenceUse = false;
                    announce = "Xoá phép của nhân viên";
                }
                CustomMessage.YesNoCustom("Xác nhận", "Huỷ");
                DialogResult ketQua = MessageBox.Show($"{announce} {staffID} ngày {dtpWorkDate.Text}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ketQua == DialogResult.Yes)
                {
                    if (workScheduleDetailBUS.Save(staff))
                    {
                        string operate;
                        string operationDetail;
                        if (announce.Contains("Thêm"))
                        {
                            operate = "Thêm phép";
                            operationDetail = $"Thêm phép cho nhân viên {staffID} ngày {dtpWorkDate.Text} - phòng ban {txtDepartment.Text}";
                        }
                        else
                        {
                            operate = "Xoá phép";
                            operationDetail = $"Xoá phép cho nhân viên {staffID} ngày {dtpWorkDate.Text} - phòng ban {txtDepartment.Text}";
                        }
                        history.Save(staff.StaffID, operate, operationDetail);
                        Reload();
                    }
                }
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }

        private void nudFontSize_ValueChanged(object sender, EventArgs e)
        {
            int fontSize = (int)nudFontSize.Value;
            dgvWorkScheduleDetail.RowsDefaultCellStyle.Font = new Font(dgvWorkScheduleDetail.Font.FontFamily, fontSize);
        }
    }
}
