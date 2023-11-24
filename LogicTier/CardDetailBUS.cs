using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class CardDetailBUS
    {
        private readonly CardDetailDAL cardDetailDAL;
        public CardDetailBUS()
        {
            cardDetailDAL = new CardDetailDAL();
        }
        public IEnumerable<CardDetailViewModels> GetAllCardDetail(string cardID)
        {
            return cardDetailDAL.GetAllCardDetail(cardID);
        }
        public IEnumerable<CardDetailViewModels> GetAllCardDetailSearch(string cardID, string search)
        {
            return cardDetailDAL.GetAllCardDetailSearch(cardID, search);
        }
        public bool Save(CardDetail cardDetail)
        {
            return cardDetailDAL.Save(cardDetail);
        }
        public bool Delete(CardDetail cardDetail)
        {
            return cardDetailDAL.Delete(cardDetail.StaffID, cardDetail.CardID);
        }
        public decimal TotalAmount(string cardID)
        {
            return cardDetailDAL.TotalAmount(cardID);
        }
        public decimal TotalDeliver(string cardID)
        {
            return cardDetailDAL.TotalDeliver(cardID);
        }
        public IEnumerable<CardDetail> GetCardDetail()
        {
            return cardDetailDAL.GetCardDetail();
        }
        public decimal StaffAmount(string staffID, string cardID)
        {
            return cardDetailDAL.StaffAmount(staffID, cardID);
        }
        public decimal StaffDeliver(string staffID, string cardID)
        {
            return cardDetailDAL.StaffDeliver(staffID, cardID);
        }
        public decimal StaffDebt(string staffID)
        {
            return cardDetailDAL.StaffDebt(staffID);
        }
        public decimal TotalStaffMonthBonus(string staffID, string month)
        {
            return cardDetailDAL.TotalStaffMonthBonus(staffID, month);
        }
        public decimal TotalStaffMonthDebt(string staffID, string month)
        {
            return cardDetailDAL.TotalStaffMonthDebt(staffID, month);
        }
        public decimal TotalStaffMonthBonusDeliver(string staffID, string month)
        {
            return cardDetailDAL.TotalStaffMonthBonusDeliver(staffID, month);
        }
        public decimal TotalStaffMonthDebtDeliver(string staffID, string month)
        {
            return cardDetailDAL.TotalStaffMonthDebtDeliver(staffID, month);
        }
    }
}
