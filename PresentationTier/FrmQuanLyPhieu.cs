using Eco.Persistence;
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
using System.Web;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhieu : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly PhieuBUS phieuBus;
        private readonly ChiTietPhieuBUS chiTietPhieuBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly QuanLyLoaiPhieuBUS quanLyLoaiPhieuBUS;
        private IEnumerable<PhieuViewModels> danhSachPhieuThuong;
        private IEnumerable<PhieuViewModels> danhSachPhieuThuongTimKiem;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string hoTen;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyPhieu(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phieuBus = new PhieuBUS();
            chiTietPhieuBUS = new ChiTietPhieuBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            quanLyLoaiPhieuBUS = new QuanLyLoaiPhieuBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            hoTen = nv.Ho + " " + nv.TenLot + " " + nv.Ten; ;
            this.maNV = maNV;
        }
        private void FrmPhieuThuong_Load(object sender, EventArgs e)
        {
            cmbLoaiPhieu.DisplayMember = "TenLoaiPhieu";
            cmbLoaiPhieu.ValueMember = "MaLP";
            LoadThongTinDangNhap();
            LoadPhieuThuong();
            XoaButton();
            ChiTietPhieuThuongButton();
            LoadLoaiPhieu();  
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
            dgvThongTinPhieu.Rows.Clear();
            danhSachPhieuThuong = phieuBus.GetAllPhieu();
            int rowAdd;
            foreach(var pt in danhSachPhieuThuong)
            {
                rowAdd = dgvThongTinPhieu.Rows.Add();
                dgvThongTinPhieu.Rows[rowAdd].Cells[0].Value = pt.MaP;
                dgvThongTinPhieu.Rows[rowAdd].Cells[1].Value = pt.TenLoaiPhieu;
                dgvThongTinPhieu.Rows[rowAdd].Cells[2].Value = pt.MaNV;
                dgvThongTinPhieu.Rows[rowAdd].Cells[3].Value = pt.HoTen;
                dgvThongTinPhieu.Rows[rowAdd].Cells[4].Value = pt.PhongBan;
                dgvThongTinPhieu.Rows[rowAdd].Cells[5].Value = pt.ChucVu;
                dgvThongTinPhieu.Rows[rowAdd].Cells[6].Value = pt.NgayLap.ToString(formatDate);
                dgvThongTinPhieu.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhieuBUS.TongTienPhieu(pt.MaP));
            }
        }
        public void LoadLoaiPhieu()
        {
            cmbLoaiPhieu.DataSource = quanLyLoaiPhieuBUS.GetLoaiPhieu();
        }
        public void LoadPhieuThuongTimKiem(string timKiem)
        {
            dgvThongTinPhieu.Rows.Clear();
            danhSachPhieuThuongTimKiem = phieuBus.SearchPhieu(timKiem);
            int rowAdd;
            foreach (var pt in danhSachPhieuThuongTimKiem)
            {
                rowAdd = dgvThongTinPhieu.Rows.Add();
                dgvThongTinPhieu.Rows[rowAdd].Cells[0].Value = pt.MaP;
                dgvThongTinPhieu.Rows[rowAdd].Cells[1].Value = pt.TenLoaiPhieu;
                dgvThongTinPhieu.Rows[rowAdd].Cells[2].Value = pt.MaNV;
                dgvThongTinPhieu.Rows[rowAdd].Cells[3].Value = pt.HoTen;
                dgvThongTinPhieu.Rows[rowAdd].Cells[4].Value = pt.PhongBan;
                dgvThongTinPhieu.Rows[rowAdd].Cells[5].Value = pt.ChucVu;
                dgvThongTinPhieu.Rows[rowAdd].Cells[6].Value = pt.NgayLap.ToString(formatDate);
                dgvThongTinPhieu.Rows[rowAdd].Cells[7].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhieuBUS.TongTienPhieu(pt.MaP));
                
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
                dgvThongTinPhieu.Columns.Add(btnChiTiet);                 
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
                dgvThongTinPhieu.Columns.Add(btnXoa);
            }
        }
        private void OpenChiTietPhieuThuong(string maNV, string maPT)
        {
            FrmChiTietPhieu frmOpen = new FrmChiTietPhieu(maNV,maPT);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void XoaPhieuThuong(string maP, string loaiPhieu)
        {
            Phieu phieu = new Phieu()
            {
                MaP = maP,
            };
            if (phieuBus.Delete(phieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " xoá " + loaiPhieu + " " + maP,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
        }
        //////////////////////////////////////////////////////////////////////////////
        public void Reload()
        {
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
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
        //////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            Phieu newPhieu = new Phieu
            {
                MaP = "",
                MaLP = cmbLoaiPhieu.SelectedValue.ToString(),
                MaNV = maNV,
                NgayLap = DateTime.Now,
            };
            if (phieuBus.Save(newPhieu))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " thêm phiếu" + newPhieu.LoaiPhieu.TenLoaiPhieu,
                };
                lichSuThaoTacBUS.Save(newLstt);               
            }
            Reload();            
        }       
        private void dgvThongTinPhieuThuong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            string maP = dgvThongTinPhieu.Rows[rowIndex].Cells[0].Value.ToString();
            string loaiPhieu = dgvThongTinPhieu.Rows[rowIndex].Cells[1].Value.ToString();
            if (rowIndex < 0)
                return;
            if (e.ColumnIndex == 8)
                XoaPhieuThuong(maP, loaiPhieu);
            if (e.ColumnIndex == 9)
                OpenChiTietPhieuThuong(maNV, maP);
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadPhieuThuongTimKiem(txtTimKiem.Text);
            }
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQuanLyLoaiPhieu_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiPhieu frmOpen = new FrmQuanLyLoaiPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
