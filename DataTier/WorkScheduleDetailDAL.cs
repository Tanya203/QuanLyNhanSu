using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class WorkScheduleDetailDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public WorkScheduleDetailDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<WorkScheduleDetailViewModels> GetAllWorkSchduleDetail(string ws_ID)
        {
            var workScheduleDetail = quanLyNhanSu.TimeKeepings.Select(x => new WorkScheduleDetailViewModels
            {
                WS_ID = x.WS_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                WorkDate = x.WorkSchedule.WorkDate,
                Shift = x.Shift.ShiftName,
                ShiftType = x.ShiftType.ShiftTypeName,
                CheckInTime = x.CheckInTime.ToString(),
                CheckOutTime = x.CheckOutTime.ToString(),
                AbsenceUse = x.AbsenceUse,
            }).Where(ws => ws.WS_ID == ws_ID).OrderBy(llv => llv.StaffID);
            return workScheduleDetail;            
        }
        public IEnumerable<WorkScheduleDetailViewModels> GetAllWorkSchduleDetailSearch(string ws_ID, string search)
        {
            var workScheduleDetailSearch = quanLyNhanSu.TimeKeepings.Select(x => new WorkScheduleDetailViewModels
            {
                WS_ID = x.WS_ID,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Position = x.Staff.Position.PositionName,
                Department = x.Staff.Position.Department.DepartmentName,
                WorkDate = x.WorkSchedule.WorkDate,
                Shift = x.Shift.ShiftName,
                ShiftType = x.ShiftType.ShiftTypeName,
                CheckInTime = x.CheckInTime.ToString(),
                CheckOutTime = x.CheckOutTime.ToString(),
                AbsenceUse = x.AbsenceUse,
            }).Where(ws => ws.WS_ID == ws_ID && (ws.StaffID.Contains(search) ||
                     ws.FullName.Contains(search) ||
                     ws.StaffID.Contains(search) ||
                     ws.Position.Contains(search) ||
                     ws.Department.Contains(search) ||
                     ws.CheckInTime.Contains(search) ||
                     ws.CheckOutTime.Contains(search) ||
                     ws.WorkDate.ToString().Contains(search) ||
                     ws.Shift.Contains(search) ||
                     ws.ShiftType.Contains(search))).OrderBy(ws => ws.StaffID);
            return workScheduleDetailSearch;
        }       
        public IEnumerable<TimeKeeping> GetWorkSchduleDetail()
        {
            return quanLyNhanSu.TimeKeepings.OrderBy(c => c.WS_ID).ToList();
        }
        public bool Save(TimeKeeping timeKeeping)
        {
            try
            {
                TimeKeeping staff = quanLyNhanSu.TimeKeepings.Where(id => id.WS_ID == timeKeeping.WS_ID && id.StaffID == timeKeeping.StaffID && id.ShiftID == timeKeeping.ShiftID).FirstOrDefault();
                if(staff != null)
                {
                    List<TimeKeeping> absence = quanLyNhanSu.TimeKeepings.Where(id => id.WS_ID == timeKeeping.WS_ID && id.StaffID == timeKeeping.StaffID).ToList();
                    foreach (var staffID in absence)
                        staffID.AbsenceUse = staff.AbsenceUse;
                    int soNgayPhep = staff.Staff.DayOffAmount;
                    if(soNgayPhep > 0)
                    {
                        if (staff.AbsenceUse)                        
                            staff.Staff.DayOffAmount -= 1;                        
                        else
                            staff.Staff.DayOffAmount += 1;                                                    
                    }
                    else
                    {
                        MessageBox.Show($"Nhân viên {staff.StaffID} đã hết phép!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return false;
                    }
                }
                else
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(timeKeeping);
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
        public bool Delete(string ws_ID,string staffID)
        {
            TimeKeeping timeKeeping = quanLyNhanSu.TimeKeepings.Where(x => x.WS_ID == ws_ID && x.StaffID == staffID).FirstOrDefault();
            try
            {
                if (timeKeeping != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {staffID} khỏi lịch {ws_ID}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.TimeKeepings.Remove(timeKeeping);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {staffID} khỏi lịch {ws_ID}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
    }
}
