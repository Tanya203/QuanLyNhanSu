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
        public QuanLyChucVuBUS()
        {
            chucVuDAL = new QuanLyChucVuDAL();
        }
        public IEnumerable<ChucVuViewModels> GetAllChucVu()
        {
            return chucVuDAL.GetAllChucVu();
        }
        public IEnumerable<ChucVuViewModels> SearchChucVu(string timKiem)
        {
            return chucVuDAL.SearchChucVu(timKiem);
        }
        public IEnumerable<ChucVu> GetChucVuTheoPhongBan(string maPB)
        {
            return chucVuDAL.GetChucVuTheoPhongBan(maPB);
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
        public decimal GetLuongCoBanCuaChucVu(string maCV)
        {
            return chucVuDAL.GetLuongCoBanCuaChucVu(maCV);
        }
    }
}
