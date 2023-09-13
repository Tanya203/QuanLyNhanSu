using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

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
            cmbHinhThucChamCong.DisplayMember = "TenHinhThucChamCong";
            cmbHinhThucChamCong.ValueMember = "MaHTCC";            
            LoadThongTinDangNhap();
            LoadHinhThucChamCong();
            InputStatus(false);
            PhanQuyen();
            LoadLoaiHopDong();
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
            List<object> listInput = new List<object> {txtTenLHD, cmbHinhThucChamCong };
            if (!value)
                listInput.AddRange(new List<object> {txtMaLHD, txtSoLuongNhanVien});
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
            List<Button> listButtons = new List<Button> { btnThem, btnSua, btnXoa, btnHuy };
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnHuy)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadLoaiHopDong()
        {
            Enabled = false;
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDong = loaiHopDongBUS.GetAllLoaiHopDong();
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDong)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = lhd.TenHinhThucChamCong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[3].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
            }
            Enabled = true;
        }
        private void LoadHinhThucChamCong()
        {
            cmbHinhThucChamCong.DataSource = hinhThucChamCongBUS.GetAllHinhThucChamCong();
            AutoAdjustComboBox(cmbHinhThucChamCong);
        }
        private void LoadLoaiHopDongTimKiem(string timKiem)
        {
            Enabled = false;
            dgvThongTinLoaiHopDong.Rows.Clear();
            danhSachLoaiHopDongTimKiem = loaiHopDongBUS.SearchLoaiHopDong(timKiem);           
            int rowAdd;
            foreach (var lhd in danhSachLoaiHopDongTimKiem)
            {
                rowAdd = dgvThongTinLoaiHopDong.Rows.Add();
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[0].Value = lhd.MaLHD;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[1].Value = lhd.TenLoaiHopDong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[2].Value = lhd.TenHinhThucChamCong;
                dgvThongTinLoaiHopDong.Rows[rowAdd].Cells[3].Value = loaiHopDongBUS.TongSoNhanVienTrongLoaiHopDong(lhd.MaLHD).ToString();
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
            List<object> listInput = new List<object> { txtMaLHD, txtTenLHD, txtSoLuongNhanVien, cmbHinhThucChamCong};
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
            List<TextBox> listTextBox = new List<TextBox> { txtTenLHD };
            for (int i = 0; i < listTextBox.Count; i++)
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
            if (string.IsNullOrEmpty(txtMaLHD.Text))
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
            LoaiHopDong lhd = loaiHopDongBUS.GetLoaiHopDong().FirstOrDefault(hd => hd.MaLHD == txtMaLHD.Text);
            string tenLoaiHopDong = txtTenLHD.Text;
            string hinhThucChamCong = cmbHinhThucChamCong.Text;
            if (tenLoaiHopDong != lhd.TenLoaiHopDong)
                changes.Add($"- Tên loại hợp đồng {lhd.TenLoaiHopDong} -> Tên loại hợp đồng: {tenLoaiHopDong}");
            if (hinhThucChamCong != lhd.HinhThucChamCong.TenHinhThucChamCong)
                changes.Add($"- Hình thức chấm công: {lhd.HinhThucChamCong.TenHinhThucChamCong} -> Hình thức chấm công: {hinhThucChamCong}");
            return string.Join("\n", changes);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = "",
                TenLoaiHopDong = txtTenLHD.Text,
                MaHTCC = cmbHinhThucChamCong.SelectedValue.ToString(),
            };
            if (loaiHopDongBUS.Save(newLoaiHopDong))
            {
                string tenLoaiHopDong = txtTenLHD.Text;
                string hinhThucChamCong = cmbHinhThucChamCong.Text;
                string thaoTac = $"Thêm loại hợp đông {tenLoaiHopDong}: \n  - Hình thức chấm công: {hinhThucChamCong}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            Reload();
        }
        private void btnHuy_Click(object sender, EventArgs e)
        {
            ClearAllText();
        }
        private void btnSua_Click(object sender, EventArgs e)
        {
            string chiTietSua = CheckChange();
            LoaiHopDong newLoaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text,
                TenLoaiHopDong = txtTenLHD.Text,
                MaHTCC = cmbHinhThucChamCong.SelectedValue.ToString(),
            };
            if (loaiHopDongBUS.Save(newLoaiHopDong))
            {
                string thaoTac = $"Sửa loại hợp đồng {txtMaLHD.Text}";                
                if (!string.IsNullOrEmpty(chiTietSua))
                    thaoTac += $":\n{chiTietSua}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Sửa")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }            
        }
        private void btnXoa_Click(object sender, EventArgs e)
        {
            LoaiHopDong loaiHopDong = new LoaiHopDong
            {
                MaLHD = txtMaLHD.Text
            };
            if (loaiHopDongBUS.Delete(loaiHopDong))
            {
                string tenLoaiHopDong = txtTenLHD.Text;
                string hinhThucChamCong = cmbHinhThucChamCong.Text;
                string thaoTac = $"Xoá loại hợp đồng {tenLoaiHopDong}:\n    - Hình thức chấm công: {hinhThucChamCong}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }            
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void dgvThongTinLoaiHopDong_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtMaLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[0].Value.ToString();
            txtTenLHD.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[1].Value.ToString();
            cmbHinhThucChamCong.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[2].Value.ToString();
            txtSoLuongNhanVien.Text = dgvThongTinLoaiHopDong.Rows[rowIndex].Cells[3].Value.ToString();
        }           
        private void TimKiem(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTimKiem.Text))
                LoadLoaiHopDong();
        }
        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadLoaiHopDongTimKiem(txtTimKiem.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
