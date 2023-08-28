using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class LichLamViecBUS
    {
        public readonly LichLamViecDAL lichLamViecDAL;
        public LichLamViecBUS()
        {
            lichLamViecDAL = new LichLamViecDAL();
        }
        public IEnumerable<LichLamViecViewModels> GetLichLamViecTheoPhongBan(string maP)
        {
            return lichLamViecDAL.GetLichLamViecTheoPhongBan(maP);
        }
        public IEnumerable<LichLamViecViewModels> SearchLichLamViecTheoPhongBan(string maP, string timKiem)
        {
            return lichLamViecDAL.SearchLichLamViecTheoPhongBan(maP,timKiem);
        }
        public IEnumerable<LichLamViec> GetLichLamViec()
        {
            return lichLamViecDAL.GetLichLamViec();
        }
        public bool Save(LichLamViec lichLamViec)
        {
            return lichLamViecDAL.Save(lichLamViec);
        }
        public bool Delete(LichLamViec lichLamViec)
        {
            return lichLamViecDAL.Delete(lichLamViec.MaLLV);
        }
    }
}
