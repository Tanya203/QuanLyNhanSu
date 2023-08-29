using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
