using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class ChiTietPhuCapBUS
    {
        private readonly ChiTietPhuCapDAL chiTietPhuCapDAL;
        public ChiTietPhuCapBUS()
        {
            chiTietPhuCapDAL = new ChiTietPhuCapDAL();
        }
        public IEnumerable<ChiTietPhuCapViewModels> GetAllChiTietPhuCap(string maP)
        {
            return chiTietPhuCapDAL.GetAllChiTietPhuCap(maP);
        }
        public IEnumerable<ChiTietPhuCapViewModels> GetPhuCapMotNhanVien(string maNV)
        {
            return chiTietPhuCapDAL.GetPhuCapMotNhanVien(maNV);
        }
        public IEnumerable<ChiTietPhuCapViewModels> SearchChiTietPhuCap(string maPC, string timKiem)
        {
            return chiTietPhuCapDAL.SearchChiTietPhuCap(maPC, timKiem);
        }
        public bool Save(ChiTietPhuCap chiTietPhuCap)
        {
            return chiTietPhuCapDAL.Save(chiTietPhuCap);
        }
        public bool Delete(ChiTietPhuCap chiTietPhuCap)
        {
            return chiTietPhuCapDAL.Delete(chiTietPhuCap.MaNV, chiTietPhuCap.MaPC);
        }
        public IEnumerable<ChiTietPhuCap> GetChiTIetPhuCap()
        {
            return chiTietPhuCapDAL.GetChiTIetPhuCap();
        }
        public decimal TongPhuCapMotNhanVien(string maNV)
        {
            return chiTietPhuCapDAL.TongPhuCapMotNhanVien(maNV);
        }
        public int TongSoNhanVienTrongPhuCap(string maPC)
        {
            return chiTietPhuCapDAL.TongSoNhanVienTrongPhuCap(maPC);
        }
        public decimal TongTienMotPhuCap(string maPC)
        {
            return chiTietPhuCapDAL.TongTienMotPhuCap(maPC);
        }
    }
}
