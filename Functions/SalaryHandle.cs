using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.Functions
{
    internal class SalaryHandle
    {
        private readonly StaffBUS staffBUS;
        private readonly MonthBUS monthBUS;
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        public SalaryHandle() 
        {
            
            staffBUS = new StaffBUS();
            monthBUS = new MonthBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
        }
        public void CheckMonth()
        {
            string month = DateTime.Now.ToString("yyyy-MM");
            Month checkKMonth = monthBUS.GetMonth().FirstOrDefault(m => m.MonthID == month);
            if (checkKMonth == null)
            {
                Month addMonth = new Month()
                {
                    MonthID = month,
                };
                monthBUS.AddMonth(month);
                List<Staff> listStaff = staffBUS.GetStaff().ToList();
                foreach (Staff staff in listStaff)
                {
                    MonthSalaryDetail add = new MonthSalaryDetail()
                    {
                        MonthID = addMonth.MonthID,
                        StaffID = staff.StaffID,
                        BasicSalary = staff.BasicSalary,
                        TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(staff.StaffID),
                    };
                    monthSalaryDetailBUS.Save(add);
                }
            }
        }
        public bool UpdateStaffMonthSalary(string staffID)
        {
            try
            {
                CheckMonth();
                string month = DateTime.Now.ToString("yyyy-MM");
                MonthSalaryDetail monthSalaryDetail = monthSalaryDetailBUS.GetMonthSalaryDetails().FirstOrDefault(m => m.StaffID == staffID && m.MonthID == month);
                monthSalaryDetail.TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(monthSalaryDetail.StaffID);
                monthSalaryDetail.BasicSalary = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == monthSalaryDetail.StaffID).BasicSalary;
                monthSalaryDetailBUS.Save(monthSalaryDetail);
                return true;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
            
        }
    }
}
