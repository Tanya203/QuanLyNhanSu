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
    internal class AllowanceDetailDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public AllowanceDetailDAL()
        {
            quanLyNhanSu= new QuanLyNhanSuContextDB();
        }
        public IEnumerable<AllowanceDetailViewModels> GetAllAllowanceDetail(string al_ID)
        {
            var allownaceDetail = quanLyNhanSu.AllowanceDetails.Select(x => new AllowanceDetailViewModels
            {
                AL_ID = x.AL_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName+x.Staff.MiddleName+x.Staff.FirstName,
                AllowanceName = x.Allowance.AllowanceName,                
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,             
                Amount = x.Allowance.Amount,
            }).Where(al => al.AL_ID == al_ID).OrderBy(al => al.StaffID);
            return allownaceDetail;
        }
        public IEnumerable<AllowanceDetailViewModels> GetStaffAllowanceDetail(string staffID)
        {
            var phuCapNhanVien = quanLyNhanSu.AllowanceDetails.Select(x => new AllowanceDetailViewModels
            {
                AL_ID = x.AL_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                AllowanceName = x.Allowance.AllowanceName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Amount = x.Allowance.Amount,
            }).Where(al => al.StaffID == staffID).OrderBy(al => al.StaffID);
            return phuCapNhanVien;
        }
        public IEnumerable<AllowanceDetailViewModels> GetAllAllowanceDetailSearch(string al_ID, string search)
        {
            var allownaceDetailSearch = quanLyNhanSu.AllowanceDetails.Select(x => new AllowanceDetailViewModels
            {
                AL_ID = x.AL_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                AllowanceName = x.Allowance.AllowanceName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Amount = x.Allowance.Amount,
            }).Where(al => al.AL_ID == al_ID && (al.StaffID.Contains(search) ||
                     al.FullName.Contains(search) ||
                     al.AllowanceName.Contains(search) ||
                     al.Department.Contains(search) ||
                     al.Amount.ToString().Contains(search) ||
                     al.Position.Contains(search))).OrderBy(al => al.StaffID);
            return allownaceDetailSearch;
        }
        public IEnumerable<AllowanceDetail> GetAllowanceDetail()
        {
            return quanLyNhanSu.AllowanceDetails.OrderBy(al => al.AL_ID).ToList();
        }
        public bool Save(AllowanceDetail allowanceDetail)
        {
            try
            {
                quanLyNhanSu.AllowanceDetails.Add(allowanceDetail);
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
        public bool Delete(string staffID, string al_ID)
        {
            try
            {
                AllowanceDetail allowanceDetail = quanLyNhanSu.AllowanceDetails.Where(al => al.StaffID == staffID && al.AL_ID == al_ID).FirstOrDefault();             
                if(allowanceDetail != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    string allowance = allowanceDetail.Allowance.AllowanceName;
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá phụ cấp {allowance} của nhân viên {staffID}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.AllowanceDetails.Remove(allowanceDetail);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá {allowance} của {staffID}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        public int AllowanceTotalStaff(string al_ID)
        {
            int amount = quanLyNhanSu.AllowanceDetails.Where(al => al.AL_ID == al_ID).Count();
            return amount;
        }
        public decimal StaffTotalAllowance(string staffID)
        {            
            List<AllowanceDetail> allowanceDetails = quanLyNhanSu.AllowanceDetails.Where(al => al.StaffID == staffID).ToList();
            if (allowanceDetails != null)
                return allowanceDetails.Sum(pc => pc.Allowance.Amount);
            return 0;
        }
        public decimal AllowanceTotalAmount(string al_ID)
        {
            List<AllowanceDetail> allowanceDetails = quanLyNhanSu.AllowanceDetails.Where(al => al.AL_ID == al_ID).ToList();
            if (allowanceDetails != null)
                return allowanceDetails.Sum(pc => pc.Allowance.Amount);
            return 0;
        }
    }
}
