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
    public partial class FrmQuanLyLoaiHopDong : Form
    {
        private readonly QuanLyLoaiHopDongBUS loaiHopDongBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;  
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly HinhThucChamCongBUS hinhThucChamCongBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDong;
        private IEnumerable<LoaiHopDongViewModels> danhSachLoaiHopDongTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiHopDong(string maNV)
        {
            InitializeComponent();
            loaiHopDongBUS = new QuanLyLoaiHopDongBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            hinhThucChamCongBUS = new HinhThucChamCongBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý loại hợp đồng").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkThaoTac = false;
        }
        private void frmQuanLyLoaiHopDong_Load(object sender, EventArgs e)
        {
            cmbTimekeepingMethod.DisplayMember = "TenHinhThucChamCong";
            cmbTimekeepingMethod.ValueMember = "MaHTCC";            
            LoadThongTinDangNhap();
            LoadHinhThucChamCong();
            InputStatus(false);
            PhanQuyen();
            LoadLoaiHopDong();
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
            List<object> listInput = new List<object> {txtContractTypeName, cmbTimekeepingMethod };
            if (!value)
                listInput.AddRange(new List<object> {txtContractTypeID, txtStaffAmount});
            for(int i = 0; i < listInput.Count; i++)
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
        private void LoadLoaiHopDong()
        {
            Enabled = false;
            dgvContractType.Rows.Clear();
            danhSachLoaiHopDong = loaiHopDongBUS.GetAllLoaiHopDong();
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDong)
            {
                rowAdd = dgvContractType.Rows.Add();
                dgvContractType.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvContractType.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvContractType.Rows[rowAdd].Cells[2].Value = lhd.TenHinhThucChamCong;
                dgvContractType.Rows[rowAdd].Cells[3].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
            Enabled = true;
        }
        private void LoadHinhThucChamCong()
        {
            cmbTimekeepingMethod.DataSource = hinhThucChamCongBUS.GetAllHinhThucChamCong();
            AutoAdjustComboBox(cmbTimekeepingMethod);
        }
        private void LoadLoaiHopDongTimKiem(string timKiem)
        {
            Enabled = false;
            dgvContractType.Rows.Clear();
            danhSachLoaiHopDongTimKiem = loaiHopDongBUS.SearchLoaiHopDong(timKiem);           
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDongTimKiem)
            {
                rowAdd = dgvContractType.Rows.Add();
                dgvContractType.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvContractType.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvContractType.Rows[rowAdd].Cells[2].Value = lhd.TenHinhThucChamCong;
                dgvContractType.Rows[rowAdd].Cells[3].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
            Enabled = true;
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtContractTypeID, txtContractTypeName, txtStaffAmount, cmbTimekeepingMethod};
            for(int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if (listInput[i] is ComboBox) 
                {
                    typeof(ComboBox).GetProperty("SelectedIndex").SetValue(listInput[i], 0);
                    continue;
                }
            }            
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmQuanLyLoaiHopDong frmOpen = new FrmQuanLyLoaiHopDong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtContractTypeName };
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
            if (string.IsNullOrEmpty(txtContractTypeID.Text))
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
        //////////////////////////////////////////////////////////////////////////////////////////////////////
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
            LoaiHopDong lhd = loaiHopDongBUS.GetLoaiHopDong().FirstOrDefault(hd => hd.MaLHD == txtContractTypeID.Text);
            string tenLoaiHopDong = txtContractTypeName.Text;
            string hinhThucChamCong = cmbTimekeepingMethod.Text;
            if (tenLoaiHopDong != lhd.TenLoaiHopDong)
                changes.Add($"- Tên loại hợp đồng {lhd.TenLoaiHopDong} -> Tên loại hợp đồng: {tenLoaiHopDong}");
            if (hinhThucChamCong != lhd.HinhThucChamCong.TenHinhThucChamCong)
                changes.Add($"- Hình thức chấm công: {lhd.HinhThucChamCong.TenHinhThucChamCong} -> Hình thức chấm công: {hinhThucChamCong}");
            return string.Join("\n", changes);
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtContractTypeName, loaiHopDongBUS.GetLoaiHopDong().FirstOrDefault(lhd => lhd.TenLoaiHopDong == txtContractTypeName.Text) != null ? "Tên loại hợp đồng đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtContractTypeName) != string.Empty)
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
                LoaiHopDong newLoaiHopDong = new LoaiHopDong
                {
                    MaLHD = "",
                    TenLoaiHopDong = txtContractTypeName.Text,
                    MaHTCC = cmbTimekeepingMethod.SelectedValue.ToString(),
                };
                if (loaiHopDongBUS.Save(newLoaiHopDong))
                {
                    string tenLoaiHopDong = txtContractTypeName.Text;
                    string hinhThucChamCong = cmbTimekeepingMethod.Text;
                    string thaoTac = $"Thêm loại hợp đông {tenLoaiHopDong}: \n  - Hình thức chấm công: {hinhThucChamCong}";
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
                LoaiHopDong newLoaiHopDong = new LoaiHopDong
                {
                    MaLHD = txtContractTypeID.Text,
                    TenLoaiHopDong = txtContractTypeName.Text,
                    MaHTCC = cmbTimekeepingMethod.SelectedValue.ToString(),
                };
                if (loaiHopDongBUS.Save(newLoaiHopDong))
                {
                    string thaoTac = $"Sửa loại hợp đồng {txtContractTypeID.Text}";
                    if (!string.IsNullOrEmpty(chiTietSua))
                        thaoTac += $":\n{chiTietSua}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                ErrorMessage(ex);
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                LoaiHopDong loaiHopDong = new LoaiHopDong
                {
                    MaLHD = txtContractTypeID.Text
                };
                if (loaiHopDongBUS.Delete(loaiHopDong))
                {
                    string tenLoaiHopDong = txtContractTypeName.Text;
                    string hinhThucChamCong = cmbTimekeepingMethod.Text;
                    string thaoTac = $"Xoá loại hợp đồng {tenLoaiHopDong}:\n    - Hình thức chấm công: {hinhThucChamCong}";
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
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvContractType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtContractTypeID.Text = dgvContractType.Rows[rowIndex].Cells[0].Value.ToString();
            txtContractTypeName.Text = dgvContractType.Rows[rowIndex].Cells[1].Value.ToString();
            cmbTimekeepingMethod.Text = dgvContractType.Rows[rowIndex].Cells[2].Value.ToString();
            txtStaffAmount.Text = dgvContractType.Rows[rowIndex].Cells[3].Value.ToString();
        }           
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadLoaiHopDong();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiHopDongTimKiem(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
