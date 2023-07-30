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
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoNgay(string ngay)
        {
            return lichSuThaoTacDAL.GetAllLichSuThaoTacTheoNgay(ngay);
        }
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuTThaoTacTheoThang(string thang)
        {
            return lichSuThaoTacDAL.GetAllLichSuThaoTacTheoThang(thang);
        }
        public IEnumerable<LichSuThaoTacViewModels> GetAllLichSuThaoTacTheoNam(string nam)
        {
            return lichSuThaoTacDAL.GetAllLichSuThaoTacTheoNam(nam);
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiemNgay(string ngay ,string timKiem)
        {
            return lichSuThaoTacDAL.LichSuThaoTacTimKiemNgay(ngay, timKiem);
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiemThang(string thang, string timKiem)
        {
            return lichSuThaoTacDAL.LichSuThaoTacTimKiemThang(thang, timKiem);
        }
        public IEnumerable<LichSuThaoTacViewModels> LichSuThaoTacTimKiemNam(string nam, string timKiem)
        {
            return lichSuThaoTacDAL.LichSuThaoTacTimKiemNam(nam, timKiem);
        }
        public bool Save(LichSuThaoTac lstt)
        {
            return lichSuThaoTacDAL.Save(lstt);
        }
    }
}
