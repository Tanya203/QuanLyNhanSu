using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class WorkScheduleDetailDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        private readonly SalaryHandle salary;
        public WorkScheduleDetailDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
            salary = new SalaryHandle();
        }
        public IEnumerable<WorkScheduleDetailViewModels> GetAllWorkSchduleDetail(string ws_ID)
        {
            var workScheduleDetail = quanLyNhanSu.TimeKeepings.Select(x => new WorkScheduleDetailViewModels
            {
                WS_ID = x.WS_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                WorkDate = x.WorkSchedule.WorkDate,
                Shift = x.Shift.ShiftName,
                ShiftType = x.ShiftType.ShiftTypeName,
                CheckInTime = x.CheckInTime.ToString(),
                CheckOutTime = x.CheckOutTime.ToString(),
                AbsenceUse = x.AbsenceUse,
            }).Where(ws => ws.WS_ID == ws_ID).OrderBy(llv => llv.StaffID);
            return workScheduleDetail;            
        }
        public IEnumerable<WorkScheduleDetailViewModels> GetAllWorkSchduleDetailSearch(string ws_ID, string search)
        {
            var workScheduleDetailSearch = quanLyNhanSu.TimeKeepings.Select(x => new WorkScheduleDetailViewModels
            {
                WS_ID = x.WS_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                WorkDate = x.WorkSchedule.WorkDate,
                Shift = x.Shift.ShiftName,
                ShiftType = x.ShiftType.ShiftTypeName,
                CheckInTime = x.CheckInTime.ToString(),
                CheckOutTime = x.CheckOutTime.ToString(),
                AbsenceUse = x.AbsenceUse,
            }).Where(ws => ws.WS_ID == ws_ID && (ws.StaffID.Contains(search) ||
                     ws.FullName.Contains(search) ||
                     ws.StaffID.Contains(search) ||
                     ws.Position.Contains(search) ||
                     ws.Department.Contains(search) ||
                     ws.CheckInTime.Contains(search) ||
                     ws.CheckOutTime.Contains(search) ||
                     ws.WorkDate.ToString().Contains(search) ||
                     ws.Shift.Contains(search) ||
                     ws.ShiftType.Contains(search))).OrderBy(ws => ws.StaffID);
            return workScheduleDetailSearch;
        }       
        public IEnumerable<TimeKeeping> GetWorkSchduleDetail()
        {
            return quanLyNhanSu.TimeKeepings.OrderBy(c => c.WS_ID).ToList();
        }
        public bool Save(TimeKeeping timeKeeping)
        {
            try
            {
                TimeKeeping staff = quanLyNhanSu.TimeKeepings.FirstOrDefault(id => id.WS_ID == timeKeeping.WS_ID && id.StaffID == timeKeeping.StaffID && id.ShiftID == timeKeeping.ShiftID);
                if(staff != null)
                {
                    MonthSalaryDetail salaryDetail = salary.GetStaffMonthSalary(timeKeeping.StaffID);
                    List<TimeKeeping> absence = quanLyNhanSu.TimeKeepings.Where(id => id.WS_ID == timeKeeping.WS_ID && id.StaffID == timeKeeping.StaffID).ToList();
                    int soNgayPhep = staff.Staff.DayOffAmount;
                    if (soNgayPhep > 0)
                    {
                        if (staff.AbsenceUse)
                            staff.Staff.DayOffAmount -= 1;
                        else
                            staff.Staff.DayOffAmount += 1;
                    }
                    else
                    {
                        MessageBox.Show($"Nhân viên {staff.StaffID} đã hết phép!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return false;
                    }
                    foreach (TimeKeeping staffID in absence)
                    {
                        
                        staffID.AbsenceUse = timeKeeping.AbsenceUse;
                        TimeSpan hour;
                        decimal totalHours = 0;
                        if (staffID.Shift.BeginTime > staffID.Shift.EndTime)
                            hour = staffID.Shift.EndTime.Add(new TimeSpan(24, 0, 0)) - staffID.Shift.BeginTime;
                        else
                            hour = staffID.Shift.EndTime - staffID.Shift.BeginTime;
                        totalHours = (decimal)hour.TotalHours * staffID.ShiftType.SalaryCoefficient * (decimal)0.8;
                        if (staffID.AbsenceUse)
                            salaryDetail.TotalWorkHours += totalHours;
                        else if(!staffID.AbsenceUse && salaryDetail.TotalWorkHours > 0)
                            salaryDetail.TotalWorkHours -= totalHours;
                        
                    }
                    quanLyNhanSu.MonthSalaryDetails.AddOrUpdate(salaryDetail);
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(timeKeeping);
                }
                else
                {
                    TimeKeeping checkAbsenes = quanLyNhanSu.TimeKeepings.FirstOrDefault(s => s.StaffID == timeKeeping.StaffID && s.WS_ID == timeKeeping.WS_ID);
                    if (checkAbsenes != null)
                        timeKeeping.AbsenceUse = checkAbsenes.AbsenceUse;
                    MonthSalaryDetail salaryDetail = salary.GetStaffMonthSalary(timeKeeping.StaffID);
                    Shift shift = quanLyNhanSu.Shifts.FirstOrDefault(s => s.ShiftID == timeKeeping.ShiftID);
                    ShiftType shiftType = quanLyNhanSu.ShiftTypes.FirstOrDefault(s => s.ST_ID == timeKeeping.ST_ID);
                    TimeSpan hour;
                    decimal totalHours = 0;
                    if (shift.BeginTime > shift.EndTime)
                        hour = shift.EndTime.Add(new TimeSpan(24, 0, 0)) - shift.BeginTime;
                    else
                        hour = shift.EndTime - shift.BeginTime;
                    totalHours = (decimal)hour.TotalHours * shiftType.SalaryCoefficient * (decimal)0.8;
                    quanLyNhanSu.MonthSalaryDetails.AddOrUpdate(salaryDetail);
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(timeKeeping);
                }
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public bool Delete(string ws_ID,string staffID)
        {
            try
            {
                TimeKeeping timeKeeping = quanLyNhanSu.TimeKeepings.Where(x => x.WS_ID == ws_ID && x.StaffID == staffID).FirstOrDefault();
                if(timeKeeping.CheckInTime != null)
                {
                    MessageBox.Show("Nhân viên đã chấm công. Không thể xoá!!!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                if (timeKeeping != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {staffID} khỏi lịch {ws_ID} - ca {timeKeeping.Shift.ShiftName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        if(timeKeeping.WorkSchedule.WorkDate >= DateTime.Now.Date && timeKeeping.AbsenceUse)
                        {
                            List<TimeKeeping> absence = quanLyNhanSu.TimeKeepings.Where(id => id.WS_ID == timeKeeping.WS_ID && id.StaffID == timeKeeping.StaffID).ToList();
                            if (absence.Count == 1)
                                timeKeeping.Staff.DayOffAmount += 1;
                            MonthSalaryDetail salaryDetail = salary.GetStaffMonthSalary(staffID);
                            TimeSpan hour;
                            decimal totalHours = 0;
                            if (timeKeeping.Shift.BeginTime > timeKeeping.Shift.EndTime)
                                hour = timeKeeping.Shift.EndTime.Add(new TimeSpan(24, 0, 0)) - timeKeeping.Shift.BeginTime;
                            else
                                hour = timeKeeping.Shift.EndTime - timeKeeping.Shift.BeginTime;
                            totalHours = (decimal)hour.TotalHours * timeKeeping.ShiftType.SalaryCoefficient * (decimal)0.8;
                            salaryDetail.TotalWorkHours -= totalHours;
                            quanLyNhanSu.MonthSalaryDetails.AddOrUpdate(salaryDetail);
                        }
                        quanLyNhanSu.TimeKeepings.Remove(timeKeeping);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {staffID} khỏi lịch {ws_ID} - ca {timeKeeping.Shift.ShiftName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }            
        }
    }
}
