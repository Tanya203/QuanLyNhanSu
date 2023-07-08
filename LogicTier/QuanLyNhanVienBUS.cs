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
        public IEnumerable<NhanVien> GetNhanVienTheoPhongBan(string maPB)
        {
            return nhanVienDAL.GetNhanVienTheoPhongBan(maPB);
        }        
        public bool Save(NhanVien nhanVien)
        {
            NhanVien nv = nhanVienDAL.ThongTinNhanVien(nhanVien.MaNV);
            Regex bcryptCheck = new Regex(@"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d).{8,}$");                      
            if (nv != null && !bcryptCheck.IsMatch(nhanVien.MatKhau))
                return nhanVienDAL.Save(nhanVien);
            nhanVien.MatKhau = BCrypt.Net.BCrypt.HashPassword(nhanVien.MatKhau);
            return nhanVienDAL.Save(nhanVien);
        }
        public bool Delete(string maNV)
        {
            return nhanVienDAL.Delete(maNV);
        }
        public decimal TongPhuCap1NhanVien(string maNV)
        {
            return nhanVienDAL.TongPhuCap1NhanVien(maNV);
        }
        public bool LoginVerify(string taiKhoan, string matKhau)
        {            
            return nhanVienDAL.LoginVerify(taiKhoan, matKhau);
        }
    }
}
