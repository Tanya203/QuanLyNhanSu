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
    internal class ChiTietPhieuThuongBUS
    {
        private readonly ChiTietPhieuThuongDAL chiTietPhieuThuongDAL;
        public ChiTietPhieuThuongBUS()
        {
            chiTietPhieuThuongDAL = new ChiTietPhieuThuongDAL();
        }
        public IEnumerable<ChiTietPhieuThuongViewModels> GetAllChiTietPhieuThuong()
        {
            return chiTietPhieuThuongDAL.GetAllChiTietPhieuThuong();
        }
        public IEnumerable<ChiTietPhieuThuongViewModels> SearchChiTietPhieuThuong(string timKiem)
        {
            return chiTietPhieuThuongDAL.SearchChiTietPhieuThuong(timKiem);
        }
        public bool Save(ChiTietPhieuThuong chiTietPhieuThuong)
        {
            return chiTietPhieuThuongDAL.Save(chiTietPhieuThuong);
        }
        public bool Delete(ChiTietPhieuThuong chiTietPhieuThuong)
        {
            return chiTietPhieuThuongDAL.Delete(chiTietPhieuThuong.MaNV);
        }
    }
}
