using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Net.NetworkInformation;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;
using System.Threading.Tasks;
using System.Web;
using System.Web.Services.Protocols;
using System.Windows.Forms;
using WECPOFLogic;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ListView;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyNhanVien : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly QuanLyPhongBanBUS phongBanBus;
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private IEnumerable<NhanVienViewModel> danhSachNhanVien;
        private IEnumerable<NhanVienViewModel> danhSachNhanVienTimKiem;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string maNV;
        private readonly string hoTen;
        private readonly NhanVien nv;


        public FrmQuanLyNhanVien(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            phongBanBus = new QuanLyPhongBanBUS();
            chucVuBUS = new QuanLyChucVuBUS();
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            MessageBoxManager.Register_OnceOnly();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            hoTen = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
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
            txtNgayKhoa.ReadOnly = true;
            txtSoTienNo.ReadOnly = true;
            btnThem.Enabled = false;
            btnSua.Enabled = false;
            btnXoa.Enabled = false;
            btnThemPhuCap.Enabled = false;
            btnMoKhoa.Enabled = false;
            dtpNTNS.Text = "01/01/1990";          
            
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        public void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadNhanVien()
        {
            Enabled = false;
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
                dgvThongTinNhanVien.Rows[rowAdd].Cells[5].Value = nv.CCCD;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[6].Value = nv.Ho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[7].Value = nv.TenLot;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[8].Value = nv.Ten;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[9].Value = nv.NTNS.ToString(formatDate);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[10].Value = nv.SoNha;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[11].Value = nv.TenDuong;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[12].Value = nv.Phuong_Xa;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[13].Value = nv.Quan_Huyen;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[14].Value = nv.Tinh_ThanhPho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[15].Value = nv.GioiTinh;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[16].Value = nv.SDT;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[17].Value = nv.Email;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[18].Value = nv.TrinhDoHocVan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[19].Value = nv.NgayVaoLam.ToString(formatDate);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[20].Value = nv.ThoiHanHopDong.ToString(formatDate);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[21].Value = nv.TinhTrang;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[22].Value = nv.SoNgayPhep;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nv.MaNV));
                dgvThongTinNhanVien.Rows[rowAdd].Cells[25].Value = nv.NgayKhoa.ToString();
                if (nv.SoTienNo == null)
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", 0.000);
                else
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", nv.SoTienNo);
            }
            Enabled = true;
        }
        private void LoadNhanVienTimKiem(string timKiem)
        {
            this.UseWaitCursor = true;
            Enabled = false;            
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
                dgvThongTinNhanVien.Rows[rowAdd].Cells[5].Value = nv.CCCD;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[6].Value = nv.Ho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[7].Value = nv.TenLot;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[8].Value = nv.Ten;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[9].Value = nv.NTNS.ToString(formatDate);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[10].Value = nv.SoNha;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[11].Value = nv.TenDuong;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[12].Value = nv.Phuong_Xa;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[13].Value = nv.Quan_Huyen;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[14].Value = nv.Tinh_ThanhPho;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[15].Value = nv.GioiTinh;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[16].Value = nv.SDT;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[17].Value = nv.Email;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[18].Value = nv.TrinhDoHocVan;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[19].Value = nv.NgayVaoLam.ToString(formatDate);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[20].Value = nv.ThoiHanHopDong.ToString(formatDate);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[21].Value = nv.TinhTrang;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[22].Value = nv.SoNgayPhep;
                dgvThongTinNhanVien.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
                dgvThongTinNhanVien.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nv.MaNV));
                dgvThongTinNhanVien.Rows[rowAdd].Cells[25].Value = nv.NgayKhoa.ToString();
                if(nv.SoTienNo == null)
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", 0.000);
                else
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", nv.SoTienNo);
            }
            this.UseWaitCursor = false;
            Enabled = true;
        }
        public void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBus.GetPhongBan();
        }
        public void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVu().Where(cv => cv.MaPB == maPB).ToList();
        }
        public void LoadLoaiHopDong()
        {
            cmbLoaiHopDong.DataSource = loaiHopDongBUS.GetLoaiHopDong();
        }
        private void LoadLuongKhoiDiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaNV.Text) || string.IsNullOrEmpty(txtLuongCoBan.Text))
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
            txtCCCD.Text = string.Empty;
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
            dtpNgayVaoLam.Text = DateTime.Now.ToString();
            dtpThoiHanHopDong.Text = DateTime.Now.ToString();
            txtTinhTrang.Text = string.Empty;
            txtSoNgayPhep.Text = string.Empty;
            txtPhuCap.Text = string.Empty;
            txtTaiKhoan.ReadOnly = false;
            txtMatKhau.Enabled = txtNhapLaiMatKhau.Enabled = true;
            txtNgayKhoa.Text = string.Empty;
            txtSoTienNo.Text = string.Empty;
            
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        public void Reload()
        {
            FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        public string CheckMatKhau(string matKhau)
        {
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
            if (!passCheck.IsMatch(matKhau) || matKhau.Length > 20)
            {
                MessageBox.Show("Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
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
            if (rbNam.Checked)
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
        public string CheckCCCD(string cccd)
        {
            Regex cccdCheck = new Regex(@"^(001|002|004|006|008|010|011|012|014|015|017|019|020|022|024|025|026|027|030|031|033|034|035|036|037|
                                        038|040|042|044|045|046|048|049|051|052|054|056|058|060|062|064|066|067|068|070|072|074|075|077|079|080|
                                        082|083|084|086|087|089|091|092|093|094|095|096)[02-3][0-9]{2}[0-9]{6}$");
            if (!cccdCheck.IsMatch(cccd))
            {
                MessageBox.Show("Định dạng CCCD/CMND không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }
            return cccd;
        }
        private void CheckChonGioiTinh(object sender, EventArgs e)
        {
            BatTatNut();
        }
        public bool CheckEmptyText()
        {
            if (string.IsNullOrEmpty(txtTaiKhoan.Text) || string.IsNullOrEmpty(txtMatKhau.Text) ||
                string.IsNullOrEmpty(txtNhapLaiMatKhau.Text) || string.IsNullOrEmpty(txtCCCD.Text) ||
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
        public bool CheckEmptyTextSua()
        {
            if (string.IsNullOrEmpty(txtCCCD.Text) ||
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
             string.IsNullOrEmpty(txtMaNV.Text) && !CheckChonGioiTinh() || !CheckEmptyTextSua())
            {
                btnThem.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                btnThemPhuCap.Enabled = false;
                cbHienThiMatKhau.Enabled = true;
                return;
            }
            if (string.IsNullOrEmpty(txtMaNV.Text) && CheckEmptyText() && CheckChonGioiTinh())
            {
                btnThem.Enabled = true;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                txtMatKhau.Enabled = txtNhapLaiMatKhau.Enabled = true;
                cbHienThiMatKhau.Enabled = true;
                txtTaiKhoan.ReadOnly = false;
                return;
            }
            if (!string.IsNullOrEmpty(txtMaNV.Text) && CheckEmptyTextSua() && CheckChonGioiTinh())
            {
                btnThem.Enabled = false;
                btnSua.Enabled = true;
                btnXoa.Enabled = true;
                btnThemPhuCap.Enabled = true;
                txtMatKhau.Enabled = txtNhapLaiMatKhau.Enabled = false;
                cbHienThiMatKhau.Enabled = false;
                txtTaiKhoan.ReadOnly= true;
                return;
            }
        }
        private void EnableButtons(object sender, EventArgs e)
        {
            BatTatNut();            
        }
        private void txtNgayKhoa_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtNgayKhoa.Text))
            {
                btnMoKhoa.Enabled = false;
                return;
            }
            else
            {
                btnMoKhoa.Enabled = true;
                return;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void txtSoNgayPhep_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        private void txtSDT_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
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
        private void txtCCCD_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (!char.IsControl(e.KeyChar) && !char.IsDigit(e.KeyChar))
            {
                e.Handled = true;
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void btnThem_Click(object sender, EventArgs e)
        {            
            if (string.IsNullOrEmpty(CheckMatKhau(txtMatKhau.Text)))
                return;            
            if (string.IsNullOrEmpty(CheckSDT(txtSDT.Text)))
                return;            
            if (string.IsNullOrEmpty(CheckEmail(txtEmail.Text)))
                return;            
            if(string.IsNullOrEmpty(CheckCCCD(txtCCCD.Text)))
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
                MatKhau = txtMatKhau.Text,
                CCCD = txtCCCD.Text,
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
                SDT = txtSDT.Text,
                Email = txtEmail.Text,
                TrinhDoHocVan = txtTrinhDoHocVan.Text,
                NgayVaoLam = dtpNgayVaoLam.Value,
                ThoiHanHopDong = dtpThoiHanHopDong.Value,
                TinhTrang = txtTinhTrang.Text,
                SoNgayPhep = int.Parse(txtSoNgayPhep.Text),
                LuongCoBan = decimal.Parse(txtLuongCoBan.Text),
                //hinh
            };
            if (nhanVienBUS.Save(newNhanVien))
            {                
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " thêm nhân viên " + hoTen,
                };
                lichSuThaoTacBUS.Save(newLstt);
            }
            Reload();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            /*string matKhau = CheckMatKhau(txtMatKhau.Text);//
            if (string.IsNullOrEmpty(matKhau))//
                return;//*/
            if (string.IsNullOrEmpty(CheckSDT(txtSDT.Text)))
                return;
            if (string.IsNullOrEmpty(CheckEmail(txtEmail.Text)))
                return;
            if (string.IsNullOrEmpty(CheckCCCD(txtCCCD.Text)))
                return;
            string gioiTinh = ChonGioiTinh();
            if (string.IsNullOrEmpty(gioiTinh))
                return;
            NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text);                     
            nhanVien.MaCV = cmbChucVu.SelectedValue.ToString();
            nhanVien.MaLHD = cmbLoaiHopDong.SelectedValue.ToString();
            /*nhanVien.MatKhau = matKhau;//*/
            nhanVien.CCCD = txtCCCD.Text;
            nhanVien.Ho = txtHo.Text;
            nhanVien.TenLot = txtTenLot.Text;
            nhanVien.Ten = txtTen.Text;
            nhanVien.NTNS = dtpNTNS.Value;
            nhanVien.SoNha = txtSoNha.Text;
            nhanVien.TenDuong = txtDuong.Text;
            nhanVien.Phuong_Xa = txtPhuong_Xa.Text;
            nhanVien.Quan_Huyen = txtQuan_Huyen.Text;
            nhanVien.Tinh_ThanhPho = txtTinh_ThanhPho.Text;
            nhanVien.GioiTinh = gioiTinh;
            nhanVien.SDT = txtSDT.Text;
            nhanVien.Email = txtEmail.Text;
            nhanVien.TrinhDoHocVan = txtTrinhDoHocVan.Text;
            nhanVien.NgayVaoLam = dtpNgayVaoLam.Value;
            nhanVien.ThoiHanHopDong = dtpThoiHanHopDong.Value;
            nhanVien.TinhTrang = txtTinhTrang.Text;
            nhanVien.SoNgayPhep = int.Parse(txtSoNgayPhep.Text);
            nhanVien.LuongCoBan = decimal.Parse(txtLuongCoBan.Text);
            //hinh
            if (nhanVienBUS.Save(nhanVien))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + hoTen + " chỉnh sửa nhân viên '" + txtMaNV.Text + "'",
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }                      
        }      
        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtMaNV.Text == maNV)
            {
                MessageBox.Show("Không thể xoá tài khoản đang đăng nhập", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                ClearAllText();
                return;
            }
                
            NhanVien newNhanVien = new NhanVien
            {
                MaNV = txtMaNV.Text,                
            };
            if (nhanVienBUS.Delete(newNhanVien.MaNV))
            {
                string hoTen = txtHo.Text + " " + txtTenLot.Text + " " + txtTen.Text;
                LichSuThaoTac newLstt = new LichSuThaoTac
                {                    
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + this.hoTen + " xoá nhân viên " + hoTen,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
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
            txtMatKhau.Enabled = txtNhapLaiMatKhau.Enabled = true;
            txtTaiKhoan.ReadOnly = false;
        }              
        private void btnThemPhuCap_Click(object sender, EventArgs e)
        {
            FrmChiTietPhuCapMotNhanVien frmOpen = new FrmChiTietPhuCapMotNhanVien(maNV,txtMaNV.Text,"nhanVien");
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnMoKhoa_Click(object sender, EventArgs e)
        {
            string hoTen = txtHo.Text + " " + txtTenLot.Text + " " + txtTen.Text;
            NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text);
            nhanVien.NgayKhoa = null;
            MessageBoxManager.Yes = "Có";
            MessageBoxManager.No = "Không";
            DialogResult ketQua = MessageBox.Show("Xác nhận mở khoá tài khoản của " + txtMaNV.Text + " - " + hoTen + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ketQua == DialogResult.Yes)
            {
                if (nhanVienBUS.Save(nhanVien))
                {

                    LichSuThaoTac newLstt = new LichSuThaoTac
                    {
                        NgayGio = DateTime.Now.ToString(formatDateTime),
                        MaNV = maNV,
                        ThaoTacThucHien = "Nhân viên " + this.hoTen + " mở khoá tài khoản cho nhân viên " + hoTen,
                    };
                    lichSuThaoTacBUS.Save(newLstt);
                    Reload();
                }
            }
            else
                return;            
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
                LoadNhanVien();
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
            txtCCCD.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[5].Value.ToString();
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
            txtLuongCoBan.Text = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text).LuongCoBan.ToString();
            txtPhuCap.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(txtMaNV.Text));
            txtNgayKhoa.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[25].Value.ToString();
            txtSoTienNo.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[26].Value.ToString();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadNhanVienTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        
    }
}
