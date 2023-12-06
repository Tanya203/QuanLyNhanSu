using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Linq;

namespace QuanLyNhanSu.Functions
{
    internal class SalaryHandle
    {
        private readonly MonthSalaryDetailBUS monthSalaryDetailBUS;
        private readonly StaffBUS staffBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly MonthBUS monthBUS;
        public SalaryHandle() 
        {
            monthSalaryDetailBUS = new MonthSalaryDetailBUS();
            staffBUS = new StaffBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            monthBUS = new MonthBUS();
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
            }
            MonthSalaryDetail monthSalaryDetail = monthSalaryDetailBUS.GetMonthSalaryDetails().FirstOrDefault(m => m.StaffID == staffID && m.MonthID == month);
            if (monthSalaryDetail != null)
                return monthSalaryDetail;
            else
            {
                MonthSalaryDetail addMonthSalary = new MonthSalaryDetail()
                {
                    MonthID = month,
                    StaffID = staffID,
                    BasicSalary = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID).BasicSalary,
                    TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(staffID),
                };
                monthSalaryDetailBUS.Save(addMonthSalary);
                return addMonthSalary;
            }
        }
    }
}
