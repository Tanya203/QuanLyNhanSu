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
    public partial class FrmQuanLyLoaiCa : Form
    {
        private readonly QuanLyLoaiCaBUS loaiCaBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<LoaiCaViewModels> danhSachLoaiCa;
        private IEnumerable<LoaiCaViewModels> danhSachLoaiCaTimKiem;
        private IEnumerable<PhanQuyen> phanQuyen;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiCa(string maNV)
        {
            InitializeComponent();
            loaiCaBUS = new QuanLyLoaiCaBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý loại ca").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkThaoTac = false;
        }
        private void frmQuanLyLoaiCa_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            InputStatus(false);
            PhanQuyen();
            LoadLoaiCa();            
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
            List<TextBox> listTextBox = new List<TextBox> { txtShiftTypeName, txtSalaryCoefficient };
            if (!value)
                listTextBox.Add(txtShiftTypeID);
            for(int i = 0; i< listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i], !value);
                continue;
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnAdd, btnEdit, btnDelete, btnCancel };
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnCancel)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadThongTinDangNhap()
        {
            lblStaffIDLoginValue.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblFullNameLoginValue.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblFullNameLoginValue.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblDepartmentLoginValue.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblPositionLoginValue.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadLoaiCa()
        {
            Enabled = false;
            dgvShiftType.Rows.Clear();
            danhSachLoaiCa = loaiCaBUS.GetAllLoaiCa();
            int rowAdd;
            foreach (var lc in danhSachLoaiCa)
            {
                rowAdd = dgvShiftType.Rows.Add();
                dgvShiftType.Rows[rowAdd].Cells[0].Value = lc.MaLoaiCa;
                dgvShiftType.Rows[rowAdd].Cells[1].Value = lc.TenLoaiCa;
                dgvShiftType.Rows[rowAdd].Cells[2].Value = lc.HeSoLuong;
            }
            Enabled = true;
        }
        private void LoadLoaiCaTimKiem(string timKiem)
        {            
            Enabled = false;
            dgvShiftType.Rows.Clear();
            danhSachLoaiCaTimKiem = loaiCaBUS.SearchLoaiCa(timKiem);
            int rowAdd;
            foreach (var lc in danhSachLoaiCaTimKiem)
            {
                rowAdd = dgvShiftType.Rows.Add();
                dgvShiftType.Rows[rowAdd].Cells[0].Value = lc.MaLoaiCa;
                dgvShiftType.Rows[rowAdd].Cells[1].Value = lc.TenLoaiCa;
                dgvShiftType.Rows[rowAdd].Cells[2].Value = lc.HeSoLuong;
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtShiftTypeID, txtShiftTypeName, txtSalaryCoefficient };
            for(int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmQuanLyLoaiCa frmOpen = new FrmQuanLyLoaiCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtShiftTypeName, txtSalaryCoefficient };
            for (int i = 0; i < listTextBox.Count; i++)
            {
                if (string.IsNullOrEmpty(listTextBox[i].Text))
                {
                    if (check)
                    {
                        btnAdd.Enabled = false;
                        return false;
                    }
                    else
                    {
                        btnEdit.Enabled = false;
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
            if (string.IsNullOrEmpty(txtShiftTypeID.Text))
            {
                btnEdit.Enabled = false;
                btnDelete.Enabled = false;
                check = true;
                if (CheckEmptyText(check))
                {
                    btnAdd.Enabled = true;
                    return;
                }
            }
            else
            {
                btnAdd.Enabled = false;
                btnDelete.Enabled = true;
                check = false;
                if (CheckEmptyText(check))
                {
                    btnEdit.Enabled = true;
                    return;
                }
            }
        }
        private void txtSalaryCoefficient_KeyPress(object sender, KeyPressEventArgs e)
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////////
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
            LoaiCa loaiCa = loaiCaBUS.GetLoaiCa().FirstOrDefault(lc => lc.MaLC == txtShiftTypeID.Text);
            string tenLoaiCa = txtShiftTypeName.Text;
            string heSoLuong = txtSalaryCoefficient.Text;
            if (tenLoaiCa != loaiCa.TenLoaiCa)
                changes.Add($"- Tên loại ca: {loaiCa.TenLoaiCa} -> Tên loại ca: {tenLoaiCa}");
            if (decimal.Parse(txtSalaryCoefficient.Text) != loaiCa.HeSoLuong)
                changes.Add($"- Hệ số lương: {loaiCa.HeSoLuong} -> Hệ số lương: {heSoLuong}");
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtShiftTypeName, loaiCaBUS.GetLoaiCa().FirstOrDefault(lc => lc.TenLoaiCa == txtShiftTypeName.Text && lc.MaLC != txtShiftTypeID.Text) != null ? "Tên loại ca đã tồn tại" : string.Empty);
            errProvider.SetError(txtSalaryCoefficient, double.TryParse(txtSalaryCoefficient.Text, out double check) is false ? "Hệ số lương không đúng định dạng số" : string.Empty);
            if(errProvider.GetError(txtShiftTypeName) != string.Empty || errProvider.GetError(txtSalaryCoefficient) != string.Empty)
                return false;
            return true;
        }
        private void ErrorMessage(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
                MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (!CheckErrorInput())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                LoaiCa newLoaiCa = new LoaiCa
                {
                    MaLC = "",
                    TenLoaiCa = txtShiftTypeName.Text,
                    HeSoLuong = decimal.Parse(txtSalaryCoefficient.Text)
                };
                if (loaiCaBUS.Save(newLoaiCa))
                {
                    string loaiCa = txtShiftTypeName.Text;
                    decimal heSoLuong = decimal.Parse(txtSalaryCoefficient.Text);
                    string thaoTac = $"Thêm loại ca {loaiCa}\n - Hệ số lương: {heSoLuong}";
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
        private void btnEdit_Click(object sender, EventArgs e)
        {
            if (!CheckErrorInput())
            {
                MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            try
            {
                string chiTietSua = CheckChange();
                LoaiCa newLoaiCa = new LoaiCa
                {
                    MaLC = txtShiftTypeID.Text,
                    TenLoaiCa = txtShiftTypeName.Text,
                    HeSoLuong = decimal.Parse(txtSalaryCoefficient.Text)
                };
                if (loaiCaBUS.Save(newLoaiCa))
                {
                    string thaoTac = $"Sửa loại ca {txtShiftTypeID.Text}";
                    if (!string.IsNullOrEmpty(chiTietSua))
                        thaoTac += ":\n" + chiTietSua;
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }            
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LoaiCa loaiCa = new LoaiCa
                {
                    MaLC = txtShiftTypeID.Text
                };
                if (loaiCaBUS.Delete(loaiCa))
                {
                    string tenLoaiCa = txtShiftTypeName.Text;
                    string heSoLuong = txtSalaryCoefficient.Text;
                    string thaoTac = $"Xoá loại ca {tenLoaiCa}\n    - Hệ số lương: {heSoLuong}";
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
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmQuanLyCa frmOpen = new FrmQuanLyCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvShiftType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtShiftTypeID.Text = dgvShiftType.Rows[rowIndex].Cells[0].Value.ToString();
            txtShiftTypeName.Text = dgvShiftType.Rows[rowIndex].Cells[1].Value.ToString();
            txtSalaryCoefficient.Text = dgvShiftType.Rows[rowIndex].Cells[2].Value.ToString();
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }       
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))            
                LoadLoaiCa();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiCaTimKiem(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
