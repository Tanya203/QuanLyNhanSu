using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class CardTypeBUS
    {
        private readonly CardTypeDAL cardTypeDAL;
        public CardTypeBUS()
        {
            cardTypeDAL = new CardTypeDAL();
        }
        public IEnumerable<CardTypeViewModels> GetAllCardType()
        {
            return cardTypeDAL.GetAllCardType();
        }
        public IEnumerable<CardTypeViewModels> GetAllCardTypeSearch(string search)
        {
            return cardTypeDAL.GetAllCardTypeSearch(search);
        }
        public IEnumerable<CardType> GetCardType()
        {
            return cardTypeDAL.GetCardType();
        }
        public bool Save(CardType cardType)
        {
            return cardTypeDAL.Save(cardType);
        }
        public bool Delete(CardType cardType)
        {
            return cardTypeDAL.Delete(cardType.CT_ID);
        }
        public int CardTypeAmount(string ct_ID)
        {
            return cardTypeDAL.CardTypeAmount(ct_ID);
        }
    }
}
