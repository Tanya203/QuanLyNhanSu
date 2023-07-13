using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyLoaiPhieuBUS
    {
        private readonly QuanLyLoaiPhieuDAL quanLyLoaiPhieuDAL;
        public QuanLyLoaiPhieuBUS()
        {
            quanLyLoaiPhieuDAL = new QuanLyLoaiPhieuDAL();
        }
        public IEnumerable<LoaiPhieu> GetLoaiPhieu()
        {
            return quanLyLoaiPhieuDAL.GetLoaiPhieu();
        }
    }
}
