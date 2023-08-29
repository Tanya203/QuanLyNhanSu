using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier
{
    internal class GiaoDienDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public GiaoDienDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<GiaoDien> GetGiaoDiens()
        {
            return quanLyNhanSu.GiaoDiens.OrderBy(gd => gd.MaGD).ToList();
        }
    }
}
