using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier.Models
{
    internal class QuanLyPhongBanDAL
    {
        private QuanLyNhanSuContextDB quanLyNhanSu;
        public QuanLyPhongBanDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<PhongBanViewModel> GetAllPhongBan()
        {
            var danhSachPhongBan = quanLyNhanSu.PhongBans.Select(x => new PhongBanViewModel
            {
                MaPB = x.MaPB,
                TenPhongBan = x.TenPhongBan,
            }).ToList();
            return danhSachPhongBan;
        }

        public bool Save(PhongBan phongBan)
        {
            try
            {
                PhongBan newPhongBan = quanLyNhanSu.PhongBans.Where(pb => pb.MaPB == phongBan.MaPB).FirstOrDefault();
                if (newPhongBan != null)//cập nhật
                {
                    newPhongBan.TenPhongBan = phongBan.TenPhongBan;
                }
                else
                    quanLyNhanSu.PhongBans.Add(newPhongBan);
                return true;
            }
            catch (SqlException sqlEx)
            {
                if (sqlEx.Message.Contains("UQ_TenPhongBan"))
                    throw new Exception("Tên phòng ban đã tồn tại");
                throw sqlEx;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public bool Delete(string maPB)
        {
            try
            {
                var phongBan = quanLyNhanSu.PhongBans.Where(PB => PB.MaPB == maPB).FirstOrDefault();
                if(phongBan != null)
                {
                    quanLyNhanSu.PhongBans.Remove(phongBan);
                    quanLyNhanSu.SaveChanges();
                    return true;
                }
                return false;
            }
            catch(Exception ex)
            {
                throw ex;
            }
        }
        public PhongBan GetPhongBan(string maPB)
        {
            return quanLyNhanSu.PhongBans.Where(pb => pb.MaPB == maPB).FirstOrDefault();
        }


    }
}
