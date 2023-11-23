using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
                    TotalWorkHours = 0,
                    TotalBonus = 0,
                    BasicSalary = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID).BasicSalary,
                    TotalDebt = monthSalaryDetailBUS.GetStaffMonthTotalDebt(staffID, DateTime.Parse(month).AddMonths(-1).ToString("MM/yyyy")),
                    TotalDebtPaid = 0,
                    TotalAllowance = allowanceDetailBUS.StaffTotalAllowance(staffID),
                };
                return addMonthSalary;
            }
        }
    }
}
