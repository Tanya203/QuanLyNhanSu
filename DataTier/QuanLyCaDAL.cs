    using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyCaDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyCaDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<CaViewModels> GetAllCa()
        {
            var danhSachCa = quanLyNhanSu.Cas.Select(x => new CaViewModels
            {
                MaCa = x.MaCa,
                TenCa = x.TenCa,
                GioBatDau = x.GioBatDau,
                GioKetThuc = x.GioKetThuc,
            }).OrderBy(ca => ca.MaCa);
            return danhSachCa;
        }
        public IEnumerable<CaViewModels> SearchCa(string timKiem)
        {            
            var danhSachCa = quanLyNhanSu.Cas.Select(x => new CaViewModels
            {
                MaCa = x.MaCa,
                TenCa = x.TenCa,
                GioBatDau = x.GioBatDau,
                GioKetThuc = x.GioKetThuc,
            }).Where(ca => ca.MaCa.Contains(timKiem) ||
                     ca.TenCa.Contains(timKiem) ||
                     ca.GioBatDau.ToString().Contains(timKiem) ||
                     ca.GioKetThuc.ToString().Contains(timKiem)).OrderBy(pb => pb.MaCa);
            return danhSachCa;
        }
        public IEnumerable<Ca> GetCa()
        {
            return quanLyNhanSu.Cas.OrderBy(cv => cv.MaCa).ToList();
        }
        public Ca ThongTinCa(string maCa)
        {
            return quanLyNhanSu.Cas.Where(ca => ca.MaCa == maCa).FirstOrDefault(); 
        }
        public bool Save(Ca ca)
        {
            try
            {
                Ca newCa = quanLyNhanSu.Cas.Where(lc => lc.MaCa == ca.MaCa).FirstOrDefault();
                if (newCa != null)//cập nhật
                {
                    newCa.TenCa = ca.TenCa;
                    newCa.GioBatDau = ca.GioBatDau;
                    newCa.GioKetThuc = ca.GioKetThuc;
                }
                else//thêm mới
                    quanLyNhanSu.Cas.Add(ca);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                var errorMessages = new Dictionary<string, string>
                {
                    { "UQ_GioBatDau", "Giờ bắt đầu đã tồn tại"},
                    { "UQ_GioKetThuc", "Giờ kết thúc đã tồn tại" },
                    { "UQ_TenCa", "Tên ca đã tồn tại" },
                    { "TIME_CHECK_ERROR", "Giờ bắt đầu hoặc giờ kết thúc đã trùng hoặc chồng qua các ca khác"},
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
        public bool Delete(string maCa)
        {
            Ca ca = quanLyNhanSu.Cas.Where(c => c.MaCa == maCa).FirstOrDefault();
            try
            {                
                if (ca != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá ca {ca.TenCa}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        quanLyNhanSu.Cas.Remove(ca);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá ca {ca.TenCa}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);                        
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
