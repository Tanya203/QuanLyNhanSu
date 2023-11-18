using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class MonthSalaryDetailBUS
    {
        private readonly MonthSalaryDetailDAL monthSalaryDetailDAL;
        public MonthSalaryDetailBUS()
        {
            monthSalaryDetailDAL = new MonthSalaryDetailDAL();
        }
        public IEnumerable<MonthSalaryDetail> GetMonthSalaryDetails()
        {
            return monthSalaryDetailDAL.GetMonthSalaryDetails();
        }
        public bool Save(MonthSalaryDetail salary)
        {
            return monthSalaryDetailDAL.Save(salary);
        }
        public decimal GetStaffMonthTotalDebt(string staffID, string month)
        {
            return monthSalaryDetailDAL.GetStaffMonthTotalDebt(staffID, month);
        }
    }
}
