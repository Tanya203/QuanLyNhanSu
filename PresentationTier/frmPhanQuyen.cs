﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmPhanQuyen : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuyenHanBUS quyenHanBUS;
        private readonly QuanLyChucVuBUS chucVuBUS;        
        private readonly PhanQuyenBUS phanQuyenBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private IEnumerable<PhanQuyenViewModels> danhSachPhanQuyen;
        private IEnumerable<PhanQuyenViewModels> danhSachPhanQuyenTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private string loc;
        private int check;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmPhanQuyen(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            quyenHanBUS = new QuyenHanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            MessageBoxManager.Register_OnceOnly();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Phân quyền").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            check = 0;
            checkThaoTac = false;
        }
        private void FrmPhanQuyen_Load(object sender, EventArgs e)
        {
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbQuyenHan.DisplayMember = "TenQuyenHan";
            cmbQuyenHan.ValueMember = "MaQH";
            LoadThongTinDangNhap();           
            LoadChucVu();
            LoadQuyenHan();
            PhanQuyen();
            rbLocTheoChucVu.Checked = true;
        }
        private void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        private void PhanQuyen()
        {
            foreach (PhanQuyen qh in phanQuyen)
            {
                if (qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    checkThaoTac = true;
                    continue;
                }
            }
        }
        private void LoadDanhSachPhanQuyen()
        {
            if (rbLocTheoChucVu.Checked)
                loc = cmbChucVu.SelectedValue.ToString();
            if(rbLocQuyenHan.Checked)
                loc = cmbQuyenHan.SelectedValue.ToString();
            Enabled = false;
            dgvPhanQuyen.Rows.Clear();
            danhSachPhanQuyen = phanQuyenBUS.GetAllPhanQuyen(loc);
            int rowAdd;
            foreach (PhanQuyenViewModels ph in danhSachPhanQuyen)
            {
                rowAdd = dgvPhanQuyen.Rows.Add();
                dgvPhanQuyen.Rows[rowAdd].Cells[0].Value = ph.MaQH;
                dgvPhanQuyen.Rows[rowAdd].Cells[1].Value = ph.MaCV;
                dgvPhanQuyen.Rows[rowAdd].Cells[2].Value = ph.TenChucVu;
                dgvPhanQuyen.Rows[rowAdd].Cells[3].Value = ph.GiaoDien;
                dgvPhanQuyen.Rows[rowAdd].Cells[4].Value = ph.TenQuyenHan;
                dgvPhanQuyen.Rows[rowAdd].Cells[5].Value = ph.CapQuyen;
            }
            Enabled = true;
        }
        private void LoadDanhSachPhanQuyenTimKiem(string timKiem)
        {
            if (rbLocTheoChucVu.Checked)
                loc = cmbChucVu.SelectedValue.ToString();
            if (rbLocQuyenHan.Checked)
                loc = cmbQuyenHan.SelectedValue.ToString();
            Enabled = false;
            dgvPhanQuyen.Rows.Clear();
            danhSachPhanQuyenTimKiem = phanQuyenBUS.GetAllPhanQuyenTimKiem(loc, timKiem);
            int rowAdd;
            foreach (PhanQuyenViewModels ph in danhSachPhanQuyenTimKiem)
            {
                rowAdd = dgvPhanQuyen.Rows.Add();
                dgvPhanQuyen.Rows[rowAdd].Cells[0].Value = ph.MaQH;
                dgvPhanQuyen.Rows[rowAdd].Cells[1].Value = ph.MaCV;
                dgvPhanQuyen.Rows[rowAdd].Cells[2].Value = ph.TenChucVu;
                dgvPhanQuyen.Rows[rowAdd].Cells[3].Value = ph.GiaoDien;
                dgvPhanQuyen.Rows[rowAdd].Cells[4].Value = ph.TenQuyenHan;
                dgvPhanQuyen.Rows[rowAdd].Cells[5].Value = ph.CapQuyen;
            }
            Enabled = true;
        }
        private void LoadChucVu()
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVu();
            AutoAdjustComboBox(cmbChucVu);
        }
        private void LoadQuyenHan()
        {
            cmbQuyenHan.DataSource = quyenHanBUS.GetQuyenHans();
            AutoAdjustComboBox(cmbQuyenHan);
        }
        private void AutoAdjustComboBox(ComboBox comboBox)
        {
            int maxWidth = 0;
            foreach (var items in comboBox.Items)
            {
                int itemWidth = TextRenderer.MeasureText(comboBox.GetItemText(items), comboBox.Font).Width;
                maxWidth = Math.Max(maxWidth, itemWidth);
            }
            comboBox.DropDownWidth = maxWidth + SystemInformation.VerticalScrollBarWidth;
        }
        /////////////////////////////////////////////////////////////////////////////////////////    
        private void rbLocTheoChucVu_CheckedChanged(object sender, EventArgs e)
        {
            if (rbLocTheoChucVu.Checked)
            {
                cmbChucVu.Enabled = true;
                cmbQuyenHan.Enabled = false;
                LoadDanhSachPhanQuyen();
                return;
            }
        }
        private void rbLocQuyenHan_CheckedChanged(object sender, EventArgs e)
        {
            if (rbLocQuyenHan.Checked)
            {
                cmbQuyenHan.Enabled = true;
                cmbChucVu.Enabled = false;
                LoadDanhSachPhanQuyen();
                return;
            }
        } 
        private void cmbGiaoDien_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (check != 2)
            {
                check++;
                return;
            }
            else
            {
                LoadDanhSachPhanQuyen();
            }
        }

        /////////////////////////////////////////////////////////////////////////////////////////        
        private void Reload()
        {
            FrmPhanQuyen frmOpen = new FrmPhanQuyen(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac, string maTT)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = this.maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private void ErrorMessage(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
                MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private void CapNhatQuyenHan(string maCV, string maQH, bool capQuyen, string thaoTac, string maTT)
        {
            try
            {
                PhanQuyen capNhat = new PhanQuyen
                {
                    MaCV = maCV,
                    MaQH = maQH,
                    CapQuyen = capQuyen,
                };
                if (phanQuyenBUS.Save(capNhat))
                {
                    LichSuThaoTac(thaoTac, maTT);
                }
                if (string.IsNullOrEmpty(txtTimKiem.Text))
                    LoadDanhSachPhanQuyen();
                else
                    LoadDanhSachPhanQuyenTimKiem(txtTimKiem.Text);
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
        }          
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void dgvPhanQuyen_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            int column = e.ColumnIndex;
            if (row < 0)
                return;
            else if (checkThaoTac)
            {
                if (column == 5)
                {
                    string maQH = dgvPhanQuyen.Rows[row].Cells[0].Value.ToString();
                    string maCV = dgvPhanQuyen.Rows[row].Cells[1].Value.ToString();
                    string tenQuyenHan = dgvPhanQuyen.Rows[row].Cells[4].Value.ToString();
                    string tenChucVu = dgvPhanQuyen.Rows[row].Cells[2].Value.ToString();
                    bool capQuyen = (bool)dgvPhanQuyen.Rows[row].Cells[5].Value;
                    string thongBao;
                    string maTT;
                    string thaoTac;
                    if (capQuyen)
                    {
                        capQuyen = false;
                        thongBao = $"Xác nhận xoá quyền hạn {tenQuyenHan} của chức vụ {tenChucVu}?";
                        maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                        thaoTac = $"Xoá quyền hạn {tenQuyenHan} của chức vụ {tenChucVu}";
                    }
                    else
                    {
                        capQuyen = true;
                        thongBao = $"Xác nhận thêm quyền hạn {tenQuyenHan} cho chức vụ {tenChucVu}?";
                        maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                        thaoTac = $"Thêm quyền hạn {tenQuyenHan} cho chức vụ {tenChucVu}";
                    }
                    MessageBoxManager.Yes = "Có";
                    MessageBoxManager.No = "Không";
                    DialogResult ketQua = MessageBox.Show(thongBao, "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                        CapNhatQuyenHan(maCV, maQH, capQuyen, thaoTac, maTT);
                    else
                        return;
                }
            }
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadDanhSachPhanQuyenTimKiem(txtTimKiem.Text);
            }
        }

        
    }
}
