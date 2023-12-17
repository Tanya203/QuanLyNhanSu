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
using System.Net.NetworkInformation;
using System.Threading;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

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
        private List<TimeKeeping> updateList;
        private List<TimeKeeping> removeList;
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
            updateList = new List<TimeKeeping>();
            removeList = new List<TimeKeeping>();
            checkOperate = false;
            nudFontSize.Value = (decimal)dgvWorkScheduleDetail.RowsDefaultCellStyle.Font.Size;
        }
        private void FrmChiTietLichLamViec_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            dgvWorkScheduleDetail.Columns[10].ReadOnly = true;
            DisableDisplay();
            InputStatus(false);
            LoadWorkScheduleInfo();
            if (DateTime.Parse(dtpWorkDate.Text) >= DateTime.Parse(DateTime.Now.ToString(formatDate)))
            {
               
                if (Authorizaations())
                {
                    dgvWorkScheduleDetail.Columns[10].ReadOnly = false;
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
            List<object> funtion = new List<object> { btnAdd, btnSave };
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
            List<object> listButton = new List<object> { btnAdd, btnSave };
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
            string staffID = cmbStaffID.Text;
            cmbStaffID.DisplayMember = "StaffID";
            cmbStaffID.ValueMember = "StaffID";
            int maxShift = shiftBUS.GetShift().Count();
            int countShift = 0;
            string check = null;
            List<Staff> staffList = staffBUS.GetStaff().Where(s => s.Position.Department.DP_ID == staff.Position.DP_ID).ToList();
            foreach (TimeKeeping s in updateList)
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
            cmbStaffID.Text = staffID;
            
            AutoAdjustComboBox.Adjust(cmbStaffID);
        }
        private void LoadShift(string staffID)
        {
            cmbShift.DisplayMember = "ShiftName";
            cmbShift.ValueMember = "ShiftID";
            List<Shift> shifts = shiftBUS.GetShift().ToList();
            List<TimeKeeping> staffWorkSchedule = updateList.Where(s => s.StaffID == staffID).ToList();
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
        private void UpdateList(string wsID, string staffID, string shift, string shiftType, bool absense)
        {
            string shiftID = shiftBUS.GetShift().FirstOrDefault(s => s.ShiftName == shift).ShiftID;
            string stID = shiftTypeBUS.GetShiftType().FirstOrDefault(s => s.ShiftTypeName == shiftType).ST_ID;
            TimeKeeping add = new TimeKeeping()
            {
                WS_ID = wsID,
                StaffID = staffID,
                ShiftID = shiftID,
                ST_ID = stID,
                AbsenceUse = absense
            };
            updateList.Add(add);
        }
        private void LoadWorkScheduleDetail()
        {
            Enabled = false;
            updateList.Clear();
            updateList = new List<TimeKeeping>();
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
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[9].Value = s.DayOffAmount;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[10].Value = s.AbsenceUse;
                UpdateList(s.WS_ID, s.StaffID, s.Shift, s.ShiftType, s.AbsenceUse);
            }
            if (updateList.Count > 0)
                btnSave.Enabled = true;
            else
                btnSave.Enabled = false;
            if(checkOperate)
                LoadShift(cmbStaffID.SelectedValue.ToString());
            Enabled = true;
        }
        private void LoadWorkScheduleDetailSearch(string search)
        {
            Enabled = false;
            updateList.Clear();
            updateList = new List<TimeKeeping>();
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
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[9].Value = s.DayOffAmount;
                dgvWorkScheduleDetail.Rows[rowAdd].Cells[10].Value = s.AbsenceUse;
                UpdateList(s.WS_ID, s.StaffID, s.Shift, s.ShiftType, s.AbsenceUse);
            }
            if (updateList.Count > 0)
                btnSave.Enabled = true;
            else
                btnSave.Enabled = false;
            if(checkOperate)
                LoadShift(cmbStaffID.SelectedValue.ToString());
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
            TimeKeeping timeKeeping = new TimeKeeping
            {
                WS_ID = workSchedule.WS_ID,
                StaffID = cmbStaffID.SelectedValue.ToString(),
                ShiftID = cmbShift.SelectedValue.ToString(),
                ST_ID = cmbShiftType.SelectedValue.ToString(),
                AbsenceUse = false,
            };
            int rowAdd;
            int dayOffAmount = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == timeKeeping.StaffID).DayOffAmount;
            rowAdd = dgvWorkScheduleDetail.Rows.Add();
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[0].Value = timeKeeping.WS_ID;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[1].Value = timeKeeping.StaffID;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[2].Value = txtFullName.Text;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[3].Value = txtDepartment.Text;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[4].Value = txtPosition.Text;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[5].Value = cmbShift.Text;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[6].Value = cmbShiftType.Text;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[7].Value = "";
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[8].Value = "";
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[9].Value = dayOffAmount;
            dgvWorkScheduleDetail.Rows[rowAdd].Cells[10].Value = timeKeeping.AbsenceUse;
            if (dgvWorkScheduleDetail.Rows.Count > 1)
            {
                foreach (DataGridViewRow r in dgvWorkScheduleDetail.Rows)
                {
                    if (timeKeeping.StaffID == dgvWorkScheduleDetail.Rows[r.Index].Cells[1].Value.ToString())
                    {
                        dgvWorkScheduleDetail.Rows[rowAdd].Cells[10].Value = dgvWorkScheduleDetail.Rows[r.Index].Cells[10].Value;
                        timeKeeping.AbsenceUse = (bool)dgvWorkScheduleDetail.Rows[r.Index].Cells[10].Value;
                        break;
                    }
                }
            }
            updateList.Add(timeKeeping);
            LoadStaffByDepartment();
            if (updateList.Count > 0)
                btnSave.Enabled = true;
            else
                btnSave.Enabled = false;
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
        private string CheckChange()
        {
            string result = "";
            string add = " - Thêm nhân viên:";
            string remove = "\n - Xoá nhân viên:";
            string absences = "\n - Cập nhật phép:";
            string check = "";
            foreach (TimeKeeping staff in updateList)
            {
                string shift = shiftBUS.GetShift().FirstOrDefault(s => s.ShiftID == staff.ShiftID).ShiftName;
                if (timeKeepings.FirstOrDefault(s => s.StaffID == staff.StaffID && s.ShiftID == staff.ShiftID) == null)
                {
                    add += $"\n    - {staff.StaffID} - ca {shift} - phép : ";
                    if (staff.AbsenceUse)
                        add += "Có";
                    else
                        add += "Không";
                }
                if(timeKeepings.Count > 0)
                {
                    if (timeKeepings.FirstOrDefault(s => s.StaffID == staff.StaffID) != null &&
                    timeKeepings.FirstOrDefault(s => s.StaffID == staff.StaffID).AbsenceUse != staff.AbsenceUse && staff.StaffID != check)
                    {
                        check = staff.StaffID;
                        if (staff.AbsenceUse)
                            absences += $"\n    - Thêm phép cho nhân viên {staff.StaffID}";
                        else
                            absences += $"\n    - Xoá phép của nhân viên {staff.StaffID}";
                    }
                }
            }
            foreach(TimeKeeping staff in timeKeepings)
            {
                string shift = shiftBUS.GetShift().FirstOrDefault(s => s.ShiftID == staff.ShiftID).ShiftName;
                if (updateList.FirstOrDefault(s => s.StaffID == staff.StaffID && s.ShiftID == staff.ShiftID) == null)
                    remove += $"\n  - {staff.StaffID} - ca {shift}";
            }
            result = add + remove + absences;
            return result;
        }
        private void dgvWorkScheduleDetail_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            
            int row = e.RowIndex;
            if (row < 0)
                return;
            if (e.ColumnIndex == 10)
            {
                int dayOffAmount = (int)dgvWorkScheduleDetail.Rows[row].Cells[9].Value;
                if (dayOffAmount == 0)
                {
                    MessageBox.Show("Nhân viên đã hết phép", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                bool absense = false;
                string staffID = dgvWorkScheduleDetail.Rows[row].Cells[1].Value.ToString();
                string shift = dgvWorkScheduleDetail.Rows[row].Cells[5].Value.ToString();
                string shiftID = shiftBUS.GetShift().FirstOrDefault(s => s.ShiftName == shift).ShiftID;
                var checkBox = dgvWorkScheduleDetail.Rows[row].Cells[10];
                if (checkBox is DataGridViewCheckBoxCell checkBoxCell)
                {
                    absense = (bool)checkBoxCell.EditedFormattedValue;
                    foreach (DataGridViewRow r in dgvWorkScheduleDetail.Rows)
                    {
                        if (dgvWorkScheduleDetail.Rows[r.Index].Cells[1].Value.ToString() == staffID)
                            dgvWorkScheduleDetail.Rows[r.Index].Cells[10].Value = absense;
                    }
                }
                foreach (TimeKeeping staff in updateList)
                    if (staff.StaffID == staffID)
                        staff.AbsenceUse = absense;
            }
            if (e.ColumnIndex == 11)
            {
                string checkIn = dgvWorkScheduleDetail.Rows[row].Cells[7].Value.ToString();
                if (!string.IsNullOrEmpty(checkIn))
                {
                    MessageBox.Show("Nhân viên đã chấm công! Không thể xoá!!!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string staffID = dgvWorkScheduleDetail.Rows[row].Cells[1].Value.ToString();
                string shiftID = shiftBUS.GetShift().FirstOrDefault(s => s.ShiftName == dgvWorkScheduleDetail.Rows[row].Cells[5].Value.ToString()).ShiftID;
                DataGridViewRow remove = dgvWorkScheduleDetail.Rows[row];
                dgvWorkScheduleDetail.Rows.Remove(remove);
                removeList.Add(updateList.FirstOrDefault(s => s.StaffID == staffID && s.ShiftID == shiftID));
                updateList.RemoveAll(s => s.StaffID == staffID && s.ShiftID == shiftID);
                LoadStaffByDepartment();
                if (updateList.Count > 0 || (removeList.Count > 0 && timeKeepings.Count > 0))
                    btnSave.Enabled = true;
                else
                    btnSave.Enabled = false;
            }
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
        

        private void nudFontSize_ValueChanged(object sender, EventArgs e)
        {
            int fontSize = (int)nudFontSize.Value;
            dgvWorkScheduleDetail.RowsDefaultCellStyle.Font = new Font(dgvWorkScheduleDetail.Font.FontFamily, fontSize);
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (!checkExist.CheckWorkSchedule(txtWorkScheduleID.Text))
                {
                    btnBack.PerformClick();
                    return;
                }
                /*if (!checkExist.CheckShift(cmbShift.SelectedValue.ToString()) ||
                    !checkExist.CheckShiftType(cmbShiftType.SelectedValue.ToString()) || !checkExist.CheckStaff(cmbStaffID.SelectedValue.ToString()))
                {
                    Reload();
                    return;
                }*/
                string editDetail = CheckChange();
                string flag = "";
                foreach (TimeKeeping staff in updateList)
                {
                    if (flag != staff.StaffID)
                    {
                        flag = staff.StaffID;
                        Staff update = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staff.StaffID);
                        if (timeKeepings.Count > 0)
                        {
                            if(timeKeepings.FirstOrDefault(x => x.StaffID == staff.StaffID) != null)
                            {
                                if (staff.AbsenceUse != timeKeepings.FirstOrDefault(x => x.StaffID == staff.StaffID).AbsenceUse)
                                {
                                    update.DayOffAmount = staff.AbsenceUse ? update.DayOffAmount - 1 : update.DayOffAmount + 1;
                                    staffBUS.UpdateDayOffAmount(update);
                                }
                            }
                        }
                        if (staff.AbsenceUse && timeKeepings.FirstOrDefault(s => s.StaffID == staff.StaffID) == null)
                        {
                            update.DayOffAmount -= 1;
                            staffBUS.UpdateDayOffAmount(update);
                        }
                    }
                }
                if(removeList.Count > 0)
                {
                    string check = "";
                    foreach(TimeKeeping staff in removeList)
                    {
                        if(updateList.FirstOrDefault(s => s.StaffID == staff.StaffID) == null && check != staff.StaffID && staff.AbsenceUse)
                        {
                            check = staff.StaffID;
                            Staff update = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staff.StaffID);
                            update.DayOffAmount += 1;
                            staffBUS.UpdateDayOffAmount(update);
                        }
                    }
                    workScheduleDetailBUS.Delete(removeList);
                }
                if (workScheduleDetailBUS.Save(updateList))
                {
                    //MonthSalaryDetail monthSalary = salary.GetStaffMonthSalary(timeKeeping.StaffID);
                    string operate = $"Cập nhật";
                    string operationDetail = $"Cập nhật lịch làm việc ngày {dtpWorkDate.Text} - phòng ban {staff.Position.Department.DepartmentName}";
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

        
    }
}
