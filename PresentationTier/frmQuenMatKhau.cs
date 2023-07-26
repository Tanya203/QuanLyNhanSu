using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuenMatKhau : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuenMatKhau()
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
        }       
        private void FrmQuenMatKhau_Load(object sender, EventArgs e)
        {
            txtMatKhau.Enabled = false;
            txtNhapLaiMatKhau.Enabled = false;
            cbHienThiMatKhau.Enabled = false;
            btnXacThucThongTin.Enabled = false;
            btnDoiMatKhau.Enabled = false;
            txtMaNhanVien.Text = "NV0000000001";
            txtTaiKhoan.Text = "TK001";
            txtCCCD.Text = "079202007088";
            txtSDT.Text = "0933781574";
            txtEmail.Text = "test1@gmail.com";
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        public bool CheckMatKhau(string matKhau)
        {
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
            if (!passCheck.IsMatch(matKhau) || matKhau.Length > 20)
            {
                MessageBox.Show("Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            if (txtNhapLaiMatKhau.Text != matKhau)
            {
                MessageBox.Show("Mật khẩu nhập lại không khớp", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            return true;
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void txtMaNhanVien_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMaNhanVien.Text) && !string.IsNullOrEmpty(txtTaiKhoan.Text) &&
               !string.IsNullOrEmpty(txtCCCD.Text) && !string.IsNullOrEmpty(txtSDT.Text) &&
               !string.IsNullOrEmpty(txtEmail.Text))
                btnXacThucThongTin.Enabled = true;
            else
                btnXacThucThongTin.Enabled = false;
        }
        private void cbHienThiMatKhau_CheckedChanged(object sender, EventArgs e)
        {
            if (cbHienThiMatKhau.Checked)
            {
                txtMatKhau.UseSystemPasswordChar = false;
                txtNhapLaiMatKhau.UseSystemPasswordChar = false;
            }
            else
            {
                txtMatKhau.UseSystemPasswordChar = true;
                txtNhapLaiMatKhau.UseSystemPasswordChar = true;
            }
        }
        private void txtMatKhau_TextChanged_1(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(txtMatKhau.Text) && !string.IsNullOrEmpty(txtNhapLaiMatKhau.Text))
                btnDoiMatKhau.Enabled = true;
            else
                btnDoiMatKhau.Enabled = false;
        }
        private void txtCCCD_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void btnXacThucThongTin_Click(object sender, EventArgs e)
        {
            if(nhanVienBUS.VerifyInfo(txtMaNhanVien.Text, txtTaiKhoan.Text, txtCCCD.Text, txtSDT.Text, txtEmail.Text))
            {
                txtMaNhanVien.Enabled = false;
                txtTaiKhoan.Enabled = false;
                txtCCCD.Enabled = false;
                txtSDT.Enabled = false;
                txtEmail.Enabled = false;
                btnXacThucThongTin.Enabled = false;
                txtMatKhau.Enabled = true;
                txtNhapLaiMatKhau.Enabled = true;
                cbHienThiMatKhau.Enabled = true;                
            }
        }
        private void btnDoiMatKhau_Click(object sender, EventArgs e)
        {
            NhanVien nhanVien = new NhanVien
            {
                MaNV = txtMaNhanVien.Text,
                MatKhau = txtMatKhau.Text,
            };   
            if (CheckMatKhau(txtMatKhau.Text))
            {
                nhanVien.MatKhau = txtMatKhau.Text;
                if (nhanVienBUS.Save(nhanVien))
                {
                    LichSuThaoTac newLstt = new LichSuThaoTac
                    {
                        NgayGio = DateTime.Now.ToString(formatDateTime),
                        MaNV = txtMaNhanVien.Text,
                        ThaoTacThucHien = "Nhân viên " + txtMaNhanVien.Text + " quên mật khẩu.",
                    };
                    lichSuThaoTacBUS.Save(newLstt);
                    btnTroVe_Click(sender, e);
                }
            }                    
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmDangNhap frmOpen = new FrmDangNhap();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        
    }
}
