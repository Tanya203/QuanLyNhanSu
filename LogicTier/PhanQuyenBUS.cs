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
    internal class PhanQuyenBUS
    {
        public readonly PhanQuyenDAL phanQuyenDAL;
        public PhanQuyenBUS()
        {
            phanQuyenDAL = new PhanQuyenDAL();
        }
        public IEnumerable<PhanQuyenViewModels> GetAllPhanQuyen(string loc)
        {
            return phanQuyenDAL.GetAllPhanQuyen(loc);
        }
        public IEnumerable<PhanQuyenViewModels> GetAllPhanQuyenTimKiem(string loc, string timKiem)
        {
            return phanQuyenDAL.GetAllPhanQuyenTimKiem(loc, timKiem);
        }
        public IEnumerable<PhanQuyen> GetPhanQuyens()
        {
            return phanQuyenDAL.GetPhanQuyens();
        }
        public bool Save(PhanQuyen pq)
        {
            return phanQuyenDAL.Save(pq);
        }
        public bool AddChucVuVaoPhanQuyen(List<PhanQuyen> chucVu)
        {
            return phanQuyenDAL.AddChucVuVaoPhanQuyen(chucVu);
        }
    }
}
