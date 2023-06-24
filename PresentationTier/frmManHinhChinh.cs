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
        public FrmManHinhChinh()
        {   
            InitializeComponent();
          
        }
        private void frmManHinhChinh_Load(object sender, EventArgs e)
        {
            /*lblHoTenNV =;
            lblMaNV = ;
            lblPhongBanNV = ;
            lblChucVuNV = ;
            lblSoNgayPhepConNV = ;
            dtpLichLamViec = ;
            pbAnhNV = ;*/
        }       
        private void btnQLNV_Click(object sender, EventArgs e)
        {
            FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }      
        private void btnQLPB_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhongBan frmOpen = new FrmQuanLyPhongBan();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLCV_Click(object sender, EventArgs e)
        {
            FrmQuanLyChucVu frmOpen = new FrmQuanLyChucVu();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLC_Click(object sender, EventArgs e)
        {
            FrmQuanLyCa frmOpen = new FrmQuanLyCa();
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
            FrmLichLamViec frmOpen = new FrmLichLamViec();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPC_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhuCap frmOpen = new FrmQuanLyPhuCap();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPT_Click(object sender, EventArgs e)
        {
            FrmPhieuThuong frmOpen = new FrmPhieuThuong();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPP_Click(object sender, EventArgs e)
        {
            FrmPhieuPhat frmOpen = new FrmPhieuPhat();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLTK_Click(object sender, EventArgs e)
        {
            FrmThongKeLuong frmOpen = new FrmThongKeLuong();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLLHD_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiHopDong frmOpen = new FrmQuanLyLoaiHopDong();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnQLPQ_Click(object sender, EventArgs e)
        {
            FrmPhanQuyen frmOpen = new FrmPhanQuyen();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnLSTT_Click(object sender, EventArgs e)
        {
            FrmLichSuThaoTac frmOpen = new FrmLichSuThaoTac();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnTTTK_Click(object sender, EventArgs e)
        {
            FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan();
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
