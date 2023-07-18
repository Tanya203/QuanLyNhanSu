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
        public LichLamViec ThongTinLichLamViec(string maLLV)
        {
            return lichLamViecDAL.ThongTinLichLamViec(maLLV);
        }
        public IEnumerable<LichLamViec> LocLichTheoNgay(string maPB, string ngayLam)
        {
            return lichLamViecDAL.LocLichTheoNgay(maPB, ngayLam);
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
