using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class CardTypeDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public CardTypeDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<CardTypeViewModels> GetAllCardType()
        {
            var cardTypeList = quanLyNhanSu.CardTypes.Select(x => new CardTypeViewModels
            {
                CT_ID = x.CT_ID,
                CardTypeName = x.CardTypeName,
                CaculateMethod = x.CaculateMethod,
            }).OrderBy(ct => ct.CT_ID);
            return cardTypeList;
        }
        public IEnumerable<CardTypeViewModels> GetAllCardTypeSearch(string search)
        {
            var cardTypeList = quanLyNhanSu.CardTypes.Select(x => new CardTypeViewModels
            {
                CT_ID = x.CT_ID,
                CardTypeName = x.CardTypeName,
                CaculateMethod = x.CaculateMethod,
            }).Where(ct => ct.CT_ID.Contains(search) ||
                     ct.CardTypeName.Contains(search) ||
                     ct.CaculateMethod.Contains(search)).OrderBy(ct => ct.CT_ID);
            return cardTypeList;
        }
        public IEnumerable<CardType> GetCardType()
        {
            return quanLyNhanSu.CardTypes.OrderBy(ct => ct.CT_ID).ToList();
        }
        public bool Save(CardType cardType)
        {
            try
            {
                quanLyNhanSu.CardTypes.AddOrUpdate(cardType);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public bool Delete(string ct_ID)
        {
            try
            {
                var cardType = quanLyNhanSu.CardTypes.Where(ct => ct.CT_ID == ct_ID).FirstOrDefault();
                if (cardType != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá loại phiếu {cardType.CardTypeName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.CardTypes.Remove(cardType);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá loại phiếu {cardType.CardTypeName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }                    
                    
                }
                return false;
            }
            catch(Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK_Phieu_LoaiPhieu"))
                {
                    MessageBox.Show("Loại phiếu vẫn còn phiếu. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                else
                {
                    CustomMessage.ExecptionCustom(ex);
                    return false;
                }
            }
        }
        public int CardTypeAmount(string ct_ID)
        {
            int amount = quanLyNhanSu.Cards.Where(c => c.CT_ID == ct_ID).Count();
            return amount;
        }
    }
}
