using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class AllowanceBUS
    {
        private readonly AllowanceDAL allowanceDAL;
        public AllowanceBUS()
        {
            allowanceDAL = new AllowanceDAL();
        }
        public IEnumerable<AllowanceViewModels> GetAllAllowance()
        {
            return allowanceDAL.GetAllAllowance();
        }
        public IEnumerable<AllowanceViewModels> GetAllAllowanceSearch(string search)
        {
            return allowanceDAL.GetAllAllowanceSearch(search);
        }
        public IEnumerable<Allowance> GetAllowance()
        {
            return allowanceDAL.GetAllowance();
        }
        public bool Save(Allowance allowance)
        {
            return allowanceDAL.Save(allowance);
        }
        public bool Delete(Allowance allowance)
        {
            return allowanceDAL.Delete(allowance.AL_ID);
        }
    }
}
