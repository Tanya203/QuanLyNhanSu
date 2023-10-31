using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Drawing;
using System.Linq;
using System.Threading;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmThongKe : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly NhanVien nv;
        private readonly string maNV;
        public FrmThongKe(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            this.maNV = maNV;
        }
        private void FrmThongKeLuong_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
        }
        public void LoadThongTinDangNhap()
        {
            lblStaffIDLoginValue.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblFullNameLoginValue.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblFullNameLoginValue.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblDepartmentLoginValue.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblPositionLoginValue.Text = nv.ChucVu.TenChucVu;
        }
        private void tabControlMenu_DrawItem(object sender, DrawItemEventArgs e)
        {
            TabControl tabControl = (TabControl)sender;
            TabPage tabPage = tabControl.TabPages[e.Index];
            Font font = tabPage.Font;
            Brush brush = new SolidBrush(tabPage.ForeColor);
            Rectangle bounds = e.Bounds;
            e.Graphics.DrawString(tabPage.Text, font, brush, bounds);
        }
        //////////////////////////////////////////////////////////////////////////////
        private void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmThongKe(maNV));
        }
        private void Reload()
        {
            this.Close();
            currentForm = new Thread(new ThreadStart(() => CloseCurrentForm(maNV)));
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void tabPageThongKeLuong_Click(object sender, EventArgs e)
        {

        }

        
    }
}
