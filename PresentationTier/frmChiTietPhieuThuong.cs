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
    public partial class FrmChiTietPhieuThuong : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly PhieuThuongBus phieuThuongBus;
        private readonly ChiTietPhieuThuongBUS chiTietPhieuThuongBus;
        private IEnumerable<ChiTietPhieuThuongViewModels> danhSachChiTietPhieuThuong;
        private IEnumerable<ChiTietPhieuThuongViewModels> danhSachChiTietPhieuThuongTimKiem;
        private readonly NhanVien nv;
        private readonly PhieuThuong pt;
        private readonly string maNV;
        private readonly string maPT;
        public FrmChiTietPhieuThuong(string maNV, string maPT)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            phieuThuongBus = new PhieuThuongBus();
            chiTietPhieuThuongBus = new ChiTietPhieuThuongBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            pt = phieuThuongBus.ThongTinPhieuThuong(maPT); 
            this.maNV = maNV;
            this.maPT = maPT;
        }
        private void FrmChiTietPhieuThuong_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            LoadThongTinDangNhap();
            LoadThongTinPhieuThuong();
            LoadChiTietPhieuThuong();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            txtMaPT.ReadOnly = txtMaNV.ReadOnly = txtHoTenTT.ReadOnly = txtPhongBan.ReadOnly = txtChucVu.ReadOnly = txtHoTenNV.ReadOnly = txtTongTien.ReadOnly = true;
            dtpNgayLapPhieu.Enabled = false;
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
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVienChucVu(maCV).Where(nv => nv.MaNV != pt.MaNV).ToList();            
            cmbNhanVien.DataSource = nhanVienList;
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
        }
        private void LoadNhanVien(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            if(string.IsNullOrEmpty(cmbNhanVien.Text))
                cmbNhanVien.Enabled = false;
            else 
                cmbNhanVien.Enabled = true;
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
            txtMaPT.Text = pt.MaPT;
            txtMaNV.Text = pt.MaNV;
            txtHoTenTT.Text = pt.NhanVien.Ho + " " + pt.NhanVien.TenLot + " " + pt.NhanVien.Ten;
            txtPhongBan.Text = pt.NhanVien.ChucVu.PhongBan.TenPhongBan;
            txtChucVu.Text = pt.NhanVien.ChucVu.TenChucVu;
            dtpNgayLapPhieu.Text = pt.NgayLap.ToString();
            txtTongTien.Text = phieuThuongBus.TongTienPhieuThuong(maPT).ToString();
        }
        
        public void LoadChiTietPhieuThuong()
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieuThuong = chiTietPhieuThuongBus.GetAllChiTietPhieuThuong();
            int rowAdd;
            foreach(var pt in danhSachChiTietPhieuThuong)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = pt.MaPT;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = pt.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = pt.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = pt.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = pt.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = pt.TienThuong;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = pt.GhiChu;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmChiTietPhieuThuong(maNV,maPT));
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
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmPhieuThuong frmOpen = new FrmPhieuThuong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        
    }
}
