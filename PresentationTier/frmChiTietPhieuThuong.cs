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
    public partial class FrmChiTietPhieuThuong : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly PhieuThuongBus phieuThuongBus;
        private readonly ChiTietPhieuThuongBUS chiTietPhieuThuongBus;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<ChiTietPhieuThuongViewModels> danhSachChiTietPhieuThuong;
        private IEnumerable<ChiTietPhieuThuongViewModels> danhSachChiTietPhieuThuongTimKiem;
        private IEnumerable<ChiTietPhieuThuong> ctpt;
        private readonly NhanVien nv;
        private readonly PhieuThuong pt;
        private string maNV_Chon;
        
        private readonly string maNV;
        private readonly string maPT;
        public FrmChiTietPhieuThuong(string maNV, string maPT)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            phieuThuongBus = new PhieuThuongBus();
            chiTietPhieuThuongBus = new ChiTietPhieuThuongBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);
            pt = phieuThuongBus.ThongTinPhieuThuong(maPT);
            this.maNV = maNV;
            this.maPT = maPT;
        }
        private void FrmChiTietPhieuThuong_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            ctpt = chiTietPhieuThuongBus.ThongTinChiTietPhieuThuong(maPT);
            LoadThongTinDangNhap();
            LoadThongTinPhieuThuong();
            LoadChiTietPhieuThuong();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());
            txtMaPT.ReadOnly = txtMaNV.ReadOnly = txtHoTenTT.ReadOnly = txtPhongBan.ReadOnly = txtChucVu.ReadOnly = txtHoTenNV.ReadOnly = txtTongTien.ReadOnly = true;
            dtpNgayLapPhieu.Enabled = false;
            btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = false;
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBUS.GetPhongBan();
        }
        public void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVuTheoPhongBan(maPB);
        }
        public void LoadNhanVienTheoChucVu(string maCV)
        {
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVienChucVu(maCV).ToList();
            foreach (var pt in ctpt)
                nhanVienList = nhanVienList.Where(nv => nv.MaNV != pt.MaNV).ToList();                            
            cmbNhanVien.DataSource = nhanVienList;
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbNhanVien.Text) && string.IsNullOrEmpty(maNV_Chon))
            {
                txtHoTenNV.Text = string.Empty;
            }
            else
                txtTienThuong.Text = string.Empty;                
        }
        private void LoadNhanVien(object sender, EventArgs e)
        {
            LoadNhanVienTheoChucVu(cmbChucVu.SelectedValue.ToString());            
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
        public void LoadThongTinPhieuThuong()
        {
            txtMaPT.Text = pt.MaPT;
            txtMaNV.Text = pt.MaNV;
            txtHoTenTT.Text = pt.NhanVien.Ho + " " + pt.NhanVien.TenLot + " " + pt.NhanVien.Ten;
            txtPhongBan.Text = pt.NhanVien.ChucVu.PhongBan.TenPhongBan;
            txtChucVu.Text = pt.NhanVien.ChucVu.TenChucVu;
            dtpNgayLapPhieu.Text = pt.NgayLap.ToString();
            txtTongTien.Text = chiTietPhieuThuongBus.TongTienPhieuThuong(maPT).ToString();
        }             
        public void LoadChiTietPhieuThuong()
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieuThuong = chiTietPhieuThuongBus.GetAllChiTietPhieuThuong(maPT);
            int rowAdd;
            foreach(var pt in danhSachChiTietPhieuThuong)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = pt.MaPT;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = pt.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = pt.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = pt.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = pt.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = pt.TienThuong;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = pt.GhiChu;
            }
        }
        public void LoadChiTietPhieuThuongTimKiem(string timKiem)
        {
            dgvThongTinPhieuThuong.Rows.Clear();
            danhSachChiTietPhieuThuongTimKiem = chiTietPhieuThuongBus.SearchChiTietPhieuThuong(maPT, timKiem);
            int rowAdd;
            foreach (var pt in danhSachChiTietPhieuThuongTimKiem)
            {
                rowAdd = dgvThongTinPhieuThuong.Rows.Add();
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[0].Value = pt.MaPT;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[1].Value = pt.MaNV;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[2].Value = pt.HoTen;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[3].Value = pt.PhongBan;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[4].Value = pt.ChucVu;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[5].Value = pt.TienThuong;
                dgvThongTinPhieuThuong.Rows[rowAdd].Cells[6].Value = pt.GhiChu;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void cmbNhanVien_SelectedIndexChanged(object sender, EventArgs e)
        {
            NhanVien nv = nhanVienBUS.ThongTinNhanVien(cmbNhanVien.SelectedValue.ToString());
            txtHoTenNV.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;            
        }
        private void EnableButton()
        {
            
            if(string.IsNullOrEmpty(cmbNhanVien.Text) && string.IsNullOrEmpty(txtTienThuong.Text) || string.IsNullOrEmpty(txtTienThuong.Text))
            {
                btnThem.Enabled = btnSua.Enabled = btnXoa.Enabled = false;
                return;
            }
            if(!string.IsNullOrEmpty(cmbNhanVien.Text) && !string.IsNullOrEmpty(txtTienThuong.Text))
            {
                btnThem.Enabled = true;
                btnSua.Enabled = btnXoa.Enabled = false;
                return;
            }
            if(string.IsNullOrEmpty(cmbNhanVien.Text) && !string.IsNullOrEmpty(txtTienThuong.Text))
            {
                btnThem.Enabled = false;
                btnSua.Enabled = btnXoa.Enabled = true;
                return;
            }            
        }
        private void BatTatBut(object sender, EventArgs e)
        {
            EnableButton();
        }
        private void dgvThongTinPhieuThuong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            cmbNhanVien.Text = string.Empty;
            if (rowIndex < 0)
                return;            
            maNV_Chon = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[1].Value.ToString();
            txtHoTenNV.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[2].Value.ToString();
            cmbPhongBan.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[3].Value.ToString();
            cmbChucVu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[4].Value.ToString();
            txtTienThuong.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[5].Value.ToString();
            if (dgvThongTinPhieuThuong.Rows[rowIndex].Cells[6].Value is null)
                rtxtGhiChu.Text = string.Empty;
            else
                rtxtGhiChu.Text = dgvThongTinPhieuThuong.Rows[rowIndex].Cells[6].Value.ToString();
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            cmbPhongBan.SelectedIndex = 0;
            cmbChucVu.SelectedIndex = 0;
            txtTienThuong.Text = string.Empty;
            txtHoTenNV.Text = string.Empty;
            rtxtGhiChu.Text = string.Empty;
        }
        ///////////////////////////////////////////////////////////////////////////////////////////
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmChiTietPhieuThuong(maNV,maPT));
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
        ///////////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChiTietPhieuThuong newChiTietPhieuThuong = new ChiTietPhieuThuong
            {
                MaPT = maPT,
                MaNV = cmbNhanVien.SelectedValue.ToString(),
                TienThuong = decimal.Parse(txtTienThuong.Text),
                GhiChu = rtxtGhiChu.Text,
            };
            if (chiTietPhieuThuongBus.Save(newChiTietPhieuThuong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm nhân viên " + cmbNhanVien.SelectedValue.ToString() + " vào phiếu thưởng " + maPT,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            ChiTietPhieuThuong newChiTietPhieuThuong = new ChiTietPhieuThuong
            {
                MaPT = maPT,
                MaNV = maNV_Chon,
                TienThuong = decimal.Parse(txtTienThuong.Text),
                GhiChu = rtxtGhiChu.Text,
            };
            if (chiTietPhieuThuongBus.Save(newChiTietPhieuThuong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " sửa nhân viên " + maNV_Chon + " trong phiếu thưởng " + maPT,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            FrmChiTietPhieuThuong_Load(sender, e);
            ClearAllText();
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            ChiTietPhieuThuong newChiTietPhieuThuong = new ChiTietPhieuThuong
            {               
                MaNV = maNV_Chon,
            };
            if (chiTietPhieuThuongBus.Delete(newChiTietPhieuThuong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now,
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " xáo nhân viên " + maNV_Chon + " trong phiếu thưởng " + maPT,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            FrmChiTietPhieuThuong_Load(sender, e);
            ClearAllText();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmPhieuThuong frmOpen = new FrmPhieuThuong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadChiTietPhieuThuong();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadChiTietPhieuThuongTimKiem(txtTimKiem.Text);
            }
            
        }
    }
}
