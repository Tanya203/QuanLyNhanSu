using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;
using WECPOFLogic;

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
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<NhanVienViewModel> danhSachNhanVien;
        private IEnumerable<NhanVienViewModel> danhSachNhanVienTimKiem;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string maNV;
        private readonly string maCV;
        private readonly string maGD;
        private bool checkThaoTac;
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
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý nhân viên").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tc => tc.MaGD == maGD).ToList();            
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkThaoTac = false;
            MessageBoxManager.Register_OnceOnly();
        }
        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
        {
            cmbPhongBan.DisplayMember = "TenPhongBan";
            cmbPhongBan.ValueMember = "MaPB";
            cmbChucVu.DisplayMember = "TenChucVu";
            cmbChucVu.ValueMember = "MaCV";
            cmbLoaiHopDong.DisplayMember = "TenLoaiHopDong";
            cmbLoaiHopDong.ValueMember = "MaLHD";
            InputStatus(false);
            PhanQuyen();
            LoadNhanVien();
            LoadPhongBan();
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
            LoadLoaiHopDong();
            LoadThongTinDangNhap();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
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
        private void PhanQuyen()
        {
            foreach (PhanQuyen qh in phanQuyen)
            {
                if(qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    InputStatus(true);
                    checkThaoTac = true;
                    continue;
                }
                if(qh.QuyenHan.TenQuyenHan.Contains("Truy cập") && qh.CapQuyen && checkThaoTac)
                {
                    btnThemPhuCap.Visible = true;
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<object> listInput = new List<object> { cmbChucVu, cmbLoaiHopDong, cmbPhongBan, txtTaiKhoan, txtMatKhau, txtNhapLaiMatKhau,
                                                        txtCCCD, txtHo, txtTenLot, txtTen, dtpNTNS, txtSoNha, txtDuong, txtPhuong_Xa, txtQuan_Huyen, 
                                                        txtTinh_ThanhPho, rbNam, rbNu, rbKhac, txtSDT, txtEmail, txtTrinhDoHocVan, dtpNgayVaoLam, dtpThoiHanHopDong, 
                                                        txtTinhTrang, txtSoNgayPhep, txtLuongCoBan};
            if (!value)
                listInput.AddRange(new List<object> { txtMaNV, txtPhuCap, txtNgayKhoa, txtSoTienNo });
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }               
                else if (listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
                else if(listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
                else if (listInput[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
            }                  
        }
        private void ButtonStatus(bool value)
        {
            List<object> listButtons = new List<object>() { btnThem, btnSua, btnXoa, btnHuy, btnMoKhoa, btnKhoa, cbHienThiMatKhau, rbNam };
            if (!value)
                listButtons.Add(btnThemPhuCap);
            for (int i = 0; i < listButtons.Count; i++)
            {
                if (listButtons[i] is Button)
                {
                    typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                    if(value && listButtons[i] != btnHuy)
                        typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
                    continue;
                }
                else if (listButtons[i] is CheckBox)
                {
                    typeof(CheckBox).GetProperty("Visible").SetValue(listButtons[i], value);
                    continue;
                }               
                else if(listButtons[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Checked").SetValue(listButtons[i], true);
                    continue;
                }
            }
        }
        private void LoadNhanVien()
        {
            Enabled = false;
            dgvThongTinNhanVien.Rows.Clear();
            if (checkThaoTac)
                danhSachNhanVien = nhanVienBUS.GetAllNhanVien();
            else
                danhSachNhanVien = nhanVienBUS.GetAllNhanVien().Where(nv => nv.TenPhongBan == this.nv.ChucVu.PhongBan.TenPhongBan);
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
                dgvThongTinNhanVien.Rows[rowAdd].Cells[25].Value = nv.NgayKhoa.ToString();
                if (checkThaoTac)
                {
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nv.MaNV));
                    if (nv.SoTienNo == null)
                        dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", 0.000);
                    else
                        dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", nv.SoTienNo);
                }
            }
            Enabled = true;
        }
        private void LoadNhanVienTimKiem(string timKiem)
        {
            this.UseWaitCursor = true;
            Enabled = false;            
            dgvThongTinNhanVien.Rows.Clear();
            if (checkThaoTac)
                danhSachNhanVienTimKiem = nhanVienBUS.SearchNhanVien(timKiem);
            else
                danhSachNhanVienTimKiem = nhanVienBUS.SearchNhanVien(timKiem).Where(nv => nv.TenPhongBan == this.nv.ChucVu.PhongBan.TenPhongBan);
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
                dgvThongTinNhanVien.Rows[rowAdd].Cells[25].Value = nv.NgayKhoa.ToString();
                if (checkThaoTac)
                {
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[23].Value = String.Format(fVND, "{0:N3} ₫", nv.LuongCoBan);
                    dgvThongTinNhanVien.Rows[rowAdd].Cells[24].Value = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nv.MaNV));
                    if (nv.SoTienNo == null)
                        dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", 0.000);
                    else
                        dgvThongTinNhanVien.Rows[rowAdd].Cells[26].Value = String.Format(fVND, "{0:N3} ₫", nv.SoTienNo);
                }
            }
            this.UseWaitCursor = false;
            Enabled = true;
        }
        private void LoadPhongBan()
        {
            cmbPhongBan.DataSource = phongBanBus.GetPhongBan();
            AutoAdjustComboBox(cmbPhongBan);
        }
        private void LoadChucVuTheoPhongBan(string maPB)
        {
            cmbChucVu.DataSource = chucVuBUS.GetChucVu().Where(cv => cv.MaPB == maPB).ToList();
            AutoAdjustComboBox(cmbChucVu);
        }
        private void LoadLoaiHopDong()
        {
            cmbLoaiHopDong.DataSource = loaiHopDongBUS.GetLoaiHopDong();
            AutoAdjustComboBox(cmbLoaiHopDong);
        }
        private void LoadLuongKhoiDiem(object sender, EventArgs e)
        {
            if ((string.IsNullOrEmpty(txtMaNV.Text) || string.IsNullOrEmpty(txtLuongCoBan.Text)) && cmbChucVu.Enabled)
                txtLuongCoBan.Text = chucVuBUS.GetLuongCoBanCuaChucVu(cmbChucVu.SelectedValue.ToString()).ToString();
        }
        private void LoadChucVu(object sender, EventArgs e)
        {
            LoadChucVuTheoPhongBan(cmbPhongBan.SelectedValue.ToString());
        }
        private void AutoAdjustComboBox(ComboBox comboBox)
        {
            int maxWidth = 0;
            foreach (var items in comboBox.Items)
            {
                int itemWidth = TextRenderer.MeasureText(comboBox.GetItemText(items), comboBox.Font).Width;
                maxWidth = Math.Max(maxWidth, itemWidth);
            }
            comboBox.DropDownWidth = maxWidth + SystemInformation.VerticalScrollBarWidth;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { cmbChucVu, cmbLoaiHopDong, cmbPhongBan, txtTaiKhoan, txtMatKhau, txtNhapLaiMatKhau,
                                                        txtCCCD, txtHo, txtTenLot, txtTen, dtpNTNS, txtSoNha, txtDuong, txtPhuong_Xa, txtQuan_Huyen,
                                                        txtTinh_ThanhPho, rbNam, txtSDT, txtEmail, txtTrinhDoHocVan, dtpNgayVaoLam, dtpThoiHanHopDong,
                                                        txtTinhTrang, txtSoNgayPhep, txtLuongCoBan, txtMaNV, txtPhuCap, txtNgayKhoa, txtSoTienNo,
                                                        btnThem, btnSua, btnXoa, btnHuy, btnMoKhoa, btnChonHinh, btnThemPhuCap ,cbHienThiMatKhau};
            for(int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if(listInput[i] is ComboBox)
                {
                    typeof(ComboBox).GetProperty("SelectedIndex").SetValue(listInput[i], 0);
                    continue;
                }
                else if (listInput[i] is RadioButton)
                {
                    typeof(RadioButton).GetProperty("Checked").SetValue(listInput[i], true);
                    continue;
                }
                else if (listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Text").SetValue(listInput[i], DateTime.Now.ToString());
                    continue;
                }
                else if (listInput[i] is CheckBox)
                {
                    typeof(CheckBox).GetProperty("Enabled").SetValue(listInput[i], true);
                    continue;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private bool CheckMatKhau(string matKhau)
        {
            Regex passCheck = new Regex("^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$");
            if (!passCheck.IsMatch(matKhau) || matKhau.Length > 20)
                return false;
            return true;
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
        private bool CheckSDT(string sdt)
        {
            Regex sdtCheck = new Regex(@"(84|0[3|5|7|8|9])+([0-9]{8})\b");
            if (!sdtCheck.IsMatch(sdt))
                return false;
            return true;
        }
        private bool CheckEmail(string email)
        {
            Regex emailCheck = new Regex("^[\\w-\\.]+@([\\w-]+\\.)+[\\w-]{2,4}$");
            if (!emailCheck.IsMatch(email))
                return false;
            return true;                    
        }
        private bool CheckCCCD(string cccd)
        {
            Regex cccdCheck = new Regex(@"^(001|002|004|006|008|010|011|012|014|015|017|019|020|022|024|025|026|027|030|031|033|034|035|036|037|
                                        038|040|042|044|045|046|048|049|051|052|054|056|058|060|062|064|066|067|068|070|072|074|075|077|079|080|
                                        082|083|084|086|087|089|091|092|093|094|095|096)[02-3][0-9]{2}[0-9]{6}$");
            if (!cccdCheck.IsMatch(cccd))
                return false;
            return true;
        }
        private void CheckChonGioiTinh(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            BatTatNut();
        }
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> {  txtCCCD, txtHo, txtTen, txtSoNha, txtDuong, txtPhuong_Xa, txtQuan_Huyen, txtTinh_ThanhPho,
                                                              txtSDT, txtEmail, txtTrinhDoHocVan, txtTinhTrang, txtSoNgayPhep, txtLuongCoBan};
            if (check)
                listTextBox.AddRange(new List<TextBox> { txtTaiKhoan, txtMatKhau, txtNhapLaiMatKhau});
            for(int i = 0; i< listTextBox.Count; i++)
            {
                if (string.IsNullOrEmpty(listTextBox[i].Text))
                {
                    if (check)
                    {
                        btnThem.Enabled = false;
                        return false;
                    }
                    else
                    {
                        btnSua.Enabled = false;
                        return false;
                    }
                }                   
            }
            return true;
        }        
        private string GetValueAsString(NhanVien nhanVien, string propertyName)
        {
            object value;
            if (propertyName.Contains("."))
            {
                string[] propertyNames = propertyName.Split('.');
                value = nhanVien;
                foreach (string name in propertyNames)
                {
                    value = value?.GetType().GetProperty(name)?.GetValue(value);
                    if (value == null)
                        break;
                }
                return value?.ToString() ?? string.Empty;
            }
            if (propertyName == "NTNS" || propertyName == "NgayVaoLam" || propertyName == "ThoiHanHopDong")
            {
                value = typeof(NhanVien).GetProperty(propertyName)?.GetValue(nhanVien);
                DateTime dateValue = (DateTime)value;
                return dateValue.ToString("yyyy-MM-dd");
            }
            else
                value = typeof(NhanVien).GetProperty(propertyName)?.GetValue(nhanVien);
            return value?.ToString() ?? string.Empty;
        }
        private string CheckChange()
        {            
            List<string> changes = new List<string>();
            NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text);
            string[] properties = { "ChucVu.PhongBan.TenPhongBan", "ChucVu.TenChucVu", "LoaiHopDong.TenLoaiHopDong", "CCCD", "Ho", "TenLot", "Ten", "NTNS", "GioiTinh", "SDT", "Email", "TrinhDoHocVan", "NgayVaoLam", "ThoiHanHopDong", "TinhTrang", "SoNgayPhep", "LuongCoBan" };
            string[] labels = { "Chức vụ", "Phòng ban", "Loại hợp đồng", "CCCD", "Họ", "Tên lót", "Tên", "NTNS", "Giới tính", "SDT", "Email", "Trình độ học vấn", "Ngày vào làm", "Thời hạn hợp đồng", "Tình trạng", "Số ngày phép", "Lương cơ bản" };
            string[] values = { cmbPhongBan.Text, cmbChucVu.Text, cmbLoaiHopDong.Text, txtCCCD.Text, txtHo.Text, txtTenLot.Text, txtTen.Text, dtpNTNS.Text, ChonGioiTinh(), txtSDT.Text, txtEmail.Text, txtTrinhDoHocVan.Text, dtpNgayVaoLam.Text, dtpThoiHanHopDong.Text, txtTinhTrang.Text, txtSoNgayPhep.Text, txtLuongCoBan.Text };
            for (int i = 0; i < properties.Length; i++)
            {
                string currentValue = GetValueAsString(nhanVien, properties[i]);
                if (values[i] != currentValue)
                {
                    if (properties[i] == "LuongCoBan")
                        changes.Add($"- {labels[i]}: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(currentValue))} -> {labels[i]}: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(values[i]))}");
                    else
                        changes.Add($"- {labels[i]}: {currentValue} -> {labels[i]}: {values[i]}");
                }

            }
            return string.Join("\n", changes);
        }
        private void BatTatNut()
        {
            bool check;
            if (string.IsNullOrEmpty(txtMaNV.Text))
            {
                cbHienThiMatKhau.Enabled = true;
                btnThemPhuCap.Enabled = false;
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                btnMoKhoa.Enabled = false;
                btnKhoa.Enabled = false;
                txtMatKhau.Enabled = true;
                txtNhapLaiMatKhau.Enabled = true;
                txtTaiKhoan.ReadOnly = false;
                check = true;
                if (CheckEmptyText(check))
                {
                    btnThem.Enabled = true;
                    return;
                }
            }
            else
            {
                cbHienThiMatKhau.Enabled = false;
                btnThemPhuCap.Enabled = true;
                btnXoa.Enabled = true;
                txtMatKhau.Enabled = false;
                txtNhapLaiMatKhau.Enabled = false;
                txtTaiKhoan.ReadOnly = true;
                check = false;
                if (!string.IsNullOrEmpty(txtNgayKhoa.Text))
                {
                    btnMoKhoa.Enabled = true;
                    btnKhoa.Enabled = false;
                }
                if (string.IsNullOrEmpty(txtNgayKhoa.Text))
                {
                    btnMoKhoa.Enabled = false;
                    btnKhoa.Enabled = true;
                }
                if (CheckEmptyText(check))
                {
                    btnSua.Enabled = true;
                    return;
                }
            }     
        }
        private void EnableButtons(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            BatTatNut();            
        }
        ///////////////////////////////////////////////////////////////////////////////////////
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
        private void OnlyCharHoTen(object sender, KeyPressEventArgs e)
        {
            if (!char.IsLetter(e.KeyChar) && !char.IsControl(e.KeyChar))
            {                
                e.Handled = true;
            }
        }       
       
        ///////////////////////////////////////////////////////////////////////////////////////      
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
        private void ErrorMessage(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
                MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private bool CheckInputError(Button button)
        {
            bool flag = true;
            double check;
            errProvider.Clear();
            var validationRules = new Dictionary<Control, Func<bool>>
            {
                { dtpNgayVaoLam, () => DateTime.Parse(dtpNgayVaoLam.Value.ToString(formatDate)) < DateTime.Parse(DateTime.Now.ToString(formatDate)) },
                { txtCCCD, () => !CheckCCCD(txtCCCD.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.CCCD == txtCCCD.Text && nv.MaNV != txtMaNV.Text) != null},
                { dtpNTNS, () => DateTime.Now.Year - dtpNTNS.Value.Year < 18 },
                { txtSDT, () => !CheckSDT(txtSDT.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.SDT == txtSDT.Text && nv.MaNV != txtMaNV.Text) != null},
                { txtEmail, () => !CheckEmail(txtEmail.Text) || nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.Email == txtEmail.Text && nv.MaNV != txtMaNV.Text) != null},
                { txtLuongCoBan, () => double.TryParse(txtLuongCoBan.Text, out check) is false },
                { dtpThoiHanHopDong, () => dtpThoiHanHopDong.Value <= dtpNgayVaoLam.Value },
            };
            if (button == btnThem)
            {
                validationRules.Add(txtTaiKhoan, () => nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.TaiKhoan == txtTaiKhoan.Text) != null || txtTaiKhoan.Text.Length < 5);
                validationRules.Add(txtMatKhau, () => !CheckMatKhau(txtMatKhau.Text));
                validationRules.Add(txtNhapLaiMatKhau, () => txtMatKhau.Text != txtNhapLaiMatKhau.Text);
            }
            var errorMessages = new Dictionary<Control, string>
            {
                { txtTaiKhoan, "Tài khoản đã tồn tại hoặc ít hơn 5 ký tự" },
                { txtMatKhau, "Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!" },
                { txtNhapLaiMatKhau, "Mật khẩu nhập lại không khớp" },
                { dtpNgayVaoLam, "Ngày vào làm không thể nhỏ hơn ngày hiện tại" },
                { txtCCCD, "Căn cước công dân không đúng định dạng hoặc đã tồn tại" },
                { dtpNTNS, "Tuổi phải lớn hơn hoặc bằng 18" },
                { txtSDT, "Số điện thoại không đúng định dạng hoặc đã tồn tại" },
                { txtEmail, "Email không đúng định dạng hoặc đã tồn tại" },
                { dtpThoiHanHopDong, "Thời hạn hợp đồng phải lớn hơn ngày vào làm" },
                { txtLuongCoBan, "Lương cơ bản không đúng định dạng số" }
            };
            foreach (var rule in validationRules)
            {
                var control = rule.Key;
                var validate = rule.Value;
                if (control is DateTimePicker && button == btnSua)
                {
                    if (validate() && dtpNgayVaoLam.Value.ToString(formatDate) != nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text).NgayVaoLam.ToString(formatDate))
                    {
                        errProvider.SetError(control, errorMessages[control]);
                        flag = false;
                    }
                }
                else
                {
                    if (validate())
                    {
                        errProvider.SetError(control, errorMessages[control]);
                        flag = false;
                    }
                }
            }
            if (flag)
                return true;
            return false;
            /*errProvider.Clear();
            if(button == btnThem)
            {
                errProvider.SetError(txtTaiKhoan, nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.TaiKhoan == txtTaiKhoan.Text) != null ? "Tài khoản đã tồn tại" : string.Empty);
                errProvider.SetError(txtMatKhau, CheckMatKhau(txtMatKhau.Text) is false ? "Mật khẩu phải có ít nhất 1 ký tự hoa, 1 ký tự thường, 1 ký tự đặc biệt, 1 ký tự số và có độ dài >= 8 và =< 20 ký tự!" : string.Empty);
                errProvider.SetError(txtNhapLaiMatKhau, txtMatKhau.Text != txtNhapLaiMatKhau.Text ? "Mật khẩu nhập lại không khớp" : string.Empty);
                errProvider.SetError(dtpNgayVaoLam, DateTime.Parse(dtpNgayVaoLam.Value.ToString(formatDate)) < DateTime.Parse(DateTime.Now.ToString(formatDate)) ? "Ngày vào làm không thể nhỏ hơn ngày hiện tại" : string.Empty);
            }
            else
                errProvider.SetError(dtpNgayVaoLam, DateTime.Parse(dtpNgayVaoLam.Value.ToString(formatDate)) < DateTime.Parse(DateTime.Now.ToString(formatDate)) && dtpNgayVaoLam.Value.ToString(formatDate) != nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text).NgayVaoLam.ToString(formatDate) 
                            ? "Ngày vào làm không thể nhỏ hơn ngày hiện tại" : string.Empty);
            errProvider.SetError(txtCCCD, CheckCCCD(txtCCCD.Text) is false ? "Căn cước công dân không đúng định dạng" : string.Empty);
            errProvider.SetError(dtpNTNS, DateTime.Now.Year - dtpNTNS.Value.Year < 18 ? "Tuổi phải lớn hơn hoặc bằng 18" : string.Empty);
            errProvider.SetError(txtSDT, CheckSDT(txtSDT.Text) is false ? "Số điện thoại không đúng định dạng" : string.Empty);
            errProvider.SetError(txtEmail, CheckEmail(txtEmail.Text) is false ? "Email không đúng định dạng" : string.Empty);            
            errProvider.SetError(dtpThoiHanHopDong, dtpThoiHanHopDong.Value <= dtpNgayVaoLam.Value ? "Thời hạn hợp đồng phải lớn hơn ngày vào làm" : string.Empty);
            List<Control> controlsToCheck = new List<Control> { txtTaiKhoan, txtMatKhau, txtNhapLaiMatKhau, txtCCCD, dtpNTNS, txtSDT, txtEmail, dtpNgayVaoLam, dtpThoiHanHopDong };
            foreach (Control control in controlsToCheck)
            {
                if (errProvider.GetError(control) != string.Empty)
                    return false;
            }
            return true;*/
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckInputError(btnThem))
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string gioiTinh = ChonGioiTinh();
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
                    string thaoTac = $"Thêm nhân viên {txtHo.Text} {txtHo.Text} {txtTen.Text}:\n" +
                                    $"- Phòng ban: {cmbPhongBan.Text}\n" +
                                    $"- Chức vụ: {cmbChucVu.Text}\n" +
                                    $"- Loại hợp đồng: {cmbLoaiHopDong.Text}\n" +
                                    $"- Tài khoản: {txtTaiKhoan.Text}\n" +
                                    $"- CCCD: {txtCCCD.Text}\n" +
                                    $"- NTNS: {dtpNTNS.Text}\n" +
                                    $"- Số nhà: {txtSoNha.Text}\n" +
                                    $"- Đường: {txtDuong.Text}\n" +
                                    $"- Phường/xã: {txtPhuong_Xa.Text}\n" +
                                    $"- Quận/huyện: {txtQuan_Huyen.Text}\n" +
                                    $"- Tỉnh/Thành Phố: {txtTinh_ThanhPho.Text}\n" +
                                    $"- Giới tính: {ChonGioiTinh()}\n" +
                                    $"- Số điện thoại: {txtSDT.Text}\n" +
                                    $"- Email: {txtEmail.Text}\n" +
                                    $"- Trình độ học vấn: {txtTrinhDoHocVan.Text}\n" +
                                    $"- Ngày vào làm: {dtpNgayVaoLam.Text}\n" +
                                    $"- Thời hạn hợp đồng: {dtpThoiHanHopDong.Text}\n" +
                                    $"- Tình trạng: {txtTinhTrang.Text}\n" +
                                    $"- Số ngày phép: {txtSoNgayPhep.Text}\n" +
                                    $"- Lương cơ bản: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtLuongCoBan.Text))}\n";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }                
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }           
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckInputError(btnSua))
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string gioiTinh = ChonGioiTinh();
                string chiTietSua = CheckChange();
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
                    string thaoTac = $"Sửa nhân viên {txtMaNV.Text}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                    if (!string.IsNullOrEmpty(chiTietSua))
                        thaoTac += $":\n{chiTietSua}";
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
                      
        }      
        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
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
                    string thaoTac = $"Xoá nhân viên {txtHo.Text} {txtHo.Text} {txtTen.Text}:\n" +
                                    $"- Phòng ban: {cmbPhongBan.Text}\n" +
                                    $"- Chức vụ: {cmbChucVu.Text}\n" +
                                    $"- Loại hợp đồng: {cmbLoaiHopDong.Text}\n" +
                                    $"- Tài khoản: {txtTaiKhoan.Text}\n" +
                                    $"- CCCD: {txtCCCD.Text}\n" +
                                    $"- NTNS: {dtpNTNS.Text}\n" +
                                    $"- Số nhà: {txtSoNha.Text}\n" +
                                    $"- Đường: {txtDuong.Text}\n" +
                                    $"- Phường/xã: {txtPhuong_Xa.Text}\n" +
                                    $"- Quận/huyện: {txtQuan_Huyen.Text}\n" +
                                    $"- Tỉnh/Thành Phố: {txtTinh_ThanhPho.Text}\n" +
                                    $"- Giới tính: {ChonGioiTinh()}\n" +
                                    $"- Số điện thoại: {txtSDT.Text}\n" +
                                    $"- Email: {txtEmail.Text}\n" +
                                    $"- Trình độ học vấn: {txtTrinhDoHocVan.Text}\n" +
                                    $"- Ngày vào làm: {dtpNgayVaoLam.Text}\n" +
                                    $"- Thời hạn hợp đồng: {dtpThoiHanHopDong.Text}\n" +
                                    $"- Tình trạng: {txtTinhTrang.Text}\n" +
                                    $"- Số ngày phép: {txtSoNgayPhep.Text}\n" +
                                    $"- Lương cơ bản: {String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtLuongCoBan.Text))}\n" +
                                    $"- Phụ cấp: {String.Format(fVND, "{0:N3} ₫", txtPhuCap.Text)}\n" +
                                    $"- Số tiền nợ: {String.Format(fVND, "{0:N3} ₫", txtSoTienNo.Text)}\n";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
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
            errProvider.Clear();
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
            try
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
                        string thaoTac = $"Mở khoá tài khoản của nhân viên {txtMaNV.Text}";
                        string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Mở khoá")).MaTT;
                        LichSuThaoTac(thaoTac, maTT);
                        Reload();
                    }
                }
                else
                    return;
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
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
                LoadNhanVien();
        }
        private void dgvThongTinNhanVien_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
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
            txtNgayKhoa.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[25].Value.ToString();
            if (checkThaoTac)
            {
                txtLuongCoBan.Text = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtMaNV.Text).LuongCoBan.ToString();
                txtPhuCap.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(txtMaNV.Text));                
                txtSoTienNo.Text = dgvThongTinNhanVien.Rows[rowIndex].Cells[26].Value.ToString();
            }            
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
        private void btnKhoa_Click(object sender, EventArgs e)
        {
            try
            {
                string maNV_Khoa = txtMaNV.Text;
                if (maNV_Khoa == maNV)
                {
                    MessageBox.Show($"Không thể khoá tài khoản hiện đang đăng nhập", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return;
                }
                FrmKhoaTaiKhoan open = new FrmKhoaTaiKhoan(maNV, maNV_Khoa);
                open.ShowDialog();
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }            
        }
    }
}
