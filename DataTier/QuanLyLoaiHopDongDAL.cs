using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class QuanLyLoaiHopDongDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyLoaiHopDongDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<LoaiHopDongViewModels> GetAllLoaiHopDong()
        {
            var danhSachLoaiHopDong = quanLyNhanSu.LoaiHopDongs.Select(x => new LoaiHopDongViewModels
            {
                MaLHD = x.MaLHD,
                TenLoaiHopDong = x.TenLoaiHopDong,
            }).OrderBy(lhd => lhd.MaLHD).ToList();
            return danhSachLoaiHopDong;
        }
        public IEnumerable<LoaiHopDong> GetLoaiHopDong()
        {
            return quanLyNhanSu.LoaiHopDongs.OrderBy(lhd => lhd.MaLHD).ToList();
        }
        public IEnumerable<LoaiHopDongViewModels> SearchLoaiHopDong(string timKiem)
        {
            var danhSachLoaiHopDong = quanLyNhanSu.LoaiHopDongs.Select(x => new LoaiHopDongViewModels
            {
                MaLHD = x.MaLHD,
                TenLoaiHopDong = x.TenLoaiHopDong,
            }).Where(pb => pb.TenLoaiHopDong.Contains(timKiem) ||
                     pb.MaLHD.Contains(timKiem)).ToList();
            return danhSachLoaiHopDong;
        }
        public bool Save(LoaiHopDong loaiHopDong)
        {
            try
            {
                LoaiHopDong newLoaiHopDong = quanLyNhanSu.LoaiHopDongs.Where(pb => pb.MaLHD == loaiHopDong.MaLHD).FirstOrDefault();
                if (newLoaiHopDong != null)//cập nhật
                {
                    newLoaiHopDong.TenLoaiHopDong = loaiHopDong.TenLoaiHopDong;
                    quanLyNhanSu.LoaiHopDongs.AddOrUpdate(newLoaiHopDong);
                }
                else//thêm mới
                    quanLyNhanSu.LoaiHopDongs.Add(loaiHopDong);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("UQ_TenLoaiHopDong"))
                {
                    MessageBox.Show("Tên loại hợp đồng đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        public bool Delete(string maLHD)
        {
            var loaiHopDong = quanLyNhanSu.LoaiHopDongs.Where(lhd => lhd.MaLHD == maLHD).FirstOrDefault();
            try
            {                
                if (loaiHopDong != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá loại hợp đồng " + loaiHopDong.TenLoaiHopDong + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.LoaiHopDongs.Remove(loaiHopDong);
                        quanLyNhanSu.SaveChanges();                       
                        MessageBox.Show("Đã xoá loại hợp đồng " + loaiHopDong.TenLoaiHopDong, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK_NhanVien_LoaiHopDong"))
                {
                    MessageBox.Show("Loại hợp đồng vẫn còn nhân viên. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return false;
                }
                else
                {
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
                    
        }
        public int TongSoNhanVienTrongLoaiHopDong(string maLHD)
        {
            int sl = quanLyNhanSu.NhanViens.Where(nv => nv.MaLHD == maLHD).Count();           
            return sl;
        }
    }
}
