using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;

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
