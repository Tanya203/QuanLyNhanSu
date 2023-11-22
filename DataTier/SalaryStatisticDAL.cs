using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier
{
    public class SalaryStatisticDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public SalaryStatisticDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<MonthSalaryViewModels> GetAllMonthSalary(string month, string sort)
        {
            var listSalary = quanLyNhanSu.MonthSalaryDetails.Select(x => new MonthSalaryViewModels
            {
                MonthID = x.MonthID,
                StaffID = x.StaffID,
                DP_ID = x.Staff.Position.DP_ID,
                PS_ID = x.Staff.PS_ID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                BasicSalary = x.BasicSalary,
                TotalBonus = x.TotalBonus,
                TotalAllownace = x.TotalAllowance,
                TotalWorkHours = x.TotalWorkHours,
            }).Where(x => x.MonthID == month);
            if(sort != null)
            {
                if (sort.Contains("DP"))
                    listSalary = listSalary.Where(x => x.DP_ID == sort);
                else if(sort.Contains("PS"))
                    listSalary = listSalary.Where(x => x.PS_ID == sort);
            }
            return listSalary;  
        }
    }
}
