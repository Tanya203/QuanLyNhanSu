using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
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
            }).OrderBy(pc => pc.MaPC).ToList();
            return danhSachPhuCap;
        }
        public IEnumerable<PhuCapViewMModels>SearchPhuCap(string timKiem)
        {
            var danhSachPhuCap = quanLyNhanSu.PhuCaps.Select(x => new PhuCapViewMModels
            {
                MaPC = x.MaPC,
                TenPhuCap = x.TenPhuCap,
                TienPhuCap = x.TienPhuCap,
            }).Where(pc => pc.MaPC.ToLower().Contains(timKiem) ||
                     pc.TenPhuCap.ToLower().Contains(timKiem) ||
                     pc.TienPhuCap.ToString().Contains(timKiem)).OrderBy(pc => pc.MaPC);
            return danhSachPhuCap;
        }
        public PhuCap ThongTinPhuCap(string maPC)
        {
            return quanLyNhanSu.PhuCaps.Where(pc => pc.MaPC == maPC).FirstOrDefault();
        }
        public IEnumerable<PhuCap> GetPhuCap()
        {
            return quanLyNhanSu.PhuCaps.OrderBy(pc => pc.MaPC).ToList();
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
        public bool Delete(string maPC)
        {
            var phuCap = quanLyNhanSu.PhuCaps.Where(pc => pc.MaPC == maPC).FirstOrDefault();
            try
            {                
                if (phuCap != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá phụ cấp {phuCap.TenPhuCap}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.PhuCaps.Remove(phuCap);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá phụ cấp {phuCap.TenPhuCap}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
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
