using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmQuanLyLoaiPhieu : Form
    {
        private readonly QuanLyLoaiPhieuBUS loaiPhieuBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<LoaiPhieuViewModels> danhSachLoaiPhieu;
        private IEnumerable<LoaiPhieuViewModels> danhSachLoaiPhieuTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyLoaiPhieu(string maNV)
        {
            InitializeComponent();
            loaiPhieuBUS = new QuanLyLoaiPhieuBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();      
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý loại phiếu").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkThaoTac = false;
        }
        private void FrmQuanLyLoaiPhieu_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            InputStatus(false);
            PhanQuyen();
            LoadLoaiPhieu();
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
            List<TextBox> listTextBox = new List<TextBox> { txtCardTypeName };
            if(!value)
                listTextBox.AddRange(new List<TextBox> { txtCardTypeID, txtCardTypeCreateAmount});
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
        private void LoadLoaiPhieu()
        {
            Enabled = false;
            dgvCardType.Rows.Clear();
            danhSachLoaiPhieu = loaiPhieuBUS.GetAllLoaiPhieu();
            int rowAdd;
            foreach (var lp in danhSachLoaiPhieu)
            {
                rowAdd = dgvCardType.Rows.Add();
                dgvCardType.Rows[rowAdd].Cells[0].Value = lp.MaLP;
                dgvCardType.Rows[rowAdd].Cells[1].Value = lp.TenLoaiPhieu;
                dgvCardType.Rows[rowAdd].Cells[2].Value = loaiPhieuBUS.SoLuongPhieuLap(lp.MaLP).ToString();
            }
            Enabled = true;
        }
        private void LoadLoaiPhieuTimKiem(string timKiem)
        {
            Enabled = false;
            dgvCardType.Rows.Clear();
            danhSachLoaiPhieuTimKiem = loaiPhieuBUS.SearchLoaiPhieu(timKiem);
            int rowAdd;
            foreach (var lp in danhSachLoaiPhieuTimKiem)
            {
                rowAdd = dgvCardType.Rows.Add();
                dgvCardType.Rows[rowAdd].Cells[0].Value = lp.MaLP;
                dgvCardType.Rows[rowAdd].Cells[1].Value = lp.TenLoaiPhieu;
                dgvCardType.Rows[rowAdd].Cells[2].Value = loaiPhieuBUS.SoLuongPhieuLap(lp.MaLP).ToString();
            }
            Enabled = true;
        }
        /////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtCardTypeID, txtCardTypeName, txtCardTypeName };
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("Text").SetValue(listTextBox[i], string.Empty);
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////s
        private void Reload()
        {
            FrmQuanLyLoaiPhieu frmOpen = new FrmQuanLyLoaiPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        //////////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtCardTypeName };
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
        private void EnableButton(object sender, EventArgs e)
        {
            if (!checkThaoTac)
                return;
            bool check;
            if (string.IsNullOrEmpty(txtCardTypeID.Text))
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
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadLoaiPhieu();
        }
        //////////////////////////////////////////////////////////////////////////////////////////
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
            LoaiPhieu loaiPhieu = loaiPhieuBUS.GetLoaiPhieu().FirstOrDefault(lp => lp.MaLP == txtCardTypeID.Text);
            string tenLoaiPhieu = txtCardTypeName.Text;
            if (tenLoaiPhieu != loaiPhieu.TenLoaiPhieu)
                changes.Add($"- Tên loại phiếu: {loaiPhieu.TenLoaiPhieu} -> Tên loại phiếu: {tenLoaiPhieu}");
            return string.Join("\n", changes);
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            LoaiPhieu newLoaiPhieu = new LoaiPhieu
            {
                MaLP = "",
                TenLoaiPhieu = txtCardTypeName.Text,   
            };
            if (loaiPhieuBUS.Save(newLoaiPhieu))
            {
                string thaoTac = $"Thêm loại phiếu {txtCardTypeName.Text}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            Reload();
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            LoaiPhieu newLoaiPhieu = new LoaiPhieu
            {
                MaLP = txtCardTypeID.Text,
                TenLoaiPhieu = txtCardTypeName.Text,
            };
            if (loaiPhieuBUS.Save(newLoaiPhieu))
            {
                string thaoTac = $"Sửa loại phiếu {txtCardTypeID.Text}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += $":\n{chiTietSua}";
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            LoaiPhieu newLoaiPhieu = new LoaiPhieu
            {
                MaLP = txtCardTypeID.Text
            };
            if (loaiPhieuBUS.Delete(newLoaiPhieu))
            {
                string thaoTac = $"Xoá loại phiếu {txtCardTypeName.Text}";
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
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvCardType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtCardTypeID.Text = dgvCardType.Rows[rowIndex].Cells[0].Value.ToString();
            txtCardTypeName.Text = dgvCardType.Rows[rowIndex].Cells[1].Value.ToString();
            txtCardTypeCreateAmount.Text = dgvCardType.Rows[rowIndex].Cells[2].Value.ToString();
        }       
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiPhieuTimKiem(txtSearch.Text);
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
