using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class ChiTietPhuCapDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ChiTietPhuCapDAL()
        {
            quanLyNhanSu= new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChiTietPhuCapViewModels> GetAllChiTietPhuCap(string maPC)
        {
            var chiTietPhuCap = quanLyNhanSu.ChiTietPhuCaps.Select(x => new ChiTietPhuCapViewModels
            {
                MaPC = x.MaPC,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                TenPhuCap = x.PhuCap.TenPhuCap,                
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,             
                TienPhuCap = x.PhuCap.TienPhuCap,
            }).Where(pc => pc.MaPC == maPC).OrderBy(pc => pc.MaNV);
            return chiTietPhuCap;
        }
        public IEnumerable<ChiTietPhuCapViewModels> GetPhuCapMotNhanVien(string maNV)
        {
            var phuCapNhanVien = quanLyNhanSu.ChiTietPhuCaps.Select(x => new ChiTietPhuCapViewModels
            {
                MaPC = x.MaPC,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                TenPhuCap = x.PhuCap.TenPhuCap,                
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                TienPhuCap = x.PhuCap.TienPhuCap,
            }).Where(pc => pc.MaNV == maNV).OrderBy(pc => pc.MaPC);
            return phuCapNhanVien;
        }
        public IEnumerable<ChiTietPhuCapViewModels> SearchChiTietPhuCap(string maPC, string timKiem)
        {
            var phuCapTimKiem = quanLyNhanSu.ChiTietPhuCaps.Select(x => new ChiTietPhuCapViewModels
            {

                MaPC = x.MaPC,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                TenPhuCap = x.PhuCap.TenPhuCap,                
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                TienPhuCap = x.PhuCap.TienPhuCap,
            }).Where(pc => pc.MaPC == maPC && (pc.MaNV.Contains(timKiem) ||
                     pc.HoTen.Contains(timKiem) ||
                     pc.TenPhuCap.Contains(timKiem) ||
                     pc.PhongBan.Contains(timKiem) ||
                     pc.TienPhuCap.ToString().Contains(timKiem) ||
                     pc.ChucVu.Contains(timKiem))).OrderBy(pc => pc.MaNV);
            return phuCapTimKiem;
        }
        public IEnumerable<ChiTietPhuCap> GetChiTIetPhuCap()
        {
            return quanLyNhanSu.ChiTietPhuCaps.OrderBy(ctpc => ctpc.MaPC).ToList();
        }
        public bool Save(ChiTietPhuCap chiTietPhuCap)
        {
            try
            {
                quanLyNhanSu.ChiTietPhuCaps.Add(chiTietPhuCap);
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
        public bool Delete(string maNV, string maPC)
        {
            try
            {
                ChiTietPhuCap newChiTietPhuCap = quanLyNhanSu.ChiTietPhuCaps.Where(pc => pc.MaNV == maNV && pc.MaPC == maPC).FirstOrDefault();             
                if(newChiTietPhuCap != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    string phuCap = newChiTietPhuCap.PhuCap.TenPhuCap;
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá {phuCap} của {maNV}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.ChiTietPhuCaps.Remove(newChiTietPhuCap);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá {phuCap} của {maNV}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        public int TongSoNhanVienTrongPhuCap(string maPC)
        {
            int sl = quanLyNhanSu.ChiTietPhuCaps.Where(pc => pc.MaPC == maPC).Count();
            return sl;
        }
        public decimal TongPhuCapMotNhanVien(string maNV)
        {            
            List<ChiTietPhuCap> chiTietPhuCap = quanLyNhanSu.ChiTietPhuCaps.Where(pc => pc.MaNV == maNV).ToList();
            if (chiTietPhuCap != null)
                return chiTietPhuCap.Sum(pc => pc.PhuCap.TienPhuCap);
            return 0;
        }
        public decimal TongTienMotPhuCap(string maPC)
        {
            List<ChiTietPhuCap> chiTietPhuCap = quanLyNhanSu.ChiTietPhuCaps.Where(pc => pc.MaPC == maPC).ToList();
            if (chiTietPhuCap != null)
                return chiTietPhuCap.Sum(pc => pc.PhuCap.TienPhuCap);
            return 0;
        }
    }
}
