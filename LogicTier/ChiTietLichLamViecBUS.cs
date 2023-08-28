using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class ChiTietLichLamViecBUS
    {
        private readonly ChiTietLichLamViecDAL chiTietLichLamViecDAL;
        public ChiTietLichLamViecBUS()
        {
            chiTietLichLamViecDAL = new ChiTietLichLamViecDAL();
        }
        public IEnumerable<ChiTietLichLamViecViewModels> GetChiTietLichLamViec(string maLLV)
        {
            return chiTietLichLamViecDAL.GetChiTietLichLamViec(maLLV);
        }
        public IEnumerable<ChiTietLichLamViecViewModels> SearchChiTietLichLamViec(string maLLV, string timKiem)
        {
            return chiTietLichLamViecDAL.SearchChiTietLichLamViec(maLLV, timKiem);
        }
        public IEnumerable<ChamCong> GetChiTietLichLamViec()
        {
            return chiTietLichLamViecDAL.GetChiTietLichLamViec();
        }
        public bool Save(ChamCong chamCong)
        {
            return chiTietLichLamViecDAL.Save(chamCong);
        }
        public bool Delete(ChamCong nhanVien)
        {
            return chiTietLichLamViecDAL.Delete(nhanVien.MaLLV, nhanVien.MaNV);
        }
    }
}
