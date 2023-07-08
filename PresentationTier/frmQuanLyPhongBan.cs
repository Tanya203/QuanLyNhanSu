﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhongBan : Form
    {
        Thread currentForm;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly NhanVien nv;
        private IEnumerable<PhongBanViewModel> danhSachPhongBan;
        private IEnumerable<PhongBanViewModel> danhSachPhongBanTimKiem;
        private readonly string maNV;
        public FrmQuanLyPhongBan(string maNV)
        {
            InitializeComponent();
            this.Load += frmQuanLyPhongBan_Load;
            phongBanBUS = new QuanLyPhongBanBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            txtMaPB.ReadOnly = true;
            txtTongSoNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyPhongBan_Load(object sender, EventArgs e)
        {
            LoadPhongBan();
            LoadThongTinDangNhap();
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
        private void LoadPhongBan()
        {
            dgvThongTinPhongBan.Rows.Clear();
            danhSachPhongBan = phongBanBUS.GetAllPhongBan();           
            int rowAdd;
            foreach (var pb in danhSachPhongBan)
            {
                rowAdd = dgvThongTinPhongBan.Rows.Add();
                dgvThongTinPhongBan.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
        }
        private void LoadPhongBanTimKiem(string timKiem)
        {           
            dgvThongTinPhongBan.Rows.Clear();
            danhSachPhongBanTimKiem = phongBanBUS.SearchPhongBan(timKiem);
            int rowAdd;
            foreach (var pb in danhSachPhongBanTimKiem)
            {
                rowAdd = dgvThongTinPhongBan.Rows.Add();
                dgvThongTinPhongBan.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaPB.Text = string.Empty;
            txtTenPB.Text = string.Empty;
            txtTongSoNhanVien.Text = string.Empty;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {            
            this.Close();
            Application.Run(new FrmQuanLyPhongBan(maNV));
        }
        public void Reload()
        {            
            this.Close();
            currentForm = new Thread(new ThreadStart(() => CloseCurrentForm(maNV)));
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaPB.Text) && string.IsNullOrEmpty(txtTenPB.Text) || string.IsNullOrEmpty(txtTenPB.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrEmpty(txtMaPB.Text) && !string.IsNullOrEmpty(txtTenPB.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrEmpty(txtMaPB.Text) && !string.IsNullOrEmpty(txtTenPB.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            PhongBan newPhongBan = new PhongBan
            {
                MaPB = "1",
                TenPhongBan = txtTenPB.Text
            };
            phongBanBUS.Save(newPhongBan);
            Reload();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            PhongBan newPhongBan = new PhongBan
            {
                MaPB = txtMaPB.Text,
                TenPhongBan = txtTenPB.Text
            };
            phongBanBUS.Save(newPhongBan);            
            ClearAllText();
            LoadPhongBan();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            PhongBan phongBan = new PhongBan
            {
                MaPB = txtMaPB.Text
            };
            phongBanBUS.Delete(phongBan);
            ClearAllText();
            LoadPhongBan();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(lblMaNV_DN.Text);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void dgvThongTinPhongBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaPB.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenPB.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[1].Value.ToString();
            txtTongSoNhanVien.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[2].Value.ToString();
        }        
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadPhongBan();
        }

        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadPhongBanTimKiem(txtTimKiem.Text);
        }
    } 
}
