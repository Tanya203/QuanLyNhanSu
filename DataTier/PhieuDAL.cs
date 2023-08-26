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
    internal class PhieuDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public PhieuDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<PhieuViewModels> GetAllPhieu()
        {
            var danhSachPhieuThuong = quanLyNhanSu.Phieux.Select(x => new PhieuViewModels
            {
                MaP = x.MaP,
                MaLP = x.MaLP,
                TenLoaiPhieu = x.LoaiPhieu.TenLoaiPhieu,
                MaNV = x.MaNV,               
                HoTen = x.NhanVien.Ho + " " +x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                NgayLap = x.NgayLap,
            }).OrderBy(x=>x.MaLP);
            return danhSachPhieuThuong;
        }
        public IEnumerable<PhieuViewModels> SearchPhieu(string timKiem)
        {
            var danhSachPhieuThuong = quanLyNhanSu.Phieux.Select(x => new PhieuViewModels
            {
                MaP = x.MaP,
                MaLP = x.MaLP,
                TenLoaiPhieu = x.LoaiPhieu.TenLoaiPhieu,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                NgayLap = x.NgayLap,
            }).Where(pt => pt.MaP.Contains(timKiem) ||
               pt.TenLoaiPhieu.Contains(timKiem) ||
               pt.MaNV.Contains(timKiem) ||
               pt.HoTen.Contains(timKiem) ||
               pt.ChucVu.Contains(timKiem) || 
               pt.PhongBan.Contains(timKiem) ||
               pt.NgayLap.ToString().Contains(timKiem)).OrderBy(x => x.MaP);
            return danhSachPhieuThuong;
        }
        public IEnumerable<Phieu> GetPhieu()
        {
            return quanLyNhanSu.Phieux.OrderBy(p => p.MaP).ToList();
        }
        public bool Save(Phieu phieu)
        {
            try
            {
                quanLyNhanSu.Phieux.Add(phieu);
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
        public bool Delete(string maPhieu)
        {
            try
            {
                Phieu phieu = quanLyNhanSu.Phieux.Where(pt => pt.MaP == maPhieu).FirstOrDefault();
                if(phieu != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    string loaiPhieu = phieu.LoaiPhieu.TenLoaiPhieu.ToLower();
                    string maP = phieu.MaP;
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá {loaiPhieu} {maP}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.Phieux.Remove(phieu);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá {loaiPhieu} {maP}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
