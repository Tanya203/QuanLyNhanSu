using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class BonusDebtDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public BonusDebtDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<BonusDebtViewModels> GetAllBonusDebt(string staffID, string type)
        {
            var bonusDebtList = quanLyNhanSu.CardDetails.Select(x => new BonusDebtViewModels
            {
                StaffID = x.StaffID,
                CardID = x.CardID,
                CardType = x.Card.CardType.CardTypeName,
                FullName = x.Staff.LastName+x.Staff.MiddleName+x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Amount = x.Amount,
                Deliver = x.Deliver,
                Note = x.Note,
                Caculation = x.Card.CardType.CaculateMethod
            }).Where(c => c.StaffID == staffID && c.Caculation == type);
            return bonusDebtList;
        }
        public IEnumerable<BonusDebtViewModels> GetAllBonusDebtSearch(string staffID, string type, string search)
        {
            var bonusDebtList = quanLyNhanSu.CardDetails.Select(x => new BonusDebtViewModels
            {
                StaffID = x.StaffID,
                CardID = x.CardID,
                CardType = x.Card.CardType.CardTypeName,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Amount = x.Amount,
                Deliver = x.Deliver,
                Note = x.Note,
                Caculation = x.Card.CardType.CaculateMethod
            }).Where(c => c.StaffID == staffID && c.Caculation == type &&
                    (c.CardID.Contains(search) ||
                    c.CardType.Contains(search) ||
                    c.FullName.Contains(search) ||
                    c.Department.Contains(search) ||
                    c.Position.Contains(search) ||
                    c.Amount.ToString().Contains(search) ||
                    c.Deliver.ToString().Contains(search) ||
                    c.Note.Contains(search)));
            return bonusDebtList;
        }

    }
}
