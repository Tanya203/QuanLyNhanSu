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
using System.Data.Entity;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyNhanVienDAL
    {
        private QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyNhanVienDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<NhanVienViewModel> GetAllNhanVien()
        {
            var danhSachNhanVien = quanLyNhanSu.NhanViens.Select(nv => new NhanVienViewModel
            {
                MaNV = nv.MaNV,
                MaCV = nv.MaCV,
                MaLHD = nv.MaLHD,
                TaiKhoan = nv.TaiKhoan,
                CCCD_CMND = nv.CCCD_CMND,
                Ho = nv.Ho,
                TenLot = nv.TenLot,
                Ten = nv.Ten,
                NTNS = nv.NTNS,
                SoNha = nv.SoNha,
                TenDuong = nv.TenDuong,
                Phuong_Xa = nv.Phuong_Xa,
                Quan_Huyen = nv.Quan_Huyen,
                Tinh_ThanhPho = nv.Tinh_ThanhPho,
                GioiTinh = nv.GioiTinh,
                SDT = nv.SDT,
                Email = nv.Email,
                TrinhDoHocVan = nv.TrinhDoHocVan,
                NgayVaoLam = nv.NgayVaoLam,
                ThoiHanHopDong = nv.ThoiHanHopDong,
                TinhTrang = nv.TinhTrang,
                SoNgayPhep = nv.SoNgayPhep,
                LuongCoBan = nv.LuongCoBan,
                Hinh = nv.Hinh,
                TenPhongBan = nv.ChucVu.PhongBan.TenPhongBan,
                TenChucVu = nv.ChucVu.TenChucVu,
                TenLoaiHopDong = nv.LoaiHopDong.TenLoaiHopDong,
            }).OrderBy(nv=>nv.MaNV);                                   
            return danhSachNhanVien;
        }       
        public IEnumerable<NhanVien> GetNhanVienTheoPhongBan(string maPB)
        {
            var listNV = quanLyNhanSu.NhanViens.Where(nv => nv.ChucVu.PhongBan.MaPB == maPB).ToList();
            return listNV;
        }
        public IEnumerable<NhanVien> GetNhanVien()
        {
            return quanLyNhanSu.NhanViens.OrderBy(nv => nv.MaNV).ToList();
        }
        public bool Save(NhanVien nhanVien)
        {
            try
            {
                NhanVien newNhanVien = quanLyNhanSu.NhanViens.Where(nv => nv.MaNV == nhanVien.MaNV).FirstOrDefault();
                if (newNhanVien != null)// cập nhật
                {
                    newNhanVien.MaCV = nhanVien.MaCV;
                    newNhanVien.MaLHD = nhanVien.MaLHD;
                    newNhanVien.TaiKhoan = nhanVien.TaiKhoan;
                    newNhanVien.MatKhau = nhanVien.MatKhau;
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
                    newNhanVien.NgayVaoLam = nhanVien.NgayVaoLam;
                    newNhanVien.ThoiHanHopDong = nhanVien.ThoiHanHopDong;
                    newNhanVien.TinhTrang = nhanVien.TinhTrang;
                    newNhanVien.SoNgayPhep = nhanVien.SoNgayPhep;
                    newNhanVien.LuongCoBan = nhanVien.LuongCoBan;
                    newNhanVien.Hinh = nhanVien.Hinh;
                }
                else//thêm mới           
                    quanLyNhanSu.NhanViens.Add(nhanVien);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
                    { "CHECK_ThoiHanHopDong", "Thời hạn hợp đồng phải lớn hơn ngày vào làm" }
                };                
                foreach (var error in errorMessages)
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
                    if (!string.IsNullOrEmpty(ex.InnerException.ToString()))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá ca " + nhanVien.MaNV + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.NhanViens.Remove(nhanVien);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá ca " + nhanVien.MaNV, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
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
                    if (string.IsNullOrEmpty(ex.Message))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }
        public NhanVien GetNhanVien(string maNV)
        {
            return quanLyNhanSu.NhanViens.Where(nv =>nv.MaNV == maNV).FirstOrDefault();
        }
        public decimal TongPhuCap1NhanVien(string maNV)
        {
            decimal tongPhuCap = 0;
            var listCTPC = quanLyNhanSu.ChiTietPhuCaps.Where(nv => nv.MaNV == maNV).ToList();
            foreach(var pc in listCTPC)
            {
                tongPhuCap += quanLyNhanSu.PhuCaps.Where(x => x.MaPC == pc.MaPC).Sum(p => p.TienPhuCap);
            }
            return tongPhuCap;
            /*decimal tongPhuCap = quanLyNhanSu.ChiTietPhuCaps
            .Join(quanLyNhanSu.PhuCaps, ctpc => ctpc.MaPC, pc => pc.MaPC, (ctpc, pc) => new { ctpc, pc })
            .Where(x => x.ctpc.MaNV == maNV)
            .Sum(x => x.pc.TienPhuCap);
            return tongPhuCap;*/
        }
        public bool LoginVerify(string taiKhoan, string matKhau)
        {
            var nhanVien = quanLyNhanSu.NhanViens.Where(x => x.TaiKhoan == taiKhoan).FirstOrDefault();
            try
            {                
                if (nhanVien == null || !BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau))
                {
                    MessageBox.Show("Tài khoản hoặc mật khẩu không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                else if(nhanVien != null  && BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau))
                {
                    MessageBox.Show("Đăng nhập thành công! - "+nhanVien.MaNV+"","Thông báo", MessageBoxButtons.OK,MessageBoxIcon.Information);
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
                    if(string.IsNullOrEmpty(ex.Message))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }                       
        }
    }
}
