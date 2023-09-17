using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhongBan : Form
    {
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<PhongBanViewModel> danhSachPhongBan;
        private IEnumerable<PhongBanViewModel> danhSachPhongBanTimKiem;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly List<ThaoTac> listThaoTac;
        private readonly string maNV;
        private readonly NhanVien nv;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyPhongBan(string maNV)
        {
            InitializeComponent();            
            phongBanBUS = new QuanLyPhongBanBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý phòng ban").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();            
            this.maNV = maNV;
            checkThaoTac = false;
        }
        private void frmQuanLyPhongBan_Load(object sender, EventArgs e)
        {            
            LoadThongTinDangNhap();
            InputStatus(false);
            PhanQuyen();
            LoadPhongBan();
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
        private void PhanQuyen()
        {
            foreach(PhanQuyen qh in phanQuyen)
            {
                if (qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    checkThaoTac = true;
                    InputStatus(true);
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<TextBox> listTextBox = new List<TextBox> { txtTenPB };
            if (!value)
                listTextBox.AddRange(new List<TextBox> { txtMaPB, txtTongSoNhanVien});
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i], !value);                
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnThem, btnSua, btnXoa, btnHuy};
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnHuy)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadPhongBan()
        {
            Enabled = false;
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
            Enabled = true;
        }
        private void LoadPhongBanTimKiem(string timKiem)
        {
            Enabled = false;
            dgvThongTinPhongBan.Rows.Clear();
            danhSachPhongBanTimKiem = phongBanBUS.SearchPhongBan(timKiem);
            int rowAdd;
            foreach (var pb in danhSachPhongBanTimKiem)
            {
                rowAdd = dgvThongTinPhongBan.Rows.Add();
                dgvThongTinPhongBan.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvThongTinPhongBan.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtMaPB, txtTenPB, txtTongSoNhanVien };
            for(int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmQuanLyPhongBan frmOpen = new FrmQuanLyPhongBan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> {txtTenPB};
            for(int i =0; i<listTextBox.Count; i++)
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
        private void EnableButtons(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            bool check;
            if (string.IsNullOrEmpty(txtMaPB.Text))
            {
                btnSua.Enabled = false;
                btnXoa.Enabled = false;
                check = true;
                if (CheckEmptyText(check))
                {
                    btnThem.Enabled = true;
                    return;
                }                    
            }
            else
            {
                btnThem.Enabled = false;
                btnXoa.Enabled = true;
                check = false;
                if (CheckEmptyText(check))
                {
                    btnSua.Enabled = true;
                    return;
                }
            }
        }
        
        //////////////////////////////////////////////////////////////////////////////////////////////////
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
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            PhongBan phongBan = phongBanBUS.GetPhongBan().FirstOrDefault(pb => pb.MaPB == txtMaPB.Text);
            string tenPhongBan = txtTenPB.Text;
            if (tenPhongBan != phongBan.TenPhongBan)
                changes.Add($"- Tên phòng ban {phongBan.TenPhongBan} -> Tên phòng ban: {tenPhongBan}");
            return string.Join("\n", changes);
        }
        private void ErrorMessage(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
                MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtTenPB, phongBanBUS.GetPhongBan().FirstOrDefault(pb => pb.TenPhongBan == txtTenPB.Text && pb.MaPB != txtMaPB.Text) != null ? "Tên phòng ban đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtTenPB) != string.Empty)
                return false;
            return true;
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                PhongBan newPhongBan = new PhongBan
                {
                    MaPB = "",
                    TenPhongBan = txtTenPB.Text
                };
                if (phongBanBUS.Save(newPhongBan))
                {
                    string thaoTac = $"Thêm phòng ban {txtTenPB.Text}";
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
        private void btnHuy_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                if(!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string chiTietSua = CheckChange();
                PhongBan phongBan = phongBanBUS.GetPhongBan().FirstOrDefault(pb => pb.MaPB == txtMaPB.Text);
                phongBan.TenPhongBan = txtTenPB.Text;
                if (phongBanBUS.Save(phongBan))
                {
                    string thaoTac = $"Sửa phòng ban {txtMaPB.Text}";
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
                PhongBan phongBan = new PhongBan
                {
                    MaPB = txtMaPB.Text
                };
                if (phongBanBUS.Delete(phongBan))
                {
                    string thaoTac = $"Xoá phòng ban {txtTenPB.Text}";
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
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void dgvThongTinPhongBan_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaPB.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenPB.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[1].Value.ToString();
            txtTongSoNhanVien.Text = dgvThongTinPhongBan.Rows[rowIndex].Cells[2].Value.ToString();
        }        
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadPhongBan();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadPhongBanTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    } 
}
