using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class TimeKeepingMethodBUS
    {
        private readonly TimeKeepingMethodDAL timeKeepingMethodDAL;
        public TimeKeepingMethodBUS()
        {
            timeKeepingMethodDAL = new TimeKeepingMethodDAL();
        }
        public IEnumerable<TimeKeepingMethod> GetTimeKeepingMethod()
        {
            return timeKeepingMethodDAL.GetTimeKeepingMethod();
        }
    }
}
