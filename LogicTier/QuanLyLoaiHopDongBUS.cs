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
