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
    internal class ShiftTypeDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ShiftTypeDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<ShiftTypeViewModels> GetAllShiftType()
        {
            var shiftTypeList = quanLyNhanSu.ShiftTypes.Select(x => new ShiftTypeViewModels
            {
                ST_ID = x.ST_ID,
                ShiftTypeName = x.ShiftTypeName,
                SalaryCoefficient = x.SalaryCoefficient,
            }).OrderBy(st => st.ST_ID);
            return shiftTypeList;
        }
        public IEnumerable<ShiftTypeViewModels> GetAllShiftTypeSearch(string search)
        {
            var shiftTypeSearchList = quanLyNhanSu.ShiftTypes.Select(x => new ShiftTypeViewModels
            {
                ST_ID = x.ST_ID,
                ShiftTypeName = x.ShiftTypeName,
                SalaryCoefficient = x.SalaryCoefficient,
            }).Where(st => st.ST_ID.Contains(search) ||
                     st.ShiftTypeName.Contains(search) ||
                     st.SalaryCoefficient.ToString().Contains(search)).OrderBy(st => st.ST_ID);
            return shiftTypeSearchList;
        }
        public IEnumerable<ShiftType> GetShiftType()
        {
            return quanLyNhanSu.ShiftTypes.OrderBy(st => st.ST_ID).ToList();
        }
        public bool Save(ShiftType shiftType)
        {
            try
            {
                quanLyNhanSu.ShiftTypes.AddOrUpdate(shiftType);
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
        public bool Delete(string st_ID)
        {
            try
            {
                ShiftType shiftType = quanLyNhanSu.ShiftTypes.Where(st => st.ST_ID == st_ID).FirstOrDefault();
                if (shiftType != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá loại ca {shiftType.ShiftTypeName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.ShiftTypes.Remove(shiftType);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá loại ca {shiftType.ShiftTypeName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK"))
                {
                    MessageBox.Show("Loại ca vẫn còn lịch. Không thể xoá!!!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
