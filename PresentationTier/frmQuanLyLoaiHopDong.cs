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
    public partial class FrmQuanLyLoaiHopDong : Form
    {
        private Thread currentForm;
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;  
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDong;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDongTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiHopDong(string maNV)
        {
            InitializeComponent();
            this.Load += frmQuanLyLoaiHopDong_Load;
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            txtMaLHD.ReadOnly = true;
            txtSoLuongNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyLoaiHopDong_Load(object sender, EventArgs e)
        {
            LoadLoaiHopDong();
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
        private void LoadLoaiHopDong()
        {
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDong = loaiHopDongBUS.GetAllLoaiHopDong();
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDong)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
        }
        private void LoadLoaiHopDongTimKiem(string timKiem)
        {            
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDongTimKiem = loaiHopDongBUS.SearchLoaiHopDong(timKiem);           
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDongTimKiem)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaLHD.Text = string.Empty;
            txtTenLHD.Text = string.Empty;
            txtSoLuongNhanVien.Text = string.Empty;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmQuanLyLoaiHopDong(maNV));
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaLHD.Text) && string.IsNullOrEmpty(txtTenLHD.Text) || string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrEmpty(txtMaLHD.Text) && !string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrEmpty(txtMaLHD.Text) && !string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = "",
                TenLoaiHopDong = txtTenLHD.Text
            };
            if (loaiHopDongBUS.Save(newLoaiHopDong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm loại hợp đồng '" + txtTenLHD.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            Reload();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text,
                TenLoaiHopDong = txtTenLHD.Text
            };
            if (loaiHopDongBUS.Save(newLoaiHopDong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " chỉnh sửa loại hợp đồng '" + txtMaLHD.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            ClearAllText();
            LoadLoaiHopDong();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiHopDong loaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text
            };
            if (loaiHopDongBUS.Delete(loaiHopDong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm chức vụ '" + txtMaLHD.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            ClearAllText();
            LoadLoaiHopDong();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinLoaiHopDong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[1].Value.ToString();
            txtSoLuongNhanVien.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[2].Value.ToString();
        }           
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadLoaiHopDong();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiHopDongTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
