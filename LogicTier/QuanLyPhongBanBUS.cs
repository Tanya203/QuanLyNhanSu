using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyPhongBanBUS
    {
        private readonly QuanLyPhongBanDAL phongBanDAL;
        public QuanLyPhongBanBUS()
        {
            phongBanDAL = new QuanLyPhongBanDAL();
        }
        public IEnumerable<PhongBanViewModel> GetAllPhongBan()
        {
            return phongBanDAL.GetAllPhongBan();
        }
        public IEnumerable<PhongBanViewModel> SearchPhongBan(string timKiem)
        {
            return phongBanDAL.SearchPhongBan(timKiem);
        }
        public bool Save(PhongBan phongBan)
        {
            return phongBanDAL.Save(phongBan);           
        }
        public bool Delete(PhongBan phongBan)
        {
           return phongBanDAL.Delete(phongBan.MaPB);            
        }
        public IEnumerable<PhongBan> GetPhongBan()
        {
            return phongBanDAL.GetPhongBan();   
        }
        public int TongSoLuongNhanVienTrongPhongBan(string maPB)
        {
            return phongBanDAL.TongSoNhanVienTrongPhongBan(maPB);
        }
    }
}
