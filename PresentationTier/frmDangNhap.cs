using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.PresentationTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu
{
    public partial class FrmDangNhap : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;       
        private readonly List<ThaoTac> listThaoTac;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmDangNhap()
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            thaoTacBUS = new ThaoTacBUS();
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.GiaoDien.TenGiaoDien == "Đăng nhập").ToList();
            btnDangNhap.Enabled = false;
            txtTaiKhoan.Text = "TK001";
            txtMatKhau.Text = "Aa@12345";
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
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac == "Đăng nhập").MaTT;
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = nv.MaNV,
                    MaTT = maTT,
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

        private void FrmDangNhap_Load(object sender, EventArgs e)
        {

        }
    }
}
