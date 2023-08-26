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
    internal class LichLamViecDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly string formatDate = "yyyy-MM-dd";
        public LichLamViecDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public List<LichLamViecViewModels> GetLichLamViecTheoPhongBan(string maP)
        {
            var lichLamViec = quanLyNhanSu.LichLamViecs.Select(x => new LichLamViecViewModels
            {
                MaLLV = x.MaLLV,
                MaNV = x.MaNV,
                MaPB = x.NhanVien.ChucVu.PhongBan.MaPB,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                NgayLam = x.NgayLam,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
            }).Where(llv => llv.MaPB == maP).OrderBy(llv => llv.MaNV).ToList();
            return lichLamViec;            
        }
        public IEnumerable<LichLamViecViewModels> SearchLichLamViecTheoPhongBan(string maP, string timKiem)
        {
            var lichLamViec = quanLyNhanSu.LichLamViecs.Select(x => new LichLamViecViewModels
            {
                MaLLV = x.MaLLV,
                MaNV = x.MaNV,
                MaPB = x.NhanVien.ChucVu.PhongBan.MaPB,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,                
                NgayLam = x.NgayLam,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
            }).Where(llv => llv.MaPB == maP && ((llv.MaNV.Contains(timKiem )||
                     llv.MaLLV.Contains(timKiem) ||
                     llv.NgayLam.ToString().Contains(timKiem) ||
                     llv.ChucVu.Contains(timKiem) ||
                     llv.HoTen.Contains(timKiem)))).OrderBy(llv => llv.MaNV);
            return lichLamViec;
        }
        public IEnumerable<LichLamViec> GetLichLamViec()
        {
            return quanLyNhanSu.LichLamViecs.OrderBy(llv => llv.MaLLV).ToList();
        }
        public bool Save(LichLamViec lichLamViec)
        {
            try
            {
                quanLyNhanSu.LichLamViecs.Add(lichLamViec);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("CHECK_Ngay"))
                {
                    MessageBox.Show("Không thể thêm lịch trong quá khứ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
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
        public bool Delete(string maLLV)
        {
            try
            {
                LichLamViec lichLamViec = quanLyNhanSu.LichLamViecs.Where(llv => llv.MaLLV == maLLV).FirstOrDefault();
                string ngayLam = lichLamViec.NgayLam.ToString(formatDate);
                if (lichLamViec != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá lịch làm việc ngày {ngayLam}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.LichLamViecs.Remove(lichLamViec);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá lịch làm việc ngày {ngayLam}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
