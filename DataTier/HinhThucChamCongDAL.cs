using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class HinhThucChamCongDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public HinhThucChamCongDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<HinhThucChamCong> GetAllHinhThucChamCong()
        {
            return quanLyNhanSu.HinhThucChamCongs.OrderBy(ht => ht.MaHTCC).ToList();
        }
    }
}
