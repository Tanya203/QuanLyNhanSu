﻿using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class QuanLyChucVuBUS
    {
        private readonly QuanLyChucVuDAL chucVuDAL;
        public QuanLyChucVuBUS()
        {
            chucVuDAL = new QuanLyChucVuDAL();
        }
        public IEnumerable<ChucVuViewModels> GetAllChucVu()
        {
            return chucVuDAL.GetAllChucVu();
        }
        public IEnumerable<ChucVuViewModels> SearchChucVu(string timKiem)
        {
            return chucVuDAL.SearchChucVu(timKiem);
        }
        public IEnumerable<ChucVu> GetChucVu()
        {
            return chucVuDAL.GetChucVu();
        }
        public bool Save(ChucVu chucVu)
        {
            return chucVuDAL.Save(chucVu);
        }
        public bool Delete(ChucVu chucVu)
        {
            return chucVuDAL.Delete(chucVu.MaCV);
        }
        public int TongSoNhanVienThuocChucVu(string maCV)
        {
            return chucVuDAL.TongSoNhanVienThuocChucVu(maCV);
        }
        public decimal GetLuongCoBanCuaChucVu(string maCV)
        {
            return chucVuDAL.GetLuongCoBanCuaChucVu(maCV);
        }
    }
}
