using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;


namespace QuanLyNhanSu.DataTier.Models
{
    internal class QuanLyPhongBanDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyPhongBanDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<PhongBan> GetPhongBan()
        {
            return quanLyNhanSu.PhongBans.OrderBy(pb => pb.MaPB).ToList();
        }
        public IEnumerable<PhongBanViewModel> GetAllPhongBan()
        {
            var danhSachPhongBan = quanLyNhanSu.PhongBans.Select(x => new PhongBanViewModel
            {
                MaPB = x.MaPB,
                TenPhongBan = x.TenPhongBan,
            }).OrderBy(pb => pb.MaPB);
            return danhSachPhongBan;
        }
        public IEnumerable<PhongBanViewModel> SearchPhongBan(string timKiem)
        {
            var danhSachPhongBan = quanLyNhanSu.PhongBans.Select(x => new PhongBanViewModel
            {
                MaPB = x.MaPB,
                TenPhongBan = x.TenPhongBan,
            }).Where(pb => pb.TenPhongBan.Contains(timKiem) ||
                     pb.MaPB.Contains(timKiem)).OrderBy(pb => pb.MaPB);
            return danhSachPhongBan;
        }        
        public bool Save(PhongBan phongBan)
        {
            try
            {
                PhongBan newPhongBan = quanLyNhanSu.PhongBans.Where(pb => pb.MaPB == phongBan.MaPB).FirstOrDefault();
                if (newPhongBan != null)//cập nhật
                {
                    newPhongBan.TenPhongBan = phongBan.TenPhongBan;
                }
                else//thêm mới
                    quanLyNhanSu.PhongBans.Add(phongBan);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }            
            catch(Exception ex)
            {
                if (ex.InnerException.ToString().Contains("UQ_TenPhongBan"))
                {
                    MessageBox.Show("Tên phòng ban đã tồn tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        public bool Delete(string maPB)
        {
            var phongBan = quanLyNhanSu.PhongBans.Where(pc => pc.MaPB == maPB).FirstOrDefault();
            try
            {                
                if(phongBan != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá phòng ban {phongBan.TenPhongBan}?", "Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
                    if(ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.PhongBans.Remove(phongBan);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá phòng ban {phongBan.TenPhongBan}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }                    
                }
                return false;
            }
            catch(Exception ex)
            {
                if (ex.InnerException.ToString().Contains("FK_NhanVien_ChucVu"))
                {
                    MessageBox.Show($"Chức vụ thuộc phòng ban {phongBan.TenPhongBan} vẫn còn nhân viên. Không thể xoá!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
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
        public int TongSoNhanVienTrongPhongBan(string maPB)
        {
            int sl = 0;
            var listCV = quanLyNhanSu.ChucVus.Where(cv => cv.MaPB == maPB);
            foreach(var cv in listCV)            
                sl += quanLyNhanSu.NhanViens.Count(nv => nv.MaCV == cv.MaCV);                          
            return sl;
        }
    }
}
