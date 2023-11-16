using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class PositionDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public PositionDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<PositionViewModels> GetAllPosition()
        {
            var positionList = quanLyNhanSu.Positions.Select(ps => new PositionViewModels
                 {
                     PS_ID = ps.PS_ID,
                     DP_ID = ps.DP_ID,
                     PositionName = ps.PositionName,
                     DepartmentName = ps.Department.DepartmentName
                 }).OrderBy(ps => ps.PS_ID);    
            return positionList;                                   
        }
        public IEnumerable<PositionViewModels> GetAllPositionSearch(string search)
        {
            var positionListSeach = quanLyNhanSu.Positions.Select(ps => new PositionViewModels
            {
                PS_ID = ps.PS_ID,
                DP_ID = ps.DP_ID,
                PositionName = ps.PositionName,
                DepartmentName = ps.Department.DepartmentName
            }).Where(ps => ps.PS_ID.Contains(search) ||
                              ps.PositionName.Contains(search) ||
                              ps.DepartmentName.Contains(search)).OrderBy(ps => ps.PS_ID);
            return positionListSeach;
        }
        public IEnumerable<Position> GetPosition()
        {
            return quanLyNhanSu.Positions.OrderBy(ps => ps.PS_ID).ToList();
        }
        public bool Save(Position position)
        {
            try
            {
                quanLyNhanSu.Positions.AddOrUpdate(position);
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
        public bool Delete(string ps_ID)
        {
            var position = quanLyNhanSu.Positions.Where(ps => ps.PS_ID == ps_ID).FirstOrDefault();
            try
            {
                if (position != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá chức vụ {position.PositionName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.Positions.Remove(position);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá chức vụ {position.PositionName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK_NhanVien_ChucVu"))
                {
                    MessageBox.Show($"Vẫn còn nhân viên thuộc chức vụ {position.PositionName}. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public int PositionTotalStaff(string ps_ID)
        {                          
            return quanLyNhanSu.Staffs.Count(s => s.PS_ID == ps_ID);
        }

    }
}
