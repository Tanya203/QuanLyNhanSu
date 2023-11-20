using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.PresentationTier;
using System;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu
{
    public partial class FrmLogin : Form
    {
        private readonly StaffBUS staffBUS;        
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        public FrmLogin()
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            redirect = new FormHandle();
            history = new SaveOperateHistory("Đăng nhập");
            btnLogin.Enabled = false;
            txtAccount.Text = "TK001";
            txtPassword.Text = "Aa@12345";
            KeyPreview = true;
        }
        private void llblForgotPassword_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FrmForgotPassword open = new FrmForgotPassword();
            redirect.RedirectForm(open);
        }
        private void btnLogin_Click(object sender, EventArgs e)
        {
            Staff staff = staffBUS.LoginVerify(txtAccount.Text, txtPassword.Text);
            if (staff != null)
            {
                string operate = "Đăng nhập";
                string operationDetail = "Đăng nhập";
                history.Save(staff.StaffID, operate, operationDetail);
                FrmMainMenu open = new FrmMainMenu(staff.StaffID);
                redirect.RedirectForm(open);  
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
