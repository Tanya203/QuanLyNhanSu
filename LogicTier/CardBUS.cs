using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class CardBUS
    {
        private readonly CardDAL cardDAL;
        public CardBUS()
        {
            cardDAL = new CardDAL();
        }
        public IEnumerable<CardViewModels> GetAllCard()
        {
            return cardDAL.GetAllCard();
        }
        public IEnumerable<CardViewModels> GetAllCardSearch(string search)
        {
            return cardDAL.GetAllCardSearch(search);
        }
        public bool Save(Card card)
        {
            return cardDAL.Save(card);
        }
        public bool Delete(Card card)
        {
            return cardDAL.Delete(card.CardID);
        }
        public IEnumerable<Card> GetCard()
        {
            return cardDAL.GetCard();
        }
    }
}
