using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class GiaoDienBUS
    {
        private readonly GiaoDienDAL giaoDienDAL;
        public GiaoDienBUS()
        {
            giaoDienDAL = new GiaoDienDAL();
        }
        public IEnumerable<GiaoDien> GetGiaoDiens()
        {
            return giaoDienDAL.GetGiaoDiens();
        }
    }
}
