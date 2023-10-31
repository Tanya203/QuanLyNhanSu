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
    public partial class FrmQuanLyCa : Form
    {
        private readonly QuanLyCaBUS caBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<CaViewModels> danhSachCa;
        private IEnumerable<CaViewModels> danhSachCaTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private bool checkThaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmQuanLyCa(string maNV)
        {
            InitializeComponent();
            caBUS = new QuanLyCaBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý ca").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();            
            dtpStartTime.Text = "00:00";
            dtpEndTime.Text = "00:00";
            this.maNV = maNV;
            checkThaoTac = false;

        }
        private void frmQuanLyCa_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            InputStatus(false);
            PhanQuyen();
            LoadCa();
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
                else if(qh.QuyenHan.TenQuyenHan.Contains("Truy cập") && qh.CapQuyen)
                {
                    btnShiftType.Visible = true;
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);    
            List<object> listInput = new List<object> { txtShiftName, dtpStartTime, dtpEndTime};
            if (!value)
                listInput.Add(txtShiftID);
            for(int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listInput[i], !value);
                    continue;
                }
                if (listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listInput[i], value);
                    continue;
                }
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnAdd, btnEdit, btnDelete, btnCancel };
            if (!value)
                listButtons.Add(btnShiftType);
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if (value && listButtons[i] != btnCancel && listButtons[i] != btnShiftType)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadCa()
        {
            Enabled = false;
            dgvShift.Rows.Clear();
            danhSachCa = caBUS.GetAllCa();
            int rowAdd;
            foreach (var ca in danhSachCa)
            {
                rowAdd = dgvShift.Rows.Add();
                dgvShift.Rows[rowAdd].Cells[0].Value = ca.MaCa;
                dgvShift.Rows[rowAdd].Cells[1].Value = ca.TenCa;
                dgvShift.Rows[rowAdd].Cells[2].Value = ca.GioBatDau;
                dgvShift.Rows[rowAdd].Cells[3].Value = ca.GioKetThuc;
            }
            Enabled = true;
        }
        private void LoadCaTimKiem(string timKiem)
        {
            Enabled = false;
            dgvShift.Rows.Clear();
            danhSachCaTimKiem = caBUS.SearchCa(timKiem);
            int rowAdd;
            foreach (var ca in danhSachCaTimKiem)
            {
                rowAdd = dgvShift.Rows.Add();
                dgvShift.Rows[rowAdd].Cells[0].Value = ca.MaCa;
                dgvShift.Rows[rowAdd].Cells[1].Value = ca.TenCa;
                dgvShift.Rows[rowAdd].Cells[2].Value = ca.GioBatDau;
                dgvShift.Rows[rowAdd].Cells[3].Value = ca.GioKetThuc;
            }
            Enabled = true;
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private void ClearAllText()
        {
            List<object> listInput = new List<object> { txtShiftID, txtShiftName, dtpStartTime, dtpEndTime };
            for(int i = 0; i < listInput.Count; i++)
            {
                if (listInput[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("Text").SetValue(listInput[i], string.Empty);
                    continue;
                }
                else if (listInput[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Text").SetValue(listInput[i], "00:00");
                    continue;
                }
            }
        }
        ///////////////////////////////////////////////////////////////////////////////////////       
        private void Reload()
        {
            FrmQuanLyCa frmOpen = new FrmQuanLyCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        ///////////////////////////////////////////////////////////////////////////////////////
        private bool CheckEmptyText(bool check)
        {
            List<TextBox> listTextBox = new List<TextBox> { txtShiftName };
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
            if (string.IsNullOrEmpty(txtShiftID.Text))
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
        private string CheckChange()
        {
            List<string> changes = new List<string>();
            Ca ca = caBUS.GetCa().FirstOrDefault(c => c.MaCa == txtShiftID.Text);
            TimeSpan gioBatDau = TimeSpan.Parse(dtpStartTime.Text);
            TimeSpan gioKetThuc = TimeSpan.Parse(dtpEndTime.Text);
            if (txtShiftName.Text != ca.TenCa)
                changes.Add($"- Tên ca: {ca.TenCa} -> Tên ca: {txtShiftName.Text}");           
            if (gioBatDau != ca.GioBatDau)
                changes.Add($"- Giờ bắt đầu: {ca.GioBatDau} -> Giờ bắt đầu: {gioBatDau}");            
            if (gioKetThuc != ca.GioKetThuc)
                changes.Add($"- Giờ kết thúc: {ca.GioKetThuc} -> Giờ kết thúc: {gioKetThuc}");
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
        private bool CheckCa()
        {
            bool checkGBD = true;
            bool checkGKT = true;
            TimeSpan gioBatDau = TimeSpan.Parse(dtpStartTime.Text);
            TimeSpan gioKetThuc = TimeSpan.Parse(dtpEndTime.Text);

            if (gioBatDau == gioKetThuc)
            {
                errProvider.SetError(dtpStartTime, "Giờ bắt đầu và giờ kết thúc trùng nhau");
                errProvider.SetError(dtpEndTime, "Giờ bắt đầu và giờ kết thúc trùng nhau");
                return false;
            }
            foreach (Ca ca in caBUS.GetCa().Where(ca => ca.MaCa != txtShiftID.Text))
            {
                if (!checkGBD && !checkGKT)
                    break;
                if (ca.GioBatDau == gioBatDau && checkGBD)
                {
                    checkGBD = false;
                    errProvider.SetError(dtpStartTime, $"Giờ bắt đầu trùng với ca {ca.TenCa}");
                }
                if (ca.GioKetThuc == gioKetThuc && checkGKT)
                {
                    checkGKT = false;
                    errProvider.SetError(dtpEndTime, $"Giờ kết thúc trùng với ca {ca.TenCa}");
                }
                if (gioBatDau > ca.GioBatDau && gioBatDau < ca.GioKetThuc && checkGBD)
                {
                    checkGBD = false;
                    errProvider.SetError(dtpStartTime, $"Giờ bắt đầu nằm giữa ca {ca.TenCa}");
                }
                if (gioKetThuc > ca.GioBatDau && gioKetThuc < ca.GioKetThuc && checkGKT)
                {
                    checkGKT = false;
                    errProvider.SetError(dtpEndTime, $"Giờ kết thúc nằm giữa ca {ca.TenCa}");
                }
                if ((ca.GioBatDau < ca.GioKetThuc && gioBatDau < ca.GioBatDau && gioKetThuc > ca.GioKetThuc) ||
                    (ca.GioBatDau > ca.GioKetThuc && checkGBD && checkGKT &&
                     ((gioBatDau > gioKetThuc) ||
                      (gioBatDau > ca.GioBatDau && gioKetThuc > ca.GioBatDau) ||
                      (gioBatDau < ca.GioKetThuc && gioKetThuc < ca.GioKetThuc) ||
                      (gioBatDau < ca.GioKetThuc && gioKetThuc > ca.GioKetThuc))))
                {
                    checkGBD = checkGKT = false;
                    errProvider.SetError(dtpStartTime, $"Giờ bắt đầu và kết thúc chồng qua ca {ca.TenCa}");
                    errProvider.SetError(dtpEndTime, $"Giờ bắt đầu và kết thúc chồng qua ca {ca.TenCa}");
                    break;
                }
            }

            if (!checkGBD || !checkGKT)
                return false;

            return true;
        }
        private bool CheckErrorInput()
        {
            errProvider.Clear();
            errProvider.SetError(txtShiftName, caBUS.GetCa().FirstOrDefault(ca => ca.TenCa == txtShiftName.Text && ca.MaCa != txtShiftID.Text) != null ? "Tên ca đã tồn tại" : string.Empty);
            if (errProvider.GetError(txtShiftName) != string.Empty || !CheckCa())
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
                Ca newCa = new Ca
                {
                    MaCa = "",
                    TenCa = txtShiftName.Text,
                    GioBatDau = TimeSpan.Parse(dtpStartTime.Text),
                    GioKetThuc = TimeSpan.Parse(dtpEndTime.Text),
                };
                if (caBUS.Save(newCa))
                {
                    string ca = txtShiftName.Text;
                    string gioBatDau = dtpStartTime.Text;
                    string gioKetThuc = dtpEndTime.Text;
                    string thaoTac = $"Thêm ca {ca}:\n - Giờ bắt đầu: {gioBatDau}\n - Giờ kết thúc: {gioKetThuc}";
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
            try
            {
                if (!CheckErrorInput())
                {
                    MessageBox.Show("Lỗi!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                string chiTietSua = CheckChange();
                Ca newCa = new Ca
                {
                    MaCa = txtShiftID.Text,
                    TenCa = txtShiftName.Text,
                    GioBatDau = TimeSpan.Parse(dtpStartTime.Text),
                    GioKetThuc = TimeSpan.Parse(dtpEndTime.Text),
                };
                if (caBUS.Save(newCa))
                {
                    string thaoTac = "Sửa ca " + txtShiftID.Text;
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
                Ca ca = new Ca
                {
                    MaCa = txtShiftID.Text,
                };
                if (caBUS.Delete(ca))
                {
                    string tenCa = txtShiftName.Text;
                    string gioBatDau = dtpStartTime.Text;
                    string gioKetThuc = dtpEndTime.Text;
                    string thaoTac = $"Xoá ca {tenCa}:\n - Giờ bắt đầu: {gioBatDau}\n - Giờ kết thúc: {gioKetThuc}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
            catch (Exception ex)
            {
                ErrorMessage(ex);
            }                              
        }
        private void btnCancel_Click(object sender, EventArgs e)
        {
            errProvider.Clear();
            ClearAllText();
        }
        private void btnShiftType_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiCa frm = new FrmQuanLyLoaiCa(maNV);
            frm.Show();
            this.Hide();
            frm.FormClosed += CloseForm;
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }       
        private void txtSearch_TextChange(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))            
                LoadCa();                      
        }
        private void dgvShift_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            errProvider.Clear();
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            txtShiftID.Text = dgvShift.Rows[rowIndex].Cells[0].Value.ToString();
            txtShiftName.Text = dgvShift.Rows[rowIndex].Cells[1].Value.ToString();
            dtpStartTime.Text = dgvShift.Rows[rowIndex].Cells[2].Value.ToString();
            dtpEndTime.Text = dgvShift.Rows[rowIndex].Cells[3].Value.ToString();
        }

        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadCaTimKiem(txtSearch.Text);
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

    }
}
