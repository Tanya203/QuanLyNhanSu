using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class HinhThucChamCongBUS
    {
        private readonly HinhThucChamCongDAL hinhThucChamCongDAL;
        public HinhThucChamCongBUS()
        {
            hinhThucChamCongDAL = new HinhThucChamCongDAL();
        }
        public IEnumerable<HinhThucChamCong> GetAllHinhThucChamCong()
        {
            return hinhThucChamCongDAL.GetAllHinhThucChamCong();
        }
    }
}
