using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class ChiTietLichLamViecDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ChiTietLichLamViecDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChiTietLichLamViecViewModels> GetChiTietLichLamViec(string maLLV)
        {
            var chiTietLichLamViec = quanLyNhanSu.ChamCongs.Select(x => new ChiTietLichLamViecViewModels
            {
                MaLLV = x.MaLLV,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                NgayLam = x.LichLamViec.NgayLam,
                Ca = x.Ca.TenCa,
                LoaiCa = x.LoaiCa.TenLoaiCa,
                ThoiGianDen = x.ThoiGianDen.ToString(),
                ThoiGianVe = x.ThoiGianVe.ToString(),
                Phep = x.Phep,
            }).Where(llv => llv.MaLLV == maLLV).OrderBy(llv => llv.MaNV);
            return chiTietLichLamViec;            
        }
        public IEnumerable<ChiTietLichLamViecViewModels> SearchChiTietLichLamViec(string maLLV, string timKiem)
        {
            var chiTietLichLamViec = quanLyNhanSu.ChamCongs.Select(x => new ChiTietLichLamViecViewModels
            {
                MaLLV = x.MaLLV,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                NgayLam = x.LichLamViec.NgayLam,
                Ca = x.Ca.TenCa,
                LoaiCa = x.LoaiCa.TenLoaiCa,
                ThoiGianDen = x.ThoiGianDen.ToString(),
                ThoiGianVe = x.ThoiGianVe.ToString(),
                Phep = x.Phep,
            }).Where(llv => llv.MaLLV == maLLV && (llv.MaNV.Contains(timKiem) ||
                     llv.HoTen.Contains(timKiem) ||
                     llv.PhongBan.Contains(timKiem) ||
                     llv.ChucVu.Contains(timKiem) ||
                     llv.ThoiGianDen.Contains(timKiem) ||
                     llv.ThoiGianVe.Contains(timKiem) ||
                     llv.NgayLam.ToString().Contains(timKiem) ||
                     llv.Ca.Contains(timKiem) ||
                     llv.LoaiCa.Contains(timKiem))).OrderBy(llv => llv.MaNV);
            return chiTietLichLamViec;
        }       
        public IEnumerable<ChamCong> GetChiTietLichLamViec()
        {
            return quanLyNhanSu.ChamCongs.OrderBy(c => c.MaLLV).ToList();
        }
        public bool Save(ChamCong chamCong)
        {
            try
            {
                ChamCong nhanVien = quanLyNhanSu.ChamCongs.Where(nv => nv.MaLLV == chamCong.MaLLV && nv.MaNV == chamCong.MaNV && nv.MaCa == chamCong.MaCa).FirstOrDefault();
                if(nhanVien != null)
                {
                    List<ChamCong> phep = quanLyNhanSu.ChamCongs.Where(nv => nv.MaLLV == chamCong.MaLLV && nv.MaNV == chamCong.MaNV).ToList();
                    foreach (var nv in phep)
                        nv.Phep = nhanVien.Phep;
                    int soNgayPhep = nhanVien.NhanVien.SoNgayPhep;
                    if(soNgayPhep > 0)
                    {
                        if (nhanVien.Phep)                        
                            nhanVien.NhanVien.SoNgayPhep -= 1;                        
                        else                       
                            nhanVien.NhanVien.SoNgayPhep += 1;                                                    
                    }
                    else
                    {
                        MessageBox.Show($"Nhân viên {nhanVien.MaNV} đã hết phép!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return false;
                    }
                }
                else
                    quanLyNhanSu.ChamCongs.Add(chamCong);
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
        public bool Delete(string maLLV,string maNV)
        {
            ChamCong chamCong = quanLyNhanSu.ChamCongs.Where(x => x.MaLLV == maLLV && x.MaNV == maNV).FirstOrDefault();
            try
            {
                if (chamCong != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {maNV} khỏi lịch {maLLV}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.ChamCongs.Remove(chamCong);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {maNV} khỏi lịch {maLLV}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
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
