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
        }
        public IEnumerable<LoaiHopDongViewModels> GetAllLoaiHopDong()
        {
            var danhSachLoaiHopDong = quanLyNhanSu.LoaiHopDongs.Select(x => new LoaiHopDongViewModels
            {
                MaLHD = x.MaLHD,
                TenLoaiHopDong = x.TenLoaiHopDong,
            }).ToList();
            return danhSachLoaiHopDong;
        }
        public IEnumerable<LoaiHopDongViewModels> SearchLoaiHopDong(string timKiem)
        {
            var danhSachLoaiHopDong = quanLyNhanSu.LoaiHopDongs.Select(x => new LoaiHopDongViewModels
            {
                MaLHD = x.MaLHD,
                TenLoaiHopDong = x.TenLoaiHopDong,
            }).Where(pb => pb.TenLoaiHopDong.ToString().Contains(timKiem) ||
                     pb.MaLHD.ToString().Contains(timKiem)).ToList();
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
                else
                    throw ex;
            }
        }
        public bool Delete(string maLHD)
        {
            try
            {
                var loaiHopDong = quanLyNhanSu.LoaiHopDongs.Where(lhd => lhd.MaLHD == maLHD).FirstOrDefault();
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
                    throw ex;
            }
        }
        public int TongSoNhanVienTrongLoaiHopDong(string maLHD)
        {
            int sl = quanLyNhanSu.NhanViens.Where(nv => nv.MaLHD == maLHD).Count();           
            return sl;
        }
    }
}
