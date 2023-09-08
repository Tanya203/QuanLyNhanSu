using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyLoaiCaDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyLoaiCaDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<LoaiCaViewModels> GetAllLoaiCa()
        {
            var danhSachLoaiCa = quanLyNhanSu.LoaiCas.Select(x => new LoaiCaViewModels
            {
                MaLoaiCa = x.MaLC,
                TenLoaiCa = x.TenLoaiCa,
                HeSoLuong = x.HeSoLuong,
            }).OrderBy(lc => lc.MaLoaiCa);
            return danhSachLoaiCa;
        }
        public IEnumerable<LoaiCaViewModels> SearchLoaiCa(string timKiem)
        {
            var danhSachLoaiCa = quanLyNhanSu.LoaiCas.Select(x => new LoaiCaViewModels
            {
                MaLoaiCa = x.MaLC,
                TenLoaiCa = x.TenLoaiCa,
                HeSoLuong = x.HeSoLuong,
            }).Where(lc => lc.MaLoaiCa.Contains(timKiem) || 
                     lc.TenLoaiCa.Contains(timKiem) ||
                     lc.HeSoLuong.ToString().Contains(timKiem)).OrderBy(lc => lc.MaLoaiCa);
            return danhSachLoaiCa;
        }
        public IEnumerable<LoaiCa> GetLoaiCa()
        {
            return quanLyNhanSu.LoaiCas.OrderBy(lc => lc.MaLC).ToList();
        }
        public bool Save(LoaiCa loaiCa)
        {
            try
            {
                quanLyNhanSu.LoaiCas.AddOrUpdate(loaiCa);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                var errorMessages = new Dictionary<string, string>
                {
                    { "UQ_TenLoaiCa", "Tên phụ cấp đã tồn tại" },
                    { "CHECK_HeSoLuong", "Hệ số lương phải > 0" },
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
        public bool Delete(string maLC)
        {
            var loaiCa = quanLyNhanSu.LoaiCas.Where(lc => lc.MaLC == maLC).FirstOrDefault();
            try
            {                
                if (loaiCa != null)
                {                    
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá loại ca {loaiCa.TenLoaiCa}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.LoaiCas.Remove(loaiCa);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá loại ca {loaiCa.TenLoaiCa}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
    }
}
