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
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmThongTinTaiKhoan : Form
    {
        Thread currentForm;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly string maNV;
        string formatDateTime = "dd/MM/yyyy";
        public FrmThongTinTaiKhoan(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            this.maNV = maNV;
            txtMaNV.ReadOnly = true;
            txtPhongBan.ReadOnly = true;
            txtChucVu.ReadOnly = true;
            txtLoaiHopDong.ReadOnly = true;
            txtTaiKhoan.ReadOnly = true;
            txtTrinhDoHocVan.ReadOnly = true;
            txtNgayVaoLam.ReadOnly = true;
            txtThoiHanHopDong.ReadOnly = true;
            txtTinhTrang.ReadOnly = true;
            txtSoNgayPhep.ReadOnly = true;
            txtLuongCoBan.ReadOnly = true;
            txtPhuCap.ReadOnly = true;           
        }
        private void FrmThongTinTaiKhoan_Load(object sender, EventArgs e)
        {
            LoadThongTinTaiKhoan();
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
        private void LoadThongTinTaiKhoan()
        {
            NhanVien nv = nhanVienBUS.ThongTinNhanVienDangNhap(maNV);
            txtMaNV.Text = nv.MaNV;
            txtPhongBan.Text = nv.ChucVu.PhongBan.TenPhongBan;
            txtChucVu.Text = nv.ChucVu.TenChucVu;
            txtLoaiHopDong.Text = nv.LoaiHopDong.TenLoaiHopDong;
            txtTaiKhoan.Text = nv.TaiKhoan;
            txtCCCD_CMND.Text = nv.CCCD_CMND;
            txtHo.Text = nv.Ho;
            txtTenLot.Text = nv.TenLot;
            txtTen.Text = nv.Ten;
            dtpNTNS.Text = nv.NTNS.ToString(formatDateTime);
            txtSoNha.Text = nv.SoNha;
            txtDuong.Text = nv.TenDuong;
            txtPhuong_Xa.Text = nv.Phuong_Xa;
            txtQuan_Huyen.Text = nv.Quan_Huyen;
            txtTinh_ThanhPho.Text = nv.Tinh_ThanhPho;
            string gioiTinh = nv.GioiTinh;
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
            txtSDT.Text = nv.SDT;
            txtEmail.Text = nv.Email;
            txtTrinhDoHocVan.Text = nv.TrinhDoHocVan;
            txtNgayVaoLam.Text = nv.NgayVaoLam.ToString(formatDateTime);
            txtThoiHanHopDong.Text = nv.ThoiHanHopDong.ToString(formatDateTime);
            txtTinhTrang.Text = nv.TinhTrang;
            txtSoNgayPhep.Text = nv.SoNgayPhep.ToString();
            txtLuongCoBan.Text = nv.LuongCoBan.ToString();
            txtPhuCap.Text = nhanVienBUS.TongPhuCap1NhanVien(maNV).ToString();
        }
        //////////////////////////////////////////////////////////////////////////////        
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////
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
        private void txtCCCD_CMND_KeyPress(object sender, KeyPressEventArgs e)
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
        public string ChonGioiTinh()
        {
            if (rbNam.Checked)
                return rbNam.Text;
            if (rbNu.Checked)
                return rbNu.Text;
            else
                return rbKhac.Text;
        }
        //////////////////////////////////////////////////////////////////////////////
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void txtTen_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtHo.Text) || string.IsNullOrEmpty(txtTen.Text) ||
               string.IsNullOrEmpty(txtCCCD_CMND.Text) || string.IsNullOrEmpty(txtSoNha.Text) ||
               string.IsNullOrEmpty(txtDuong.Text) || string.IsNullOrEmpty(txtPhuong_Xa.Text) ||
               string.IsNullOrEmpty(txtQuan_Huyen.Text) || string.IsNullOrEmpty(txtTinh_ThanhPho.Text) ||
               string.IsNullOrEmpty(txtSDT.Text) || string.IsNullOrEmpty(txtEmail.Text))
                btnLuu.Enabled = false;
            else
                btnLuu.Enabled = true;
        }

        private void btnDatLaiThongTin_Click(object sender, EventArgs e)
        {
            LoadThongTinTaiKhoan();
        }

        private void btnLuu_Click(object sender, EventArgs e)
        {
            string sdt = CheckSDT(txtSDT.Text);
            if (string.IsNullOrEmpty(sdt))
                return;
            string email = CheckEmail(txtEmail.Text);
            if (string.IsNullOrEmpty(email))
                return;
            NhanVien nv = nhanVienBUS.ThongTinNhanVienDangNhap(maNV);
            nv.CCCD_CMND = txtCCCD_CMND.Text;
            nv.Ho = txtHo.Text;
            nv.TenLot = txtTenLot.Text;
            nv.Ten = txtTen.Text;
            nv.NTNS = DateTime.Parse(dtpNTNS.Text);
            nv.SoNha = txtSoNha.Text;
            nv.TenDuong = txtDuong.Text;
            nv.Phuong_Xa = txtPhuong_Xa.Text;
            nv.Quan_Huyen = txtQuan_Huyen.Text;
            nv.Tinh_ThanhPho = txtTinh_ThanhPho.Text;
            nv.GioiTinh = ChonGioiTinh();
            nv.SDT = txtSDT.Text;
            nv.Email = txtEmail.Text;
            nhanVienBUS.Save(nv);
        }
    }
}
