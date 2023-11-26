using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;

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
    }
}
