using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class BonusDebtBUS
    {
        private readonly BonusDebtDAL bonusDebtDAL;
        public BonusDebtBUS()
        {
            bonusDebtDAL = new BonusDebtDAL();
        }
        public IEnumerable<BonusDebtViewModels> GetAllBonusDebt(string staffID, string type)
        {
            return bonusDebtDAL.GetAllBonusDebt(staffID, type);
        }
        public IEnumerable<BonusDebtViewModels> GetAllBonusDebtSearch(string staffID, string type ,string search)
        {
            return bonusDebtDAL.GetAllBonusDebtSearch(staffID, type, search);
        }
    }
}
