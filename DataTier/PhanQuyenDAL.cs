using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class PhanQuyenDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public PhanQuyenDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            MessageBoxManager.Register_OnceOnly();
        }
        public IEnumerable<PhanQuyenViewModels> GetAllPhanQuyen(string loc)
        {
            var danhSachPhanQuyen = quanLyNhanSu.PhanQuyens.Select(x => new PhanQuyenViewModels
            {
                MaQH = x.MaQH,
                MaCV = x.MaCV,
                MaGD = x.QuyenHan.GiaoDien.MaGD,
                TenQuyenHan = x.QuyenHan.TenQuyenHan,
                GiaoDien = x.QuyenHan.GiaoDien.TenGiaoDien,
                TenChucVu = x.ChucVu.TenChucVu,
                CapQuyen = x.CapQuyen,
            });
            if (loc.Contains("CV"))
                danhSachPhanQuyen = danhSachPhanQuyen.Where(pq => pq.MaCV == loc).OrderBy(pq => pq.MaQH);
            else if (loc.Contains("QH"))
                danhSachPhanQuyen = danhSachPhanQuyen.Where(pq => pq.MaQH == loc).OrderBy(pq => pq.MaQH);
            else if (loc.Contains("GD"))
                danhSachPhanQuyen = danhSachPhanQuyen.Where(pq => pq.MaGD == loc).OrderBy(pq => pq.MaQH);
            return danhSachPhanQuyen;
        }
        public IEnumerable<PhanQuyenViewModels> GetAllPhanQuyenTimKiem(string loc ,string timKiem)
        {
            var danhSachPhanQuyenTimKiem = quanLyNhanSu.PhanQuyens.Select(x => new PhanQuyenViewModels
            {
                MaQH = x.MaQH,
                MaCV = x.MaCV,
                MaGD = x.QuyenHan.GiaoDien.MaGD,
                TenQuyenHan = x.QuyenHan.TenQuyenHan,
                GiaoDien = x.QuyenHan.GiaoDien.TenGiaoDien,
                TenChucVu = x.ChucVu.TenChucVu,
                CapQuyen = x.CapQuyen,
            });
            if (loc.Contains("CV"))
                danhSachPhanQuyenTimKiem = danhSachPhanQuyenTimKiem.Where(pq => pq.MaCV == loc).OrderBy(pq => pq.MaQH);
            else if (loc.Contains("QH"))
                danhSachPhanQuyenTimKiem = danhSachPhanQuyenTimKiem.Where(pq => pq.MaQH == loc).OrderBy(pq => pq.MaQH);
            else if (loc.Contains("GD"))
                danhSachPhanQuyenTimKiem = danhSachPhanQuyenTimKiem.Where(pq => pq.MaGD == loc).OrderBy(pq => pq.MaQH);
            danhSachPhanQuyenTimKiem = danhSachPhanQuyenTimKiem.Where(pq => pq.MaQH.Contains(timKiem) ||
                                                                      pq.MaCV.Contains(timKiem) ||
                                                                      pq.TenQuyenHan.Contains(timKiem) ||
                                                                      pq.GiaoDien.Contains(timKiem) ||
                                                                      pq.TenChucVu.Contains(timKiem));
            return danhSachPhanQuyenTimKiem;
        }
        
        public IEnumerable<PhanQuyen> GetPhanQuyens()
        {
            return quanLyNhanSu.PhanQuyens.OrderBy(pq => pq.MaCV).ToList();
        }
        public bool Save(PhanQuyen pq)
        {
            try
            {
                quanLyNhanSu.PhanQuyens.AddOrUpdate(pq);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch(Exception ex)
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
        public bool AddChucVuVaoPhanQuyen(List<PhanQuyen> chucVu)
        {
            try
            {
                foreach(PhanQuyen qh in chucVu)
                {
                    quanLyNhanSu.PhanQuyens.Add(qh);
                }
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch(Exception ex)
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
