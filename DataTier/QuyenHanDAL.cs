using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
            return quanLyNhanSu.QuyenHans.OrderBy(qh => qh.MaQH).ToList();
        }
    }
}
