using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class QuyenHanDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuyenHanDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<QuyenHan> GetQuyenHans()
        {
            return quanLyNhanSu.QuyenHans.OrderBy(qh => qh.TenQuyenHan).ToList();
        }
    }
}
