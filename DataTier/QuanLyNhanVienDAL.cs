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
            var danhSachNhanVien = from nhanVien in quanLyNhanSu.NhanViens
                                   join chucVu in quanLyNhanSu.ChucVus on nhanVien.MaCV equals chucVu.MaCV
                                   join phongBan in quanLyNhanSu.PhongBans on chucVu.MaPB equals phongBan.MaPB
                                   join loaiHopDong in quanLyNhanSu.LoaiHopDongs on nhanVien.MaLHD equals loaiHopDong.MaLHD
                                   select new NhanVienViewModel
                                   {
                                       MaNV = nhanVien.MaNV,
                                       MaCV = nhanVien.MaCV,
                                       MaLHD = nhanVien.MaLHD,
                                       TaiKhoan = nhanVien.TaiKhoan,
                                       CCCD_CMND = nhanVien.CCCD_CMND,
                                       Ho = nhanVien.Ho,
                                       TenLot = nhanVien.TenLot,
                                       Ten = nhanVien.Ten,
                                       NTNS = nhanVien.NTNS,
                                       SoNha = nhanVien.SoNha,
                                       TenDuong = nhanVien.TenDuong,
                                       Phuong_Xa = nhanVien.Phuong_Xa,
                                       Quan_Huyen = nhanVien.Quan_Huyen,
                                       Tinh_ThanhPho = nhanVien.Tinh_ThanhPho,
                                       GioiTinh = nhanVien.GioiTinh,
                                       SDT = nhanVien.SDT,
                                       Email = nhanVien.Email,
                                       TrinhDoHocVan = nhanVien.TrinhDoHocVan,
                                       NgayVaoLam = nhanVien.NgayVaoLam,
                                       ThoiHanHopDong = nhanVien.ThoiHanHopDong,
                                       TinhTrang = nhanVien.TinhTrang,
                                       SoNgayPhep = nhanVien.SoNgayPhep,
                                       LuongCoBan = nhanVien.LuongCoBan,
                                       Hinh = nhanVien.Hinh,
                                       TenPhongBan = phongBan.TenPhongBan,
                                       TenChucVu = chucVu.TenChucVu,
                                       TenLoaiHopDong= loaiHopDong.TenLoaiHopDong,
                                   }
                                   into nhanVien
                                   orderby nhanVien.MaNV
                                   select nhanVien;
            return danhSachNhanVien;
        }
        public IEnumerable<NhanVienViewModel> SearchNhanVien(string timKiem)
        {
            var danhSachNhanVien = from nhanVien in quanLyNhanSu.NhanViens
                                   join chucVu in quanLyNhanSu.ChucVus on nhanVien.MaCV equals chucVu.MaCV
                                   join phongBan in quanLyNhanSu.PhongBans on chucVu.MaPB equals phongBan.MaPB
                                   join loaiHopDong in quanLyNhanSu.LoaiHopDongs on nhanVien.MaLHD equals loaiHopDong.MaLHD
                                   select new NhanVienViewModel
                                   {
                                       MaNV = nhanVien.MaNV,
                                       MaCV = nhanVien.MaCV,
                                       MaLHD = nhanVien.MaLHD,
                                       TaiKhoan = nhanVien.TaiKhoan,
                                       CCCD_CMND = nhanVien.CCCD_CMND,
                                       Ho = nhanVien.Ho,
                                       TenLot = nhanVien.TenLot,
                                       Ten = nhanVien.Ten,
                                       NTNS = nhanVien.NTNS,
                                       SoNha = nhanVien.SoNha,
                                       TenDuong = nhanVien.TenDuong,
                                       Phuong_Xa = nhanVien.Phuong_Xa,
                                       Quan_Huyen = nhanVien.Quan_Huyen,
                                       Tinh_ThanhPho = nhanVien.Tinh_ThanhPho,
                                       GioiTinh = nhanVien.GioiTinh,
                                       SDT = nhanVien.SDT,
                                       Email = nhanVien.Email,
                                       TrinhDoHocVan = nhanVien.TrinhDoHocVan,
                                       NgayVaoLam = nhanVien.NgayVaoLam,
                                       ThoiHanHopDong = nhanVien.ThoiHanHopDong,
                                       TinhTrang = nhanVien.TinhTrang,
                                       SoNgayPhep = nhanVien.SoNgayPhep,
                                       LuongCoBan = nhanVien.LuongCoBan,
                                       Hinh = nhanVien.Hinh,
                                       TenPhongBan = phongBan.TenPhongBan,
                                       TenChucVu = chucVu.TenChucVu,
                                       TenLoaiHopDong = loaiHopDong.TenLoaiHopDong,
                                   }
                                   into nhanVien
                                   where (nhanVien.MaNV.Contains(timKiem) ||
                                          nhanVien.TenPhongBan.Contains(timKiem) ||
                                          nhanVien.TenChucVu.Contains(timKiem) ||
                                          nhanVien.TaiKhoan.Contains(timKiem) ||
                                          nhanVien.CCCD_CMND.Contains(timKiem) ||
                                          nhanVien.Ho.Contains(timKiem) ||
                                          nhanVien.TenLot.Contains(timKiem) ||
                                          nhanVien.Ten.Contains(timKiem) ||
                                          nhanVien.NTNS.ToString().Contains(timKiem) ||
                                          nhanVien.SoNha.Contains(timKiem) ||
                                          nhanVien.TenDuong.Contains(timKiem) ||
                                          nhanVien.Phuong_Xa.Contains(timKiem) ||
                                          nhanVien.Quan_Huyen.Contains(timKiem) ||
                                          nhanVien.Tinh_ThanhPho.Contains(timKiem) ||
                                          nhanVien.GioiTinh.Contains(timKiem) ||
                                          nhanVien.SDT.Contains(timKiem) ||
                                          nhanVien.Email.Contains(timKiem) ||
                                          nhanVien.TrinhDoHocVan.Contains(timKiem) ||
                                          nhanVien.NgayVaoLam.ToString().Contains(timKiem) ||
                                          nhanVien.ThoiHanHopDong.ToString().Contains(timKiem) ||
                                          nhanVien.TinhTrang.Contains(timKiem) ||
                                          nhanVien.SoNgayPhep.ToString().Contains(timKiem) ||
                                          nhanVien.LuongCoBan.ToString().Contains(timKiem))
                                   orderby nhanVien.MaNV
                                   select nhanVien;
            return danhSachNhanVien;
        }
        public IEnumerable<NhanVien> GetNhanVienTheoPhongBan(string maPB)
        {
            var listNV = from nhanVien in quanLyNhanSu.NhanViens
                         join chucVu in quanLyNhanSu.ChucVus on nhanVien.MaCV equals chucVu.MaCV
                         join phongBan in quanLyNhanSu.PhongBans on chucVu.MaPB equals phongBan.MaPB
                         where chucVu.MaPB == maPB
                         orderby nhanVien.MaNV
                         select nhanVien;
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
                    newNhanVien.MaCV = nhanVien.MaNV;
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
                if (nhanVien == null || nhanVien.MatKhau != matKhau/*!BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau)*/)
                {
                    MessageBox.Show("Tài khoản hoặc mật khẩu không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                else if(nhanVien != null || nhanVien.MatKhau == matKhau/*BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau)*/)
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
