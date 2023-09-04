using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.LogicTier
{
    internal class ChamCongBUS
    {
        private readonly ChamCongDAL chamCongDAL;
        public ChamCongBUS()
        {
            chamCongDAL = new ChamCongDAL();
        }
        public List<ChamCong> GetLichLamViecTheoNgay(string ngayLam)
        {
            return chamCongDAL.GetLichLamViecTheoNgay(ngayLam).ToList();
        }
        public bool ChamCong(List<ChamCong> nhanVien, string thaoTac)
        {
            return chamCongDAL.ChamCong(nhanVien, thaoTac);
        }
    }
}
