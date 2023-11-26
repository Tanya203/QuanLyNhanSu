using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.DataTier
{
    internal class ContractTypeDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ContractTypeDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<ContractTypeViewModels> GetAllContractType()
        {
            var contractTypeList = quanLyNhanSu.ContractTypes.Select(x => new ContractTypeViewModels
            {
                CT_ID = x.CT_ID,
                ContractTypeName = x.ContractTypeName,
                TimeKeepingMethod = x.TimeKeepingMethod.TimeKeepingMethodName,
            }).OrderBy(ct => ct.CT_ID);
            return contractTypeList;
        }
        public IEnumerable<ContractTypeViewModels> GetAllContractTypeSearch(string search)
        {
            var contractTypeList = quanLyNhanSu.ContractTypes.Select(x => new ContractTypeViewModels
            {
                CT_ID = x.CT_ID,
                ContractTypeName = x.ContractTypeName,
                TimeKeepingMethod = x.TimeKeepingMethod.TimeKeepingMethodName,
            }).Where(ct => ct.ContractTypeName.Contains(search) ||
                     ct.TimeKeepingMethod.Contains(search)).OrderBy(ct => ct.CT_ID);
            return contractTypeList;
        }
        public IEnumerable<ContractType> GetContractType()
        {
            return quanLyNhanSu.ContractTypes.OrderBy(ct => ct.CT_ID).ToList();
        }      
        public bool Save(ContractType contractType)
        {
            try
            {
                quanLyNhanSu.ContractTypes.AddOrUpdate(contractType);
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
                ContractType contractType = quanLyNhanSu.ContractTypes.Where(ct => ct.CT_ID == ct_ID).FirstOrDefault();
                if (contractType != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá loại hợp đồng {contractType.ContractTypeName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.ContractTypes.Remove(contractType);
                        quanLyNhanSu.SaveChanges();                       
                        MessageBox.Show($"Đã xoá loại hợp đồng {contractType.ContractTypeName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK"))
                {
                    MessageBox.Show("Loại hợp đồng vẫn còn nhân viên. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                else
                {
                    CustomMessage.ExecptionCustom(ex);
                    return false;
                }
            }
                    
        }
        public int TotalContractTypeStaff(string ct_ID)
        {
            int amount = quanLyNhanSu.Staffs.Where(s => s.CT_ID == ct_ID).Count();           
            return amount;
        }
    }
}
