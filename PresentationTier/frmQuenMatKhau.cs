using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuenMatKhau : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly List<ThaoTac> listThaoTac;
        private readonly string maDG;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuenMatKhau()
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            maDG = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quên mật khẩu").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maDG).ToList();
        }       
        private void FrmQuenMatKhau_Load(object sender, EventArgs e)
        {
            txtNewPassword.Enabled = false;
            txtReEnterNewPassword.Enabled = false;
            cbShowPassword.Enabled = false;
            btnVerifyInfo.Enabled = false;
            btnChangePassword.Enabled = false;
            txtStaffID.Text = "NV0000000001";
            txtAccount.Text = "TK001";
            txtIDCard.Text = "079202007088";
            txtPhone.Text = "0933781574";
            txtEmail.Text = "test1@gmail.com";
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckMatKhau(string matKhau)
        {
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
            if (!passCheck.IsMatch(matKhau) || matKhau.Length > 20)
            {
                MessageBox.Show("Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (txtReEnterNewPassword.Text != matKhau)
            {
                MessageBox.Show("Mật khẩu nhập lại không khớp", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
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
        private void txtIDCard_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void btnVerfifyInfo_Click(object sender, EventArgs e)
        {
            if(nhanVienBUS.VerifyInfo(txtStaffID.Text, txtAccount.Text, txtIDCard.Text, txtPhone.Text, txtEmail.Text))
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
            NhanVien nhanVien = new NhanVien
            {
                MaNV = txtStaffID.Text,
                MatKhau = txtNewPassword.Text,
            };   
            if (CheckMatKhau(txtNewPassword.Text))
            {
                nhanVien.MatKhau = txtNewPassword.Text;
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Quên mật khẩu")).MaTT;
                if (nhanVienBUS.Save(nhanVien))
                {
                    LichSuThaoTac newLstt = new LichSuThaoTac
                    {
                        NgayGio = DateTime.Now.ToString(formatDateTime),
                        MaNV = txtStaffID.Text,
                        MaTT = maTT,
                        ThaoTacThucHien = $"Nhân viên { txtStaffID.Text } quên mật khẩu.",
                    };
                    lichSuThaoTacBUS.Save(newLstt);
                    btnBack_Click(sender, e);
                }
            }                    
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmDangNhap frmOpen = new FrmDangNhap();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        
    }
}
