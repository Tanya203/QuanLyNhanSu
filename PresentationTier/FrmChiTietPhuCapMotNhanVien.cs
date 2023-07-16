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
    public partial class FrmChiTietPhuCapMotNhanVien : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly QuanLyPhuCapBUS phuCapBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachChiTietPhuCap;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachChiTietPhuCapTimKiem;
        private IEnumerable<ChiTietPhuCapViewModels> ctpc;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string nhanVienPC;        
        private readonly string check;
        private string maPC_Chon;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmChiTietPhuCapMotNhanVien(string maNV, string nhanVienPC, string check)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            phuCapBUS = new QuanLyPhuCapBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            ctpc = chiTietPhuCapBUS.GetPhuCapMotNhanVien(nhanVienPC);
            this.maNV = maNV;
            this.nhanVienPC = nhanVienPC;
            this.check = check;
        }
        private void FrmChiTietPhuCapMotNhanVien_Load(object sender, EventArgs e)
        {
            cmbPhuCap.DisplayMember = "TenPhuCap";
            cmbPhuCap.ValueMember = "MaPC";
            LoadPhuCapNhanVien();
            LoadThongTinDangNhap();
            LoadPhuCap();            
            txtMaNV.ReadOnly = true;
            txtSoTien.ReadOnly = true;
            txtTongPhuCap.ReadOnly = true;
            btnThem.Enabled = false;
            if(check == "nhanVien")
            {
                pnlMenu.Visible = true;
                XoaButton();
            }                           
        }
        public void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        public void LoadPhuCap()
        {
            List<PhuCap> phuCap = phuCapBUS.GetPhuCap().ToList();
            foreach (var pc in ctpc)
                phuCap = phuCap.Where(p => p.MaPC != pc.MaPC).ToList();
            cmbPhuCap.DataSource = phuCap;
        }
        public void LoadPhuCapNhanVien()
        {
            dgvChiTietPhuCap.Rows.Clear();
            danhSachChiTietPhuCap = chiTietPhuCapBUS.GetPhuCapMotNhanVien(nhanVienPC);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhuCap)
            {
                rowAdd = dgvChiTietPhuCap.Rows.Add();
                dgvChiTietPhuCap.Rows[rowAdd].Cells[0].Value = phieu.MaNV;                
                dgvChiTietPhuCap.Rows[rowAdd].Cells[1].Value = phieu.HoTen;
                dgvChiTietPhuCap.Rows[rowAdd].Cells[2].Value = phieu.PhongBan;
                dgvChiTietPhuCap.Rows[rowAdd].Cells[3].Value = phieu.ChucVu;
                dgvChiTietPhuCap.Rows[rowAdd].Cells[4].Value = phieu.MaPC;
                dgvChiTietPhuCap.Rows[rowAdd].Cells[5].Value = phieu.TenPhuCap;
                dgvChiTietPhuCap.Rows[rowAdd].Cells[6].Value = phieu.TienPhuCap;
            }
            txtTongPhuCap.Text = chiTietPhuCapBUS.TongPhuCapMotNhanVien(nhanVienPC).ToString();
            txtMaNV.Text = nhanVienPC;
        }
        //////////////////////////////////////////////////////////////////////////////////////        
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmChiTietPhuCapMotNhanVien frmOpen = new FrmChiTietPhuCapMotNhanVien(maNV, nhanVienPC, check);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmbPhuCap_TextChanged(object sender, EventArgs e)
        {
            PhuCap phuCap = phuCapBUS.ThongTinPhuCap(cmbPhuCap.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbPhuCap.Text))
                btnThem.Enabled = false;
            else
            {
                btnThem.Enabled = true;
                txtSoTien.Text = phuCap.TienPhuCap.ToString();
            }              

        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChiTietPhuCap chiTietPhuCap = new ChiTietPhuCap
            {
                MaNV = nhanVienPC,
                MaPC = cmbPhuCap.SelectedValue.ToString(),                
            };
            if (chiTietPhuCapBUS.Save(chiTietPhuCap))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm phụ cấp " + cmbPhuCap.SelectedValue.ToString() + " cho " + nhanVienPC,
                };
                lichSuThaoTacBUS.Save(newLstt);                
            }
            txtSoTien.Text = string.Empty;
            Reload();
        }
        public void XoaButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Xoá";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvChiTietPhuCap.Columns.Add(btnXoa);
            }
        }
        public void XoaPhuCap(string maNV, string maPC)
        {
            ChiTietPhuCap chiTietPhuCap = new ChiTietPhuCap
            {
                MaPC = maPC,
                MaNV = maNV                
            };
            if (chiTietPhuCapBUS.Delete(chiTietPhuCap))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = this.maNV,
                    ThaoTacThucHien = "Nhân viên " + this.maNV + " xoá phụ cấp " + maPC + " của " + maNV,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
        }
        private void dgvChiTietPhuCap_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (e.ColumnIndex == 7)
            {
                maPC_Chon = dgvChiTietPhuCap.Rows[rowIndex].Cells[4].Value.ToString();
                XoaPhuCap(nhanVienPC, maPC_Chon);
            }
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            if(check == "nhanVien")
            {
                FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
                frmOpen.Show();
                this.Hide();
                frmOpen.FormClosed += CloseForm;
            }
            else
            {
                FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan(maNV);
                frmOpen.Show();
                this.Hide();
                frmOpen.FormClosed += CloseForm;
            }
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        
    }
}
