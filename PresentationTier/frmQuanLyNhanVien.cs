using QuanLyNhanSu.DataTier.Models;
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

namespace QuanLyNhanSu.PresentationTier
{
    public partial class frmQuanLyNhanVien : Form
    {
        Thread currentForm;
        public frmQuanLyNhanVien()
        {
            InitializeComponent();
        }

        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
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

        private void dgvThongTinNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            NhanVien newNhanVien = new NhanVien
            {
                MaNV = "1",
                
            };

        }
    }
}
