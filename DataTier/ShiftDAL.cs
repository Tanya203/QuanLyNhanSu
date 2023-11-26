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
    internal class ShiftDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ShiftDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<ShiftViewModels> GetAllShifts()
        {
            var shiftList = quanLyNhanSu.Shifts.Select(x => new ShiftViewModels
            {
                ShiftID = x.ShiftID,
                ShiftName = x.ShiftName,
                BeginTime = x.BeginTime,
                EndTime = x.EndTime,
            }).OrderBy(shift => shift.ShiftID);
            return shiftList;
        }
        public IEnumerable<ShiftViewModels> GetAllShiftsSearch(string search)
        {            
            var searchShiftList = quanLyNhanSu.Shifts.Select(x => new ShiftViewModels
            {
                ShiftID = x.ShiftID,
                ShiftName = x.ShiftName,
                BeginTime = x.BeginTime,
                EndTime = x.EndTime,
            }).Where(ca => ca.ShiftID.Contains(search) ||
                     ca.ShiftName.Contains(search) ||
                     ca.BeginTime.ToString().Contains(search) ||
                     ca.EndTime.ToString().Contains(search)).OrderBy(pb => pb.ShiftID);
            return searchShiftList;
        }
        public IEnumerable<Shift> GetShift()
        {
            return quanLyNhanSu.Shifts.OrderBy(cv => cv.ShiftID).ToList();
        }
        public bool Save(Shift shift)
        {
            try
            {
                quanLyNhanSu.Shifts.AddOrUpdate(shift);
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
        public bool Delete(string shiftID)
        {
            try
            {
                Shift shift = quanLyNhanSu.Shifts.Where(c => c.ShiftID == shiftID).FirstOrDefault();
                if (shift != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá ca {shift.ShiftName}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.Shifts.Remove(shift);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá ca {shift.ShiftName}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);                        
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK"))
                {
                    MessageBox.Show("Ca vẫn còn lịch. Không thể xoá!!!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
