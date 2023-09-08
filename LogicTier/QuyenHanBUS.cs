using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
