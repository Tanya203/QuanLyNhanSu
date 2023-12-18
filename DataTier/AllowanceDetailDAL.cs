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
        public bool Save(List<AllowanceDetail> allowanceDetail)
        {
            try
            {
                foreach(AllowanceDetail staff in allowanceDetail)
                    quanLyNhanSu.AllowanceDetails.AddOrUpdate(staff);
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
        public bool Delete(List<AllowanceDetail> allowanceDetail)
        {
            try
            {
               foreach(AllowanceDetail staff in allowanceDetail)
                {
                    AllowanceDetail remove = quanLyNhanSu.AllowanceDetails.FirstOrDefault(s => s.StaffID == staff.StaffID && s.AL_ID == staff.AL_ID);
                    quanLyNhanSu.AllowanceDetails.Remove(remove);
                }
               quanLyNhanSu.SaveChanges();
               return true;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public int AllowanceTotalStaff(string al_ID)
        {
            return quanLyNhanSu.AllowanceDetails.Where(al => al.AL_ID == al_ID).Count();
        }
        public decimal StaffTotalAllowance(string staffID)
        {
            List<AllowanceDetail> allowanceDetails = quanLyNhanSu.AllowanceDetails.Where(al => al.StaffID == staffID).ToList();
            if (allowanceDetails.Count != 0)
                return allowanceDetails.Sum(al => al.Allowance.Amount);
            return 0;
        }
        public decimal AllowanceTotalAmount(string al_ID)
        {
            List<AllowanceDetail> allowanceDetails = quanLyNhanSu.AllowanceDetails.Where(al => al.AL_ID == al_ID).ToList();
            if (allowanceDetails.Count != 0)
                return allowanceDetails.Sum(al => al.Allowance.Amount);
            return 0;
        }
    }
}
