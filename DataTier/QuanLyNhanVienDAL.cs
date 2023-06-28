using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Drawing;
using System.Data.Entity.Migrations;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyNhanVienDAL
    {
        private QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyNhanVienDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();       
        }
        public IEnumerable<NhanVienViewModel> GetAllNhanVien()
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
        public bool Save(NhanVien nhanVien)
        {
            try
            {
                NhanVien newNhanVien = quanLyNhanSu.NhanViens.Where(nv => nv.MaNV == nhanVien.MaNV).FirstOrDefault();
                if (newNhanVien != null)// cập nhật
                {
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
                }
                else//thêm mới           
                    quanLyNhanSu.NhanViens.Add(nhanVien);
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                var errorMessages = new Dictionary<string, string>
                {
                    { "UQ_CCCD_CMND", "CCCD/CMND đã tồn tại" },
                    { "UQ_Email", "Email đã tồn tại" },
                    { "UQ_SDT", "Số điện thoại đã tồn tại" },
                    { "UQ_TaiKhoan", "Tài khoản đã tồn tại" },
                    { "CHECK_CCCD_CMND", "Độ dài CCCD/CMND phải = 9 hoặc 12" },
                    { "CHECK_GioiTinh", "Giới tính phải là Nam, Nữ hoặc Khác" },
                    { "CHECK_LuongCoBan", "Lương cơ bản phải >= 0" },
                    { "CHECK_NgayVaoLam", "Ngày vào làm phải >= ngày hiện tại" },
                    { "CHECK_NTNS", "Tuổi phải >= 18" },
                    { "CHECK_SDT", "Độ dài số điện thoại phải = 10" },
                    { "CHECK_SoNgayPhep", "Số ngày phép phải >= 0" },
                    { "CHECK_TaiKhoan", "Độ dài tại khoản phải >= 5 và =<15 ký tự" },
                    { "CHECK_ThoiHanHopDong", "Thời hạn hợp đồng phải lơn hơn ngày vào làm" }
                };
                
                foreach (KeyValuePair<string, string> error in errorMessages)
                {
                    if (ex.InnerException.ToString().Contains(error.Key))
                    {
                        MessageBox.Show(error.Value, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return false;
                    }
                }
                MessageBoxManager.Yes = "OK";
                MessageBoxManager.No = "Chi tiết lỗi";
                DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
                if (ketQua == DialogResult.No)
                {
                    MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }            
        }                        
        
        public bool Delete(string maNV)
        {
            try
            {
                var nhanVien = quanLyNhanSu.NhanViens.Where(nv => nv.MaNV == maNV).FirstOrDefault();
                if(nhanVien != null)
                {
                    quanLyNhanSu.NhanViens.Remove(nhanVien);
                    quanLyNhanSu.SaveChanges();
                    return true;
                }
                return false;
            }
            catch (Exception ex)
            {
                MessageBoxManager.Yes = "OK";
                MessageBoxManager.No = "Chi tiết lỗi";
                DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
                if (ketQua == DialogResult.No)
                {
                    MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }

        public NhanVien GetNhanVien(string maNV)
        {
            return quanLyNhanSu.NhanViens.Where(nv =>nv.MaNV == maNV).FirstOrDefault();
        }
        public int LoginVerify(string taiKhoan, string matKhau, out NhanVienViewModel nv)
        {
            var nhanVien = quanLyNhanSu.NhanViens.Where(x => x.TaiKhoan == taiKhoan).FirstOrDefault();
            nv = new NhanVienViewModel();
            if (nhanVien == null)
                return -1;
            if(BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau))                          
                return 1;            
            return 0;
        }
    }
}
