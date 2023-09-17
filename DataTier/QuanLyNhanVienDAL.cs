using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;
using QuanLyNhanSu.LogicTier;
using System.Data.Entity.Migrations;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyNhanVienDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private int count;
        public QuanLyNhanVienDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();

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
                CCCD = nv.CCCD,
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
                NgayKhoa = nv.NgayKhoa,
                SoTienNo = nv.SoTienNo,
            }).OrderBy(nv=>nv.MaNV);                                   
            return danhSachNhanVien;
        }
        public IEnumerable<NhanVienViewModel> SearchNhanVien(string timKiem)
        {
            var danhSachNhanVien = quanLyNhanSu.NhanViens.Select(nv => new NhanVienViewModel
            {
                MaNV = nv.MaNV,
                MaCV = nv.MaCV,
                MaLHD = nv.MaLHD,
                TaiKhoan = nv.TaiKhoan,
                CCCD = nv.CCCD,
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
                NgayKhoa = nv.NgayKhoa,
                SoTienNo = nv.SoTienNo,
            }).Where(nhanVien => nhanVien.MaNV.Contains(timKiem) ||
                                          nhanVien.TenPhongBan.Contains(timKiem) ||
                                          nhanVien.TenChucVu.Contains(timKiem) ||
                                          nhanVien.TenLoaiHopDong.Contains(timKiem) ||
                                          nhanVien.TaiKhoan.Contains(timKiem) ||
                                          nhanVien.CCCD.Contains(timKiem) ||
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
                                          nhanVien.LuongCoBan.ToString().Contains(timKiem) ||
                                          nhanVien.NgayKhoa.ToString().Contains(timKiem) ||
                                          nhanVien.SoTienNo.ToString().Contains(timKiem)).OrderBy(nhanVien => nhanVien.MaNV).OrderBy(nv => nv.MaNV);
            return danhSachNhanVien;
        }
        public IEnumerable<NhanVien> GetNhanVienChucVu(string maCV)
        {
            var listNV = quanLyNhanSu.NhanViens.Where(nv => nv.ChucVu.MaCV == maCV).ToList();
            return listNV;
        }
        public IEnumerable<NhanVien> GetNhanVienPhongBan(string maPB)
        {
            var listNV = quanLyNhanSu.NhanViens.Where(nv => nv.ChucVu.PhongBan.MaPB == maPB).ToList();
            return listNV;
        }
        public IEnumerable<NhanVien> GetNhanVien()
        {
            return quanLyNhanSu.NhanViens.OrderBy(nv => nv.MaNV).ToList();
        }
        public NhanVien ThongTinNhanVien(string maNV)
        {
            NhanVien nhanVien = quanLyNhanSu.NhanViens.Where(nv => nv.MaNV == maNV).FirstOrDefault();
            return nhanVien;
        }
        public bool Save(NhanVien nhanVien)
        {
            try
            {
                quanLyNhanSu.NhanViens.AddOrUpdate(nhanVien);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
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
        public bool CapNhatSoTienNo(List<NhanVien> nhanVien)
        {
            try
            {
                foreach(NhanVien nv in nhanVien)
                {
                    quanLyNhanSu.NhanViens.AddOrUpdate(nv);
                    quanLyNhanSu.SaveChanges();
                }
                return true;
            }
            catch(Exception ex)
            {
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
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {maNV}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.NhanViens.Remove(nhanVien);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {maNV}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
                    if (!string.IsNullOrEmpty(ex.InnerException.ToString()))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }
        public bool LoginVerify(string taiKhoan, string matKhau)
        {
            var nhanVien = quanLyNhanSu.NhanViens.Where(x => x.TaiKhoan == taiKhoan).FirstOrDefault();            
            try
            {
                if(nhanVien == null)
                {
                    MessageBox.Show("Tài khoản không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                string maNV = nhanVien.MaNV;
                string ngayKhoa = nhanVien.NgayKhoa.ToString();
                if (nhanVien.NgayKhoa != null && nhanVien.NgayKhoa > DateTime.Now)
                {                    
                    MessageBox.Show($"Tài khoản {taiKhoan} của nhân viên {maNV} đã bị khoá đến {ngayKhoa}! Liên hệ phòng kỹ thuật để biết thêm chi tiết.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }
                if(nhanVien != null && !BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau))
                {
                    count++;
                    if (count == 3)
                    {
                        string maTT = quanLyNhanSu.ThaoTacs.FirstOrDefault(tt => tt.TenThaoTac == "Khoá tài khoản (nhập sai mật khẩu)").MaTT;
                        DateTime lockDate = DateTime.Now.AddMinutes(30);
                        nhanVien.NgayKhoa = lockDate;
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Nhập sai mật khẩu lần 3! Tài khoản {taiKhoan} của nhân viên {maNV} đã bị khoá đến {lockDate}! Liên hệ phòng kỹ thuật để biết thêm chi tiết.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        count = 0;
                        LichSuThaoTac newLstt = new LichSuThaoTac
                        {
                            NgayGio = DateTime.Now.ToString(formatDateTime),
                            MaNV = maNV,
                            MaTT = maTT,
                            ThaoTacThucHien = $"Tài khoản {taiKhoan} bị khoá đến {lockDate} (nhập sai mật khẩu 3 lần)",
                        };
                        lichSuThaoTacBUS.Save(newLstt);
                        return false;
                    }
                    else
                    {
                        MessageBox.Show($"Nhập sai mật khẩu lần thứ {count}! Lần thứ 3 tài khoản sẽ bị khoá!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return false;
                    }                    
                }                           
                else if(nhanVien != null  && BCrypt.Net.BCrypt.Verify(matKhau, nhanVien.MatKhau))
                {
                    if(nhanVien.NgayKhoa != null && nhanVien.NgayKhoa < DateTime.Now)
                    {
                        nhanVien.NgayKhoa = null;
                        quanLyNhanSu.SaveChanges();
                    }
                    MessageBox.Show($"Đăng nhập thành công! - {maNV}", "Thông báo", MessageBoxButtons.OK,MessageBoxIcon.Information);
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
                    if (!string.IsNullOrEmpty(ex.InnerException.ToString()))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }                       
        }
        public bool VerifyInfo(string maNV, string taiKhoan, string CCCD, string sdt, string email)
        {
            try
            {
                NhanVien nhanVien = quanLyNhanSu.NhanViens.Where(nv => nv.MaNV == maNV).FirstOrDefault();
                if (nhanVien != null)
                {
                    if(nhanVien.TaiKhoan == taiKhoan && nhanVien.CCCD == CCCD && nhanVien.SDT == sdt && nhanVien.Email == email) 
                    {
                        MessageBox.Show($"Xác thực thành công! Nhân viên {maNV}.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                    else
                    {
                        MessageBox.Show("Thông tin xác thực không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return false;
                    }
                }
                else
                {
                    MessageBox.Show("Thông tin xác thực không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return false;
                }              
            }
            catch(Exception ex)
            {
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
    }
}
