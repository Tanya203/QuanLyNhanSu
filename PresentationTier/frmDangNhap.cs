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
    public partial class frmDangNhap : Form
    {
        Thread currentForm;
        public frmDangNhap()
        {
            InitializeComponent();
        }
        public void OpenQMK()
        {
            this.Close();
            Application.Run(new frmQuenMatKhau());
        }
        private void llblQuenMatKhau_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQMK);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
