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
    public partial class FrmQuanLyLoaiHopDong : Form
    {
        private Thread currentForm;
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDong;
        public FrmQuanLyLoaiHopDong()
        {
            InitializeComponent();
            this.Load += frmQuanLyLoaiHopDong_Load;
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            txtMaLHD.ReadOnly = true;
            txtSoLuongNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }
        private void frmQuanLyLoaiHopDong_Load(object sender, EventArgs e)
        {
            LoadLoaiHopDong();
        }
        private void LoadLoaiHopDong()
        {
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDong = loaiHopDongBUS.GetAllLoaiHopDong();
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDong)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
        }
        private void LoadLoaiHopDongTimKiem(string timKiem)
        {
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDong = loaiHopDongBUS.SearchLoaiHopDong(timKiem);
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDong)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
        }
        public void ClearAllText()
        {
            txtMaLHD.Text = string.Empty;
            txtTenLHD.Text = string.Empty;
            txtSoLuongNhanVien.Text = string.Empty;
        }
        public void CloseCurrentForm()
        {
            this.Close();
            Application.Run(new FrmQuanLyLoaiHopDong());
        }
        public void Reload()
        {
            this.Close();
            currentForm = new Thread(CloseCurrentForm);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinLoaiHopDong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[1].Value.ToString();
            txtSoLuongNhanVien.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[2].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = "1",
                TenLoaiHopDong = txtTenLHD.Text
            };
            loaiHopDongBUS.Save(newLoaiHopDong);
            Reload();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text,
                TenLoaiHopDong = txtTenLHD.Text
            };
            loaiHopDongBUS.Save(newLoaiHopDong);
            ClearAllText();
            LoadLoaiHopDong();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiHopDong loaiHopDong = new LoaiHopDong();
            loaiHopDong.MaLHD = txtMaLHD.Text;
            loaiHopDongBUS.Delete(loaiHopDong);
            ClearAllText();
            LoadLoaiHopDong();
        }

        
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaLHD.Text) && string.IsNullOrEmpty(txtTenLHD.Text) || string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (string.IsNullOrEmpty(txtMaLHD.Text) && !string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if (!string.IsNullOrEmpty(txtMaLHD.Text) && !string.IsNullOrEmpty(txtTenLHD.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }     
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
            {
                LoadLoaiHopDong();
                return;
            }
            LoadLoaiHopDongTimKiem(txtTimKiem.Text);
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void lblThongTinLoaiHopDong_Click(object sender, EventArgs e)
        {

        }

        private void pnlMenu_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
