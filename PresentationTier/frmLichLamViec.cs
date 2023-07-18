﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmLichLamViec : Form
    {
        
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichLamViecBUS lichLamViecBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly QuanLyCaBUS quanLyCaBUS;
        private readonly QuanLyLoaiCaBUS quanLyLoaiCaBUS;
        public IEnumerable<LichLamViecViewModels> danhSachLichLamViec;
        public IEnumerable<LichLamViecViewModels> danhSachLichLamViecTimKiem;
        private readonly NhanVien nv;
        private readonly string maPB;
        private readonly string maNV;
        private readonly string formatDate = "yyyy-MM-dd";

        public FrmLichLamViec(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichLamViecBUS = new LichLamViecBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            quanLyCaBUS = new QuanLyCaBUS();
            quanLyLoaiCaBUS = new QuanLyLoaiCaBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            this.maNV = maNV;
            maPB = nv.ChucVu.PhongBan.MaPB;
        }
        private void FrmLichLamViec_Load(object sender, EventArgs e)
        {
            cmbCa.DisplayMember = "TenCa";
            cmbCa.ValueMember = "MaCa";
            cmbLoaiCa.DisplayMember = "TenLoaiCa";
            cmbLoaiCa.ValueMember = "MaLC";
            LoadThongTinDangNhap();
            LoadLichLamViec();
            LoadLoaiCa();
            LoadCa(dtpNgayLam.Text);
            LoadThongTinCa(cmbCa.SelectedValue.ToString());
            txtMaCa.ReadOnly = true;
            txtTenCa.ReadOnly = true;
            txtGioBatDau.ReadOnly = true;
            txtGioKetThuc.ReadOnly = true;
        }
        public void LoadThongTinDangNhap()
        {            
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }             
        private void LoadLichLamViec()
        {
            dgvThongTinLichLamViec.Rows.Clear();
            danhSachLichLamViec = lichLamViecBUS.GetLichLamViecTheoPhongBan(maPB);
            int rowAdd;
            foreach (var llv in danhSachLichLamViec)
            {
                rowAdd = dgvThongTinLichLamViec.Rows.Add();
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[0].Value = llv.MaLLV;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[1].Value = llv.MaNV;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[2].Value = llv.HoTen;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[3].Value = llv.PhongBan;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[4].Value = llv.ChucVu;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[5].Value = llv.NgayLam.ToString(formatDate);
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[6].Value = llv.TenCa;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[7].Value = llv.TenLC;
            }
        }
        private void LoadLichLamViecTimKiem(string timKiem)
        {
            dgvThongTinLichLamViec.Rows.Clear();
            danhSachLichLamViecTimKiem = lichLamViecBUS.SearchLichLamViecTheoPhongBan(maPB, timKiem);
            int rowAdd;
            foreach (var llv in danhSachLichLamViecTimKiem)
            {
                rowAdd = dgvThongTinLichLamViec.Rows.Add();
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[0].Value = llv.MaLLV;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[1].Value = llv.MaNV;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[2].Value = llv.HoTen;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[3].Value = llv.PhongBan;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[4].Value = llv.ChucVu;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[5].Value = llv.NgayLam.ToString(formatDate);
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[6].Value = llv.TenCa;
                dgvThongTinLichLamViec.Rows[rowAdd].Cells[7].Value = llv.TenLC;
            }
        }
        private void LoadThongTinCa(string maCa)
        {
            Ca ca = quanLyCaBUS.ThongTinCa(maCa);
            txtMaCa.Text = ca.MaCa;
            txtTenCa.Text = ca.TenCa;
            txtGioBatDau.Text = ca.GioBatDau.ToString();
            txtGioKetThuc.Text = ca.GioKetThuc.ToString();
        }
        public void LoadCa(string ngayLam)
        {
            List<LichLamViec> locLich = lichLamViecBUS.LocLichTheoNgay(maPB, ngayLam).ToList();
            List<Ca> ca = quanLyCaBUS.GetCa().ToList();
            foreach(var c in locLich)
                ca = ca.Where(x => x.MaCa != c.MaCa).ToList();
            cmbCa.DataSource = ca;
        }
        public void LoadLoaiCa()
        {
            cmbLoaiCa.DataSource = quanLyLoaiCaBUS.GetLoaiCa();
        }
        private void cmbCa_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cmbCa.Text))
            {
                cmbCa.Enabled = false;
                txtMaCa.Text = string.Empty;
                txtTenCa.Text = string.Empty;
                txtGioBatDau.Text = string.Empty;
                txtGioKetThuc.Text= string.Empty;
                btnThem.Enabled = false;
            }
            else
            {
                cmbCa.Enabled = true;
                btnThem.Enabled = true;
                LoadThongTinCa(cmbCa.SelectedValue.ToString());
            }                
        }
        private void dtpNgayLam_ValueChanged(object sender, EventArgs e)
        {
            LoadCa(dtpNgayLam.Text);
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButton(object sender, EventArgs e)
        {
            
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        public void Reload()
        {
            FrmLichLamViec frmOpen = new FrmLichLamViec(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void lblThongTinLichLamViec_Click(object sender, EventArgs e)
        {

        }

        private void btnThem_Click(object sender, EventArgs e)
        {

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {

        }


    }
}
