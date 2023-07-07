using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyCa : Form
    {
        Thread currentForm;
        private readonly QuanLyCaBUS caBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private IEnumerable<CaViewModels> danhSachCa;
        private IEnumerable<CaViewModels> danhSachCaTimKiem;
        string formatTime = "HH:mm";
        private readonly string maNV;
        public FrmQuanLyCa(string maNV)
        {
            InitializeComponent();
            this.Load += frmQuanLyCa_Load;
            caBUS = new QuanLyCaBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            txtMaCa.ReadOnly = true;
            dtpThoiGianBatDau.Text = "00:00";
            dtpThoiGianKetThuc.Text = "00:00";
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyCa_Load(object sender, EventArgs e)
        {
            LoadCa();
            LoadThongTinDangNhap();
        }
        public void LoadThongTinDangNhap()
        {
            NhanVien nv = nhanVienBUS.ThongTinNhanVienDangNhap(maNV);
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadCa()
        {
            dgvThongTinCa.Rows.Clear();
            danhSachCa = caBUS.GetAllCa();
            int rowAdd;
            foreach (var ca in danhSachCa)
            {
                rowAdd = dgvThongTinCa.Rows.Add();
                dgvThongTinCa.Rows[rowAdd].Cells[0].Value = ca.MaCa;
                dgvThongTinCa.Rows[rowAdd].Cells[1].Value = ca.TenCa;
                dgvThongTinCa.Rows[rowAdd].Cells[2].Value = ca.GioBatDau;
                dgvThongTinCa.Rows[rowAdd].Cells[3].Value = ca.GioKetThuc;
            }
        }
        private void LoadCaTimKiem(string timKiem)
        {            
            dgvThongTinCa.Rows.Clear();
            danhSachCaTimKiem = caBUS.SearchCa(timKiem);
            int rowAdd;
            foreach (var ca in danhSachCaTimKiem)
            {
                rowAdd = dgvThongTinCa.Rows.Add();
                dgvThongTinCa.Rows[rowAdd].Cells[0].Value = ca.MaCa;
                dgvThongTinCa.Rows[rowAdd].Cells[1].Value = ca.TenCa;
                dgvThongTinCa.Rows[rowAdd].Cells[2].Value = ca.GioBatDau;
                dgvThongTinCa.Rows[rowAdd].Cells[3].Value = ca.GioKetThuc;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaCa.Text = string.Empty;
            txtTenCa.Text = string.Empty;
            dtpThoiGianBatDau.Text = "00:00";
            dtpThoiGianKetThuc.Text = "00:00";
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmQuanLyCa(maNV));
        }
        public void Reload()
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
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtMaCa.Text) && string.IsNullOrEmpty(txtTenCa.Text) || string.IsNullOrEmpty(txtTenCa.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrWhiteSpace(txtMaCa.Text) && !string.IsNullOrEmpty(txtTenCa.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrWhiteSpace(txtMaCa.Text) && !string.IsNullOrEmpty(txtTenCa.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            Ca newCa = new Ca
            {
                MaCa = "",
                TenCa = txtTenCa.Text,
                GioBatDau = TimeSpan.Parse(dtpThoiGianBatDau.Text),
                GioKetThuc = TimeSpan.Parse(dtpThoiGianKetThuc.Text),
            };
            caBUS.Save(newCa);
            Reload();            
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            Ca newCa = new Ca
            {
                MaCa = txtMaCa.Text,
                TenCa = txtTenCa.Text,
                GioBatDau = TimeSpan.Parse(dtpThoiGianBatDau.Text),
                GioKetThuc = TimeSpan.Parse(dtpThoiGianKetThuc.Text),
            };
            caBUS.Save(newCa);            
            ClearAllText();
            LoadCa();            
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            Ca ca = new Ca
            {
                MaCa = txtMaCa.Text,
            };
            caBUS.Delete(ca);
            this.Refresh();
            ClearAllText();
            LoadCa();          
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnQuanLyLoaiCa_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiCa frm = new FrmQuanLyLoaiCa(maNV);
            frm.Show();
            this.Hide();
            frm.FormClosed += CloseForm;
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }       
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))            
                LoadCa();                      
        }
        private void dgvThongTinCa_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaCa.Text = dgvThongTinCa.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenCa.Text = dgvThongTinCa.Rows[rowIndex].Cells[1].Value.ToString();
            dtpThoiGianBatDau.Text = dgvThongTinCa.Rows[rowIndex].Cells[2].Value.ToString();
            dtpThoiGianKetThuc.Text = dgvThongTinCa.Rows[rowIndex].Cells[3].Value.ToString();
        }

        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadCaTimKiem(txtTimKiem.Text);
            }
        }
    }
}
