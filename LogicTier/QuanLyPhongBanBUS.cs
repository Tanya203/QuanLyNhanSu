using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
        public bool Save(PhongBan phongBan)
        {
            return phongBanDAL.Save(phongBan);           
        }

        public bool Delete(PhongBan phongBan)
        {
           return phongBanDAL.Delete(phongBan.MaPB);            
        }

        public int TongSoLuongNhanVienTrongPhongBan(string maPB)
        {
            return phongBanDAL.TongSoNhanVienTrongPhongBan(maPB);
        }

    }
}
