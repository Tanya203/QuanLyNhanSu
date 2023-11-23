using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class TimeKeepingDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly SalaryHandle salary;
        public TimeKeepingDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            salary = new SalaryHandle();
        }
        public IEnumerable<TimeKeeping> GetWorkScheduleByDate(string date)
        {
            return quanLyNhanSu.TimeKeepings.Where(ws => ws.WorkSchedule.WorkDate.ToString() == date).ToList();
        }
        public bool TimeKeeping(List<TimeKeeping> staff, string operation)
        {
            try
            {
                MonthSalaryDetail salaryDetail = salary.GetStaffMonthSalary(staff[0].StaffID);
                foreach (TimeKeeping s in staff)
                {
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(s);
                    if (s.CheckInTime != null && s.CheckOutTime != null) 
                    {

                        TimeSpan? checkIn = s.CheckInTime;
                        TimeSpan? checkOut = s.CheckOutTime;
                        TimeSpan hours;
                        decimal totalHours = 0;
                        if (s.AbsenceUse)
                            continue;
                        if (s.Shift.BeginTime > s.Shift.EndTime)
                        {
                            if(checkIn < s.Shift.BeginTime && checkIn > s.Shift.EndTime)
                                checkIn = s.Shift.BeginTime;
                            if(checkOut > s.Shift.EndTime)
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
                        totalHours = (decimal)hours.TotalHours * s.ShiftType.SalaryCoefficient;
                        salaryDetail.TotalWorkHours += totalHours;
                    }
                }
                quanLyNhanSu.MonthSalaryDetails.AddOrUpdate(salaryDetail);
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
