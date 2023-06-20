using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Drawing.Imaging;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class frmManHinhChinh : Form
    {
        Thread currentForm;
        public frmManHinhChinh()
        {   
            InitializeComponent();
          
        }
        private void frmManHinhChinh_Load(object sender, EventArgs e)
        {
            /*lblHoTenNV =;
            lblMaNV = ;
            lblPhongBanNV = ;
            lblChucVuNV = ;
            lblSoNgayPhepConNV = ;
            dtpLichLamViec = ;
            pbAnhNV = ;*/
        }

        public void OpenQLNV()
        {
            Application.Run(new frmQuanLyNhanVien());
        }

        public void OpenQLPB()
        {
            Application.Run(new frmQuanLyPhongBan());
        }

        public void OpenQLCV()
        {
            Application.Run(new frmQuanLyChucVu());
        }
        public void OpenQLC()
        {
            Application.Run(new frmQuanLyCa());
        }
        public void OpenQLCC()
        {
            Application.Run(new frmChiTietLichLamViec());
        }
        public void OpenLLV()
        {
            Application.Run(new frmLichLamViec());
        }
        public void OpenQLPC()
        {
            Application.Run(new frmQuanLyPhuCap());
        }
        public void OpenQLPT()
        {
            Application.Run(new frmPhieuThuong());
        }
        public void OpenQLPP()
        {
            Application.Run(new frmPhieuPhat());
        }
        public void OpenTKL()
        {
            Application.Run(new frmThongKeLuong());
        }
        public void OpenQLLHD()
        {
            Application.Run(new frmQuanLyLoaiHopDong());
        }
        public void OpenPQ()
        {
            Application.Run(new frmPhanQuyen());
        }
        public void OpenLSTT()
        {
            Application.Run(new frmLichSuThaoTac());
        }
        public void OpenTTTK()
        {
            Application.Run(new frmThongTinTaiKhoan());
        }
        private void btnQLNV_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLNV);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }      

        private void btnQLPB_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLPB);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLCV_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLCV);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLC_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLC);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLCC_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLCC);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLLLV_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenLLV);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLPC_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLPC);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLPT_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLPT);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLPP_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLPP);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLTK_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenTKL);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLLHD_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenQLLHD);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnQLPQ_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenPQ);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnLSTT_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenLSTT);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }

        private void btnTTTK_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(OpenTTTK);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
