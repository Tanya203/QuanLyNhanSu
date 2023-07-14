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
    internal class QuanLyLoaiPhieuDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyLoaiPhieuDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<LoaiPhieuViewModels> GetAllLoaiPhieu()
        {
            var danhSachLoaiPhieu = quanLyNhanSu.LoaiPhieux.Select(x => new LoaiPhieuViewModels
            {
                MaLP = x.MaLP,
                TenLoaiPhieu = x.TenLoaiPhieu,
            }).OrderBy(lp => lp.MaLP);
            return danhSachLoaiPhieu;
        }
        public IEnumerable<LoaiPhieuViewModels> SearchLoaiPhieu(string timKiem)
        {
            var danhSachLoaiPhieu = quanLyNhanSu.LoaiPhieux.Select(x => new LoaiPhieuViewModels
            {
                MaLP = x.MaLP,
                TenLoaiPhieu = x.TenLoaiPhieu,
            }).Where(lp => lp.MaLP.Contains(timKiem) ||
                     lp.TenLoaiPhieu.Contains(timKiem)).OrderBy(lp => lp.MaLP);
            return danhSachLoaiPhieu;
        }
        public IEnumerable<LoaiPhieu> GetLoaiPhieu()
        {
            return quanLyNhanSu.LoaiPhieux.OrderBy(lp => lp.MaLP).ToList();
        }
        public bool Save(LoaiPhieu loaiPhieu)
        {
            try
            {
                LoaiPhieu newLoaiPhieu = quanLyNhanSu.LoaiPhieux.Where(lp => lp.MaLP == loaiPhieu.MaLP).FirstOrDefault();
                if (newLoaiPhieu != null)
                {
                    newLoaiPhieu.TenLoaiPhieu = loaiPhieu.TenLoaiPhieu;
                }
                else
                    quanLyNhanSu.LoaiPhieux.Add(loaiPhieu);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("UQ_TenLoaiPhieu"))
                {
                    MessageBox.Show("Tên loại phiếu đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        public bool Delete(string maLP)
        {
            try
            {
                var loaiPhieu = quanLyNhanSu.LoaiPhieux.Where(lp => lp.MaLP == maLP).FirstOrDefault();
                if (loaiPhieu != null)
                {                    
                        MessageBoxManager.Yes = "Có";
                        MessageBoxManager.No = "Không";
                        DialogResult ketQua = MessageBox.Show("Xác nhận xoá loại phiếu " + loaiPhieu.TenLoaiPhieu + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                        if (ketQua == DialogResult.Yes)
                        {
                            quanLyNhanSu.LoaiPhieux.Remove(loaiPhieu);
                            quanLyNhanSu.SaveChanges();
                            MessageBox.Show("Đã xoá loại phiếu " + loaiPhieu.TenLoaiPhieu, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            return true;
                        }                    
                    
                }
                return false;
            }
            catch(Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK_Phieu_LoaiPhieu"))
                {
                    MessageBox.Show("Loại phiếu vẫn còn phiếu. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                else
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
        public int SoLuongPhieuLap(string maPL)
        {
            int sl = quanLyNhanSu.Phieux.Where(phieu => phieu.MaLP == maPL).Count();
            return sl;
        }
    }
}
