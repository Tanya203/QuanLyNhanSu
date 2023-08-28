using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyLoaiCaBUS
    {
        private readonly QuanLyLoaiCaDAL loaiCaDAL;
        public QuanLyLoaiCaBUS()
        {
            loaiCaDAL = new QuanLyLoaiCaDAL();
        }
        public IEnumerable<LoaiCaViewModels> GetAllLoaiCa()
        {
            return loaiCaDAL.GetAllLoaiCa();
        }
        public IEnumerable<LoaiCaViewModels> SearchLoaiCa(string timKiem)
        {
            return loaiCaDAL.SearchLoaiCa(timKiem);
        }
        public IEnumerable<LoaiCa> GetLoaiCa()
        {
            return loaiCaDAL.GetLoaiCa();
        }
        public bool Save(LoaiCa loaiCa)
        {
            return loaiCaDAL.Save(loaiCa);
        }
        public bool Delete(LoaiCa loaiCa)
        {
            return loaiCaDAL.Delete(loaiCa.MaLC);
        }
    }
}
