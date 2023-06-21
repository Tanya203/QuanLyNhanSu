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
    internal class QuanLyNhanVienBUS
    {
        private QuanLyNhanVienDAL nhanVienDAL;

        public QuanLyNhanVienBUS()
        {
            nhanVienDAL = new QuanLyNhanVienDAL();
        }
        public IEnumerable<NhanVienViewModel> GetAllNhanVien()
        {
            return nhanVienDAL.GetAllNhanVien();   
        }

        public bool Save(NhanVien nhanVien)
        {
            try
            {
                return nhanVienDAL.Save(nhanVien);
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
    }
}
