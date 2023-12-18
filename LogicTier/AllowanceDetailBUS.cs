using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class AllowanceDetailBUS
    {
        private readonly AllowanceDetailDAL allowanceDetailDAL;
        public AllowanceDetailBUS()
        {
            allowanceDetailDAL = new AllowanceDetailDAL();
        }
        public IEnumerable<AllowanceDetailViewModels> GetAllAllowanceDetail(string al_ID)
        {
            return allowanceDetailDAL.GetAllAllowanceDetail(al_ID);
        }
        public IEnumerable<AllowanceDetailViewModels> GetStaffAllowanceDetail(string staffID)
        {
            return allowanceDetailDAL.GetStaffAllowanceDetail(staffID);
        }
        public IEnumerable<AllowanceDetailViewModels> GetAllAllowanceDetailSearch(string al_ID, string search)
        {
            return allowanceDetailDAL.GetAllAllowanceDetailSearch(al_ID, search);
        }
        public bool Save(List<AllowanceDetail> allowanceDetail)
        {
            return allowanceDetailDAL.Save(allowanceDetail);
        }
        public bool Delete(List<AllowanceDetail> allowanceDetail)
        {
            return allowanceDetailDAL.Delete(allowanceDetail);
        }
        public IEnumerable<AllowanceDetail> GetAllowanceDetail()
        {
            return allowanceDetailDAL.GetAllowanceDetail();
        }
        public decimal StaffTotalAllowance(string staffID)
        {
            return allowanceDetailDAL.StaffTotalAllowance(staffID);
        }
        public int AllowanceTotalStaff(string al_ID)
        {
            return allowanceDetailDAL.AllowanceTotalStaff(al_ID);
        }
        public decimal AllowanceTotalAmount(string al_ID)
        {
            return allowanceDetailDAL.AllowanceTotalAmount(al_ID);
        }
    }
}
