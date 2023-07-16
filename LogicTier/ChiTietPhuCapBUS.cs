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
            return chiTietPhuCapDAL.Delete(chiTietPhuCap);
        }
        public List<ChiTietPhuCap> ThongTinPhuCapNhanVien(string maNV)
        {
            return chiTietPhuCapDAL.ThongTinPhuCapNhanVien(maNV);
        }
        public decimal TongPhuCapMotNhanVien(string maNV)
        {
            return chiTietPhuCapDAL.TongPhuCapMotNhanVien(maNV);
        }
    }
}
