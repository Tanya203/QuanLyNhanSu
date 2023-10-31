using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyPhuCap : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyPhuCapBUS phuCapBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;        
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<PhuCapViewMModels> danhSachPhuCap;
        private IEnumerable<PhuCapViewMModels> danhSachPhuCapTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyPhuCap(string maNV)
        {
            InitializeComponent();
            phuCapBUS = new QuanLyPhuCapBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý phụ cấp").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkThaoTac = false;
        }
        private void frmQuanLyPhuCap_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            InputStatus(false);
            PhanQuyen();
            LoadPhuCap();            
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
                else if (qh.QuyenHan.TenQuyenHan.Contains("Truy cập") && qh.CapQuyen)
                {
                    ChiTietButton();
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceName, txtAmount};
            if (!value)
                listTextBox.AddRange(new List<TextBox> { txtAllowanceID, txtStaffAmount });
            for(int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i], !value);
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
        private void LoadPhuCap()
        {
            Enabled = false;
            dgvAllowance.Rows.Clear();
            danhSachPhuCap = phuCapBUS.GetAllPhuCap();
            int rowAdd;
            foreach (var pc in danhSachPhuCap)
            {
                rowAdd = dgvAllowance.Rows.Add();
                dgvAllowance.Rows[rowAdd].Cells[0].Value = pc.MaPC;
                dgvAllowance.Rows[rowAdd].Cells[1].Value = pc.TenPhuCap;
                dgvAllowance.Rows[rowAdd].Cells[2].Value = String.Format(fVND, "{0:N3} ₫", pc.TienPhuCap);
                dgvAllowance.Rows[rowAdd].Cells[3].Value = chiTietPhuCapBUS.TongSoNhanVienTrongPhuCap(pc.MaPC);
            }            
            Enabled = true;
        }
        private void LoadPhuCapTimKiem(string timKiem)
        {
            Enabled = false;
            dgvAllowance.Rows.Clear();
            danhSachPhuCapTimKiem = phuCapBUS.SearchPhuCap(timKiem);
            int rowAdd;
            foreach (var pc in danhSachPhuCapTimKiem)
            {
                rowAdd = dgvAllowance.Rows.Add();
                dgvAllowance.Rows[rowAdd].Cells[0].Value = pc.MaPC;
                dgvAllowance.Rows[rowAdd].Cells[1].Value = pc.TenPhuCap;
                dgvAllowance.Rows[rowAdd].Cells[2].Value = String.Format(fVND, "{0:N3} ₫", pc.TienPhuCap);
                dgvAllowance.Rows[rowAdd].Cells[3].Value = chiTietPhuCapBUS.TongSoNhanVienTrongPhuCap(pc.MaPC).ToString();
            }
            Enabled = true;
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceID, txtAllowanceName , txtAmount, txtStaffAmount };
            for(int i = 0;  i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private void Reload()
        {
            FrmQuanLyPhuCap frmOpen = new FrmQuanLyPhuCap(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        ////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtAllowanceName, txtAmount };
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
            if (string.IsNullOrEmpty(txtAllowanceID.Text))
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
        private void txtAmount_KeyPress(object sender, KeyPressEventArgs e)
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
        ////////////////////////////////////////////////////////////////////////////////////////
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
            PhuCap phuCap = phuCapBUS.GetPhuCap().FirstOrDefault(pc => pc.MaPC == txtAllowanceID.Text);
            string tenPhuCap = txtAllowanceName.Text;
            string tienPhuCapCu = String.Format(fVND, "{0:N3} ₫", phuCap.TienPhuCap);
            string tienPhuCapMoi = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
            if (tenPhuCap != phuCap.TenPhuCap)
                changes.Add($"- Tên phụ cấp: {phuCap.TenPhuCap} -> Tên phụ cấp: {tenPhuCap}");
            if (tienPhuCapCu != tienPhuCapMoi)
                changes.Add($"- Số tiền: {tienPhuCapCu} -> Số tiền : {tienPhuCapMoi}");
            return string.Join("\n", changes);
        }
        public void ChiTietButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Chi tiết";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvAllowance.Columns.Add(btnXoa);
            }
        }
        public void ChiTietPhuCap(string maPC)
        {
            FrmChiTietPhuCap frmOpen = new FrmChiTietPhuCap(maNV, maPC);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            PhuCap newPhuCap = new PhuCap
            {
                MaPC = "",
                TenPhuCap = txtAllowanceName.Text,
                TienPhuCap = decimal.Parse(txtAmount.Text)
            };
            if (phuCapBUS.Save(newPhuCap))
            {
                string tenPhuCap = txtAllowanceName.Text;
                string soTien = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
                string thaoTac = $"Thêm {tenPhuCap}:\n  - Số tiền: {soTien}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            Reload();
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            PhuCap newPhuCap = new PhuCap
            {
                MaPC = txtAllowanceID.Text,
                TenPhuCap = txtAllowanceName.Text,
                TienPhuCap = decimal.Parse(txtAmount.Text)
            };
            if (phuCapBUS.Save(newPhuCap))
            {
                string thaoTac = $"Sửa {txtAllowanceID.Text}";                
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += $":\n{chiTietSua}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            PhuCap phuCap = new PhuCap();
            phuCap.MaPC = txtAllowanceID.Text;
            if (phuCapBUS.Delete(phuCap))
            {
                string tenPhuCap = txtAllowanceName.Text;
                string soTien = String.Format(fVND, "{0:N3} ₫", decimal.Parse(txtAmount.Text));
                string thaoTac = $"Xoá {tenPhuCap}:\n  - Số tiền: {soTien}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvAllowance_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtAllowanceID.Text = dgvAllowance.Rows[rowIndex].Cells[0].Value.ToString();
            txtAllowanceName.Text = dgvAllowance.Rows[rowIndex].Cells[1].Value.ToString();
            txtAmount.Text = phuCapBUS.ThongTinPhuCap(txtAllowanceID.Text).TienPhuCap.ToString();
            txtStaffAmount.Text = dgvAllowance.Rows[rowIndex].Cells[3].Value.ToString();
            if (e.ColumnIndex == 4)
                ChiTietPhuCap(txtAllowanceID.Text);
        }
       
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadPhuCap();      
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadPhuCapTimKiem(txtSearch.Text);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
