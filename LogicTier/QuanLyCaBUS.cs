using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyCaBUS
    {
        private readonly QuanLyCaDAL caDAL;
        public QuanLyCaBUS()
        {
            caDAL = new QuanLyCaDAL();
        }
        public IEnumerable<CaViewModels> GetAllCa()
        {
            return caDAL.GetAllCa();
        }
        public IEnumerable<CaViewModels> SearchCa(string timKiem)
        {
            return caDAL.SearchCa(timKiem);
        }
        public IEnumerable<Ca> GetCa()
        {
            return caDAL.GetCa();
        }
        public bool Save(Ca ca)
        {
            return caDAL.Save(ca);
        }
        public bool Delete(Ca ca)
        {
            return caDAL.Delete(ca.MaCa);
        }

    }
}
