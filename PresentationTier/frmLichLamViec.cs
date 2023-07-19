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
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";

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
            XoaButton();
            ChiTietButton();
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
            if(maCa != null)
            {
                Ca ca = quanLyCaBUS.ThongTinCa(maCa);
                txtMaCa.Text = ca.MaCa;
                txtTenCa.Text = ca.TenCa;
                txtGioBatDau.Text = ca.GioBatDau.ToString();
                txtGioKetThuc.Text = ca.GioKetThuc.ToString();
            }            
        }
        public void LoadCa(string ngayLam)
        {
            List<LichLamViec> locLich = lichLamViecBUS.LocLichTheoNgay(maPB, ngayLam).ToList();
            List<Ca> ca = quanLyCaBUS.GetCa().ToList();
            foreach(var c in locLich)
                ca = ca.Where(x => x.MaCa != c.MaCa).ToList();
            cmbCa.DataSource = ca;
            if(string.IsNullOrEmpty(cmbCa.Text))
            {
                cmbCa.Enabled = false;
                btnThem.Enabled = false;
                txtMaCa.Text = string.Empty;
                txtTenCa.Text = string.Empty;
                txtGioBatDau.Text = string.Empty;
                txtGioKetThuc.Text = string.Empty;
            }
            else
            {
                Ca thongTinca = quanLyCaBUS.ThongTinCa(cmbCa.SelectedValue.ToString());
                txtMaCa.Text = thongTinca.MaCa;
                txtTenCa.Text = thongTinca.TenCa;
                txtGioBatDau.Text = thongTinca.GioBatDau.ToString();
                txtGioKetThuc.Text = thongTinca.GioKetThuc.ToString();
                cmbCa.Enabled = true;
                btnThem.Enabled = true;
            }
        }
        public void LoadLoaiCa()
        {
            cmbLoaiCa.DataSource = quanLyLoaiCaBUS.GetLoaiCa();
        }
        private void dtpNgayLam_ValueChanged(object sender, EventArgs e)
        {
            LoadCa(dtpNgayLam.Text);
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
        public void ChiTietButton()
        {
            DataGridViewButtonColumn btnChiTiet = new DataGridViewButtonColumn();
            {
                btnChiTiet.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnChiTiet.Text = "Chi tiết";
                btnChiTiet.UseColumnTextForButtonValue = true;
                btnChiTiet.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnChiTiet.DefaultCellStyle = buttonCellStyle;
                dgvThongTinLichLamViec.Columns.Add(btnChiTiet);
            }
        }
        public void XoaButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Xoá";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvThongTinLichLamViec.Columns.Add(btnXoa);
            }
        }
        private void OpenChiTietLichLamViec(string maNV, string maLLV)
        {
            FrmChiTietLichLamViec frmOpen = new FrmChiTietLichLamViec(maNV, maLLV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void XoaLichLamViec(string maLLV, string phongBan, string ngayLam, string ca, string loaiCa)
        {
            LichLamViec lichLamViec = new LichLamViec
            {
                MaLLV = maLLV,
            };
            if (lichLamViecBUS.Delete(lichLamViec))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " xoá lịch ngày " + ngayLam + " - Ca " + ca + " - Loại ca " + loaiCa + " - Phòng ban " + phongBan,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            LichLamViec lichLamViec = new LichLamViec
            {
                MaLLV = "",
                MaNV = maNV,
                MaCa = cmbCa.SelectedValue.ToString(),
                MaLC = cmbLoaiCa.SelectedValue.ToString(),
                NgayLam = dtpNgayLam.Value,
            };
            if (lichLamViecBUS.Save(lichLamViec))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm lịch ngày " + lichLamViec.NgayLam.ToString(formatDate) + " - Ca " + cmbCa.Text + " - Loại ca " + cmbLoaiCa.Text + " - Phòng ban " + nv.ChucVu.PhongBan.TenPhongBan,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            Reload();
        }
        private void dgvThongTinLichLamViec_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            string maLLV = dgvThongTinLichLamViec.Rows[rowIndex].Cells[0].Value.ToString();
            string phongBan = dgvThongTinLichLamViec.Rows[rowIndex].Cells[3].Value.ToString();
            string ngayLam = dgvThongTinLichLamViec.Rows[rowIndex].Cells[5].Value.ToString();
            string ca = dgvThongTinLichLamViec.Rows[rowIndex].Cells[6].Value.ToString();
            string loaiCa = dgvThongTinLichLamViec.Rows[rowIndex].Cells[7].Value.ToString();
            if (rowIndex < 0)
                return;
            if (e.ColumnIndex == 8)                           
                XoaLichLamViec(maLLV, phongBan, ngayLam, ca, loaiCa);                                                                  
            if (e.ColumnIndex == 9)           
                OpenChiTietLichLamViec(maNV, maLLV);
            
                
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

        private void cmbCa_TextChanged(object sender, EventArgs e)
        {
            Ca ca = quanLyCaBUS.ThongTinCa(cmbCa.SelectedValue.ToString());
            txtMaCa.Text = ca.MaCa;
            txtTenCa.Text = ca.TenCa;
            txtGioBatDau.Text = ca.GioBatDau.ToString();
            txtGioKetThuc.Text = ca.GioKetThuc.ToString();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadLichLamViec();
        }

        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadLichLamViecTimKiem(txtTimKiem.Text);
            }
        }
    }
}
