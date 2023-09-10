using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class ThaoTacDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ThaoTacDAL() 
        {
            quanLyNhanSu =  new QuanLyNhanSuContextDB();
        }
        public IEnumerable<ThaoTac> GetThaoTac()
        {
            return quanLyNhanSu.ThaoTacs.OrderBy(tt => tt.MaTT).ToList();
        }
    }
}
