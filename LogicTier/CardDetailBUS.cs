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
    }
}
