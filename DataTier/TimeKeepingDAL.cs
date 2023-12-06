using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.DataTier
{
    internal class TimeKeepingDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public TimeKeepingDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<TimeKeeping> GetWorkScheduleByDate(string date)
        {
            return quanLyNhanSu.TimeKeepings.Where(ws => ws.WorkSchedule.WorkDate.ToString() == date).ToList();
        }
        public decimal GetStaffMonthTotalWorkHour(string staffID, string month)
        {
            List<TimeKeeping> salaryDetail = quanLyNhanSu.TimeKeepings.Where(s => s.StaffID == staffID && s.WorkSchedule.WorkDate.ToString().Contains(month)).ToList();
            decimal totalHours = 0;
            
            foreach (TimeKeeping s in salaryDetail)
            {
                TimeSpan? checkIn = s.CheckInTime;
                TimeSpan? checkOut = s.CheckOutTime;
                TimeSpan hours;
                if (s.AbsenceUse)
                {
                    checkIn = s.Shift.BeginTime;
                    checkOut = s.Shift.EndTime;
                    hours = (TimeSpan)(checkOut - checkIn);
                    totalHours += (decimal)hours.TotalHours * s.ShiftType.SalaryCoefficient;
                    totalHours *= (decimal)0.8;
                }
                if (s.CheckInTime != null && s.CheckOutTime != null)
                {
                    if (s.Shift.BeginTime > s.Shift.EndTime)
                    {
                        if (checkIn < s.Shift.BeginTime && checkIn > s.Shift.EndTime)
                            checkIn = s.Shift.BeginTime;
                        if (checkOut > s.Shift.EndTime)
                            checkOut = s.Shift.EndTime.Add(new TimeSpan(24, 0, 0));
                    }
                    else
                    {
                        if (checkIn == checkOut)
                        {
                            checkIn = s.Shift.BeginTime;
                            checkOut = s.Shift.EndTime;
                        }
                        else
                        {
                            if (checkIn < s.Shift.BeginTime)
                                checkIn = s.Shift.BeginTime;
                            if (checkOut > s.Shift.EndTime)
                                checkOut = s.Shift.EndTime;
                        }
                    }
                    hours = (TimeSpan)(checkOut - checkIn);
                    totalHours += (decimal)hours.TotalHours * s.ShiftType.SalaryCoefficient;
                }
            }
            return totalHours;
        }
        public bool TimeKeeping(List<TimeKeeping> staff, string operation)
        {
            try
            {
                foreach (TimeKeeping s in staff)
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(s);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show(operation, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
