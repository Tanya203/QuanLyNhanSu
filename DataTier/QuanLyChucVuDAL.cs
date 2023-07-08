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
    internal class QuanLyChucVuDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyChucVuDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChucVuViewModels> GetAllChucVu()
        {
            var danhSachChucVu = quanLyNhanSu.ChucVus.Select(cv => new ChucVuViewModels
                 {
                     MaCV = cv.MaCV,
                     MaPB = cv.MaPB,
                     TenChucVu = cv.TenChucVu,
                     LuongKhoiDiem = cv.LuongKhoiDiem,
                     TenPhongBan = cv.PhongBan.TenPhongBan
                 }).OrderBy(cv => cv.MaCV);    
            return danhSachChucVu;                                   
        }
        public IEnumerable<ChucVuViewModels> SearchChucVu(string timKiem)
        {
            var danhSachChucVu = quanLyNhanSu.ChucVus.Select(cv => new ChucVuViewModels
            {
                MaCV = cv.MaCV,
                MaPB = cv.MaPB,
                TenChucVu = cv.TenChucVu,
                LuongKhoiDiem = cv.LuongKhoiDiem,
                TenPhongBan = cv.PhongBan.TenPhongBan
            }).Where(chucVu => chucVu.MaCV.Contains(timKiem) ||
                              chucVu.TenPhongBan.Contains(timKiem) ||
                              chucVu.TenChucVu.Contains(timKiem) ||
                              chucVu.LuongKhoiDiem.ToString().Contains(timKiem)).OrderBy(cv => cv.MaCV);
            return danhSachChucVu;
        }

        public IEnumerable<ChucVu> GetChucVuTheoPhongBan(string maPB)
        {
            return quanLyNhanSu.ChucVus.Where(cv => cv.MaPB == maPB).OrderBy(cv => cv.MaCV).ToList();
        }
        public decimal GetLuongCoBanCuaChucVu(string maCV)
        {
            return quanLyNhanSu.ChucVus.Where(cv => cv.MaCV == maCV).Sum(cv => cv.LuongKhoiDiem);
        }
        public bool Save(ChucVu chucVu)
        {
            try
            {
                ChucVu newChucVu = quanLyNhanSu.ChucVus.Where(cv => cv.MaCV == chucVu.MaCV).FirstOrDefault();
                if (newChucVu != null)//cập nhật
                {                    
                    newChucVu.TenChucVu = chucVu.TenChucVu;
                    newChucVu.LuongKhoiDiem = chucVu.LuongKhoiDiem;
                }
                else//thêm mới
                    quanLyNhanSu.ChucVus.Add(chucVu);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                var errorMessages = new Dictionary<string, string>
                {
                    { "UQ_TenChucVu", "Tên chức vụ đã tồn tại" },
                    { "CHECK_LuongKhoiDiem", "Lương khởi điểm phải > 0" },
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
                    if (string.IsNullOrEmpty(ex.Message))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }
        public bool Delete(string maCV)
        {
            var chucVu = quanLyNhanSu.ChucVus.Where(cv => cv.MaCV == maCV).FirstOrDefault();
            try
            {
                if (chucVu != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá chức vụ " + chucVu.TenChucVu + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.ChucVus.Remove(chucVu);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá chức vụ " + chucVu.TenChucVu, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK_NhanVien_ChucVu"))
                {
                    MessageBox.Show("Vẫn còn nhân viên thuộc chức vụ " + chucVu.TenChucVu + ". Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                MessageBoxManager.Yes = "OK";
                MessageBoxManager.No = "Chi tiết lỗi";
                DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
                if (ketQua == DialogResult.No)
                {
                    if (string.IsNullOrEmpty(ex.Message))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }
        public int TongSoNhanVienThuocChucVu(string maCV)
        {
            int sl = quanLyNhanSu.NhanViens.Count(nv => nv.MaCV == maCV);            
            return sl;
        }

    }
}
