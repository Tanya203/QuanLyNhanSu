using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
