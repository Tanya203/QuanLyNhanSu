using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

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
            return phuCapDAL.SearchPhuCap(timKiem);
        }
        public IEnumerable<PhuCap> GetPhuCap()
        {
            return phuCapDAL.GetPhuCap();
        }
        public bool Save(PhuCap phuCap)
        {
            return phuCapDAL.Save(phuCap);
        }
        public bool Delete(PhuCap phuCap)
        {
            return phuCapDAL.Delete(phuCap.MaPC);
        }
        public PhuCap ThongTinPhuCap(string maPC)
        {
            return phuCapDAL.ThongTinPhuCap(maPC);
        }
    }
}
