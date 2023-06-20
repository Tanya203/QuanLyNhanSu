using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyNhanVienDAL
    {
        private QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyNhanVienDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();       
        }

        public IEnumerable<NhanVienViewModel> GetAll()
        {
            var danhSachNhanVien = quanLyNhanSu.NhanViens.Select(x => new NhanVienViewModel
                                                                {
                                                                    MaNV = x.MaNV,
                                                                    MaCV = x.MaCV,
                                                                    MaLHD = x.MaLHD,
                                                                    TaiKhoan = x.TaiKhoan,
                                                                    MatKhau = x.MatKhau,
                                                                    CCCD_CMND = x.CCCD_CMND,
                                                                    Ho = x.Ho,
                                                                    TenLot = x.TenLot,
                                                                    Ten = x.Ten,
                                                                    NTNS = x.NTNS,
                                                                    SoNha = x.SoNha,
                                                                    TenDuong = x.TenDuong,
                                                                    Phuong_Xa = x.Phuong_Xa,
                                                                    Quan_Huyen = x.Quan_Huyen,
                                                                    Tinh_ThanhPho = x.Tinh_ThanhPho,
                                                                    GioiTinh = x.GioiTinh,
                                                                    SDT = x.SDT,
                                                                    Email = x.Email,
                                                                    TrinhDoHocVan = x.TrinhDoHocVan,
                                                                    NgayVaoLam = x.NgayVaoLam,
                                                                    ThoiHanHopDong = x.ThoiHanHopDong,
                                                                    SoNgayPhep = x.SoNgayPhep,
                                                                    LuongCoBan = x.LuongCoBan,
                                                                    Hinh = x.Hinh,
                                                                }).ToList();
            return danhSachNhanVien;
        }

        public bool Add(NhanVien nhanVien)
        {
            try
            {
                NhanVien newNhanVien = new NhanVien();
                newNhanVien.MaNV = "1";
                newNhanVien.MaCV = nhanVien.MaNV;
                newNhanVien.MaLHD = nhanVien.MaLHD;
                newNhanVien.TaiKhoan = nhanVien.TaiKhoan;
                newNhanVien.MatKhau = BCrypt.Net.BCrypt.HashPassword(nhanVien.MatKhau);
                newNhanVien.CCCD_CMND = nhanVien.CCCD_CMND;
                newNhanVien.Ho = nhanVien.Ho;
                newNhanVien.TenLot = nhanVien.TenLot;
                newNhanVien.Ten = nhanVien.Ten;
                newNhanVien.NTNS = nhanVien.NTNS;
                newNhanVien.SoNha = nhanVien.SoNha;
                newNhanVien.TenDuong = nhanVien.TenDuong;
                newNhanVien.Phuong_Xa = nhanVien.Phuong_Xa;
                newNhanVien.Quan_Huyen = nhanVien.Quan_Huyen;
                newNhanVien.Tinh_ThanhPho = nhanVien.Tinh_ThanhPho;
                newNhanVien.GioiTinh = nhanVien.GioiTinh;
                newNhanVien.SDT = nhanVien.SDT;
                newNhanVien.Email = nhanVien.Email;
                newNhanVien.TrinhDoHocVan = nhanVien.TrinhDoHocVan;
                newNhanVien.NgayVaoLam = nhanVien.ThoiHanHopDong;
                newNhanVien.ThoiHanHopDong = nhanVien.ThoiHanHopDong;
                newNhanVien.TinhTrang = nhanVien.TinhTrang;
                newNhanVien.SoNgayPhep = nhanVien.SoNgayPhep;
                newNhanVien.LuongCoBan = nhanVien.LuongCoBan;
                newNhanVien.Hinh = nhanVien.Hinh;
                quanLyNhanSu.NhanViens.Add(newNhanVien);
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch(SqlException ex)
            {
                throw ex;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
