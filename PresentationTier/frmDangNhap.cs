using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.PresentationTier;
using System;
using System.Data;
using System.Linq;
using System.Threading;
using System.Windows.Forms;

namespace QuanLyNhanSu
{
    public partial class FrmDangNhap : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmDangNhap()
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            btnDangNhap.Enabled = false;
            txtTaiKhoan.Text = "TK001";
            txtMatKhau.Text = "Aa@12345";
        }
        private void FrmDangNhap_Load(object sender, EventArgs e)
        {

        }
        private void llblQuenMatKhau_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FrmQuenMatKhau frmOpen = new FrmQuenMatKhau();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if(nhanVienBUS.LoginVerify(txtTaiKhoan.Text, txtMatKhau.Text))
            {                                 
                NhanVien nv = nhanVienBUS.GetNhanVien().Where(nhanVien => nhanVien.TaiKhoan == txtTaiKhoan.Text).FirstOrDefault();
                string hoTen = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
                string chucVu = nv.ChucVu.TenChucVu;
                string phongban = nv.ChucVu.PhongBan.TenPhongBan;
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = nv.MaNV,
                    ThaoTacThucHien = "Đăng nhập",
                };
                lichSuThaoTacBUS.Save(newLstt);
                FrmManHinhChinh frmOpen = new FrmManHinhChinh(nv.MaNV);
                frmOpen.Show();
                this.Hide();
                frmOpen.FormClosed += CloseForm;
            }            
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void cbHienThiMatKhau_CheckedChanged(object sender, EventArgs e)
        {
            if (cbHienThiMatKhau.Checked == true)            
                txtMatKhau.UseSystemPasswordChar = false;            
            else            
                txtMatKhau.UseSystemPasswordChar = true;            
        }
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTaiKhoan.Text) || string.IsNullOrEmpty(txtMatKhau.Text))
                btnDangNhap.Enabled = false;
            else
                btnDangNhap.Enabled = true;
        }
    }
}
