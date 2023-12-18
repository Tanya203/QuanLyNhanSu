using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.PresentationTier;
using System;
using System.Windows.Forms;

namespace QuanLyNhanSu
{
    public partial class FrmLogin : Form
    {
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly SalaryHandle salary;
        public FrmLogin()
        {
            InitializeComponent();
            redirect = new FormHandle();
            history = new SaveOperateHistory("Đăng nhập");
            btnLogin.Enabled = false;
            salary = new SalaryHandle();
            txtAccount.Text = "TK001";
            txtPassword.Text = "Aa@12345";
            KeyPreview = true;
        }
        private void llblForgotPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FrmForgotPassword open = new FrmForgotPassword();
            redirect.RedirectForm(open, this);
        }
        private void btnLogin_Click(object sender, EventArgs e)
        {
            StaffBUS staffBUS = new StaffBUS();
            Staff staff = staffBUS.LoginVerify(txtAccount.Text, txtPassword.Text);
            if (staff != null)
            {
                string operate = "Đăng nhập";
                string operationDetail = "Đăng nhập";
                history.Save(staff.StaffID, operate, operationDetail);
                salary.CheckMonth();
                FrmMainMenu open = new FrmMainMenu(staff.StaffID);
                redirect.RedirectForm(open, this);  
            }
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
