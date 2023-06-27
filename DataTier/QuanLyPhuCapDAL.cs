using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier.Models
{
    internal class QuanLyPhuCapDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyPhuCapDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<PhuCapViewMModels> GetAllPhuCap()
        {
            var danhSachPhuCap = quanLyNhanSu.PhuCaps.Select(x => new PhuCapViewMModels
            {
                MaPC = x.MaPC,
                TenPhuCap = x.TenPhuCap,
                TienPhuCap = x.TienPhuCap,
            }).ToList();
            return danhSachPhuCap;
        }
        public IEnumerable<PhuCapViewMModels> SearchPhuCap(string timKiem)
        {
            var danhSachPhuCap = quanLyNhanSu.PhuCaps.Select(x => new PhuCapViewMModels
            {
                MaPC = x.MaPC,
                TenPhuCap = x.TenPhuCap,
                TienPhuCap = x.TienPhuCap,
            }).Where(pc => pc.MaPC.Contains(timKiem) ||
                     pc.TenPhuCap.Contains(timKiem) ||
                     pc.TienPhuCap.ToString().Contains(timKiem)).ToList();
            return danhSachPhuCap;
        }
        public bool Save(PhuCap phuCap)
        {
            try
            {
                PhuCap newPhuCap = quanLyNhanSu.PhuCaps.Where(pc => pc.MaPC == phuCap.MaPC).FirstOrDefault();
                if (newPhuCap != null)//cập nhật
                {
                    newPhuCap.TenPhuCap = phuCap.TenPhuCap;
                    newPhuCap.TienPhuCap = phuCap.TienPhuCap;
                }
                else//thêm mới
                    quanLyNhanSu.PhuCaps.Add(phuCap);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                var errorMessages = new Dictionary<string, string>
                {
                    { "UQ_TenPhuCap", "Tên phụ cấp đã tồn tại" },
                    { "CHECK_TienPhuCap", "Số tiền phụ cấp phải > 0" },                    
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
        public bool Delete(string maPC)
        {
            try
            {
                var phuCap = quanLyNhanSu.PhuCaps.Where(pc => pc.MaPC == maPC).FirstOrDefault();
                if (phuCap != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá phụ cấp " + phuCap.TenPhuCap + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.PhuCaps.Remove(phuCap);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá phụ cấp " + phuCap.TenPhuCap, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
        public int TongSoNhanVienTrongPhuCap(string maPC)
        {
            int sl = quanLyNhanSu.ChiTietPhuCaps.Where(pc => pc.MaPC == maPC).Count();
            return sl;
        }
    }
}
