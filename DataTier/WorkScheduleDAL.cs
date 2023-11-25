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
    internal class WorkScheduleDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly string formatDate = "yyyy-MM-dd";
        public WorkScheduleDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<WorkScheduleViewModels> GetAllWorkScheduleDepartment(string dp_ID)
        {
            var workSchedule = quanLyNhanSu.WorkSchedules.Select(x => new WorkScheduleViewModels
            {
                WS_ID = x.WS_ID,
                StaffID = x.StaffID,
                DP_ID = x.Staff.Position.Department.DP_ID,
                FullName = x.Staff.LastName+x.Staff.MiddleName+x.Staff.FirstName,
                WorkDate = x.WorkDate,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
            }).Where(ws => ws.DP_ID == dp_ID).OrderBy(ws => ws.StaffID).ToList();
            return workSchedule;            
        }
        public IEnumerable<WorkScheduleViewModels> GetAllWorkScheduleDepartmentSearch(string dp_ID, string search)
        {
            var workScheduleSearch = quanLyNhanSu.WorkSchedules.Select(x => new WorkScheduleViewModels
            {
                WS_ID = x.WS_ID,
                StaffID = x.StaffID,
                DP_ID = x.Staff.Position.Department.DP_ID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                WorkDate = x.WorkDate,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
            }).Where(ws => ws.DP_ID == dp_ID && ((ws.StaffID.Contains(search)||
                     ws.WS_ID.Contains(search) ||
                     ws.WorkDate.ToString().Contains(search) ||
                     ws.Department.Contains(search)) ||
                     ws.Position.Contains(search) ||
                     ws.FullName.Contains(search))).OrderBy(ws => ws.StaffID);
            return workScheduleSearch;
        }
        public IEnumerable<WorkSchedule> GetWorkSchedule()
        {
            return quanLyNhanSu.WorkSchedules.OrderBy(ws => ws.WS_ID).ToList();
        }
        public bool Save(WorkSchedule workSchedule)
        {
            try
            {
                quanLyNhanSu.WorkSchedules.Add(workSchedule);
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
        public bool Delete(string ws_ID)
        {
            try
            {
                WorkSchedule workSchedule = quanLyNhanSu.WorkSchedules.Where(ws => ws.WS_ID == ws_ID).FirstOrDefault();
                string workDate = workSchedule.WorkDate.ToString(formatDate);
                List<TimeKeeping> listWorkSchedule = quanLyNhanSu.TimeKeepings.Where(ws => ws.WS_ID == workSchedule.WS_ID).ToList();
                if(listWorkSchedule.Count > 0) 
                {
                    foreach(TimeKeeping staff  in listWorkSchedule) 
                    {
                        if(staff.CheckInTime != null)
                        {
                            MessageBox.Show("Đã có nhân viên chấm công lịch. Không thể xoá!!!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            return false;
                        }
                    }
                }
                if (workSchedule != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá lịch làm việc ngày {workDate}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.WorkSchedules.Remove(workSchedule);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá lịch làm việc ngày {workDate}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
