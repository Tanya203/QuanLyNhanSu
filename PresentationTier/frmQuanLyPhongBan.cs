using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
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
    public partial class frmQuanLyPhongBan : Form
    {
        Thread currentForm;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private IEnumerable<PhongBanViewModel> danhSachPhongBan;
        public frmQuanLyPhongBan()
        {
            InitializeComponent();
            this.Load += frmQuanLyPhongBan_Load;
            phongBanBUS = new QuanLyPhongBanBUS();
        }
        private void frmQuanLyPhongBan_Load(object sender, EventArgs e)
        {
            LoadPhongBan();
        }
        private void LoadPhongBan()
        {
            dgvThongTinPhongBan.Rows.Clear();
            danhSachPhongBan = phongBanBUS.GetAllPhongBan();
            dgvThongTinPhongBan.Rows.Clear();
            int rowAdd;
            foreach (var pb in phongBanBUS.GetAllPhongBan())
            {
                rowAdd = dgvThongTinPhongBan.Rows.Add();
                dgvThongTinPhongBan.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
            }           
            
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

        private void dgvThongTinPhongBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        
    }
}
