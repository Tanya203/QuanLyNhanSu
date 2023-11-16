using QuanLyNhanSu.Functions;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier.Models
{
    internal class AllowanceDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public AllowanceDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<AllowanceViewModels> GetAllAllowance()
        {
            var allowanceList = quanLyNhanSu.Allowances.Select(x => new AllowanceViewModels
            {
                AL_ID = x.AL_ID,
                AllowanceName = x.AllowanceName,
                Amount = x.Amount,
            }).OrderBy(al => al.AL_ID).ToList();
            return allowanceList;
        }
        public IEnumerable<AllowanceViewModels> GetAllAllowanceSearch(string search)
        {
            var allowanceList = quanLyNhanSu.Allowances.Select(x => new AllowanceViewModels
            {
                AL_ID = x.AL_ID,
                AllowanceName = x.AllowanceName,
                Amount = x.Amount,
            }).Where(al => al.AL_ID.Contains(search) ||
                     al.AllowanceName.Contains(search) ||
                     al.Amount.ToString().Contains(search)).OrderBy(al => al.AL_ID);
            return allowanceList;
        }
        public IEnumerable<Allowance> GetAllowance()
        {
            return quanLyNhanSu.Allowances.OrderBy(al => al.AL_ID).ToList();
        }
        public bool Save(Allowance allowance)
        {
            try
            {
                quanLyNhanSu.Allowances.AddOrUpdate(allowance);
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
        public bool Delete(string alID)
        {
            var allowance = quanLyNhanSu.Allowances.Where(al => al.AL_ID == alID).FirstOrDefault();
            try
            {                
                if (allowance != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá phụ cấp {allowance.AllowanceName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.Allowances.Remove(allowance);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá phụ cấp {allowance.AllowanceName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
    }
}
