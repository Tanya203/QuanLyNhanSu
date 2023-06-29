using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.PresentationTier;
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

namespace QuanLyNhanSu
{
    public partial class FrmDangNhap : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        public FrmDangNhap()
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
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
                FrmManHinhChinh frmOpen = new FrmManHinhChinh();
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
            {
                txtMatKhau.PasswordChar = '\0';
            }
            else
            {
                txtMatKhau.PasswordChar = '*';
            }

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
