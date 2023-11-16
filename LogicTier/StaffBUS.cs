using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.LogicTier
{
    internal class StaffBUS
    {
        private readonly StaffDAL staffDAL;
        public StaffBUS()
        {
            staffDAL = new StaffDAL();
        }
        public IEnumerable<StaffViewModel> GetAllStaff()
        {
            return staffDAL.GetAllStaff();
        }
        public IEnumerable<Staff> GetStaff()
        {
            return staffDAL.GetStaff();
        }
        public IEnumerable<StaffViewModel> GetAllStaffSearch(string search)
        {
            return staffDAL.GetAllStaffSearch(search);
        }
        public bool UpdateDept(List<Staff> staff)
        {
            return staffDAL.UpdateDept(staff);
        }
        public bool Save(Staff staff)
        {
            Staff s = staffDAL.GetStaff().FirstOrDefault(x => x.StaffID == staff.StaffID);            
            if (s != null && staff.Password == s.Password)
                return staffDAL.Save(staff);
            if(s != null && staff.Password != s.Password)
            {
                s.Password = BCrypt.Net.BCrypt.HashPassword(staff.Password);
                return staffDAL.Save(s);
            }
            staff.Password = BCrypt.Net.BCrypt.HashPassword(staff.Password);
            return staffDAL.Save(staff);
        }
        public bool Delete(Staff staff)
        {
            return staffDAL.Delete(staff.StaffID);
        }
        public bool LoginVerify(string account, string password)
        {            
            return staffDAL.LoginVerify(account, password);
        }
        public bool VerifyInfo(string staffID, string account, string cardID, string phone, string email)
        {
            return staffDAL.VerifyInfo(staffID, account, cardID, phone, email);
        }
        public bool VerifyPassword(string staffID, string password)
        {
            return staffDAL.VerifyPassword(staffID, password);
        }
    }
}
