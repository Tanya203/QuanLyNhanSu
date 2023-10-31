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
            List<TextBox> listTextBox = new List<TextBox> { txtDepartmentName };
            if (!value)
                listTextBox.AddRange(new List<TextBox> { txtDepartmentID, txtStaffAmount});
            for (int i = 0; i < listTextBox.Count; i++)
            {
                typeof(TextBox).GetProperty("ReadOnly").SetValue(listTextBox[i], !value);                
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnAdd, btnEdit, btnDelete, btnCancel};
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnCancel)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadPhongBan()
        {
            Enabled = false;
            dgvDepartment.Rows.Clear();
            danhSachPhongBan = phongBanBUS.GetAllPhongBan();           
            int rowAdd;
            foreach (var pb in danhSachPhongBan)
            {
                rowAdd = dgvDepartment.Rows.Add();
                dgvDepartment.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvDepartment.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvDepartment.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
            Enabled = true;
        }
        private void LoadPhongBanTimKiem(string timKiem)
        {
            Enabled = false;
            dgvDepartment.Rows.Clear();
            danhSachPhongBanTimKiem = phongBanBUS.SearchPhongBan(timKiem);
            int rowAdd;
            foreach (var pb in danhSachPhongBanTimKiem)
            {
                rowAdd = dgvDepartment.Rows.Add();
                dgvDepartment.Rows[rowAdd].Cells[0].Value = pb.MaPB;
                dgvDepartment.Rows[rowAdd].Cells[1].Value = pb.TenPhongBan;
                dgvDepartment.Rows[rowAdd].Cells[2].Value = phongBanBUS.TongSoLuongNhanVienTrongPhongBan(pb.MaPB).ToString();
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<TextBox> listTextBox = new List<TextBox> { txtDepartmentID, txtDepartmentName, txtStaffAmount };
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
            List<TextBox> listTextBox = new List<TextBox> {txtDepartmentName};
            for(int i =0; i<listTextBox.Count; i++)
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
            if (string.IsNullOrEmpty(txtDepartmentID.Text))
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
            PhongBan phongBan = phongBanBUS.GetPhongBan().FirstOrDefault(pb => pb.MaPB == txtDepartmentID.Text);
            string tenPhongBan = txtDepartmentName.Text;
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
            errProvider.SetError(txtDepartmentName, phongBanBUS.GetPhongBan().FirstOrDefault(pb => pb.TenPhongBan == txtDepartmentName.Text && pb.MaPB != txtDepartmentID.Text) != null ? "Tên phòng ban đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtDepartmentName) != string.Empty)
                return false;
            return true;
        }
        private void btnAdd_Click(object sender, EventArgs e)
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
                    TenPhongBan = txtDepartmentName.Text
                };
                if (phongBanBUS.Save(newPhongBan))
                {
                    string thaoTac = $"Thêm phòng ban {txtDepartmentName.Text}";
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
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void btnEdit_Click(object sender, EventArgs e)
        {
            try
            {
                if(!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string chiTietSua = CheckChange();
                PhongBan phongBan = phongBanBUS.GetPhongBan().FirstOrDefault(pb => pb.MaPB == txtDepartmentID.Text);
                phongBan.TenPhongBan = txtDepartmentName.Text;
                if (phongBanBUS.Save(phongBan))
                {
                    string thaoTac = $"Sửa phòng ban {txtDepartmentID.Text}";
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
        private void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                PhongBan phongBan = new PhongBan
                {
                    MaPB = txtDepartmentID.Text
                };
                if (phongBanBUS.Delete(phongBan))
                {
                    string thaoTac = $"Xoá phòng ban {txtDepartmentName.Text}";
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
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void dgvDepartment_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtDepartmentID.Text = dgvDepartment.Rows[rowIndex].Cells[0].Value.ToString();
            txtDepartmentName.Text = dgvDepartment.Rows[rowIndex].Cells[1].Value.ToString();
            txtStaffAmount.Text = dgvDepartment.Rows[rowIndex].Cells[2].Value.ToString();
        }        
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadPhongBan();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadPhongBanTimKiem(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    } 
}
