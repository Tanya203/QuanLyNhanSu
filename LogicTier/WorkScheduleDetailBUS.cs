using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class WorkScheduleDetailBUS
    {
        private readonly WorkScheduleDetailDAL workScheduleDetailDAL;
        public WorkScheduleDetailBUS()
        {
            workScheduleDetailDAL = new WorkScheduleDetailDAL();
        }
        public IEnumerable<WorkScheduleDetailViewModels> GetAllWorkSchduleDetail(string ws_ID)
        {
            return workScheduleDetailDAL.GetAllWorkSchduleDetail(ws_ID);
        }
        public IEnumerable<WorkScheduleDetailViewModels> GetAllWorkSchduleDetailSearch(string ws_ID, string search)
        {
            return workScheduleDetailDAL.GetAllWorkSchduleDetailSearch(ws_ID, search);
        }
        public IEnumerable<TimeKeeping> GetWorkSchduleDetail()
        {
            return workScheduleDetailDAL.GetWorkSchduleDetail();
        }
        public bool Save(List<TimeKeeping> timeKeeping)
        {
            return workScheduleDetailDAL.Save(timeKeeping);
        }
        public bool Delete(List<TimeKeeping> removeList)
        {
            return workScheduleDetailDAL.Delete(removeList);
        }
    }
}
