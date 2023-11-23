using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.PresentationTier
{
    internal class BonusDebtStatisticBUS
    {
        private readonly BonusDebtSatisticDAL bonusDebtSatisticDAL;
        public BonusDebtStatisticBUS()
        {
            bonusDebtSatisticDAL = new BonusDebtSatisticDAL();
        }
        public IEnumerable<MonthBonusDebtViewModels> GetAllMonthBonus(string month, string sort)
        {
            return bonusDebtSatisticDAL.GetAllMonthBonus(month, sort);
        }
        public IEnumerable<MonthBonusDebtViewModels> GetAllMonthDebt(string month, string sort)
        {
            return bonusDebtSatisticDAL.GetAllMonthDebt(month, sort);
        }
    }
}
