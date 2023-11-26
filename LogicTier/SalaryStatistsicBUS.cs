using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    public class SalaryStatistsicBUS
    {
        private readonly SalaryStatisticDAL salaryStatisticDAL;
        public SalaryStatistsicBUS()
        {
            salaryStatisticDAL = new SalaryStatisticDAL();
        }
        public IEnumerable<MonthSalaryViewModels> GetAllMonthSalary(string month, string sort)
        {
            return salaryStatisticDAL.GetAllMonthSalary(month, sort);
        }
    }
}
