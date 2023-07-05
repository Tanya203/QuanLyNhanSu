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
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyNhanVien : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBus;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private IEnumerable<NhanVienViewModel> danhSachNhanVien;
        private IEnumerable<NhanVienViewModel> danhSachNhanVienTimKiem;
        string formatDateTime = "dd/MM/yyyy";
        private readonly string maNV;

        public FrmQuanLyNhanVien(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBus = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            this.maNV = maNV;
        }

        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbLoaiHopDong.DisplayMember = "TenLoaiHopDong";
            cmbLoaiHopDong.ValueMember = "MaLHD";
            LoadNhanVien();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            LoadLoaiHopDong();
            LoadThongTinDangNhap();
            txtMaNV.ReadOnly = true;
            txtPhuCap.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnThemPhuCap.Enabled = false;
            dtpNTNS.Text = "01/01/1990";          
            
        }
        ///////////////////////////////////////////////////////////////////////////////////////
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
        private void LoadNhanVien()
        {
            dgvThongTinNhanVien.Rows.Clear();
            danhSachNhanVien = nhanVienBUS.GetAllNhanVien();
            int rowAdd;
            foreach (var nv in danhSachNhanVien)
            {
                rowAdd = dgvThongTinNhanVien.Rows.Add();
                dgvThongTinNhanVien.Rows[rowAdd].Cells[0].Value = nv.MaNV;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[1].Value = nv.TenPhongBan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[2].Value = nv.TenChucVu;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[3].Value = nv.TenLoaiHopDong;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[4].Value = nv.TaiKhoan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[5].Value = nv.CCCD_CMND;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[6].Value = nv.Ho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[7].Value = nv.TenLot;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[8].Value = nv.Ten;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[9].Value = nv.NTNS.ToString(formatDateTime);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[10].Value = nv.SoNha;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[11].Value = nv.TenDuong;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[12].Value = nv.Phuong_Xa;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[13].Value = nv.Quan_Huyen;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[14].Value = nv.Tinh_ThanhPho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[15].Value = nv.GioiTinh;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[16].Value = nv.SDT;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[17].Value = nv.Email;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[18].Value = nv.TrinhDoHocVan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[19].Value = nv.NgayVaoLam.ToString(formatDateTime);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[20].Value = nv.ThoiHanHopDong.ToString(formatDateTime);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[21].Value = nv.TinhTrang;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[22].Value = nv.SoNgayPhep;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[23].Value = nv.LuongCoBan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[24].Value = nhanVienBUS.TongPhuCap1NhanVien(nv.MaNV);
            }
        }
        private void LoadNhanVienTimKiem(string timKiem)
        {            
            dgvThongTinNhanVien.Rows.Clear();
            danhSachNhanVienTimKiem = nhanVienBUS.SearchNhanVien(timKiem);
            int rowAdd;
            foreach (var nv in danhSachNhanVienTimKiem)
            {
                rowAdd = dgvThongTinNhanVien.Rows.Add();
                dgvThongTinNhanVien.Rows[rowAdd].Cells[0].Value = nv.MaNV;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[1].Value = nv.TenPhongBan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[2].Value = nv.TenChucVu;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[3].Value = nv.TenLoaiHopDong;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[4].Value = nv.TaiKhoan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[5].Value = nv.CCCD_CMND;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[6].Value = nv.Ho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[7].Value = nv.TenLot;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[8].Value = nv.Ten;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[9].Value = nv.NTNS.ToString(formatDateTime);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[10].Value = nv.SoNha;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[11].Value = nv.TenDuong;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[12].Value = nv.Phuong_Xa;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[13].Value = nv.Quan_Huyen;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[14].Value = nv.Tinh_ThanhPho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[15].Value = nv.GioiTinh;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[16].Value = nv.SDT;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[17].Value = nv.Email;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[18].Value = nv.TrinhDoHocVan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[19].Value = nv.NgayVaoLam.ToString(formatDateTime);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[20].Value = nv.ThoiHanHopDong.ToString(formatDateTime);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[21].Value = nv.TinhTrang;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[22].Value = nv.SoNgayPhep;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[23].Value = nv.LuongCoBan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[24].Value = nhanVienBUS.TongPhuCap1NhanVien(nv.MaNV);
            }
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBus.GetPhongBan();
        }
        public void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVuTheoPhongBan(maPB);
        }
        public void LoadLoaiHopDong()
        {
            cmbLoaiHopDong.DataSource = loaiHopDongBUS.GetLoaiHopDong();
        }
        private void LoadLuongKhoiDiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaNV.Text))
                txtLuongCoBan.Text = chucVuBUS.GetLuongCoBanCuaChucVu(cmbChucVu.SelectedValue.ToString()).ToString();
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        public void ClearAllText()
        {
            txtMaNV.Text = string.Empty;
            cmbPhongBan.SelectedIndex = 0;
            cmbChucVu.SelectedIndex = 0;            
            cmbLoaiHopDong.SelectedIndex = 0;
            txtTaiKhoan.Text = string.Empty;
            txtMatKhau.Text = string.Empty;
            txtNhapLaiMatKhau.Text= string.Empty;
            txtCCCD_CMND.Text = string.Empty;
            txtHo.Text = string.Empty;
            txtTenLot.Text = string.Empty;
            txtTen.Text = string.Empty;
            dtpNTNS.Text = "01/01/1990";
            txtSoNha.Text = string.Empty;
            txtDuong.Text = string.Empty;
            txtPhuong_Xa.Text = string.Empty;
            txtQuan_Huyen.Text = string.Empty;
            txtTinh_ThanhPho.Text = string.Empty;
            rbNam.Checked = false;
            rbNu.Checked = false;
            rbKhac.Checked = false;
            txtSDT.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtTrinhDoHocVan.Text = string.Empty;
            dtpNgayVaoLam.Text = DateTime.Now.ToString(formatDateTime);
            dtpThoiHanHopDong.Text = DateTime.Now.ToString(formatDateTime);
            txtTinhTrang.Text = string.Empty;
            txtSoNgayPhep.Text = string.Empty;
            txtLuongCoBan.Text = string.Empty;
            txtPhuCap.Text = string.Empty;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        public void CloseCurrentForm(string maNV)
        {
            this.Close();
            Application.Run(new FrmQuanLyNhanVien(maNV));
        }
        public void Reload()
        {            
            this.Close();
            currentForm = new Thread(new ThreadStart(() => CloseCurrentForm(maNV)));
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        public string CheckMatKhau(string matKhau)
        {
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");            
            if (!passCheck.IsMatch(matKhau) || matKhau.Length > 20)
            {
                MessageBox.Show("Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!", "Lỗi", MessageBoxButtons.OK,MessageBoxIcon.Warning);
                return null;
            }
            if (txtNhapLaiMatKhau.Text != matKhau)
            {
                MessageBox.Show("Mật khẩu nhập lại không khớp", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }                    
            return matKhau;
        }
        public string ChonGioiTinh()
        {
            if(rbNam.Checked)
                return rbNam.Text;
            if (rbNu.Checked)
                return rbNu.Text;
            else
                return rbKhac.Text;
        }
        public string CheckSDT(string sdt)
        {
            Regex sdtCheck = new Regex(@"(84|0[3|5|7|8|9])+([0-9]{8})\b");
            if (!sdtCheck.IsMatch(sdt))
            {
                MessageBox.Show("Định dạng số điện thoại không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }
            return sdt;
        }
        public string CheckEmail(string email)
        {
            Regex emailCheck = new Regex("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            if (!emailCheck.IsMatch(email))
            {
                MessageBox.Show("Định dạng email không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }
            return email;
        }        
        private void txtSoNgayPhep_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        private void CheckChonGioiTinh(object sender, EventArgs e)
        {
            BatTatNut();
        }
        public bool CheckEmptyText()
        {
            if (string.IsNullOrEmpty(txtTaiKhoan.Text) || string.IsNullOrEmpty(txtMatKhau.Text) ||
                string.IsNullOrEmpty(txtNhapLaiMatKhau.Text) || string.IsNullOrEmpty(txtCCCD_CMND.Text) ||
                string.IsNullOrEmpty(txtHo.Text) || string.IsNullOrEmpty(txtTen.Text) ||
                string.IsNullOrEmpty(txtSoNha.Text) || string.IsNullOrEmpty(txtDuong.Text) ||
                string.IsNullOrEmpty(txtPhuong_Xa.Text) || string.IsNullOrEmpty(txtQuan_Huyen.Text) ||
                string.IsNullOrEmpty(txtTinh_ThanhPho.Text) || string.IsNullOrEmpty(txtSDT.Text) ||
                string.IsNullOrEmpty(txtEmail.Text) || string.IsNullOrEmpty(txtTrinhDoHocVan.Text) ||
                string.IsNullOrEmpty(txtTinhTrang.Text) || string.IsNullOrEmpty(txtSoNgayPhep.Text) ||
                string.IsNullOrEmpty(txtLuongCoBan.Text))
                return false;
            return true;
        }
        public bool CheckChonGioiTinh()
        {
            if (!rbNam.Checked && !rbNu.Checked && !rbKhac.Checked)
                return false;
            return true;
        }
        public void BatTatNut()
        {
            if (string.IsNullOrEmpty(txtMaNV.Text) && !CheckEmptyText() && !CheckChonGioiTinh() ||
             string.IsNullOrEmpty(txtMaNV.Text) && !CheckEmptyText() ||
             string.IsNullOrEmpty(txtMaNV.Text) && !CheckChonGioiTinh())
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            if (string.IsNullOrEmpty(txtMaNV.Text) && CheckEmptyText() && CheckChonGioiTinh())
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtMaNV.Text) && CheckEmptyText() && CheckChonGioiTinh())
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                return;
            }
        }
        private void EnableButtons(object sender, EventArgs e)
        {
            BatTatNut();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {
            string matKhau = CheckMatKhau(txtMatKhau.Text);
            if (string.IsNullOrEmpty(matKhau))
                return;
            string sdt = CheckSDT(txtSDT.Text);
            if (string.IsNullOrEmpty(sdt))
                return;
            string email = CheckEmail(txtEmail.Text);
            if (string.IsNullOrEmpty(email))
                return;
            string gioiTinh = ChonGioiTinh();
            if (string.IsNullOrEmpty(gioiTinh))
                return;                                     
            NhanVien newNhanVien = new NhanVien
            {
                MaNV = "",
                MaCV = cmbChucVu.SelectedValue.ToString(),
                MaLHD = cmbLoaiHopDong.SelectedValue.ToString(),
                TaiKhoan = txtTaiKhoan.Text,
                MatKhau = matKhau,
                CCCD_CMND = txtCCCD_CMND.Text,
                Ho = txtHo.Text,
                TenLot = txtTenLot.Text,
                Ten = txtTen.Text,
                NTNS = dtpNTNS.Value,
                SoNha = txtSoNha.Text,
                TenDuong = txtDuong.Text,
                Phuong_Xa = txtPhuong_Xa.Text,
                Quan_Huyen = txtQuan_Huyen.Text,
                Tinh_ThanhPho = txtTinh_ThanhPho.Text,
                GioiTinh = gioiTinh,
                SDT = sdt,
                Email = email,
                TrinhDoHocVan = txtTrinhDoHocVan.Text,
                NgayVaoLam = dtpNgayVaoLam.Value,
                ThoiHanHopDong = dtpThoiHanHopDong.Value,
                TinhTrang = txtTinhTrang.Text,
                SoNgayPhep = int.Parse(txtSoNgayPhep.Text),
                LuongCoBan = decimal.Parse(txtLuongCoBan.Text),
                //hinh
            };
            nhanVienBUS.Save(newNhanVien);                
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string matKhau = CheckMatKhau(txtMatKhau.Text);
            if (string.IsNullOrEmpty(matKhau))
                return;
            string sdt = CheckSDT(txtSDT.Text);
            if (string.IsNullOrEmpty(sdt))
                return;
            string email = CheckEmail(txtEmail.Text);
            if (string.IsNullOrEmpty(email))
                return;
            string gioiTinh = ChonGioiTinh();
            if (string.IsNullOrEmpty(gioiTinh))
                return;
            NhanVien newNhanVien = new NhanVien
            {
                MaNV = txtMaNV.Text,
                MaCV = cmbChucVu.SelectedValue.ToString(),
                MaLHD = cmbLoaiHopDong.SelectedValue.ToString(),
                TaiKhoan = txtTaiKhoan.Text,
                MatKhau = matKhau,
                CCCD_CMND = txtCCCD_CMND.Text,
                Ho = txtHo.Text,
                TenLot = txtTenLot.Text,
                Ten = txtTen.Text,
                NTNS = dtpNTNS.Value,
                SoNha = txtSoNha.Text,
                TenDuong = txtDuong.Text,
                Phuong_Xa = txtPhuong_Xa.Text,
                Quan_Huyen = txtQuan_Huyen.Text,
                Tinh_ThanhPho = txtTinh_ThanhPho.Text,
                GioiTinh = gioiTinh,
                SDT = sdt,
                Email = email,
                TrinhDoHocVan = txtTrinhDoHocVan.Text,
                NgayVaoLam = dtpNgayVaoLam.Value,
                ThoiHanHopDong = dtpThoiHanHopDong.Value,
                TinhTrang = txtTinhTrang.Text,
                SoNgayPhep = int.Parse(txtSoNgayPhep.Text),
                LuongCoBan = decimal.Parse(txtLuongCoBan.Text),
                //hinh
            };
            if (!nhanVienBUS.Save(newNhanVien))
                return;
            if(lblMaNV_DN.Text == txtMaNV.Text)
                frmQuanLyNhanVien_Load(sender, e);
            else
            {
                ClearAllText();
                LoadNhanVien();
            }            
        }      
        private void btnXoa_Click(object sender, EventArgs e)
        {
            NhanVien newNhanVien = new NhanVien
            {
                MaNV = txtMaNV.Text,                
            };
            nhanVienBUS.Delete(newNhanVien.MaNV);
            ClearAllText();
            LoadNhanVien();
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(lblMaNV_DN.Text);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }              
        private void btnThemPhuCap_Click(object sender, EventArgs e)
        {
            FrmTongPhuCapMotNhanVien frmOpen = new FrmTongPhuCapMotNhanVien();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void txtLuongCoBan_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar) && e.KeyChar != '.')
            {
                e.Handled = true;
            }
            if (e.KeyChar == '.' && (sender as TextBox).Text.IndexOf('.') > -1)
            {
                e.Handled = true;
            }
            if (e.KeyChar == '-' && (sender as TextBox).Text.Length > 0)
            {
                e.Handled = true;
            }
        }
        private void txtCCCD_CMND_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        private void cbHienThiMatKhau_CheckedChanged(object sender, EventArgs e)
        {
            if (cbHienThiMatKhau.Checked)            
                txtMatKhau.UseSystemPasswordChar = txtNhapLaiMatKhau.UseSystemPasswordChar = false;
            else
                txtMatKhau.UseSystemPasswordChar = txtNhapLaiMatKhau.UseSystemPasswordChar = true;
        }
        
        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
            {
                LoadNhanVien();
                return;
            }
            LoadNhanVienTimKiem(txtTimKiem.Text);
        }
        private void dgvThongTinNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaNV.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[0].Value.ToString();
            cmbPhongBan.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[1].Value.ToString();
            cmbChucVu.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[2].Value.ToString();
            cmbLoaiHopDong.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[3].Value.ToString();
            txtTaiKhoan.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[4].Value.ToString();
            txtCCCD_CMND.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[5].Value.ToString();
            txtHo.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[6].Value.ToString();
            txtTenLot.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[7].Value.ToString();
            txtTen.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[8].Value.ToString();
            dtpNTNS.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[9].Value.ToString();
            txtSoNha.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[10].Value.ToString();
            txtDuong.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[11].Value.ToString();
            txtPhuong_Xa.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[12].Value.ToString();
            txtQuan_Huyen.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[13].Value.ToString();
            txtTinh_ThanhPho.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[14].Value.ToString();
            string gioiTinh = dgvThongTinNhanVien.Rows[rowIndex].Cells[15].Value.ToString();
            switch (gioiTinh)
            {
                case "Nam":
                    rbNam.Checked = true;
                    break;
                case "Nữ":
                    rbNu.Checked = true;
                    break;
                case "Khác":
                    rbKhac.Checked = true;
                    break;
            }
            txtSDT.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[16].Value.ToString();
            txtEmail.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[17].Value.ToString();
            txtTrinhDoHocVan.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[18].Value.ToString();
            dtpNgayVaoLam.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[19].Value.ToString();
            dtpThoiHanHopDong.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[20].Value.ToString();
            txtTinhTrang.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[21].Value.ToString();
            txtSoNgayPhep.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[22].Value.ToString();
            txtLuongCoBan.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[23].Value.ToString();
            txtPhuCap.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[24].Value.ToString();
        }
    }
}
