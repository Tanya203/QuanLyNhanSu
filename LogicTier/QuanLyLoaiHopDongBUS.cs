using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyLoaiHopDongBUS
    {
        private readonly QuanLyLoaiHopDongDAL loaiHopDongDAL;
        public QuanLyLoaiHopDongBUS()
        {
            loaiHopDongDAL = new QuanLyLoaiHopDongDAL();
        }
        public IEnumerable<LoaiHopDongViewModels> GetAllLoaiHopDong()
        {
            return loaiHopDongDAL.GetAllLoaiHopDong();
        }
        public IEnumerable<LoaiHopDongViewModels> SearchLoaiHopDong(string timKiem)
        {
            return loaiHopDongDAL.SearchLoaiHopDong(timKiem);
        }
        public IEnumerable<LoaiHopDong> GetLoaiHopDong()
        {
            return loaiHopDongDAL.GetLoaiHopDong();
        }
        public bool Save(LoaiHopDong loaiHopDong)
        {
            return loaiHopDongDAL.Save(loaiHopDong);
        }
        public bool Delete(LoaiHopDong loaiHopDong)
        {
            return loaiHopDongDAL.Delete(loaiHopDong.MaLHD);
        }
        public int TongSoNhanVienTrongLoaiHopDong(string maLHD)
        {
            return loaiHopDongDAL.TongSoNhanVienTrongLoaiHopDong(maLHD);
        }
    }
}
