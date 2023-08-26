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
    internal class PhieuBUS
    {
        private readonly PhieuDAL phieuDAL;
        public PhieuBUS()
        {
            phieuDAL = new PhieuDAL();
        }
        public IEnumerable<PhieuViewModels> GetAllPhieu()
        {
            return phieuDAL.GetAllPhieu();
        }
        public IEnumerable<PhieuViewModels> SearchPhieu(string timKiem)
        {
            return phieuDAL.SearchPhieu(timKiem);
        }
        public bool Save(Phieu phieu)
        {
            return phieuDAL.Save(phieu);
        }
        public bool Delete(Phieu phieu)
        {
            return phieuDAL.Delete(phieu.MaP);
        }
        public IEnumerable<Phieu> GetPhieu()
        {
            return phieuDAL.GetPhieu();
        }
    }
}
