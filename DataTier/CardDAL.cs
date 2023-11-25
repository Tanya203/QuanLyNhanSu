using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class CardDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public CardDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<CardViewModels> GetAllCard()
        {
            var cardList = quanLyNhanSu.Cards.Select(x => new CardViewModels
            {
                CardID = x.CardID,
                CT_ID = x.CT_ID,
                CardTypeName = x.CardType.CardTypeName,
                StaffID = x.StaffID,               
                FullName = x.Staff.LastName+x.Staff.MiddleName+x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                CreateDate = x.DateCreated,
            }).OrderBy(x => x.CardID);
            return cardList;
        }
        public IEnumerable<CardViewModels> GetAllCardSearch(string search)
        {
            var cardList = quanLyNhanSu.Cards.Select(x => new CardViewModels
            {
                CardID = x.CardID,
                CT_ID = x.CT_ID,
                CardTypeName = x.CardType.CardTypeName,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                CreateDate = x.DateCreated,
            }).Where(c => c.CardID.Contains(search) ||
               c.CardTypeName.Contains(search) ||
               c.StaffID.Contains(search) ||
               c.FullName.Contains(search) ||
               c.Position.Contains(search) || 
               c.Department.Contains(search) ||
               c.CreateDate.ToString().Contains(search)).OrderBy(x => x.CardID);
            return cardList;
        }
        public IEnumerable<Card> GetCard()
        {
            return quanLyNhanSu.Cards.OrderBy(p => p.CardID).ToList();
        }
        public bool Save(Card card)
        {
            try
            {
                quanLyNhanSu.Cards.Add(card);
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
        public bool Delete(string cardID)
        {
            try
            {
                Card card = quanLyNhanSu.Cards.Where(c => c.CardID == cardID).FirstOrDefault();
                if (card != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    string cardType = card.CardType.CardTypeName.ToLower();
                    DialogResult result = MessageBox.Show($"Xác nhận xoá {cardType} {cardID}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (result == DialogResult.Yes)
                    {
                        quanLyNhanSu.Cards.Remove(card);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá {cardType} {cardID}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        
    }
}
