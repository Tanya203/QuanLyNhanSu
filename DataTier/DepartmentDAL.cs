using QuanLyNhanSu.Functions;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Data.SqlClient;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;


namespace QuanLyNhanSu.DataTier.Models
{
    internal class DepartmentDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public DepartmentDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<DepartmentViewModel> GetAllDepartment()
        {
            var departmentList = quanLyNhanSu.Departments.Select(x => new DepartmentViewModel
            {
                DP_ID = x.DP_ID,
                DepartmentName = x.DepartmentName,
            }).OrderBy(dp => dp.DP_ID);
            return departmentList;
        }
        public IEnumerable<DepartmentViewModel> GetAllDepartmentSearch(string search)
        {
            var departmentList = quanLyNhanSu.Departments.Select(x => new DepartmentViewModel
            {
                DP_ID = x.DP_ID,
                DepartmentName = x.DepartmentName,
            }).Where(dp => dp.DepartmentName.Contains(search) ||
                     dp.DP_ID.Contains(search)).OrderBy(pb => pb.DP_ID);
            return departmentList;
        }
        public IEnumerable<Department> GetDepartment()
        {
            return quanLyNhanSu.Departments.OrderBy(pb => pb.DP_ID).ToList();
        }
        public bool Save(Department department)
        {
            try
            {
                quanLyNhanSu.Departments.AddOrUpdate(department);
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
        public bool Delete(string dpID)
        {
            var department = quanLyNhanSu.Departments.Where(dp => dp.DP_ID == dpID).FirstOrDefault();
            try
            {                
                if(department != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá phòng ban {department.DepartmentName}?", "Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
                    if(ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.Departments.Remove(department);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá phòng ban {department.DepartmentName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }                    
                }
                return false;
            }
            catch(SqlException ex)
            {
                if (ex.InnerException.ToString().Contains("FK_NhanVien_ChucVu"))
                {
                    MessageBox.Show($"Chức vụ thuộc phòng ban {department.DepartmentName} vẫn còn nhân viên. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }   
        public int TotalStaffDepartment(string dpID)
        {
            return quanLyNhanSu.Staffs.Count(s => s.Position.Department.DP_ID == dpID);
        }
    }
}
