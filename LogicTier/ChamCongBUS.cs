using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        public bool ChamCong(ChamCong nhanVien)
        {
            return chamCongDAL.ChamCong(nhanVien);
        }
    }
}
