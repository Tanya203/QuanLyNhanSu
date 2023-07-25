using QuanLyNhanSu.DataTier.Models;
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
    public partial class FrmQuanLyLoaiPhieu : Form
    {
        private Thread currentForm;
        private readonly QuanLyLoaiPhieuBUS loaiPhieuBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<LoaiPhieuViewModels> danhSachLoaiPhieu;
        private IEnumerable<LoaiPhieuViewModels> danhSachLoaiPhieuTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string hoTen;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiPhieu(string maNV)
        {
            InitializeComponent();
            loaiPhieuBUS = new QuanLyLoaiPhieuBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();            
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            hoTen = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            this.maNV = maNV;
        }
        private void FrmQuanLyLoaiPhieu_Load(object sender, EventArgs e)
        {
            LoadLoaiPhieu();
            LoadThongTinDangNhap();
            txtMaLP.ReadOnly = true;
            txtSoLuongPhieuLap.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
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
        private void LoadLoaiPhieu()
        {
            dgvThongTinLoaiPhieu.Rows.Clear();
            danhSachLoaiPhieu = loaiPhieuBUS.GetAllLoaiPhieu();
            int rowAdd;
            foreach (var lp in danhSachLoaiPhieu)
            {
                rowAdd = dgvThongTinLoaiPhieu.Rows.Add();
                dgvThongTinLoaiPhieu.Rows[rowAdd].Cells[0].Value = lp.MaLP;
                dgvThongTinLoaiPhieu.Rows[rowAdd].Cells[1].Value = lp.TenLoaiPhieu;
                dgvThongTinLoaiPhieu.Rows[rowAdd].Cells[2].Value = loaiPhieuBUS.SoLuongPhieuLap(lp.MaLP).ToString();
            }
        }
        private void LoadLoaiPhieuTimKiem(string timKiem)
        {
            dgvThongTinLoaiPhieu.Rows.Clear();
            danhSachLoaiPhieuTimKiem = loaiPhieuBUS.SearchLoaiPhieu(timKiem);
            int rowAdd;
            foreach (var lp in danhSachLoaiPhieuTimKiem)
            {
                rowAdd = dgvThongTinLoaiPhieu.Rows.Add();
                dgvThongTinLoaiPhieu.Rows[rowAdd].Cells[0].Value = lp.MaLP;
                dgvThongTinLoaiPhieu.Rows[rowAdd].Cells[1].Value = lp.TenLoaiPhieu;
                dgvThongTinLoaiPhieu.Rows[rowAdd].Cells[2].Value = loaiPhieuBUS.SoLuongPhieuLap(lp.MaLP).ToString();
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaLP.Text = string.Empty;
            txtTenLoaiPhieu.Text = string.Empty;
            txtSoLuongPhieuLap.Text = string.Empty;
        }
        /////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmQuanLyLoaiPhieu(maNV));
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
        //////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButton(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaLP.Text) && string.IsNullOrEmpty(txtTenLoaiPhieu.Text) || string.IsNullOrEmpty(txtTenLoaiPhieu.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
            }
            if (string.IsNullOrEmpty(txtMaLP.Text) && !string.IsNullOrEmpty(txtTenLoaiPhieu.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
            }
            if (!string.IsNullOrEmpty(txtMaLP.Text) && !string.IsNullOrEmpty(txtTenLoaiPhieu.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
            }
        }
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadLoaiPhieu();
        }
        //////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiPhieu newLoaiPhieu = new LoaiPhieu
            {
                MaLP = "",
                TenLoaiPhieu = txtTenLoaiPhieu.Text,   
            };
            if (loaiPhieuBUS.Save(newLoaiPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " thêm loại phiếu '" + txtTenLoaiPhieu.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            LoaiPhieu newLoaiPhieu = new LoaiPhieu
            {
                MaLP = txtMaLP.Text,
                TenLoaiPhieu = txtTenLoaiPhieu.Text,
            };
            if (loaiPhieuBUS.Save(newLoaiPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " chỉnh sửa loại phiếu " + txtMaLP.Text,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiPhieu newLoaiPhieu = new LoaiPhieu
            {
                MaLP = txtMaLP.Text
            };
            if (loaiPhieuBUS.Delete(newLoaiPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " xoá loại phiếu " + txtTenLoaiPhieu.Text,
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
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinLoaiPhieu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLP.Text = dgvThongTinLoaiPhieu.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLoaiPhieu.Text = dgvThongTinLoaiPhieu.Rows[rowIndex].Cells[1].Value.ToString();
            txtSoLuongPhieuLap.Text = dgvThongTinLoaiPhieu.Rows[rowIndex].Cells[2].Value.ToString();
        }       
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiPhieuTimKiem(txtTimKiem.Text);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
