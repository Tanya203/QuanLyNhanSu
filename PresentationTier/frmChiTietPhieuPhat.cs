﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChiTietPhieuPhat : Form
    {
        Thread currentForm;
        public FrmChiTietPhieuPhat()
        {
            InitializeComponent();
        }       
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmPhieuPhat frmOpen = new FrmPhieuPhat();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void FrmChiTietPhieuPhat_Load(object sender, EventArgs e)
        {

        }

        private void lblPhongBan_Click(object sender, EventArgs e)
        {

        }

        private void lblNhanVien_Click(object sender, EventArgs e)
        {

        }

        private void lblGhiChu_Click(object sender, EventArgs e)
        {

        }

        private void pnlDetail_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
