using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhuCap : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyPhuCapBUS phuCapBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<PhuCapViewMModels> danhSachPhuCap;
        private IEnumerable<PhuCapViewMModels> danhSachPhuCapTimKiem;
        private readonly string maNV;
        private readonly string hoTen;
        private readonly NhanVien nv;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyPhuCap(string maNV)
        {
            InitializeComponent();
            this.Load += frmQuanLyPhuCap_Load;
            phuCapBUS = new QuanLyPhuCapBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            hoTen = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
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
            Enabled = false;
            dgvThongTinPhuCap.Rows.Clear();
            danhSachPhuCap = phuCapBUS.GetAllPhuCap();
            int rowAdd;
            foreach (var pc in danhSachPhuCap)
            {
                rowAdd = dgvThongTinPhuCap.Rows.Add();
                dgvThongTinPhuCap.Rows[rowAdd].Cells[0].Value = pc.MaPC;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[1].Value = pc.TenPhuCap;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[2].Value = String.Format(fVND, "{0:N3} ₫", pc.TienPhuCap);
                dgvThongTinPhuCap.Rows[rowAdd].Cells[3].Value = phuCapBUS.TongSoLuongNhanVienTrongPhongBan(pc.MaPC).ToString();
            }
            Enabled = true;
        }
        private void LoadPhuCapTimKiem(string timKiem)
        {
            Enabled = false;
            dgvThongTinPhuCap.Rows.Clear();
            danhSachPhuCapTimKiem = phuCapBUS.SearchPhuCap(timKiem);
            int rowAdd;
            foreach (var pc in danhSachPhuCapTimKiem)
            {
                rowAdd = dgvThongTinPhuCap.Rows.Add();
                dgvThongTinPhuCap.Rows[rowAdd].Cells[0].Value = pc.MaPC;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[1].Value = pc.TenPhuCap;
                dgvThongTinPhuCap.Rows[rowAdd].Cells[2].Value = String.Format(fVND, "{0:N3} ₫", pc.TienPhuCap);
                dgvThongTinPhuCap.Rows[rowAdd].Cells[3].Value = phuCapBUS.TongSoLuongNhanVienTrongPhongBan(pc.MaPC).ToString();
            }
            Enabled = true;
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
        public void Reload()
        {
            FrmQuanLyPhuCap frmOpen = new FrmQuanLyPhuCap(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
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
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
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
            if (phuCapBUS.Save(newPhuCap))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " thêm phụ cấp '" + txtTenPC.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
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
            if (phuCapBUS.Save(newPhuCap))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " chỉnh sửa phụ cấp " + txtMaPC.Text,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            PhuCap phuCap = new PhuCap();
            phuCap.MaPC = txtMaPC.Text;
            if (phuCapBUS.Delete(phuCap))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " xoá phụ cấp " + txtTenPC,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
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
            txtSoTien.Text = phuCapBUS.ThongTinPhuCap(txtMaPC.Text).TienPhuCap.ToString();
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

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
