using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class DepartmentBUS
    {
        private readonly DepartmentDAL departmentDAL;
        public DepartmentBUS()
        {
            departmentDAL = new DepartmentDAL();
        }
        public IEnumerable<DepartmentViewModel> GetAllDepartment()
        {
            return departmentDAL.GetAllDepartment();
        }
        public IEnumerable<DepartmentViewModel> GetAllDepartmentSearch(string search)
        {
            return departmentDAL.GetAllDepartmentSearch(search);
        }
        public bool Save(Department department)
        {
            return departmentDAL.Save(department);           
        }
        public bool Delete(Department department)
        {
           return departmentDAL.Delete(department.DP_ID);            
        }
        public IEnumerable<Department> GetDepartment()
        {
            return departmentDAL.GetDepartment();   
        }
        public int TotalStaffDepartment(string dpID)
        {
            return departmentDAL.TotalStaffDepartment(dpID);
        }
    }
}
