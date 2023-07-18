using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyNhanVienBUS
    {
        private readonly QuanLyNhanVienDAL nhanVienDAL;
        public QuanLyNhanVienBUS()
        {
            nhanVienDAL = new QuanLyNhanVienDAL();
        }
        public IEnumerable<NhanVienViewModel> GetAllNhanVien()
        {
            return nhanVienDAL.GetAllNhanVien();
        }
        public IEnumerable<NhanVien> GetNhanVien()
        {
            return nhanVienDAL.GetNhanVien();
        }
        public NhanVien ThongTinNhanVien(string taiKhoan)
        {
            return nhanVienDAL.ThongTinNhanVien(taiKhoan);
        }
        public IEnumerable<NhanVienViewModel> SearchNhanVien(string timKiem)
        {
            return nhanVienDAL.SearchNhanVien(timKiem);
        }
        public IEnumerable<NhanVien> GetNhanVienChucVu(string maPB)
        {
            return nhanVienDAL.GetNhanVienChucVu(maPB);
        }
        public IEnumerable<NhanVien> GetNhanVienPhongBan(string maPB)
        {
            return nhanVienDAL.GetNhanVienPhongBan(maPB);
        }
        public bool Save(NhanVien nhanVien)
        {
            NhanVien nv = nhanVienDAL.ThongTinNhanVien(nhanVien.MaNV);            
            if (nv != null && nhanVien.MatKhau == nv.MatKhau)
                return nhanVienDAL.Save(nhanVien);
            nhanVien.MatKhau = BCrypt.Net.BCrypt.HashPassword(nhanVien.MatKhau);
            return nhanVienDAL.Save(nhanVien);
        }
        public bool Delete(string maNV)
        {
            return nhanVienDAL.Delete(maNV);
        }
        public bool LoginVerify(string taiKhoan, string matKhau)
        {            
            return nhanVienDAL.LoginVerify(taiKhoan, matKhau);
        }
    }
}
