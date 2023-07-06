using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmManHinhChinh : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly string maNV;
        public FrmManHinhChinh(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            this.maNV = maNV;
        }
        private void frmManHinhChinh_Load(object sender, EventArgs e)
        {            
            LoadThongTinDangNhap();
        }       
        public void LoadThongTinDangNhap()
        {
            NhanVien nv = nhanVienBUS.ThongTinNhanVienDangNhap(maNV);
            lblMaNV.Text = nv.MaNV;
            if(string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV.Text = nv.ChucVu.TenChucVu;
            lblSoNgayPhepConNV.Text = nv.SoNgayPhep.ToString();
        }
        private void btnQLNV_Click(object sender, EventArgs e)
        {
            FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }      
        private void btnQLPB_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhongBan frmOpen = new FrmQuanLyPhongBan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLCV_Click(object sender, EventArgs e)
        {
            FrmQuanLyChucVu frmOpen = new FrmQuanLyChucVu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLC_Click(object sender, EventArgs e)
        {
            FrmQuanLyCa frmOpen = new FrmQuanLyCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLCC_Click(object sender, EventArgs e)
        {
            FrmChiTietLichLamViec frmOpen = new FrmChiTietLichLamViec();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLLLV_Click(object sender, EventArgs e)
        {
            FrmLichLamViec frmOpen = new FrmLichLamViec(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPC_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhuCap frmOpen = new FrmQuanLyPhuCap(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPT_Click(object sender, EventArgs e)
        {
            FrmPhieuThuong frmOpen = new FrmPhieuThuong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPP_Click(object sender, EventArgs e)
        {
            FrmPhieuPhat frmOpen = new FrmPhieuPhat(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLTK_Click(object sender, EventArgs e)
        {
            FrmThongKeLuong frmOpen = new FrmThongKeLuong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLLHD_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiHopDong frmOpen = new FrmQuanLyLoaiHopDong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPQ_Click(object sender, EventArgs e)
        {
            FrmPhanQuyen frmOpen = new FrmPhanQuyen(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnLSTT_Click(object sender, EventArgs e)
        {
            FrmLichSuThaoTac frmOpen = new FrmLichSuThaoTac(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnTTTK_Click(object sender, EventArgs e)
        {
            FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }           
    }
}
