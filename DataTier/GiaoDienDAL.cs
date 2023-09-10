using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

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
