using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmLichLamViec : Form
    {        
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichLamViecBUS lichLamViecBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<LichLamViecViewModels> danhSachLichLamViec;
        private IEnumerable<LichLamViecViewModels> danhSachLichLamViecTimKiem;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maPB;
        private readonly string maNV;
        private readonly string maGD;
        private readonly string maCV;
        private readonly string now;
        private bool checkTruyCap;
        private bool checkThaoTac;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmLichLamViec(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            lichLamViecBUS = new LichLamViecBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý lịch làm việc").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            maCV = nv.MaCV;
            maPB = nv.ChucVu.PhongBan.MaPB;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            this.maNV = maNV;
            checkTruyCap = false;
            checkThaoTac = false;
            now = DateTime.Now.ToString(formatDate);
        }
        private void FrmLichLamViec_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            ButtonStatus(false);
            PhanQuyen();
            LoadLichLamViec();
        }
        private void LoadThongTinDangNhap()
        {
            lblStaffIDLoginValue.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblFullNameValue.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblFullNameValue.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lbllblDeapartmentLoginValue.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblPositionLoginValue.Text = nv.ChucVu.TenChucVu;
        }
        private void PhanQuyen()
        {
            foreach(PhanQuyen qh in phanQuyen)
            {
                if (qh.QuyenHan.TenQuyenHan.Contains("Thao tác") && qh.CapQuyen)
                {
                    checkThaoTac = true;
                    pnlMenu.Visible = true;
                    ButtonStatus(true);
                    continue;
                }
                else if (qh.QuyenHan.TenQuyenHan.Contains("Truy cập") && qh.CapQuyen)
                {
                    checkTruyCap = true;
                    ChiTietButton();
                    continue;
                }
            }
        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnAdd };
            if (!value)
            {
                pnlMenu.Visible = false;
                return;
            }
            if (value)
                XoaButton();
            for(int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
                if(value)
                    typeof(Button).GetProperty("Enabled").SetValue(listButtons[i], !value);
            }
        }
        private void LoadLichLamViec()
        {
            Enabled = false;
            dgvWorkSchedule.Rows.Clear();
            danhSachLichLamViec = lichLamViecBUS.GetLichLamViecTheoPhongBan(maPB);
            int rowAdd;
            foreach (var llv in danhSachLichLamViec)
            {
                rowAdd = dgvWorkSchedule.Rows.Add();
                dgvWorkSchedule.Rows[rowAdd].Cells[0].Value = llv.MaLLV;
                dgvWorkSchedule.Rows[rowAdd].Cells[1].Value = llv.MaNV;
                dgvWorkSchedule.Rows[rowAdd].Cells[2].Value = llv.HoTen;
                dgvWorkSchedule.Rows[rowAdd].Cells[3].Value = llv.PhongBan;
                dgvWorkSchedule.Rows[rowAdd].Cells[4].Value = llv.ChucVu;
                dgvWorkSchedule.Rows[rowAdd].Cells[5].Value = llv.NgayLam.ToString(formatDate);                
            }
            Enabled = true;
        }
        private void LoadLichLamViecTimKiem(string timKiem)
        {
            Enabled = false;
            dgvWorkSchedule.Rows.Clear();
            danhSachLichLamViecTimKiem = lichLamViecBUS.SearchLichLamViecTheoPhongBan(maPB, timKiem);
            int rowAdd;
            foreach (var llv in danhSachLichLamViecTimKiem)
            {
                rowAdd = dgvWorkSchedule.Rows.Add();
                dgvWorkSchedule.Rows[rowAdd].Cells[0].Value = llv.MaLLV;
                dgvWorkSchedule.Rows[rowAdd].Cells[1].Value = llv.MaNV;
                dgvWorkSchedule.Rows[rowAdd].Cells[2].Value = llv.HoTen;
                dgvWorkSchedule.Rows[rowAdd].Cells[3].Value = llv.PhongBan;
                dgvWorkSchedule.Rows[rowAdd].Cells[4].Value = llv.ChucVu;
                dgvWorkSchedule.Rows[rowAdd].Cells[5].Value = llv.NgayLam.ToString(formatDate);
            }
            Enabled = true;
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmLichLamViec frmOpen = new FrmLichLamViec(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac, string maTT) 
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private void ChiTietButton()
        {
            DataGridViewButtonColumn btnChiTiet = new DataGridViewButtonColumn();
            {
                btnChiTiet.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnChiTiet.Text = "Chi tiết";
                btnChiTiet.UseColumnTextForButtonValue = true;
                btnChiTiet.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnChiTiet.DefaultCellStyle = buttonCellStyle;
                dgvWorkSchedule.Columns.Add(btnChiTiet);
            }            
        }
        private void XoaButton()
        {
            DataGridViewButtonColumn btnXoa = new DataGridViewButtonColumn();
            {
                btnXoa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
                btnXoa.Text = "Xoá";
                btnXoa.UseColumnTextForButtonValue = true;
                btnXoa.FlatStyle = FlatStyle.Popup;
                var buttonCellStyle = new DataGridViewCellStyle
                {
                    BackColor = SystemColors.ScrollBar,
                    Alignment = DataGridViewContentAlignment.MiddleCenter
                };
                btnXoa.DefaultCellStyle = buttonCellStyle;
                dgvWorkSchedule.Columns.Add(btnXoa);
            }
        }
        private void OpenChiTietLichLamViec(string maNV, string maLLV)
        {
            FrmChiTietLichLamViec frmOpen = new FrmChiTietLichLamViec(maNV, maLLV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void XoaLichLamViec(string maLLV, string phongBan, string ngayLam)
        {
            try
            {
                LichLamViec lichLamViec = new LichLamViec
                {
                    MaLLV = maLLV,
                };
                if (lichLamViecBUS.Delete(lichLamViec))
                {
                    string thaoTac = $"Xoá lịch làm việc ngày {ngayLam} - phòng ban {phongBan}";
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
        /////////////////////////////////////////////////////////////////////////////////////////
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
            try
            {
                LichLamViec lichLamViec = new LichLamViec
                {
                    MaLLV = "",
                    MaNV = maNV,
                    NgayLam = dtpWorkDate.Value,
                };
                if (lichLamViecBUS.Save(lichLamViec))
                {
                    string ngayLam = dtpWorkDate.Text;
                    string phongBan = nv.ChucVu.PhongBan.TenPhongBan;
                    string thaoTac = $"Thêm lịch làm việc ngày {ngayLam} - phòng ban {phongBan}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                }
                Reload();
            }
            catch(Exception ex)
            {
                ErrorMessage(ex);
            }
            
        }
        private void dgvWorkSchedule_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            string maLLV = dgvWorkSchedule.Rows[rowIndex].Cells[0].Value.ToString();
            string phongBan = dgvWorkSchedule.Rows[rowIndex].Cells[3].Value.ToString();
            string ngayLam = dgvWorkSchedule.Rows[rowIndex].Cells[5].Value.ToString();           
            string date = DateTime.Now.ToString(formatDate);
            if (rowIndex < 0)
                return;
            if (checkTruyCap && checkThaoTac)
            {

                if (e.ColumnIndex == 6)
                {
                    if (DateTime.Parse(ngayLam) < DateTime.Parse(date))
                    {
                        MessageBox.Show("Không thể xoá lịch trong quá khứ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    XoaLichLamViec(maLLV, phongBan, ngayLam);
                }
                if (e.ColumnIndex == 7)
                    OpenChiTietLichLamViec(maNV, maLLV);
            }
            else if(checkTruyCap)
            {
                if (e.ColumnIndex == 6)
                    OpenChiTietLichLamViec(maNV, maLLV);
            }
            else if (checkThaoTac)
            {
                if (e.ColumnIndex == 6)
                {
                    if (DateTime.Parse(ngayLam) < DateTime.Parse(date))
                    {
                        MessageBox.Show("Không thể xoá lịch trong quá khứ!", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                    XoaLichLamViec(maLLV, phongBan, ngayLam);
                }
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmManHinhChinh frmOpen = new FrmManHinhChinh(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void txtSearch_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadLichLamViec();
        }

        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadLichLamViecTimKiem(txtSearch.Text);
            }
        }
        private void dtpWorkDate_ValueChanged(object sender, EventArgs e)
        {
            int check = 0;
            DateTime ngayLam = DateTime.Parse(dtpWorkDate.Text);
            IEnumerable<LichLamViec> locLich = lichLamViecBUS.GetLichLamViec().Where(llv => llv.NhanVien.ChucVu.PhongBan.MaPB == maPB && llv.NgayLam == ngayLam);
            foreach (var nv in locLich)            
                if (nv.NgayLam.ToString(formatDate) == dtpWorkDate.Text)
                {
                    check = 1;
                    break;
                }                                                  
            if (DateTime.Parse(dtpWorkDate.Text) < DateTime.Parse(now) || check == 1)
                btnAdd.Enabled = false;
            else
                btnAdd.Enabled = true;
        }

    }
}
