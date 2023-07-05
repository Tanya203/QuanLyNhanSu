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
    public partial class FrmQuanLyChucVu : Form
    {
        Thread currentForm;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private IEnumerable<ChucVuViewModels> danhSachChucVu;
        private IEnumerable<ChucVuViewModels> danhSachChucVuTimKiem;
        private readonly string maNV;
        public FrmQuanLyChucVu(string maNV)
        {
            InitializeComponent();            
            chucVuBUS = new QuanLyChucVuBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            txtMaCV.ReadOnly = true;
            txtTongSoNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            this.maNV = maNV;
        }
        private void frmQuanLyChucVu_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            LoadPhongBan();
            LoadChucVu();
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
        private void LoadChucVu()
        {
            dgvThongTinChucVu.Rows.Clear();
            danhSachChucVu = chucVuBUS.GetAllChucVu();
            int rowAdd;
            foreach (var cv in danhSachChucVu)
            {
                rowAdd = dgvThongTinChucVu.Rows.Add();
                dgvThongTinChucVu.Rows[rowAdd].Cells[0].Value = cv.MaCV;
                dgvThongTinChucVu.Rows[rowAdd].Cells[1].Value = cv.TenPhongBan;
                dgvThongTinChucVu.Rows[rowAdd].Cells[2].Value = cv.TenChucVu;
                dgvThongTinChucVu.Rows[rowAdd].Cells[3].Value = cv.LuongKhoiDiem;
                dgvThongTinChucVu.Rows[rowAdd].Cells[4].Value = chucVuBUS.TongSoNhanVienThuocChucVu(cv.MaCV);
            }
        }
        private void LoadChucVuTimKiem(string timKiem)
        {            
            dgvThongTinChucVu.Rows.Clear();
            danhSachChucVuTimKiem = chucVuBUS.SearchChucVu(timKiem);
            int rowAdd;
            foreach (var cv in danhSachChucVuTimKiem)
            {
                rowAdd = dgvThongTinChucVu.Rows.Add();
                dgvThongTinChucVu.Rows[rowAdd].Cells[0].Value = cv.MaCV;
                dgvThongTinChucVu.Rows[rowAdd].Cells[1].Value = cv.TenPhongBan;
                dgvThongTinChucVu.Rows[rowAdd].Cells[2].Value = cv.TenChucVu;
                dgvThongTinChucVu.Rows[rowAdd].Cells[3].Value = cv.LuongKhoiDiem;
                dgvThongTinChucVu.Rows[rowAdd].Cells[4].Value = chucVuBUS.TongSoNhanVienThuocChucVu(cv.MaCV);
            }
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBUS.GetPhongBan();
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaCV.Text = string.Empty;
            cmbPhongBan.SelectedIndex = 0;
            txtTenCV.Text = string.Empty;
            txtTongSoNhanVien.Text = string.Empty;
            txtLuongKhoiDiem.Text = string.Empty;
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmQuanLyChucVu(maNV));
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
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaCV.Text) && string.IsNullOrEmpty(txtTenCV.Text) && string.IsNullOrEmpty(txtLuongKhoiDiem.Text) ||
                string.IsNullOrEmpty(txtTenCV.Text) && string.IsNullOrEmpty(txtLuongKhoiDiem.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            if (string.IsNullOrEmpty(txtMaCV.Text) && !string.IsNullOrEmpty(txtTenCV.Text) && !string.IsNullOrEmpty(txtLuongKhoiDiem.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtMaCV.Text) && !string.IsNullOrEmpty(txtTenCV.Text) && !string.IsNullOrEmpty(txtLuongKhoiDiem.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void txtLuongKhoiDiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
            {
                e.Handled = true;
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChucVu chucVu = new ChucVu
            {
                MaCV = "",
                MaPB = cmbPhongBan.SelectedValue.ToString(),
                TenChucVu = txtTenCV.Text,
                LuongKhoiDiem = decimal.Parse(txtLuongKhoiDiem.Text),
            };
            chucVuBUS.Save(chucVu);
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            ChucVu chucVu = new ChucVu
            {
                MaCV = txtMaCV.Text,
                MaPB = cmbPhongBan.ValueMember,
                TenChucVu = txtTenCV.Text,
                LuongKhoiDiem = decimal.Parse(txtLuongKhoiDiem.Text),
            };
            chucVuBUS.Save(chucVu);
            ClearAllText();
            LoadChucVu();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            ChucVu chucVu = new ChucVu
            {
                MaCV = txtMaCV.Text                
            };
            chucVuBUS.Delete(chucVu);
            ClearAllText();
            LoadChucVu();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }      
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void dgvThongTinChucVu_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaCV.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[0].Value.ToString();
            cmbPhongBan.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[1].Value.ToString();
            txtTenCV.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[2].Value.ToString();
            txtLuongKhoiDiem.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[3].Value.ToString();
            txtTongSoNhanVien.Text = dgvThongTinChucVu.Rows[rowIndex].Cells[4].Value.ToString();

        }       
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
            {
                LoadChucVu();
                return;
            }
            LoadChucVuTimKiem(txtTimKiem.Text);
        }       
    }
}
