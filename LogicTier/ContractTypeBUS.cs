using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class ContractTypeBUS
    {
        private readonly ContractTypeDAL contractTypeDAL;
        public ContractTypeBUS()
        {
            contractTypeDAL = new ContractTypeDAL();
        }
        public IEnumerable<ContractTypeViewModels> GetAllContractType()
        {
            return contractTypeDAL.GetAllContractType();
        }
        public IEnumerable<ContractTypeViewModels> GetAllContractTypeSearch(string search)
        {
            return contractTypeDAL.GetAllContractTypeSearch(search);
        }
        public IEnumerable<ContractType> GetContractType()
        {
            return contractTypeDAL.GetContractType();
        }
        public bool Save(ContractType contractType)
        {
            return contractTypeDAL.Save(contractType);
        }
        public bool Delete(ContractType contractType)
        {
            return contractTypeDAL.Delete(contractType.CT_ID);
        }
        public int TotalContractTypeStaff(string ct_ID)
        {
            return contractTypeDAL.TotalContractTypeStaff(ct_ID);
        }
    }
}
