using Eco.FrameworkImpl.Ocl;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class LichSuThaoTacDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public LichSuThaoTacDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoThoiGian(string thoiGian)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,     
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                ThaoTacThucHien = x.ThaoTacThucHien,               
            }).Where(lstt => lstt.NgayGio.Contains(thoiGian)).OrderBy(lstt => lstt.NgayGio);
            return lichSuThaoTac;
        }        
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiem(string thoiGian ,string timKiem)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                ChucVu = x.NhanVien.ChucVu.TenChucVu,
                ThaoTacThucHien = x.ThaoTacThucHien,               
            }).Where(lstc => lstc.NgayGio.Contains(thoiGian) && (lstc.NgayGio.Contains(timKiem) ||
                     lstc.MaNV.Contains(timKiem) ||
                     lstc.HoTen.Contains(timKiem) ||
                     lstc.PhongBan.Contains(timKiem) ||
                     lstc.ChucVu.Contains(timKiem) ||
                     lstc.ThaoTacThucHien.Contains(timKiem))).OrderBy(lstt => lstt.NgayGio);            
            return lichSuThaoTac;
        }
        public bool Save(LichSuThaoTac lstt)
        {
            try
            {
                quanLyNhanSu.LichSuThaoTacs.Add(lstt);
                quanLyNhanSu.SaveChanges();
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
