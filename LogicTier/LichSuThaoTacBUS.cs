using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class LichSuThaoTacBUS
    {
        private readonly LichSuThaoTacDAL lichSuThaoTacDAL;
        public LichSuThaoTacBUS()
        {
            lichSuThaoTacDAL = new LichSuThaoTacDAL();
        }
        public IEnumerable<LichSuThaoTacViewModels> GetLichSuThaoTac(string thoiGian, string giaoDien, string thaoTac)
        {
            return lichSuThaoTacDAL.GetLichSuThaoTac(thoiGian, giaoDien, thaoTac);
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiem(string thoiGian, string giaoDien, string thaoTac, string timKiem)
        {
            return lichSuThaoTacDAL.LichSuThaoTacTimKiem(thoiGian, giaoDien, thaoTac, timKiem);
        }        
        public bool Save(LichSuThaoTac lstt)
        {
            return lichSuThaoTacDAL.Save(lstt);
        }
    }
}
