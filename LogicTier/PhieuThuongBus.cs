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
    internal class PhieuThuongBus
    {
        private readonly PhieuThuongDAL phieuThuongDAL;
        public PhieuThuongBus()
        {
            phieuThuongDAL = new PhieuThuongDAL();
        }
        public IEnumerable<PhieuThuongViewModels> GetAllPhieuThuong()
        {
            return phieuThuongDAL.GetAllPhieuThuong();
        }
        public IEnumerable<PhieuThuongViewModels> SearchPhieuThuongPhieuThuong(string timKiem)
        {
            return phieuThuongDAL.SearchPhieuThuong(timKiem);
        }
        public bool Save(PhieuThuong phieuThuong)
        {
            return phieuThuongDAL.Save(phieuThuong);
        }
        public bool Delete(PhieuThuong phieuThuong)
        {
            return phieuThuongDAL.Delete(phieuThuong.MaPT);
        }
        public decimal TongTienPhieuThuong(string maPhieuThuong)
        {
            return phieuThuongDAL.TongTienPhieuThuong(maPhieuThuong);
        }
        public PhieuThuong ThongTinPhieuThuong(string maPT)
        {
            return phieuThuongDAL.ThongTinPhieuThuong(maPT);
        }
    }
}
