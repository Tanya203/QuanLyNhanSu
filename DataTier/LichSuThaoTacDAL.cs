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
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoNgay(string ngay)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,          
                ThaoTacThucHien = x.ThaoTacThucHien,
                ThongTinNhanVien = x.ThongTinNhanVien
            }).Where(lstt => lstt.NgayGio.Contains(ngay)).OrderBy(lstt => lstt.NgayGio);
            return lichSuThaoTac;
        }
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoThang(string thang)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,
                ThongTinNhanVien = x.ThongTinNhanVien
            }).Where(lstt => lstt.NgayGio.Contains(thang)).OrderBy(lstt => lstt.NgayGio);
            return lichSuThaoTac;
        }
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoNam(string nam)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,
                ThaoTacThucHien = x.ThaoTacThucHien,
                ThongTinNhanVien = x.ThongTinNhanVien
            }).Where(lstt => lstt.NgayGio.Contains(nam)).OrderBy(lstt => lstt.NgayGio);
            return lichSuThaoTac;
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiemNgay(string ngay ,string timKiem)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,
                ThaoTacThucHien = x.ThaoTacThucHien,
                ThongTinNhanVien = x.ThongTinNhanVien
            }).Where(lstc => lstc.NgayGio.Contains(ngay) && (lstc.NgayGio.Contains(timKiem) ||
                     lstc.MaNV.Contains(timKiem) ||
                     lstc.ThaoTacThucHien.Contains(timKiem) ||
                     lstc.ThongTinNhanVien.Contains(timKiem))).OrderBy(lstt => lstt.NgayGio);            
            return lichSuThaoTac;
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiemThang(string thang, string timKiem)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,
                ThaoTacThucHien = x.ThaoTacThucHien
            }).Where(lstc => lstc.NgayGio.Contains(thang) && (lstc.NgayGio.Contains(timKiem) ||
                     lstc.MaNV.Contains(timKiem) ||
                     lstc.ThaoTacThucHien.Contains(timKiem) ||
                     lstc.ThongTinNhanVien.Contains(timKiem))).OrderBy(lstt => lstt.NgayGio);
            return lichSuThaoTac;
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiemNam(string nam, string timKiem)
        {
            var lichSuThaoTac = quanLyNhanSu.LichSuThaoTacs.Select(x => new LichSuThaoTacViewModels
            {
                NgayGio = x.NgayGio,
                MaNV = x.MaNV,
                ThaoTacThucHien = x.ThaoTacThucHien
            }).Where(lstc => lstc.NgayGio.Contains(nam) && (lstc.NgayGio.Contains(timKiem) ||
                     lstc.MaNV.Contains(timKiem) ||
                     lstc.ThaoTacThucHien.Contains(timKiem) ||
                     lstc.ThongTinNhanVien.Contains(timKiem))).OrderBy(lstt => lstt.NgayGio);
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
