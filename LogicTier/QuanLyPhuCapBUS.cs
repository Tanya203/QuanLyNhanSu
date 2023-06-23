using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyPhuCapBUS
    {
        private readonly QuanLyPhuCapDAL phuCapDAL;
        public QuanLyPhuCapBUS()
        {
            phuCapDAL = new QuanLyPhuCapDAL();
        }
        public IEnumerable<PhuCapViewMModels> GetAllPhuCap()
        {
            return phuCapDAL.GetAllPhuCap();
        }
        public IEnumerable<PhuCapViewMModels> SearchPhuCap(string timKiem)
        {
            return phuCapDAL.SearcPhuCap(timKiem);
        }

        public bool Save(PhuCap phuCap)
        {
            return phuCapDAL.Save(phuCap);
        }
        public bool Delete(PhuCap phuCap)
        {
            return phuCapDAL.Delete(phuCap.MaPC);
        }
        public int TongSoLuongNhanVienTrongPhongBan(string maPC)
        {
            return phuCapDAL.TongSoNhanVienTrongPhuCap(maPC);
        }
    }
}
