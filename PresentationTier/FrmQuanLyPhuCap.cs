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
    public partial class FrmQuanLyPhuCap : Form
    {
        Thread currentForm;
        private readonly QuanLyPhuCapBUS phuCapBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private IEnumerable<PhuCapViewMModels> danhSachPhuCap;
        private IEnumerable<PhuCapViewMModels> danhSachPhuCapTimKiem;
        private readonly string maNV;
        public FrmQuanLyPhuCap(string maNV)

        {
            InitializeComponent();
            this.Load += frmQuanLyPhuCap_Load;
            phuCapBUS = new QuanLyPhuCapBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            txtMaPC.ReadOnly = true;
            txtSoLuongNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyPhuCap_Load(object sender, EventArgs e)
        {
            LoadPhuCap();
            LoadThongTinDangNhap();
        }
        public void LoadThongTinDangNhap()
        {
            NhanVien nv = nhanVienBUS.ThongTinNhanVienDangNhap(maNV);
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadPhuCap()
        {
            dgvThongTinPhuCap.Rows.Clear();
            danhSachPhuCap = phuCapBUS.GetAllPhuCap();
            int rowAdd;
            foreach (var pc in danhSachPhuCap)
            {
                rowAdd = dgvThongTinPhuCap.Rows.Add();
                dgvThongTinPhuCap.Rows[rowAdd].Cells[0].Value = pc.MaPC;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[1].Value = pc.TenPhuCap;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[2].Value = pc.TienPhuCap;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[3].Value = phuCapBUS.TongSoLuongNhanVienTrongPhongBan(pc.MaPC).ToString();
            }
        }
        private void LoadPhuCapTimKiem(string timKiem)
        {            
            dgvThongTinPhuCap.Rows.Clear();
            danhSachPhuCapTimKiem = phuCapBUS.SearchPhuCap(timKiem);
            int rowAdd;
            foreach (var pc in danhSachPhuCapTimKiem)
            {
                rowAdd = dgvThongTinPhuCap.Rows.Add();
                dgvThongTinPhuCap.Rows[rowAdd].Cells[0].Value = pc.MaPC;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[1].Value = pc.TenPhuCap;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[2].Value = pc.TienPhuCap;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[3].Value = phuCapBUS.TongSoLuongNhanVienTrongPhongBan(pc.MaPC).ToString();
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaPC.Text = string.Empty;
            txtTenPC.Text = string.Empty;
            txtSoTien.Text = string.Empty;
            txtSoLuongNhanVien.Text = string.Empty;
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmQuanLyPhuCap(maNV));
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
        ////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaPC.Text) && string.IsNullOrEmpty(txtTenPC.Text) && string.IsNullOrEmpty(txtSoTien.Text) ||
               string.IsNullOrEmpty(txtTenPC.Text) && string.IsNullOrEmpty(txtSoTien.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrEmpty(txtMaPC.Text) && !string.IsNullOrEmpty(txtTenPC.Text) && !string.IsNullOrEmpty(txtSoTien.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrEmpty(txtMaPC.Text) && !string.IsNullOrEmpty(txtTenPC.Text) && !string.IsNullOrEmpty(txtSoTien.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        private void txtSoTien_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            PhuCap newPhuCap = new PhuCap
            {
                MaPC = "1",
                TenPhuCap = txtTenPC.Text,
                TienPhuCap = decimal.Parse(txtSoTien.Text)
            };
            phuCapBUS.Save(newPhuCap);
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            PhuCap newPhuCap = new PhuCap
            {
                MaPC = txtMaPC.Text,
                TenPhuCap = txtTenPC.Text,
                TienPhuCap = decimal.Parse(txtSoTien.Text)
            };
            phuCapBUS.Save(newPhuCap);
            ClearAllText();
            LoadPhuCap();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            PhuCap phuCap = new PhuCap();
            phuCap.MaPC = txtMaPC.Text;
            phuCapBUS.Delete(phuCap);
            ClearAllText();
            LoadPhuCap();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinPhuCap_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaPC.Text = dgvThongTinPhuCap.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenPC.Text = dgvThongTinPhuCap.Rows[rowIndex].Cells[1].Value.ToString();
            txtSoTien.Text = dgvThongTinPhuCap.Rows[rowIndex].Cells[2].Value.ToString();
            txtSoLuongNhanVien.Text = dgvThongTinPhuCap.Rows[rowIndex].Cells[3].Value.ToString();
        }
       
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadPhuCap();      
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadPhuCapTimKiem(txtTimKiem.Text);
        }
    }
}