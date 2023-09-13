﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmThongTinTaiKhoan : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBus;
        private readonly List<ThaoTac> listThaoTac;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string formatDate = "dd/MM/yyyy";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmThongTinTaiKhoan(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBus = new ThaoTacBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Tài khoản").MaGD;
            listThaoTac = thaoTacBus.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            this.maNV = maNV;
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            btnDoiMatKhau.Enabled = false;
        }
        private void FrmThongTinTaiKhoan_Load(object sender, EventArgs e)
        {
            DisableDisplay();
            btnDoiMatKhau.Enabled = false;
            LoadThongTinTaiKhoan();
            LoadThongTinDangNhap();
        }
        private void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        private void DisableDisplay()
        {
            List<TextBox> listDisplay = new List<TextBox> { txtMaNV, txtPhongBan, txtChucVu, txtLoaiHopDong, txtTaiKhoan, txtTrinhDoHocVan, txtNgayVaoLam, txtThoiHanHopDong, txtTinhTrang, txtSoNgayPhep, txtLuongCoBan, txtPhuCap};
            for(int i =0; i< listDisplay.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
            }
        }
        private void LoadThongTinTaiKhoan()
        {
            Enabled = false;
            txtMaNV.Text = nv.MaNV;
            txtPhongBan.Text = nv.ChucVu.PhongBan.TenPhongBan;
            txtChucVu.Text = nv.ChucVu.TenChucVu;
            txtLoaiHopDong.Text = nv.LoaiHopDong.TenLoaiHopDong;
            txtTaiKhoan.Text = nv.TaiKhoan;
            txtCCCD.Text = nv.CCCD;
            txtHo.Text = nv.Ho;
            txtTenLot.Text = nv.TenLot;
            txtTen.Text = nv.Ten;
            dtpNTNS.Text = nv.NTNS.ToString(formatDate);
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
            txtNgayVaoLam.Text = nv.NgayVaoLam.ToString(formatDate);
            txtThoiHanHopDong.Text = nv.ThoiHanHopDong.ToString(formatDate);
            txtTinhTrang.Text = nv.TinhTrang;
            txtSoNgayPhep.Text = nv.SoNgayPhep.ToString();
            txtLuongCoBan.Text = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
            txtPhuCap.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(maNV));
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////   
        private void Reload()
        {
            FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void DangXuat()
        {
            FrmDangNhap frmOpen = new FrmDangNhap();
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        //////////////////////////////////////////////////////////////////////////////
        private void ClearMatKhauText()
        {
            txtMatKhauCu.Text = string.Empty;
            txtMatKhauMoi.Text = string.Empty;
            txtNhapLaiMatKhau.Text = string.Empty;
        }
        //////////////////////////////////////////////////////////////////////////////
        private string CheckMatKhau(string matKhau)
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
        private string CheckSDT(string sdt)
        {
            Regex sdtCheck = new Regex(@"(84|0[3|5|7|8|9])+([0-9]{8})\b");
            if (!sdtCheck.IsMatch(sdt))
            {
                MessageBox.Show("Định dạng số điện thoại không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }
            return sdt;
        }
        private string CheckEmail(string email)
        {
            Regex emailCheck = new Regex("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            if (!emailCheck.IsMatch(email))
            {
                MessageBox.Show("Định dạng email không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }
            return email;
        }
        private string CheckCCCD(string cccd)
        {
            Regex cccdCheck = new Regex(@"^(001|002|004|006|008|010|011|012|014|015|017|019|020|022|024|025|026|027|030|031|033|034|035|036|037|
                                        038|040|042|044|045|046|048|049|051|052|054|056|058|060|062|064|066|067|068|070|072|074|075|077|079|080|
                                        082|083|084|086|087|089|091|092|093|094|095|096)[02-3][0-9]{2}[0-9]{6}$");
            if (!cccdCheck.IsMatch(cccd))
            {
                MessageBox.Show("Định dạng CCCD không hợp lệ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return null;
            }
            return cccd;
        }
        private void CheckTextMatKhau(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtMatKhauMoi.Text) || string.IsNullOrEmpty(txtMatKhauMoi.Text) || string.IsNullOrEmpty(txtNhapLaiMatKhau.Text))
                btnDoiMatKhau.Enabled = false;
            else
                btnDoiMatKhau.Enabled = true;
        }        
        private bool XacNhanMatKhau(string matKhau)
        {
            if (!BCrypt.Net.BCrypt.Verify(matKhau, nv.MatKhau))
            {
                MessageBox.Show("Mật khẩu cũ không khớp", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            else
                return true;               
        }
        //////////////////////////////////////////////////////////////////////////////
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
        private string ChonGioiTinh()
        {
            if (rbNam.Checked)
                return rbNam.Text;
            if (rbNu.Checked)
                return rbNu.Text;
            else
                return rbKhac.Text;
        }
        private bool CheckEmptyText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtCCCD, txtHo, txtTen, txtSoNha, txtDuong, txtPhuong_Xa, txtQuan_Huyen, txtTinh_ThanhPho, txtSDT, txtEmail};
            for (int i = 0; i < listTextBox.Count; i++)
            {
                if (string.IsNullOrEmpty(listTextBox[i].Text))
                {
                    btnLuu.Enabled = false;
                    return false;
                }
            }
            return true;
        }
        private void EnableButton(object sender, EventArgs e)
        {
            if (CheckEmptyText())
            {
                btnLuu.Enabled = true;
                return;
            }
        }
        //////////////////////////////////////////////////////////////////////////////       
        private void LichSuThaoTac(string thaoTac, string maTT)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private string GetValueAsString(NhanVien nhanVien, string propertyName)
        {
            object value = typeof(NhanVien).GetProperty(propertyName)?.GetValue(nhanVien);
            if (propertyName == "NTNS")
            {
                DateTime dateValue = (DateTime)value;
                return dateValue.ToString("yyyy-MM-dd");
            }
            return value?.ToString() ?? string.Empty;
        }
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            string[] properties = { "CCCD", "Ho", "TenLot", "Ten", "NTNS", "GioiTinh", "SDT", "Email" };
            string[] labels = { "CCCD", "Họ", "Tên lót", "Tên", "NTNS", "Giới tính", "SDT", "Email" };
            string[] values = { txtCCCD.Text, txtHo.Text, txtTenLot.Text, txtTen.Text, dtpNTNS.Text, ChonGioiTinh(), txtSDT.Text, txtEmail.Text };
            for (int i = 0; i < properties.Length; i++)
            {
                string currentValue = GetValueAsString(nhanVien, properties[i]);
                if (values[i] != currentValue)
                    changes.Add($"- {labels[i]}: {currentValue} -> {labels[i]}: {values[i]}");
            }
            return string.Join("\n", changes);
        }
        private void btnDatLaiThongTin_Click(object sender, EventArgs e)
        {
            LoadThongTinTaiKhoan();
        }
        private void btnLuu_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(CheckSDT(txtSDT.Text)))
                return;
            if (string.IsNullOrEmpty(CheckEmail(txtEmail.Text)))
                return;
            if (string.IsNullOrEmpty(CheckCCCD(txtCCCD.Text)))
                return;
            string gioiTinh = ChonGioiTinh();
            if (string.IsNullOrEmpty(gioiTinh))
                return;
            string chiTietSua = CheckChange();
            nv.CCCD = txtCCCD.Text;
            nv.Ho = txtHo.Text;
            nv.TenLot = txtTenLot.Text;
            nv.Ten = txtTen.Text;
            nv.NTNS = DateTime.Parse(dtpNTNS.Text);
            nv.SoNha = txtSoNha.Text;
            nv.TenDuong = txtDuong.Text;
            nv.Phuong_Xa = txtPhuong_Xa.Text;
            nv.Quan_Huyen = txtQuan_Huyen.Text;
            nv.Tinh_ThanhPho = txtTinh_ThanhPho.Text;
            nv.GioiTinh = gioiTinh;
            nv.SDT = txtSDT.Text;
            nv.Email = txtEmail.Text;
            if (nhanVienBUS.Save(nv))
            {
                string thaoTac = "Cập nhật thông tin cá nhân";
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += $":\n{chiTietSua}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            Reload();
        }
        private void cbHienThiMatKhau_CheckedChanged(object sender, EventArgs e)
        {
            if(cbHienThiMatKhau.Checked)
            {
                txtMatKhauCu.UseSystemPasswordChar = false;
                txtMatKhauMoi.UseSystemPasswordChar = false;
                txtNhapLaiMatKhau.UseSystemPasswordChar = false;
            }
            else
            {
                txtMatKhauCu.UseSystemPasswordChar = true;
                txtMatKhauMoi.UseSystemPasswordChar = true;
                txtNhapLaiMatKhau.UseSystemPasswordChar = true;
            }
        }        
        private void btnDoiMatKhau_Click(object sender, EventArgs e)
        {
            if (!XacNhanMatKhau(txtMatKhauCu.Text))
                return;
            string matKhau = CheckMatKhau(txtMatKhauMoi.Text);
            if (matKhau == null)
                return;
            NhanVien nhanVien = new NhanVien
            {
                MaNV = txtMaNV.Text,
                MatKhau = matKhau,
            };
            if (nhanVienBUS.Save(nhanVien))
            {
                string thaoTac = $"Nhân viên {txtMaNV.Text} đổi mật khẩu";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Đổi mật khẩu")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                DangXuat();
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void btnThemPhuCap_Click(object sender, EventArgs e)
        {
            FrmChiTietPhuCapMotNhanVien frmOpen = new FrmChiTietPhuCapMotNhanVien(maNV,maNV,"thongTin");
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
    }
}
