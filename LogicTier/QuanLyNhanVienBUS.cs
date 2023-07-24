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
        public NhanVien ThongTinNhanVien(string maNV)
        {
            return nhanVienDAL.ThongTinNhanVien(maNV);
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
            Regex bcryptCheck = new Regex(@"^\$2[aby]?\$\d{1,2}\$[./0-9A-Za-z]{53}$");
            if (nv != null && bcryptCheck.IsMatch(nhanVien.MatKhau))
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
        public bool VerifyInfo(string maNV, string taiKhoan, string CCCD, string sdt, string email)
        {
            return nhanVienDAL.VerifyInfo(maNV, taiKhoan, CCCD, sdt, email);
        }
    }
}
