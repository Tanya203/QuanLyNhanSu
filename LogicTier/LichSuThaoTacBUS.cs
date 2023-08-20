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
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoThoiGian(string thoiGian)
        {
            return lichSuThaoTacDAL.GetAllLichSuThaoTacTheoThoiGian(thoiGian);
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiem(string thoiGian, string timKiem)
        {
            return lichSuThaoTacDAL.LichSuThaoTacTimKiem(thoiGian, timKiem);
        }        
        public bool Save(LichSuThaoTac lstt)
        {
            return lichSuThaoTacDAL.Save(lstt);
        }
    }
}
