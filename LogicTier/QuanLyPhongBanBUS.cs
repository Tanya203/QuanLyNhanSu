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
    internal class QuanLyPhongBanBUS
    {
        private QuanLyPhongBanDAL phongBanDAL;
        public QuanLyPhongBanBUS()
        {
            phongBanDAL = new QuanLyPhongBanDAL();
        }
        public IEnumerable<PhongBanViewModel> GetAllPhongBan()
        {
            return phongBanDAL.GetAllPhongBan();
        }
        public bool Save(PhongBan phongBan)
        {
            try
            {
                return phongBanDAL.Save(phongBan);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Delete(PhongBan phongBan)
        {
            try
            {
                return phongBanDAL.Delete(phongBan.MaPB);
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

    }
}
