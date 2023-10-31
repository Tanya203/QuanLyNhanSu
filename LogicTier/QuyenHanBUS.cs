using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuyenHanBUS
    {
        private readonly QuyenHanDAL quyenHanDAL;
        public QuyenHanBUS()
        {
            quyenHanDAL = new QuyenHanDAL();
        }
        public IEnumerable<QuyenHan> GetQuyenHans()
        {
            return quyenHanDAL.GetQuyenHans();
        }
    }
}
