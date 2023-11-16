using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class CardDetailDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public CardDetailDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<CardDetailViewModels> GetAllCardDetail(string cardID)
        {
            var listCardDetail = quanLyNhanSu.CardDetails.Select(x => new CardDetailViewModels
            {
                CardID = x.CardID,
                CardTypeName = x.Card.CardType.CardTypeName,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName+x.Staff.MiddleName+x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                Amount = x.Amount,
                Note = x.Note,
            }).Where(c => c.CardID == cardID).OrderBy(c => c.CardID);
            return listCardDetail;
        }
        public IEnumerable<CardDetailViewModels> GetAllCardDetailSearch(string cardID, string search)
        {
            var listCardDetailSearch = quanLyNhanSu.CardDetails.Select(x => new CardDetailViewModels
            {
                CardID = x.CardID,
                CardTypeName = x.Card.CardType.CardTypeName,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                Amount = x.Amount,
                Note = x.Note,
            }).Where(c => c.CardID == cardID && (
                     c.CardTypeName.Contains(search) ||
                     c.StaffID.Contains(search) ||
                     c.FullName.Contains(search) ||
                     c.Position.Contains(search) ||
                     c.Department.Contains(search) ||
                     c.Amount.ToString().Contains(search) ||
                     c.Note.Contains(search))).OrderBy(c => c.StaffID);
            return listCardDetailSearch;
        }
        public decimal StaffAmount(string staffID, string cardID)
        {
            CardDetail cardDetail = quanLyNhanSu.CardDetails.Where(staff => staff.StaffID == staffID && staff.CardID == cardID).FirstOrDefault();
            if(cardDetail != null)
                return cardDetail.Amount;
            return 0;
        }
        public IEnumerable<CardDetail> GetCardDetail()
        {
            return quanLyNhanSu.CardDetails.OrderBy(c => c.CardID).ToList();
        }
        public bool Save(CardDetail cardDetail)
        {
            try
            {
                quanLyNhanSu.CardDetails.AddOrUpdate(cardDetail);
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
        public bool Delete(string staffID, string cardID)
        {
            try
            {
                CardDetail card = quanLyNhanSu.CardDetails.Where(c => c.StaffID == staffID && c.CardID == cardID).FirstOrDefault();
                if (card != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    string cardType = card.Card.CardType.CardTypeName;
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {staffID} khỏi {cardType} {cardID}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.CardDetails.Remove(card);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {staffID} khỏi {cardType} {cardID}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public decimal TotalAmount(string cardID)
        {
            List<CardDetail> cardDetail = quanLyNhanSu.CardDetails.Where(c => c.CardID == cardID).ToList();
            if (cardDetail != null)
                return cardDetail.Sum(c => c.Amount);
            return 0;
        }
    }
}
