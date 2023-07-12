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
    public partial class FrmPhieuThuong : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly PhieuThuongBus phieuThuongBus;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<PhieuThuongViewModels> danhSachPhieuThuong;
        private IEnumerable<PhieuThuongViewModels> danhSachPhieuThuongTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        public FrmPhieuThuong(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phieuThuongBus = new PhieuThuongBus();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            this.maNV = maNV;
        }
        private void FrmPhieuThuong_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            LoadPhieuThuong();
            ChiTietPhieuThuongButton();
            txtMaNV.ReadOnly = txtMaPT.ReadOnly = txtTongTien.ReadOnly = true;
            dtpNgayLapPhieu.Enabled = false;
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
        public void LoadPhieuThuong()
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachPhieuThuong = phieuThuongBus.GetAllPhieuThuong();
            int rowAdd;
            foreach(var pt in danhSachPhieuThuong)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = pt.MaPT;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = pt.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = pt.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = pt.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = pt.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = pt.NgayLap;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = phieuThuongBus.TongTienPhieuThuong(pt.MaPT);
            }
        }
        public void LoadPhieuThuongTimKiem(string timKiem)
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachPhieuThuongTimKiem = phieuThuongBus.SearchPhieuThuongPhieuThuong(timKiem);
            int rowAdd;
            foreach (var pt in danhSachPhieuThuongTimKiem)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = pt.MaPT;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = pt.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = pt.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = pt.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = pt.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = pt.NgayLap;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = phieuThuongBus.TongTienPhieuThuong(pt.MaPT);
            }
        }
        //////////////////////////////////////////////////////////////////////////////
        public void ChiTietPhieuThuongButton()
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
                dgvThongTinPhieuThuong.Columns.Add(btnChiTiet);                 
            }
        }
        private void OpenChiTietPhieuThuong(string maNV, string maPT)
        {
            FrmChiTietPhieuThuong frmOpen = new FrmChiTietPhieuThuong(maNV,maPT);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        public void ClearAllText()
        {
            txtMaPT.Text = string.Empty;
            txtMaNV.Text = string.Empty;
            txtTongTien.Text = string.Empty;
        }
        //////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmPhieuThuong(maNV));
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
        //////////////////////////////////////////////////////////////////////////////
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadPhieuThuong();
        }
        private void txtMaPT_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaPT.Text))
                btnXoa.Enabled = false;
            else
                btnXoa.Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            PhieuThuong newPhieuThuong = new PhieuThuong
            {
                MaPT = "",
                MaNV = maNV,
                NgayLap = DateTime.Now,
            };
            if (phieuThuongBus.Save(newPhieuThuong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + "thêm phiếu thưởng",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }

            ClearAllText();

        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void dgvThongTinPhieuThuong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaPT.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[0].Value.ToString();
            txtMaNV.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[1].Value.ToString();
            dtpNgayLapPhieu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[5].Value.ToString();
            txtTongTien.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[6].Value.ToString();
            if (e.ColumnIndex == 7)
                OpenChiTietPhieuThuong(maNV,dgvThongTinPhieuThuong.Rows[rowIndex].Cells[0].Value.ToString());
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadPhieuThuongTimKiem(txtTimKiem.Text);
            }
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            PhieuThuong phieuThuong = new PhieuThuong()
            {
                MaPT = txtMaPT.Text,
            };
            if (phieuThuongBus.Delete(phieuThuong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " xoá phiếu thưởng '" + txtMaPT.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            ClearAllText();
            LoadPhieuThuong();
        }
    }
}
