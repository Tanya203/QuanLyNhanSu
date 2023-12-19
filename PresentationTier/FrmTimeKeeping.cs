using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmTimeKeeping : Form
    {
        private readonly TimeKeepingBUS timeKeepingBUS;
        private readonly ShiftBUS shiftBUS;
        private readonly StaffBUS staffBUS;
        private readonly Shift firstShift;
        private readonly SaveOperateHistory history;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatTime = "HH:mm:ss";
        public FrmTimeKeeping()
        {
            InitializeComponent();
            timeKeepingBUS = new TimeKeepingBUS();
            shiftBUS = new ShiftBUS();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Chấm công");
            firstShift = shiftBUS.GetShift().OrderBy(ca => ca.ShiftName).FirstOrDefault();
            KeyPreview = true;
        }
        private void FrmChamCong_Load(object sender, EventArgs e)
        {
            btnTimekeeping.Enabled = false;
        }
        private bool TimeKeepingNightShift(List<TimeKeeping> nightShift)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            string dateNow = DateTime.Now.ToString(formatDate);
            if (nightShift != null)
            {
                foreach (TimeKeeping staff in nightShift)
                {
                    List<TimeKeeping> timeKeepings = new List<TimeKeeping>();
                    string shift = staff.Shift.ShiftName;
                    string workDate = staff.WorkSchedule.WorkDate.ToString(formatDate);
                    string operate = "Chấm công";
                    string operationDetail = $"Nhân viên {staff.StaffID} chấm công lúc {timeNow} ngày {dateNow} (lịch ngày: {workDate}) cho:\n";
                    if (staff.CheckInTime == null && timeNow < staff.Shift.EndTime)
                    {
                        staff.CheckInTime = timeNow;
                        operationDetail += $"- Giờ vào ca {shift}";
                        timeKeepings.Add(staff);
                        if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                        {
                            history.Save(staff.StaffID, operate, operationDetail);
                            txtStaffID.Text = string.Empty;
                            return true;
                        }
                    }
                    if (staff.CheckInTime != null && staff.CheckOutTime == null && timeNow < firstShift.BeginTime)
                    {
                        staff.CheckOutTime = timeNow;
                        operationDetail += $"- Giờ ra ca {shift}";
                        timeKeepings.Add(staff);
                        if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                        {
                            history.Save(staff.StaffID, operate, operationDetail);
                            txtStaffID.Text = string.Empty;
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        private void TimeKeepingSingleShift(List<TimeKeeping> workSchedule)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            string dateNow = DateTime.Now.ToString(formatDate);
            List<TimeKeeping> timeKeepings = new List<TimeKeeping>();
            int maxShift = workSchedule.Count;
            int countShift = 0;
            for (int i = 0; i < workSchedule.Count; i++)
            {
                countShift++;
                string shift = workSchedule[i].Shift.ShiftName;
                if (workSchedule[i].CheckInTime != null && workSchedule[i].CheckOutTime == null && timeNow < workSchedule[i].Shift.BeginTime)
                {
                    MessageBox.Show($"Vẫn chưa vào ca {shift}!\n({workSchedule[i].Shift.BeginTime} - {workSchedule[i].Shift.EndTime})", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtStaffID.Text = string.Empty;
                    return;
                }
                string operate = "Chấm công";
                string operationDetail = $"Nhân viên {workSchedule[i].StaffID} chấm công lúc {timeNow} ngày {dateNow} cho:\n";
                if (workSchedule[i].CheckInTime == null)
                {
                    if (timeNow < workSchedule[i].Shift.EndTime || workSchedule[i].Shift.BeginTime > workSchedule[i].Shift.EndTime)
                    {
                        workSchedule[i].CheckInTime = timeNow;
                        operationDetail += $"- Giờ vào ca {shift}";
                        timeKeepings.Add(workSchedule[i]);
                        if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                        {
                            history.Save(workSchedule[i].StaffID, operate, operationDetail);
                            txtStaffID.Text = string.Empty;
                            return;
                        }
                    }
                }
                if (workSchedule[i].CheckInTime != null && workSchedule[i].CheckOutTime == null)
                {
                    if (i == workSchedule.Count - 1 || (i +1 < workSchedule.Count && timeNow < workSchedule[i + 1].Shift.BeginTime))
                    {
                        workSchedule[i].CheckOutTime = timeNow;
                        operationDetail += $"- Giờ ra ca {shift}";
                        timeKeepings.Add(workSchedule[i]);
                        if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                        {
                            history.Save(workSchedule[i].StaffID, operate, operationDetail);
                            txtStaffID.Text = string.Empty;
                            return;
                        }
                    }  
                }           
                if(countShift == maxShift)
                {
                    MessageBox.Show($"Nhân viên {txtStaffID.Text} đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày {dateNow}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    txtStaffID.Text = string.Empty;
                    return;
                }
            }
        }
        private void TimeKeepingMultiShift(List<TimeKeeping> workSchedule)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            List<TimeKeeping> timeKeepings = new List<TimeKeeping>();
            string dateNow = DateTime.Now.ToString(formatDate);
            bool checkFirstShift = false;
            int maxShift = workSchedule.Count();
            int countShift = 0;
            string staffID = workSchedule.FirstOrDefault().StaffID;
            string operationDetail = $"Nhân viên {staffID} chấm công lúc {timeNow} ngày {dateNow} cho:";
            string operate = "Chấm công";
            foreach (TimeKeeping staff in workSchedule)
            {
                countShift++;
                string shift = staff.Shift.ShiftName;
                if (staff.CheckInTime != null && staff.CheckOutTime == null && timeNow < staff.Shift.BeginTime)
                {
                    MessageBox.Show($"Vẫn chưa vào ca {shift}!\n({staff.Shift.BeginTime} - {staff.Shift.EndTime})", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtStaffID.Text = string.Empty;
                    return;
                }
                if (staff.CheckInTime == null)
                {
                    if(timeNow < staff.Shift.EndTime || staff.Shift.BeginTime > staff.Shift.EndTime)
                    {
                        staff.CheckInTime = timeNow;
                        operationDetail += $"\n- Giờ vào ca {shift}";
                        timeKeepings.Add(staff);
                        if (staff.Shift.BeginTime > staff.Shift.EndTime || timeNow < staff.Shift.EndTime)
                        {
                            if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                            {
                                history.Save(staff.StaffID, operate, operationDetail);
                                txtStaffID.Text = string.Empty;
                                return;
                            }
                        }
                    }
                }
                if (staff.CheckInTime != null && staff.CheckOutTime == null)
                {
                    checkFirstShift = true;
                    staff.CheckOutTime = timeNow;
                    operationDetail += $"\n- Giờ ra ca {shift}";
                    timeKeepings.Add(staff);
                    if (countShift == maxShift)
                    {
                        if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                        {
                            history.Save(staff.StaffID, operate, operationDetail);
                            txtStaffID.Text = string.Empty;
                            return;
                        }
                    }
                    else
                        continue;
                }
                if (timeNow > staff.Shift.EndTime && staff.CheckInTime == null && checkFirstShift == true)
                {
                    staff.CheckInTime = timeNow;
                    operationDetail += $"\n- Giờ vào ca {shift}";
                    timeKeepings.Add(staff);
                }
                if (timeNow > staff.Shift.EndTime && staff.CheckOutTime == null && checkFirstShift == true)
                {
                    if (staff.Shift.BeginTime > staff.Shift.EndTime)
                        continue;
                    staff.CheckOutTime = timeNow;
                    operationDetail += $"\n- Giờ ra ca {shift}";
                    timeKeepings.Add(staff);
                    if (countShift == maxShift)
                    {
                        if (timeKeepingBUS.TimeKeeping(timeKeepings, operationDetail))
                        {
                            history.Save(staff.StaffID, operate, operationDetail);
                            txtStaffID.Text = string.Empty;
                            return;
                        }
                    }
                }
            }
            MessageBox.Show($"Nhân viên {txtStaffID.Text} đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày {dateNow}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtStaffID.Text = string.Empty;
            return;
        }

        private void btnTimekeeping_Click(object sender, EventArgs e)
        {
            Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == txtStaffID.Text);
            if (staff == null)
            {
                MessageBox.Show("Mã nhân viên không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStaffID.Text = string.Empty;
                return;
            }
            else
            {
                string dateNow = DateTime.Now.ToString(formatDate);
                List<TimeKeeping> nightShift = timeKeepingBUS.GetWorkScheduleByDate(DateTime.Now.AddDays(-1).ToString(formatDate)).Where(s => s.Shift.EndTime < firstShift.BeginTime && s.StaffID == txtStaffID.Text).ToList(); 
                List <TimeKeeping> workSchedule = timeKeepingBUS.GetWorkScheduleByDate(DateTime.Now.ToString(formatDate)).Where(s => s.StaffID == txtStaffID.Text).OrderBy(ws => ws.Shift.ShiftName).ToList();
                if (TimeKeepingNightShift(nightShift))
                    return;
                if (workSchedule.Count == 0)
                {
                    MessageBox.Show($"Nhân viên {staff.StaffID} không có lịch làm việc trong hôm nay {dateNow}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtStaffID.Text = string.Empty;
                    return;
                }
                if (staff.ContractType.TimeKeepingMethod.TimeKeepingMethodName == "Liên ca")
                    TimeKeepingMultiShift(workSchedule);
                else
                    TimeKeepingSingleShift(workSchedule);
            }
        }
        private void txtStaffID_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtStaffID.Text))
                btnTimekeeping.Enabled = false;
            else
                btnTimekeeping.Enabled = true;
        }

        private void FrmTimeKeeping_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnTimekeeping.PerformClick();
                e.Handled = true;
            }
        }
    }
}
