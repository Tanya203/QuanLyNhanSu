using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.LogicTier
{
    internal class TimeKeepingBUS
    {
        private readonly TimeKeepingDAL timeKeepingDAL;
        public TimeKeepingBUS()
        {
            timeKeepingDAL = new TimeKeepingDAL();
        }
        public IEnumerable<TimeKeeping> GetWorkScheduleByDate(string date)
        {
            return timeKeepingDAL.GetWorkScheduleByDate(date).ToList();
        }
        public bool TimeKeeping(List<TimeKeeping> staff, string operation)
        {
            return timeKeepingDAL.TimeKeeping(staff, operation);
        }
    }
}
