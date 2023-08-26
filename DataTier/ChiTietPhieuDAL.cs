﻿using QuanLyNhanSu.DataTier.Models;
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
    internal class ChiTietPhieuDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ChiTietPhieuDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChiTietPhieuViewModels> GetAllChiTietPhieu(string maP)
        {
            var danhSachChiTietPhieuThuong = quanLyNhanSu.ChiTietPhieux.Select(x => new ChiTietPhieuViewModels
            {
                MaP = x.MaP,
                TenLoaiPhieu = x.Phieu.LoaiPhieu.TenLoaiPhieu,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                SoTien = x.SoTien,
                GhiChu = x.GhiChu,
            }).Where(pt => pt.MaP == maP).OrderBy(pt => pt.MaNV);
            return danhSachChiTietPhieuThuong;
        }
        public IEnumerable<ChiTietPhieuViewModels> SearchChiTietPhieu(string maP, string timKiem)
        {
            var danhSachChiTietPhieuThuong = quanLyNhanSu.ChiTietPhieux.Select(x => new ChiTietPhieuViewModels
            {
                MaP = x.MaP,
                TenLoaiPhieu = x.Phieu.LoaiPhieu.TenLoaiPhieu,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                SoTien = x.SoTien,
                GhiChu = x.GhiChu,
            }).Where(pt => pt.MaP == maP && (
                     pt.TenLoaiPhieu.Contains(timKiem) ||
                     pt.MaNV.Contains(timKiem) ||
                     pt.HoTen.Contains(timKiem) ||
                     pt.ChucVu.Contains(timKiem) ||
                     pt.PhongBan.Contains(timKiem) ||
                     pt.SoTien.ToString().Contains(timKiem) ||
                     pt.GhiChu.Contains(timKiem))).OrderBy(pt => pt.MaNV);
            return danhSachChiTietPhieuThuong;
        }
        public decimal SoTienNhanVienTrongPhieu(string maNV, string maPhieu)
        {
            ChiTietPhieu chiTietPhieu = quanLyNhanSu.ChiTietPhieux.Where(nv => nv.MaNV == maNV && nv.MaP == maPhieu).FirstOrDefault();
            if(chiTietPhieu != null)
                return chiTietPhieu.SoTien;
            return 0;
        }
        public IEnumerable<ChiTietPhieu> GetChiTietPhieu()
        {
            return quanLyNhanSu.ChiTietPhieux.OrderBy(ctp => ctp.MaP).ToList();
        }
        public IEnumerable<ChiTietPhieu> ThongTinChiTietPhieu(string maP)
        {
            return quanLyNhanSu.ChiTietPhieux.Where(pt => pt.MaP == maP).ToList();
        }
        public bool Save(ChiTietPhieu chiTietPhieu)
        {
            try
            {
                ChiTietPhieu newChiTietPhieu = quanLyNhanSu.ChiTietPhieux.Where(pt => pt.MaP == chiTietPhieu.MaP && pt.MaNV == chiTietPhieu.MaNV).FirstOrDefault();
                if (newChiTietPhieu != null)
                {
                    newChiTietPhieu.SoTien = chiTietPhieu.SoTien;
                    newChiTietPhieu.GhiChu = chiTietPhieu.GhiChu;
                }
                else
                    quanLyNhanSu.ChiTietPhieux.Add(chiTietPhieu);
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
                ChiTietPhieu phieu = quanLyNhanSu.ChiTietPhieux.Where(pt => pt.MaNV == maNV).FirstOrDefault();
                if (phieu != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    string loaiPhieu = phieu.Phieu.LoaiPhieu.TenLoaiPhieu;
                    string maP = phieu.MaP;
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {maNV} khỏi {loaiPhieu} {maP}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.ChiTietPhieux.Remove(phieu);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {maNV} khỏi {loaiPhieu} {maP}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        public decimal TongTienPhieu(string maPhieu)
        {
            List<ChiTietPhieu> ctp = quanLyNhanSu.ChiTietPhieux.Where(pt => pt.MaP == maPhieu).ToList();
            if (ctp != null)
                return ctp.Sum(cptp => cptp.SoTien);
            return 0;
        }
    }
}
