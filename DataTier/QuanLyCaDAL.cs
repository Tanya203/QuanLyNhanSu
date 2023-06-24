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
        }
        public IEnumerable<CaViewModels> GetAllCa()
        {
            var danhSachCa = quanLyNhanSu.Cas.Select(x => new CaViewModels
            {
                MaCa = x.MaCa,
                TenCa = x.TenCa,
                GioBatDau = x.GioBatDau,
                GioKetThuc = x.GioKetThuc,
            }).ToList();
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
            }).Where(ca => ca.MaCa.Contains(timKiem)||
                     ca.TenCa.Contains(timKiem) ||
                     ca.GioBatDau.ToString().Contains(timKiem) ||
                     ca.GioKetThuc.ToString().Contains(timKiem));
            return danhSachCa;
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
                throw ex;
            }
        }
        public bool Delete(string maCa)
        {
            try
            {
                Ca ca = quanLyNhanSu.Cas.Where(c => c.MaCa == maCa).FirstOrDefault();
                if (ca != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá ca " + ca.TenCa + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.Cas.Remove(ca);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá ca " + ca.TenCa, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);                        
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
