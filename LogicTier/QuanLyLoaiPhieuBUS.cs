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
    internal class QuanLyLoaiPhieuBUS
    {
        private readonly QuanLyLoaiPhieuDAL quanLyLoaiPhieuDAL;
        public QuanLyLoaiPhieuBUS()
        {
            quanLyLoaiPhieuDAL = new QuanLyLoaiPhieuDAL();
        }
        public IEnumerable<LoaiPhieuViewModels> GetAllLoaiPhieu()
        {
            return quanLyLoaiPhieuDAL.GetAllLoaiPhieu();
        }
        public IEnumerable<LoaiPhieuViewModels> SearchLoaiPhieu(string timKiem)
        {
            return quanLyLoaiPhieuDAL.SearchLoaiPhieu(timKiem);
        }
        public IEnumerable<LoaiPhieu> GetLoaiPhieu()
        {
            return quanLyLoaiPhieuDAL.GetLoaiPhieu();
        }
        public bool Save(LoaiPhieu loaiPhieu)
        {
            return quanLyLoaiPhieuDAL.Save(loaiPhieu);
        }
        public bool Delete(LoaiPhieu loaiPhieu)
        {
            return quanLyLoaiPhieuDAL.Delete(loaiPhieu.MaLP);
        }
        public int SoLuongPhieuLap(string maPL)
        {
            return quanLyLoaiPhieuDAL.SoLuongPhieuLap(maPL);
        }
    }
}
