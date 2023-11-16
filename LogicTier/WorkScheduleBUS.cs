using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class WorkScheduleBUS
    {
        public readonly WorkScheduleDAL workScheduleDAL;
        public WorkScheduleBUS()
        {
            workScheduleDAL = new WorkScheduleDAL();
        }
        public IEnumerable<WorkScheduleViewModels> GetAllWorkScheduleDepartment(string dp_ID)
        {
            return workScheduleDAL.GetAllWorkScheduleDepartment(dp_ID);
        }
        public IEnumerable<WorkScheduleViewModels> GetAllWorkScheduleDepartmentSearch(string dp_ID, string search)
        {
            return workScheduleDAL.GetAllWorkScheduleDepartmentSearch(dp_ID, search);
        }
        public IEnumerable<WorkSchedule> GetWorkSchedule()
        {
            return workScheduleDAL.GetWorkSchedule();
        }
        public bool Save(WorkSchedule workSchedule)
        {
            return workScheduleDAL.Save(workSchedule);
        }
        public bool Delete(WorkSchedule workSchedule)
        {
            return workScheduleDAL.Delete(workSchedule.WS_ID);
        }
    }
}
