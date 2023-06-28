using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyChucVuBUS
    {
        private readonly QuanLyChucVuDAL chucVuDAL;
        private readonly QuanLyPhongBanDAL phongBanDAL;
        public QuanLyChucVuBUS()
        {
            chucVuDAL = new QuanLyChucVuDAL();
            phongBanDAL = new QuanLyPhongBanDAL();
        }
        public IEnumerable<ChucVuViewModels> GetAllChucVu()
        {
            return chucVuDAL.GetAllChucVu();
        }
        public IEnumerable<ChucVuViewModels> LoadChucVuTheoPhongBan(string maPB)
        {
            return chucVuDAL.LoadChucVuTheoPhongBan(maPB);
        }
        public IEnumerable<ChucVuViewModels> SearchChucVu(string timKiem)
        {
            return chucVuDAL.SearchChucVu(timKiem);
        }
        public bool Save(ChucVu chucVu)
        {
            return chucVuDAL.Save(chucVu);
        }
        public bool Delete(ChucVu chucVu)
        {
            return chucVuDAL.Delete(chucVu.MaCV);
        }
        public int TongSoNhanVienThuocChucVu(string maCV)
        {
            return chucVuDAL.TongSoNhanVienThuocChucVu(maCV);
        }
    }
}
