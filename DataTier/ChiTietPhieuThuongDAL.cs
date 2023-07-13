using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class ChiTietPhieuThuongDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ChiTietPhieuThuongDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChiTietPhieuThuongViewModels> GetAllChiTietPhieuThuong(string maPT)
        {
            var danhSachChiTietPhieuThuong = quanLyNhanSu.ChiTietPhieuThuongs.Select(x => new ChiTietPhieuThuongViewModels
            {
                MaPT = x.MaPT,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                TienThuong = x.TienThuong,
                GhiChu = x.GhiChu,
            }).Where(pt=>pt.MaPT == maPT).OrderBy(pt=>pt.MaNV);
            return danhSachChiTietPhieuThuong;
        }
        public IEnumerable<ChiTietPhieuThuongViewModels> SearchChiTietPhieuThuong(string maPT,string timKiem)
        {
            var danhSachChiTietPhieuThuong = quanLyNhanSu.ChiTietPhieuThuongs.Select(x => new ChiTietPhieuThuongViewModels
            {
                MaPT = x.MaPT,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                TienThuong = x.TienThuong,
                GhiChu = x.GhiChu,
            }).Where(pt => pt.MaPT == maPT &&(
                     pt.MaNV.Contains(timKiem) ||
                     pt.HoTen.Contains(timKiem) ||
                     pt.ChucVu.Contains(timKiem) ||
                     pt.PhongBan.Contains(timKiem) ||
                     pt.TienThuong.ToString().Contains(timKiem) ||
                     pt.GhiChu.Contains(timKiem))).OrderBy(pt => pt.MaNV);
            return danhSachChiTietPhieuThuong;
        }
        public IEnumerable<ChiTietPhieuThuong> ThongTinChiTietPhieuThuong(string maPT)
        {
            return quanLyNhanSu.ChiTietPhieuThuongs.Where(pt =>pt.MaPT == maPT).ToList();
        }
        public bool Save(ChiTietPhieuThuong chiTietPhieuThuong)
        {
            try
            {
                ChiTietPhieuThuong newChiTietPhieuThuong = quanLyNhanSu.ChiTietPhieuThuongs.Where(pt => pt.MaPT ==chiTietPhieuThuong.MaPT && pt.MaNV == chiTietPhieuThuong.MaNV).FirstOrDefault();
                if(newChiTietPhieuThuong != null)
                {
                    newChiTietPhieuThuong.TienThuong = chiTietPhieuThuong.TienThuong;
                    newChiTietPhieuThuong.GhiChu = chiTietPhieuThuong.GhiChu;
                }
                else
                    quanLyNhanSu.ChiTietPhieuThuongs.Add(chiTietPhieuThuong);
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
        public bool Delete(string maNV)
        {
            try
            {
                ChiTietPhieuThuong phieuThuong = quanLyNhanSu.ChiTietPhieuThuongs.Where(pt => pt.MaNV == maNV).FirstOrDefault();
                if (phieuThuong != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá nhân viên " + phieuThuong.MaNV + " " + "khỏi phiếu thưởng " + phieuThuong.MaPT + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.ChiTietPhieuThuongs.Remove(phieuThuong);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá nhân viên " + phieuThuong.MaNV + " " + "khỏi phiếu thưởng " + phieuThuong.MaPT, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        public decimal TongTienPhieuThuong(string maPhieuThuong)
        {
            ChiTietPhieuThuong ctpt = quanLyNhanSu.ChiTietPhieuThuongs.Where(pt => pt.MaPT == maPhieuThuong).FirstOrDefault();
            if (ctpt != null)
                return quanLyNhanSu.ChiTietPhieuThuongs.Where(pt => pt.MaPT == maPhieuThuong).Sum(cptp => cptp.TienThuong);
            return 0;
        }
    }
}
