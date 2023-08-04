using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class ChamCongDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly string formatDate = "yyyy - MM - dd";
        public ChamCongDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public List<ChamCong> GetLichLamViecTheoNgay(string ngayLam)
        {
            return quanLyNhanSu.ChamCongs.Where(llv => llv.LichLamViec.NgayLam.ToString() == ngayLam).ToList();
        }
        public bool ChamCong(ChamCong nhanVien)
        {
            try
            {
                ChamCong chamCong = nhanVien;
                quanLyNhanSu.SaveChanges();
                string thongBao;
                string thoiGian;
                if (nhanVien.ThoiGianVe == null)
                {
                    thongBao = " giờ vào ";
                    thoiGian = chamCong.ThoiGianDen.ToString();
                }
                else
                {
                    thongBao = " giờ ra ";
                    thoiGian = chamCong.ThoiGianVe.ToString();
                }
                string maNV = chamCong.MaNV;
                string ca = chamCong.Ca.TenCa;
                string ngay = chamCong.LichLamViec.NgayLam.ToString(formatDate);
                MessageBox.Show("Chấm công" + thongBao + "thành công! Nhân viên " + maNV + " - ca " + ca + " - ngày " + ngay + " - lúc " + thoiGian, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
    }
}
