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
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly MonthBUS monthBUS;
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        public SalaryHandle() 
        {
            
            staffBUS = new StaffBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            monthBUS = new MonthBUS();
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
        }
        public MonthSalaryDetail GetStaffMonthSalary(string staffID)
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
            MonthSalaryDetail monthSalaryDetail = monthSalaryDetailBUS.GetMonthSalaryDetails().FirstOrDefault(m => m.StaffID == staffID && m.MonthID == month);
            return monthSalaryDetail;
        }
    }
}
