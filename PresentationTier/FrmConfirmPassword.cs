using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmConfirmPassword : Form
    {
        private readonly StaffBUS staffBUS;
        private readonly string staffID;
        public bool Check { get; set; }
        public FrmConfirmPassword(string staffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();   
            this.staffID = staffID;
            Check = false;
            KeyPreview = true;
        }
        private void FrmConfirmPassword_Load(object sender, EventArgs e)
        {           
            btnConfirmPassoword.Enabled = false;
        }
        private void txtPassoword_TextChanged(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtPassoword.Text))
                btnConfirmPassoword.Enabled = false;
            else 
                btnConfirmPassoword.Enabled = true;
        }
        private void btnConfirmPassoword_Click(object sender, EventArgs e)
        {
            if(!staffBUS.VerifyPassword(staffID, txtPassoword.Text))
            {
                MessageBox.Show("Mật khẩu không hợp lệ", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Check = false;
            }
            else
            {
                Check = true;
                Close();
            }
                
        }
        private void FrmConfirmPassword_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                btnConfirmPassoword.PerformClick();
                e.Handled = true;
            }
        }
    }
}
