using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class ChamCongDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly string formatDate = "yyyy - MM - dd";
        public ChamCongDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<ChamCong> GetLichLamViecTheoNgay(string ngayLam)
        {
            return quanLyNhanSu.ChamCongs.Where(llv => llv.LichLamViec.NgayLam.ToString() == ngayLam).ToList();
        }
        public bool ChamCong(List<ChamCong> nhanVien, string thaoTac)
        {
            try
            {
                foreach(ChamCong nv in nhanVien)
                {
                    quanLyNhanSu.ChamCongs.AddOrUpdate(nv);
                    quanLyNhanSu.SaveChanges();
                }
                MessageBox.Show(thaoTac, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                MessageBoxManager.Yes = "OK";
                MessageBoxManager.No = "Chi tiết lỗi";
                DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
                if (ketQua == DialogResult.No)
                {
                    if (!string.IsNullOrEmpty(ex.InnerException.ToString()))
                        MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    else
                        MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                return false;
            }
        }
    }
}
