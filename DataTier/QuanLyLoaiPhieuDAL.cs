using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyLoaiPhieuDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyLoaiPhieuDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<LoaiPhieu> GetLoaiPhieu()
        {
            return quanLyNhanSu.LoaiPhieux.OrderBy(lp => lp.MaLP).ToList();
        }
    }
}
