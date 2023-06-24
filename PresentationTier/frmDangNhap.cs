﻿using QuanLyNhanSu.PresentationTier;
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
        public FrmDangNhap()
        {
            InitializeComponent();
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
            FrmManHinhChinh frmOpen = new FrmManHinhChinh();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    }
}
