using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhongBan : Form
    {
        Thread currentForm;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private IEnumerable<PhongBanViewModel> danhSachPhongBan;
        public FrmQuanLyPhongBan()
        {
            InitializeComponent();
            this.Load += frmQuanLyPhongBan_Load;
            phongBanBUS = new QuanLyPhongBanBUS();
            txtMaPB.ReadOnly = true;
            txtTongSoNhanVien.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
        }
        private void frmQuanLyPhongBan_Load(object sender, EventArgs e)
        {
            LoadPhongBan();
        }
        private void LoadPhongBan()
        {
            dgvThongTinPhongBan.Rows.Clear();
            danhSachPhongBan = phongBanBUS.GetAllPhongBan();           
            int rowAdd;
            foreach (var pb in danhSachPhongBan)
            {
                rowAdd = dgvThongTinPhongBan.Rows.Add();
                dgvThongTinPhongBan.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
        }
        private void LoadPhongBanTimKiem(string timKiem)
        {
            dgvThongTinPhongBan.Rows.Clear();
            danhSachPhongBan = phongBanBUS.SearchPhongBan(timKiem);
            int rowAdd;
            foreach (var pb in danhSachPhongBan)
            {
                rowAdd = dgvThongTinPhongBan.Rows.Add();
                dgvThongTinPhongBan.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
        }
        public void ClearAllText()
        {
            txtMaPB.Text = string.Empty;
            txtTenPB.Text = string.Empty;
            txtTongSoNhanVien.Text = string.Empty;
        }
        public void CloseCurrentForm()
        {
            this.Close();
            Application.Run(new FrmQuanLyPhongBan());
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

        private void dgvThongTinPhongBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaPB.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenPB.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[1].Value.ToString();
            txtTongSoNhanVien.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[2].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            PhongBan newPhongBan = new PhongBan
            {
                MaPB = "1",
                TenPhongBan = txtTenPB.Text
            };
            phongBanBUS.Save(newPhongBan);
            Reload();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            PhongBan newPhongBan = new PhongBan
            {
                MaPB = txtMaPB.Text,
                TenPhongBan = txtTenPB.Text
            };
            phongBanBUS.Save(newPhongBan);
            ClearAllText();
            LoadPhongBan();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            PhongBan phongBan = new PhongBan
            {
                MaPB = txtMaPB.Text
            };
            phongBanBUS.Delete(phongBan);
            ClearAllText();
            LoadPhongBan();
        }       
        private void EnableButtons(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaPB.Text) && string.IsNullOrEmpty(txtTenPB.Text) || string.IsNullOrEmpty(txtTenPB.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            else if(string.IsNullOrEmpty(txtMaPB.Text) && !string.IsNullOrEmpty(txtTenPB.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            } 
            else if(!string.IsNullOrEmpty(txtMaPB.Text) && !string.IsNullOrEmpty(txtTenPB.Text))
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
                LoadPhongBan();
                return;
            }
            LoadPhongBanTimKiem(txtTimKiem.Text);
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
    } 
}
