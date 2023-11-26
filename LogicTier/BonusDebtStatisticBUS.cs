using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

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
