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
    public partial class FrmQuanLyLoaiCa : Form
    {
        Thread currentForm;
        private readonly QuanLyLoaiCaBUS loaiCaBUS;
        private IEnumerable<LoaiCaViewModels> danhSachLoaiCa;
        public FrmQuanLyLoaiCa()
        {
            InitializeComponent();
            this.Load += frmQuanLyLoaiCa_Load;
            loaiCaBUS = new QuanLyLoaiCaBUS();
            txtMaLC.ReadOnly = true;           
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }
        private void frmQuanLyLoaiCa_Load(object sender, EventArgs e)
        {
            LoadLoaiCa();
        }
        private void LoadLoaiCa()
        {
            dgvThongTinLoaiCa.Rows.Clear();
            danhSachLoaiCa = loaiCaBUS.GetAllLoaiCa();
            int rowAdd;
            foreach (var lc in danhSachLoaiCa)
            {
                rowAdd = dgvThongTinLoaiCa.Rows.Add();
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[0].Value = lc.MaLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[1].Value = lc.TenLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[2].Value = lc.HeSoLuong;
            }
        }
        private void LoadLoaiCaTimKiem(string timKiem)
        {
            dgvThongTinLoaiCa.Rows.Clear();
            danhSachLoaiCa = loaiCaBUS.SearchLoaiCa(timKiem);
            int rowAdd;
            foreach (var lc in danhSachLoaiCa)
            {
                rowAdd = dgvThongTinLoaiCa.Rows.Add();
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[0].Value = lc.MaLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[1].Value = lc.TenLoaiCa;
                dgvThongTinLoaiCa.Rows[rowAdd].Cells[2].Value = lc.HeSoLuong;
            }
        }
        public void ClearAllText()
        {
            txtMaLC.Text = string.Empty;
            txtTenLC.Text = string.Empty;
            txtHeSoLuong.Text = string.Empty;
        }
        public void CloseCurrentForm()
        {
            this.Close();
            Application.Run(new FrmQuanLyLoaiCa());
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
            FrmQuanLyCa frmOpen = new FrmQuanLyCa();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinLoaiCa_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLC.Text = dgvThongTinLoaiCa.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLC.Text = dgvThongTinLoaiCa.Rows[rowIndex].Cells[1].Value.ToString();
            txtHeSoLuong.Text = dgvThongTinLoaiCa.Rows[rowIndex].Cells[2].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiCa newLoaiCa = new LoaiCa
            {
                MaLC = "1",
                TenLoaiCa = txtTenLC.Text,
                HeSoLuong = decimal.Parse(txtHeSoLuong.Text)
            };
            loaiCaBUS.Save(newLoaiCa);
            Reload();          
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            LoaiCa newLoaiCa = new LoaiCa
            {
                MaLC = txtMaLC.Text,
                TenLoaiCa = txtTenLC.Text,
                HeSoLuong = decimal.Parse(txtHeSoLuong.Text)
            };
            loaiCaBUS.Save(newLoaiCa);
            ClearAllText();
            LoadLoaiCa();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiCa loaiCa = new LoaiCa
            {
                MaLC = txtMaLC.Text                
            };
            loaiCaBUS.Delete(loaiCa);
            ClearAllText();
            LoadLoaiCa();
        }

        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }

        private void EnableButtons(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtMaLC.Text) && string.IsNullOrEmpty(txtTenLC.Text) && string.IsNullOrEmpty(txtHeSoLuong.Text)||
                string.IsNullOrEmpty(txtTenLC.Text) && string.IsNullOrEmpty(txtHeSoLuong.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if(string.IsNullOrEmpty(txtMaLC.Text) && !string.IsNullOrEmpty(txtTenLC.Text) && !string.IsNullOrEmpty(txtHeSoLuong.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if(!string.IsNullOrEmpty(txtMaLC.Text) && !string.IsNullOrEmpty(txtTenLC.Text) && !string.IsNullOrEmpty(txtHeSoLuong.Text))
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
                LoadLoaiCa();
                return;
            }
            LoadLoaiCaTimKiem(txtTimKiem.Text);
        }
        private void txtHeSoLuong_KeyPress(object sender, KeyPressEventArgs e)
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
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    }
}
