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
    public partial class frmLichSuThaoTac : Form
    {
        Thread currentForm;
        public frmLichSuThaoTac()
        {
            InitializeComponent();
        }

        private void frmLichSuThaoTac_Load(object sender, EventArgs e)
        {

        }

        public void ReturnHome()
        {
            this.Close();
            Application.Run(new frmManHinhChinh());
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(ReturnHome);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
