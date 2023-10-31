using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ProgressBar;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyChucVu : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyChucVuBUS chucVuBUS;
        private readonly QuanLyPhongBanBUS phongBanBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private readonly QuyenHanBUS quyenHanBUS;
        private readonly NhanVien nv;
        private IEnumerable<ChucVuViewModels> danhSachChucVu;
        private IEnumerable<ChucVuViewModels> danhSachChucVuTimKiem;
        private readonly IEnumerable<QuyenHan> listQuyenHan;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyChucVu(string maNV)
        {
            InitializeComponent();            
            chucVuBUS = new QuanLyChucVuBUS();
            phongBanBUS = new QuanLyPhongBanBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            quyenHanBUS = new QuyenHanBUS();
            listQuyenHan = quyenHanBUS.GetQuyenHans();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý chức vụ").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            txtPositionID.ReadOnly = true;
            txtTotalStaff.ReadOnly = true;
            btnAdd.Enabled = false;
            btnEdit.Enabled = false;
            btnDelete.Enabled = false;
            this.maNV = maNV;
            checkThaoTac = false;
        }
        private void frmQuanLyChucVu_Load(object sender, EventArgs e)
        {
            cmbDepartment.DisplayMember = "TenPhongBan";
            cmbDepartment.ValueMember = "MaPB";
            LoadThongTinDangNhap();
            LoadPhongBan();
            InputStatus(false);
            PhanQuyen();
            LoadChucVu();
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
        private void PhanQuyen()
        {
            foreach (PhanQuyen qh in phanQuyen)
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
            List<object> listInput = new List<object> { txtDepartmentName, txtStartingSalary, cmbDepartment };
            if (!value)
                listInput.AddRange(new List<TextBox> { txtPositionID, txtTotalStaff });
            for (int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                if(listInput[i] is ComboBox)
                {
                    typeof(TextBox).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
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
        private void LoadChucVu()
        {
            Enabled = false;
            dgvPosition.Rows.Clear();
            danhSachChucVu = chucVuBUS.GetAllChucVu();
            int rowAdd;
            foreach (var cv in danhSachChucVu)
            {
                rowAdd = dgvPosition.Rows.Add();
                dgvPosition.Rows[rowAdd].Cells[0].Value = cv.MaCV;
                dgvPosition.Rows[rowAdd].Cells[1].Value = cv.TenPhongBan;
                dgvPosition.Rows[rowAdd].Cells[2].Value = cv.TenChucVu;
                dgvPosition.Rows[rowAdd].Cells[3].Value = String.Format(fVND, "{0:N3} ₫", cv.LuongKhoiDiem);
                dgvPosition.Rows[rowAdd].Cells[4].Value = chucVuBUS.TongSoNhanVienThuocChucVu(cv.MaCV);
            }
            Enabled = true;
        }
        private void LoadChucVuTimKiem(string timKiem)
        {    
            Enabled = false;
            dgvPosition.Rows.Clear();
            danhSachChucVuTimKiem = chucVuBUS.SearchChucVu(timKiem);
            int rowAdd;
            foreach (var cv in danhSachChucVuTimKiem)
            {
                rowAdd = dgvPosition.Rows.Add();
                dgvPosition.Rows[rowAdd].Cells[0].Value = cv.MaCV;
                dgvPosition.Rows[rowAdd].Cells[1].Value = cv.TenPhongBan;
                dgvPosition.Rows[rowAdd].Cells[2].Value = cv.TenChucVu;
                dgvPosition.Rows[rowAdd].Cells[3].Value = String.Format(fVND, "{0:N3} ₫", cv.LuongKhoiDiem);
                dgvPosition.Rows[rowAdd].Cells[4].Value = chucVuBUS.TongSoNhanVienThuocChucVu(cv.MaCV);
            }
            Enabled = true;
        }
        private void LoadPhongBan()
        {
            cmbDepartment.DataSource = phongBanBUS.GetPhongBan();
            AutoAdjustComboBox(cmbDepartment);
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
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtPositionID, cmbDepartment, txtDepartmentName, txtTotalStaff, txtStartingSalary };
            for(int i = 0; i< listInput.Count; i++)
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
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmQuanLyChucVu frmOpen = new FrmQuanLyChucVu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check) 
        {
            List<TextBox> listTextBox = new List<TextBox> { txtDepartmentName, txtStartingSalary};
            for(int i = 0; i < listTextBox.Count; i++)
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
            if (string.IsNullOrEmpty(txtPositionID.Text))
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
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void txtStartingSalaryKeyPress(object sender, KeyPressEventArgs e)
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
        /////////////////////////////////////////////////////////////////////////////////////////////
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
            ChucVu chucVu = chucVuBUS.GetChucVu().Where(cv => cv.MaCV == txtPositionID.Text).FirstOrDefault();
            string luongKhoiDiemCu = String.Format(fVND, "{0:N3} ₫", chucVu.LuongKhoiDiem);
            string luongKhoiDiemMoi = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtStartingSalary.Text));
            if (txtDepartmentName.Text != chucVu.TenChucVu)
                changes.Add($"- Tên chức vụ: {chucVu.TenChucVu} -> Tên chức vụ: {txtDepartmentName.Text}");
            if (cmbDepartment.SelectedValue.ToString() != chucVu.MaPB)
                changes.Add($"- Phòng ban: {chucVu.PhongBan.TenPhongBan} -> Phòng ban: {cmbDepartment.Text}");
            if (luongKhoiDiemCu != luongKhoiDiemMoi)
                changes.Add($"- Lương khởi điểm: : {luongKhoiDiemCu} -> Lương khởi điểm: {luongKhoiDiemMoi}");
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
        private bool CheckInputError()
        {
            errProvider.Clear();
            double check;
            errProvider.SetError(txtDepartmentName, chucVuBUS.GetChucVu().FirstOrDefault(cv => cv.TenChucVu == txtDepartmentName.Text && cv.MaCV != txtPositionID.Text) != null ? "Tên chức vụ đã tồn tại" : string.Empty);
            errProvider.SetError(txtStartingSalary, double.TryParse(txtStartingSalary.Text, out check) is false ? "Lương cơ bản không đúng định dạng số" : string.Empty);
            if (errProvider.GetError(txtDepartmentName) != string.Empty || errProvider.GetError(txtStartingSalary) != string.Empty)
                return false;
            return true;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!CheckInputError())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                ChucVu chucVu = new ChucVu
                {
                    MaCV = "",
                    MaPB = cmbDepartment.SelectedValue.ToString(),
                    TenChucVu = txtDepartmentName.Text,
                    LuongKhoiDiem = decimal.Parse(txtStartingSalary.Text),
                };
                if (chucVuBUS.Save(chucVu))
                {
                    string tenChucVu = txtDepartmentName.Text;
                    string phongBan = cmbDepartment.Text;
                    string luongKhoiDiem = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtStartingSalary.Text));
                    string thaoTac = $"Thêm chức vụ: {tenChucVu}\n - Phòng ban: {phongBan}\n - Lương khỏi điểm: {luongKhoiDiem}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    List<PhanQuyen> phanQuyen = new List<PhanQuyen>();
                    ChucVu cv = chucVuBUS.GetChucVu().FirstOrDefault(x => x.TenChucVu == tenChucVu);
                    foreach (QuyenHan qh in listQuyenHan)
                    {
                        PhanQuyen pq = new PhanQuyen
                        {
                            MaCV = cv.MaCV,
                            MaQH = qh.MaQH,
                            CapQuyen = false,
                        };
                        phanQuyen.Add(pq);
                    }
                    phanQuyenBUS.AddChucVuVaoPhanQuyen(phanQuyen);
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
            try
            {
                if (!CheckInputError())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string chiTietSua = CheckChange();
                ChucVu chucVu = chucVuBUS.GetChucVu().FirstOrDefault(cv => cv.MaCV == txtPositionID.Text);
                chucVu.TenChucVu = txtDepartmentName.Text;
                chucVu.MaPB = cmbDepartment.SelectedValue.ToString();                
                if (chucVuBUS.Save(chucVu))
                {
                    string thaoTac = "Sửa chức vụ " + txtPositionID.Text;
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
            ChucVu chucVu = new ChucVu
            {
                MaCV = txtPositionID.Text                
            };
            if (chucVuBUS.Delete(chucVu))
            {
                string tenChucVu = txtDepartmentName.Text;
                string phongBan = cmbDepartment.Text;
                string luongKhoiDiem = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtStartingSalary.Text));
                string thaoTac = $"Xoá chức vụ {tenChucVu}:\n - Phòng ban: {phongBan}\n - Lương khởi điểm: {luongKhoiDiem}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }            
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }      
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void dgvPosition_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtPositionID.Text = dgvPosition.Rows[rowIndex].Cells[0].Value.ToString();
            cmbDepartment.Text = dgvPosition.Rows[rowIndex].Cells[1].Value.ToString();
            txtDepartmentName.Text = dgvPosition.Rows[rowIndex].Cells[2].Value.ToString();
            txtStartingSalary.Text = chucVuBUS.GetLuongCoBanCuaChucVu(txtPositionID.Text).ToString();
            txtTotalStaff.Text = dgvPosition.Rows[rowIndex].Cells[4].Value.ToString();

        }       
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))            
                LoadChucVu();       
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadChucVuTimKiem(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
