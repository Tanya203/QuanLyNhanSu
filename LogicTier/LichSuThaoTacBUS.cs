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
    internal class LichSuThaoTacBUS
    {
        private readonly LichSuThaoTacDAL lichSuThaoTacDAL;
        public LichSuThaoTacBUS()
        {
            lichSuThaoTacDAL = new LichSuThaoTacDAL();
        }
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuTThaoTac()
        {
            return lichSuThaoTacDAL.GetAllLichSuTThaoTac();
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiem(string timKiem)
        {
            return lichSuThaoTacDAL.LichSuThaoTacTimKiem(timKiem);
        }
        public bool Save(LichSuThaoTac lstt)
        {
            return lichSuThaoTacDAL.Save(lstt);
        }
    }
}
