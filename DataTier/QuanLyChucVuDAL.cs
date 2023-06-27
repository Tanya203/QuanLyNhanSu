using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyChucVuDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyChucVuDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<ChucVuViewModels> GetAllChucVu()
        {
            var danhSachChucVu = from chucVu in quanLyNhanSu.ChucVus
                                    join phongBan in quanLyNhanSu.PhongBans on chucVu.MaPB equals phongBan.MaPB
                                    select new ChucVuViewModels
                                    {
                                        MaCV = chucVu.MaCV,
                                        MaPB = chucVu.MaPB,
                                        TenChucVu = chucVu.TenChucVu,
                                        LuongKhoiDiem = chucVu.LuongKhoiDiem,
                                        TenPhongBan = phongBan.TenPhongBan
                                    } into chucVu
                                    select chucVu;
            return danhSachChucVu;                                   
        }
        public IEnumerable<ChucVu> LoadChucVuTheoPhongBan(string maPB)
        {
            return quanLyNhanSu.ChucVus.Where(cv => cv.MaPB == maPB).ToList();
        }

        public IEnumerable<ChucVuViewModels> SearchChucVu(string timKiem)
        {
            var danhSachPhongBan = from chucVu in quanLyNhanSu.ChucVus join phongBan in quanLyNhanSu.PhongBans on chucVu.MaPB equals phongBan.MaPB
            select new ChucVuViewModels
            {
                MaCV = chucVu.MaCV,
                MaPB = chucVu.MaPB,
                TenChucVu = chucVu.TenChucVu,
                LuongKhoiDiem = chucVu.LuongKhoiDiem,
                TenPhongBan = phongBan.TenPhongBan
            }
            into chucVu where chucVu.MaCV.Contains(timKiem) ||
                              chucVu.TenPhongBan.Contains(timKiem) ||
                              chucVu.TenChucVu.Contains(timKiem) ||
                              chucVu.LuongKhoiDiem.ToString().Contains(timKiem)
                              select chucVu;                              
            return danhSachPhongBan;
        }
        public bool Save(ChucVu chucVu)
        {
            try
            {
                ChucVu newChucVu = quanLyNhanSu.ChucVus.Where(cv => cv.MaCV == chucVu.MaCV).FirstOrDefault();
                if (newChucVu != null)//cập nhật
                {
                    newChucVu.MaPB = newChucVu.MaPB;
                    newChucVu.TenChucVu = newChucVu.TenChucVu;
                    newChucVu.LuongKhoiDiem = newChucVu.LuongKhoiDiem;
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
                throw new Exception("Unknow Error!!!");
            }
        }

    }
}
