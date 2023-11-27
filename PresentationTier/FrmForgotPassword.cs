using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmForgotPassword : Form
    {
        private readonly SaveOperateHistory history;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        public FrmForgotPassword()
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Quên mật khẩu");
            redirect = new FormHandle();
        }
        private void FrmQuenMatKhau_Load(object sender, EventArgs e)
        {
            txtNewPassword.Enabled = false;
            txtReEnterNewPassword.Enabled = false;
            cbShowPassword.Enabled = false;
            btnVerifyInfo.Enabled = false;
            btnChangePassword.Enabled = false;
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void VerifyEmptyCheck(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtStaffID.Text) && !string.IsNullOrEmpty(txtAccount.Text) &&
               !string.IsNullOrEmpty(txtIDCard.Text) && !string.IsNullOrEmpty(txtPhone.Text) &&
               !string.IsNullOrEmpty(txtEmail.Text))
                btnVerifyInfo.Enabled = true;
            else
                btnVerifyInfo.Enabled = false;
        }
        private void cbShowPassword_CheckedChanged(object sender, EventArgs e)
        {
            if (cbShowPassword.Checked)
            {
                txtNewPassword.UseSystemPasswordChar = false;
                txtReEnterNewPassword.UseSystemPasswordChar = false;
            }
            else
            {
                txtNewPassword.UseSystemPasswordChar = true;
                txtReEnterNewPassword.UseSystemPasswordChar = true;
            }
        }
        private void ChangePasswordEmptyCheck(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtNewPassword.Text) && !string.IsNullOrEmpty(txtReEnterNewPassword.Text))
                btnChangePassword.Enabled = true;
            else
                btnChangePassword.Enabled = false;
        }
        private void txtIDCardAndPhone_KeyPress(object sender, KeyPressEventArgs e)
        {
            InputCheck.OnlyNatrualNumber(sender, e);
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckInputError()
        {
            errProvider.Clear();
            errProvider.SetError(txtNewPassword, !InputCheck.CheckPassword(txtNewPassword.Text) ? "Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!" : string.Empty);
            errProvider.SetError(txtReEnterNewPassword, txtNewPassword.Text != txtReEnterNewPassword.Text ? "Mật khẩu nhập lại không khớp" : string.Empty);
            if(errProvider.GetError(txtNewPassword) != string.Empty || errProvider.GetError(txtReEnterNewPassword) != string.Empty)
                return false;
            return true;
        }
        private void btnVerfifyInfo_Click(object sender, EventArgs e)
        {
            if (staffBUS.VerifyInfo(txtStaffID.Text, txtAccount.Text, txtIDCard.Text, txtPhone.Text, txtEmail.Text))
            {
                txtStaffID.Enabled = false;
                txtAccount.Enabled = false;
                txtIDCard.Enabled = false;
                txtPhone.Enabled = false;
                txtEmail.Enabled = false;
                btnVerifyInfo.Enabled = false;
                txtNewPassword.Enabled = true;
                txtReEnterNewPassword.Enabled = true;
                cbShowPassword.Enabled = true;
            }
        }
        private void btnChangePassword_Click(object sender, EventArgs e)
        {
            if (!CheckInputError())
                return;
            Staff staff = new Staff
            {
                StaffID = txtStaffID.Text,
                Password = txtNewPassword.Text,
            };
            if (staffBUS.Save(staff))
            {
                string operate = "Quên mật khẩu";
                string operationDetail = "Quên mật khẩu";
                history.Save(txtStaffID.Text, operate, operationDetail);
                btnBack_Click(sender, e);
            }
            
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmLogin frmOpen = new FrmLogin();
            redirect.RedirectForm(frmOpen);
        }
    }
}
