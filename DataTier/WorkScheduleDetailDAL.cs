using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;

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
                DayOffAmount = x.Staff.DayOffAmount,
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
                DayOffAmount = x.Staff.DayOffAmount,
            }).Where(ws => ws.WS_ID == ws_ID && (ws.StaffID.Contains(search) ||
                     ws.FullName.Contains(search) ||
                     ws.StaffID.Contains(search) ||
                     ws.Position.Contains(search) ||
                     ws.Department.Contains(search) ||
                     ws.CheckInTime.Contains(search) ||
                     ws.CheckOutTime.Contains(search) ||
                     ws.WorkDate.ToString().Contains(search) ||
                     ws.Shift.Contains(search) ||
                     ws.ShiftType.Contains(search) ||
                     ws.DayOffAmount.ToString().Contains(search))).OrderBy(ws => ws.StaffID);
            return workScheduleDetailSearch;
        }       
        public IEnumerable<TimeKeeping> GetWorkSchduleDetail()
        {
            return quanLyNhanSu.TimeKeepings.OrderBy(c => c.WS_ID).ToList();
        }
        public bool Save(List<TimeKeeping> timeKeeping)
        {
            try
            {
                foreach(TimeKeeping staff in timeKeeping)
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(staff);
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
        public bool Delete(List<TimeKeeping> removeList)
        {
            try
            {
                foreach (TimeKeeping staff in removeList)
                {
                    TimeKeeping remove = quanLyNhanSu.TimeKeepings.FirstOrDefault(s => s.WS_ID == staff.WS_ID && s.StaffID == staff.StaffID && s.ShiftID == staff.ShiftID);
                    quanLyNhanSu.TimeKeepings.Remove(remove);
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
    }
}
