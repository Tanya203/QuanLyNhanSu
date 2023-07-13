using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.PresentationTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class PhieuThuongDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public PhieuThuongDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<PhieuThuongViewModels> GetAllPhieuThuong()
        {
            var danhSachPhieuThuong = quanLyNhanSu.PhieuThuongs.Select(x => new PhieuThuongViewModels
            {
                MaPT = x.MaPT,
                MaNV = x.MaNV,               
                HoTen = x.NhanVien.Ho + " " +x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                NgayLap = x.NgayLap,
            }).OrderBy(x=>x.MaPT);
            return danhSachPhieuThuong;
        }
        public IEnumerable<PhieuThuongViewModels> SearchPhieuThuong(string timKiem)
        {
            var danhSachPhieuThuong = quanLyNhanSu.PhieuThuongs.Select(x => new PhieuThuongViewModels
            {
                MaPT = x.MaPT,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                NgayLap = x.NgayLap,
            }).Where(pt => pt.MaPT.Contains(timKiem) ||
               pt.MaNV.Contains(timKiem) ||
               pt.HoTen.Contains(timKiem) ||
               pt.ChucVu.Contains(timKiem) || 
               pt.PhongBan.Contains(timKiem) ||
               pt.NgayLap.ToString().Contains(timKiem)).OrderBy(x => x.MaPT);
            return danhSachPhieuThuong;
        }
        public PhieuThuong ThongTinPhieuThuong(string maPT)
        {
            return quanLyNhanSu.PhieuThuongs.Where(pt => pt.MaPT == maPT).FirstOrDefault();
        }
        public bool Save(PhieuThuong phieuThuong)
        {
            try
            {
                quanLyNhanSu.PhieuThuongs.AddOrUpdate(phieuThuong);
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
        public bool Delete(string maPhieuThuong)
        {
            try
            {
                PhieuThuong phieuThuong = quanLyNhanSu.PhieuThuongs.Where(pt => pt.MaPT == maPhieuThuong).FirstOrDefault();
                if(phieuThuong != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá phiếu thưởng " + phieuThuong.MaPT + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.PhieuThuongs.Remove(phieuThuong);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá phiếu thưởng " + phieuThuong.MaPT, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
