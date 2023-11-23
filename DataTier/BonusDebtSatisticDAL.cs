using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier
{
    internal class BonusDebtSatisticDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public BonusDebtSatisticDAL() 
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<MonthBonusDebtViewModels> GetAllMonthBonus(string month, string sort)
        {
            var monthBonus = quanLyNhanSu.MonthSalaryDetails.Select(x => new MonthBonusDebtViewModels
            {
                MonthID = x.MonthID,
                StaffID = x.StaffID,
                DP_ID = x.Staff.Position.DP_ID,
                PS_ID = x.Staff.PS_ID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Amount = x.TotalBonus,
            }).Where(b => b.MonthID.Contains(month));
            if (sort != null)
            {
                if (sort.Contains("DP"))
                    monthBonus = monthBonus.Where(x => x.DP_ID == sort);
                else if (sort.Contains("PS"))
                    monthBonus = monthBonus.Where(x => x.PS_ID == sort);
            }
            return monthBonus;
        }
        public IEnumerable<MonthBonusDebtViewModels> GetAllMonthDebt(string month, string sort)
        {
            var monthDebt = quanLyNhanSu.MonthSalaryDetails.Select(x => new MonthBonusDebtViewModels
            {
                MonthID = x.MonthID,
                StaffID = x.StaffID,
                DP_ID = x.Staff.Position.DP_ID,
                PS_ID = x.Staff.PS_ID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Amount = x.TotalDebt,
                Deliver = x.TotalDebtPaid,
            }).Where(b => b.MonthID.Contains(month));
            if (sort != null)
            {
                if (sort.Contains("DP"))
                    monthDebt = monthDebt.Where(x => x.DP_ID == sort);
                else if (sort.Contains("PS"))
                    monthDebt = monthDebt.Where(x => x.PS_ID == sort);
            }
            return monthDebt;
        }
    }
}
