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
    public partial class FrmChiTietPhieu : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly PhieuBUS phieuBUS;
        private readonly ChiTietPhieuBUS chiTietPhieuBus;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<ChiTietPhieuViewModels> danhSachChiTietPhieu;
        private IEnumerable<ChiTietPhieuViewModels> danhSachChiTietPhieuTimKiem;
        private IEnumerable<ChiTietPhieu> ctp;
        private readonly NhanVien nv;
        private readonly Phieu phieu;
        private string maNV_Chon;
        private readonly string maNV;
        private readonly string maP;
        public FrmChiTietPhieu(string maNV, string maP)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            phieuBUS = new PhieuBUS();
            chiTietPhieuBus = new ChiTietPhieuBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            phieu = phieuBUS.ThongTinPhieu(maP);
            this.maNV = maNV;
            this.maP = maP;
        }
        private void FrmChiTietPhieuThuong_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            ctp = chiTietPhieuBus.ThongTinChiTietPhieu(maP);
            LoadThongTinDangNhap();
            LoadThongTinPhieuThuong();
            LoadChiTietPhieuThuong();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            txtMaP.ReadOnly = txtMaNV.ReadOnly = txtHoTenTT.ReadOnly = txtPhongBan.ReadOnly = txtChucVu.ReadOnly = txtHoTenNV.ReadOnly = txtTongTien.ReadOnly = txtLoaiPhieu.ReadOnly = true;
            dtpNgayLapPhieu.Enabled = false;
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = false;
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBUS.GetPhongBan();
        }
        public void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVuTheoPhongBan(maPB);
        }
        public void LoadNhanVienTheoChucVu(string maCV)
        {
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVienChucVu(maCV).ToList();
            foreach (var pt in ctp)
                nhanVienList = nhanVienList.Where(nv => nv.MaNV != pt.MaNV).ToList();
            cmbNhanVien.DataSource = nhanVienList;
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbNhanVien.Text) && string.IsNullOrEmpty(maNV_Chon))
            {
                txtHoTenNV.Text = string.Empty;
            }
            else
                txtTienThuong.Text = string.Empty;
        }
        private void LoadNhanVien(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
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
        public void LoadThongTinPhieuThuong()
        {
            txtMaP.Text = phieu.MaP;
            txtLoaiPhieu.Text = phieu.LoaiPhieu.TenLoaiPhieu;
            txtMaNV.Text = phieu.MaNV;
            txtHoTenTT.Text = phieu.NhanVien.Ho + " " + phieu.NhanVien.TenLot + " " + phieu.NhanVien.Ten;
            txtPhongBan.Text = phieu.NhanVien.ChucVu.PhongBan.TenPhongBan;
            txtChucVu.Text = phieu.NhanVien.ChucVu.TenChucVu;
            dtpNgayLapPhieu.Text = phieu.NgayLap.ToString();
            txtTongTien.Text = chiTietPhieuBus.TongTienPhieu(maP).ToString();
        }
        public void LoadChiTietPhieuThuong()
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieu = chiTietPhieuBus.GetAllChiTietPhieu(maP);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhieu)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = phieu.MaP;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = phieu.TenLoaiPhieu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = phieu.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = phieu.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = phieu.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = phieu.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = phieu.SoTien;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[7].Value = phieu.GhiChu;
            }
        }
        public void LoadChiTietPhieuThuongTimKiem(string timKiem)
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieuTimKiem = chiTietPhieuBus.SearchChiTietPhieu(maP, timKiem);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhieuTimKiem)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = phieu.MaP;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = phieu.TenLoaiPhieu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = phieu.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = phieu.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = phieu.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = phieu.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = phieu.SoTien;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[7].Value = phieu.GhiChu;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            NhanVien nv = nhanVienBUS.ThongTinNhanVien(cmbNhanVien.SelectedValue.ToString());
            txtHoTenNV.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
        }
        private void EnableButton()
        {

            if (string.IsNullOrEmpty(cmbNhanVien.Text) && string.IsNullOrEmpty(txtTienThuong.Text) || string.IsNullOrEmpty(txtTienThuong.Text))
            {
                btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(cmbNhanVien.Text) && !string.IsNullOrEmpty(txtTienThuong.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = btnXoa.Enabled = false;
                return;
            }
            if (string.IsNullOrEmpty(cmbNhanVien.Text) && !string.IsNullOrEmpty(txtTienThuong.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = btnXoa.Enabled = true;
                return;
            }
        }
        private void BatTatBut(object sender, EventArgs e)
        {
            EnableButton();
        }
        private void dgvThongTinPhieuThuong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            cmbNhanVien.Text = string.Empty;
            if (rowIndex < 0)
                return;
            maNV_Chon = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[2].Value.ToString();
            txtHoTenNV.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[3].Value.ToString();
            cmbPhongBan.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[4].Value.ToString();
            cmbChucVu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[5].Value.ToString();
            txtTienThuong.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[6].Value.ToString();
            if (dgvThongTinPhieuThuong.Rows[rowIndex].Cells[6].Value is null)
                rtxtGhiChu.Text = string.Empty;
            else
                rtxtGhiChu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[7].Value.ToString();
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            cmbPhongBan.SelectedIndex = 0;
            cmbChucVu.SelectedIndex = 0;
            txtTienThuong.Text = string.Empty;
            txtHoTenNV.Text = string.Empty;
            rtxtGhiChu.Text = string.Empty;
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmChiTietPhieu(maNV, maP));
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
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void txtTienThuong_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
            {
                e.Handled = true;
            }
            if (e.KeyChar == '-' && (sender as TextBox).Text.Length > 0)
            {
                e.Handled = true;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
            {
                MaP = maP,                
                MaNV = cmbNhanVien.SelectedValue.ToString(),
                SoTien = decimal.Parse(txtTienThuong.Text),
                GhiChu = rtxtGhiChu.Text,
            };
            if (chiTietPhieuBus.Save(newChiTietPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm nhân viên " + cmbNhanVien.SelectedValue.ToString() + " vào " + txtLoaiPhieu.Text.ToLower() + " "  + maP,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
            {
                MaP = maP,
                MaNV = maNV_Chon,
                SoTien = decimal.Parse(txtTienThuong.Text),
                GhiChu = rtxtGhiChu.Text,
            };
            if (chiTietPhieuBus.Save(newChiTietPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " sửa nhân viên " + maNV_Chon + " trong " + txtLoaiPhieu.Text.ToLower() + " " + maP,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            FrmChiTietPhieuThuong_Load(sender, e);
            ClearAllText();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            ChiTietPhieu newChiTietPhieu = new ChiTietPhieu
            {
                MaNV = maNV_Chon,
            };
            if (chiTietPhieuBus.Delete(newChiTietPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " xoá nhân viên " + maNV_Chon + " trong " + txtLoaiPhieu.Text.ToLower() + " " + maP,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            FrmChiTietPhieuThuong_Load(sender, e);
            ClearAllText();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadChiTietPhieuThuong();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadChiTietPhieuThuongTimKiem(txtTimKiem.Text);
            }

        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
