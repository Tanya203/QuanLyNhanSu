using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyLoaiCaBUS
    {
        private readonly QuanLyLoaiCaDAL quanLyLoaiCaDAL;
        public QuanLyLoaiCaBUS()
        {
            quanLyLoaiCaDAL = new QuanLyLoaiCaDAL();
        }
        public IEnumerable<LoaiCaViewModels> GetAllLoaiCa()
        {
            return quanLyLoaiCaDAL.GetAllLoaiCa();
        }
        public IEnumerable<LoaiCaViewModels> SearchLoaiCa(string timKiem)
        {
            return quanLyLoaiCaDAL.SearchLoaiCa(timKiem);
        }

        public bool Save(LoaiCa loaiCa)
        {
            return quanLyLoaiCaDAL.Save(loaiCa);
        }
        public bool Delete(LoaiCa loaiCa)
        {
            return quanLyLoaiCaDAL.Delete(loaiCa.MaLC);
        }
    }
}
