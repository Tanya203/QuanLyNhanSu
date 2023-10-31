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
            btnLogin.Enabled = false;
            txtAccount.Text = "TK001";
            txtPassword.Text = "Aa@12345";
            KeyPreview = true;
        }
        private void llblForgotPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FrmQuenMatKhau frmOpen = new FrmQuenMatKhau();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnLogin_Click(object sender, EventArgs e)
        {
            if (nhanVienBUS.LoginVerify(txtAccount.Text, txtPassword.Text))
            {
                NhanVien nv = nhanVienBUS.GetNhanVien().Where(nhanVien => nhanVien.TaiKhoan == txtAccount.Text).FirstOrDefault();
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

        private void cbShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowpassword.Checked == true)
                txtPassword.UseSystemPasswordChar = false;
            else
                txtPassword.UseSystemPasswordChar = true;
        }
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtAccount.Text) || string.IsNullOrEmpty(txtPassword.Text))
                btnLogin.Enabled = false;
            else
                btnLogin.Enabled = true;
        }

        private void FrmDangNhap_KeyPress(object sender, KeyPressEventArgs e)
        {

            if (e.KeyChar == (char)Keys.Enter)
            {
                btnLogin.PerformClick(); 
                e.Handled = true;
            }
        }
    }
}
