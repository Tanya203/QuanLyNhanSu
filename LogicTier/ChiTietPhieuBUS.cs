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
    internal class ChiTietPhieuBUS
    {
        private readonly ChiTietPhieuDAL chiTietPhieuDAL;
        public ChiTietPhieuBUS()
        {
            chiTietPhieuDAL = new ChiTietPhieuDAL();
        }
        public IEnumerable<ChiTietPhieuViewModels> GetAllChiTietPhieu(string maP)
        {
            return chiTietPhieuDAL.GetAllChiTietPhieu(maP);
        }
        public IEnumerable<ChiTietPhieuViewModels> SearchChiTietPhieu(string maP, string timKiem)
        {
            return chiTietPhieuDAL.SearchChiTietPhieu(maP, timKiem);
        }
        public bool Save(ChiTietPhieu chiTietPhieu)
        {
            return chiTietPhieuDAL.Save(chiTietPhieu);
        }
        public bool Delete(ChiTietPhieu chiTietPhieu)
        {
            return chiTietPhieuDAL.Delete(chiTietPhieu.MaNV);
        }
        public decimal TongTienPhieu(string maPhieu)
        {
            return chiTietPhieuDAL.TongTienPhieu(maPhieu);
        }
        public IEnumerable<ChiTietPhieu> GetChiTietPhieu()
        {
            return chiTietPhieuDAL.GetChiTietPhieu();
        }
        public decimal SoTienNhanVienTrongPhieu(string maNV, string maPhieu)
        {
            return chiTietPhieuDAL.SoTienNhanVienTrongPhieu(maNV, maPhieu);
        }
    }
}
