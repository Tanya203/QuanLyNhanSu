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
    internal class QuanLyLoaiCaDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyLoaiCaDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<LoaiCaViewModels> GetAllLoaiCa()
        {
            var danhSachLoaiCa = quanLyNhanSu.LoaiCas.Select(x => new LoaiCaViewModels
            {
                MaLoaiCa = x.MaLC,
                TenLoaiCa = x.TenLoaiCa,
                HeSoLuong = x.HeSoLuong,
            }).ToList();
            return danhSachLoaiCa;
        }
        public IEnumerable<LoaiCaViewModels> SearchLoaiCa(string timKiem)
        {
            var danhSachLoaiCa = quanLyNhanSu.LoaiCas.Select(x => new LoaiCaViewModels
            {
                MaLoaiCa = x.MaLC,
                TenLoaiCa = x.TenLoaiCa,
                HeSoLuong = x.HeSoLuong,
            }).Where(lc => lc.MaLoaiCa.ToString().Contains(timKiem) ||
                     lc.TenLoaiCa.ToString().Contains(timKiem) ||
                     lc.HeSoLuong.ToString().Contains(timKiem)).ToList();
            return danhSachLoaiCa;
        }
        public bool Save(LoaiCa loaiCa)
        {
            try
            {
                LoaiCa newLoaiCa = quanLyNhanSu.LoaiCas.Where(lc => lc.MaLC == loaiCa.MaLC).FirstOrDefault();
                if (newLoaiCa != null)//cập nhật
                {
                    newLoaiCa.TenLoaiCa = loaiCa.TenLoaiCa;
                    newLoaiCa.HeSoLuong = loaiCa.HeSoLuong;
                }
                else//thêm mới
                    quanLyNhanSu.LoaiCas.Add(loaiCa);
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
                throw ex;
            }
        }
        public bool Delete(string maLC)
        {
            try
            {
                var loaiCa = quanLyNhanSu.LoaiCas.Where(lc => lc.MaLC == maLC).FirstOrDefault();
                if (loaiCa != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá phụ cấp " + loaiCa.TenLoaiCa + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.LoaiCas.Remove(loaiCa);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá phụ cấp " + loaiCa.TenLoaiCa, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
