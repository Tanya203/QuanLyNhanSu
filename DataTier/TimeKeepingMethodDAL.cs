using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class TimeKeepingMethodDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public TimeKeepingMethodDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<TimeKeepingMethod> GetTimeKeepingMethod()
        {
            return quanLyNhanSu.TimeKeepingMethods.OrderBy(tkm => tkm.TKM_ID).ToList();
        }
    }
}
