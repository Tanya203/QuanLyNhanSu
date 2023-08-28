using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

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
            if (nv != null && nhanVien.MatKhau == nv.MatKhau)
                return nhanVienDAL.Save(nhanVien);
            if(nv != null && nhanVien.MatKhau != nv.MatKhau)
            {
                nv.MatKhau = BCrypt.Net.BCrypt.HashPassword(nhanVien.MatKhau);
                return nhanVienDAL.Save(nv);
            }
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
