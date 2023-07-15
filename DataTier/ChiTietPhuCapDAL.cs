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
    internal class ChiTietPhuCapDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public ChiTietPhuCapDAL()
        {
            quanLyNhanSu= new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChiTietPhuCapViewModels> GetAllChiTietPhuCap(string maPC)
        {
            return quanLyNhanSu.ChiTietPhuCaps.Select(x => new ChiTietPhuCapViewModels
            {

                MaPC = x.MaPC,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                TenPhuCap = x.PhuCap.TenPhuCap,
                TienPhuCap = x.PhuCap.TienPhuCap,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                GhiChu = x.GhiChu
            }).Where(pc => pc.MaPC == maPC).OrderBy(pc => pc.MaNV);
        }
        public IEnumerable<ChiTietPhuCapViewModels> GetPhuCapMotNhanVien(string maNV)
        {
            return quanLyNhanSu.ChiTietPhuCaps.Select(x => new ChiTietPhuCapViewModels
            {
                MaPC = x.MaPC,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                TenPhuCap = x.PhuCap.TenPhuCap,
                TienPhuCap = x.PhuCap.TienPhuCap,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                GhiChu = x.GhiChu
            }).Where(pc => pc.MaNV == maNV).OrderBy(pc => pc.MaPC);
        }
        public IEnumerable<ChiTietPhuCapViewModels> SearchChiTietPhuCap(string maPC, string timKiem)
        {
            return quanLyNhanSu.ChiTietPhuCaps.Select(x => new ChiTietPhuCapViewModels
            {

                MaPC = x.MaPC,
                MaNV = x.MaNV,
                HoTen = x.NhanVien.Ho + " " + x.NhanVien.TenLot + " " + x.NhanVien.Ten,
                TenPhuCap = x.PhuCap.TenPhuCap,
                TienPhuCap = x.PhuCap.TienPhuCap,
                PhongBan = x.NhanVien.ChucVu.PhongBan.TenPhongBan,
                GhiChu = x.GhiChu
            }).Where(pc => pc.MaPC == maPC && (pc.MaNV.Contains(timKiem) ||
                     pc.HoTen.Contains(timKiem) ||
                     pc.TenPhuCap.Contains(timKiem) ||
                     pc.TienPhuCap.ToString().Contains(timKiem) ||
                     pc.PhongBan.Contains(timKiem) ||
                     pc.ChucVu.Contains(timKiem))).OrderBy(pc => pc.MaNV);
        }
        public bool Save(ChiTietPhuCap chiTietPhuCap)
        {
            try
            {
                quanLyNhanSu.ChiTietPhuCaps.Add(chiTietPhuCap);
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
        public bool Delete(ChiTietPhuCap chiTietPhuCap)
        {
            try
            {
                List<ChiTietPhuCap> newChiTietPhuCap = quanLyNhanSu.ChiTietPhuCaps.Where(pc => pc.MaNV == chiTietPhuCap.MaNV && pc.MaPC == chiTietPhuCap.MaPC).ToList();
                if(newChiTietPhuCap != null)
                {
                    foreach(var pc in newChiTietPhuCap)
                    {
                        quanLyNhanSu.ChiTietPhuCaps.Remove(pc);
                    }
                    quanLyNhanSu.SaveChanges();
                    return true;
                }
                return false;
            }
            catch(Exception ex)
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
