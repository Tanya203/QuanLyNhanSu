using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
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
        }
        public IEnumerable<PhongBanViewModel> GetAllPhongBan()
        {
            var danhSachPhongBan = quanLyNhanSu.PhongBans.Select(x => new PhongBanViewModel
            {
                MaPB = x.MaPB,
                TenPhongBan = x.TenPhongBan,
            }).ToList();
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
                else
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
                throw ex;
            }
        }
        public bool Delete(string maPB)
        {
            try
            {
                var phongBan = quanLyNhanSu.PhongBans.Where(PB => PB.MaPB == maPB).FirstOrDefault();
                if(phongBan != null)
                {
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show("Xác nhận xoá phòng ban " + phongBan.TenPhongBan + "?","Thông báo",MessageBoxButtons.YesNo,MessageBoxIcon.Question);
                    if(ketQua == DialogResult.Yes)
                    {
                        quanLyNhanSu.PhongBans.Remove(phongBan);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show("Đã xoá phòng ban " + phongBan.TenPhongBan, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                    
                }
                return false;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public PhongBan GetPhongBan(string maPB)
        {
            return quanLyNhanSu.PhongBans.Where(pb => pb.MaPB == maPB).FirstOrDefault();
        }
        public int TongSoNhanVienTrongPhongBan(string maPB)
        {
            int sl = 0;
            var listCV = quanLyNhanSu.ChucVus.Where(cv => cv.MaPB == maPB).ToList();
            foreach(var cv in listCV)            
                sl += quanLyNhanSu.NhanViens.Count(nv => nv.MaCV == cv.MaCV);                          
            return sl;
        }



    }
}
