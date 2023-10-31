using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChiTietPhuCapMotNhanVien : Form
    {
        private readonly CultureInfo fVND = CultureInfo.GetCultureInfo("vi-VN");
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly ChiTietPhuCapBUS chiTietPhuCapBUS;
        private readonly QuanLyPhuCapBUS phuCapBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private IEnumerable<ChiTietPhuCapViewModels> danhSachChiTietPhuCap;
        private readonly IEnumerable<ChiTietPhuCapViewModels> ctpc;
        private readonly List<ThaoTac> listThaoTac;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string nhanVienPC;
        private readonly string maGD;
        private readonly string check;
        private string maPC_Chon;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmChiTietPhuCapMotNhanVien(string maNV, string nhanVienPC, string check)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietPhuCapBUS = new ChiTietPhuCapBUS();
            phuCapBUS = new QuanLyPhuCapBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Phụ cấp một nhân viên").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            ctpc = chiTietPhuCapBUS.GetPhuCapMotNhanVien(nhanVienPC);
            this.maNV = maNV;
            this.nhanVienPC = nhanVienPC;
            this.check = check;
        }
        private void FrmChiTietPhuCapMotNhanVien_Load(object sender, EventArgs e)
        {
            cmbAllowance.DisplayMember = "TenPhuCap";
            cmbAllowance.ValueMember = "MaPC";
            LoadPhuCapNhanVien();
            LoadThongTinDangNhap();
            LoadPhuCap();            
            txtStaffID.ReadOnly = true;
            txtAmount.ReadOnly = true;
            txtTongPhuCap.ReadOnly = true;
            pnlMenu.Visible = false;
            lblAllowanceText.Visible = false;
            if(check == "nhanVien")
            {
                lblAllowanceText.Visible = false;
                pnlMenu.Visible = true;                
                XoaButton();
            }                           
        }
        private void LoadThongTinDangNhap()
        {
            lblStaffIDLoginValue.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblFullNameValue.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblFullNameValue.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblDeapartmentLoginValue.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblPositionLoginValue.Text = nv.ChucVu.TenChucVu;
        }
        private void LoadPhuCap()
        {
            List<PhuCap> phuCap = phuCapBUS.GetPhuCap().ToList();
            foreach (var pc in ctpc)
                phuCap = phuCap.Where(p => p.MaPC != pc.MaPC).ToList();
            if(phuCap.Count() == 0)
                btnAdd.Enabled = false;
            cmbAllowance.DataSource = phuCap;
            AutoAdjustComboBox(cmbAllowance);
        }
        private void LoadPhuCapNhanVien()
        {
            Enabled = false;
            dgvAllowanceDetail.Rows.Clear();
            danhSachChiTietPhuCap = chiTietPhuCapBUS.GetPhuCapMotNhanVien(nhanVienPC);
            int rowAdd;
            foreach (var phieu in danhSachChiTietPhuCap)
            {
                rowAdd = dgvAllowanceDetail.Rows.Add();
                dgvAllowanceDetail.Rows[rowAdd].Cells[0].Value = phieu.MaNV;                
                dgvAllowanceDetail.Rows[rowAdd].Cells[1].Value = phieu.HoTen;
                dgvAllowanceDetail.Rows[rowAdd].Cells[2].Value = phieu.PhongBan;
                dgvAllowanceDetail.Rows[rowAdd].Cells[3].Value = phieu.ChucVu;
                dgvAllowanceDetail.Rows[rowAdd].Cells[4].Value = phieu.MaPC;
                dgvAllowanceDetail.Rows[rowAdd].Cells[5].Value = phieu.TenPhuCap;
                dgvAllowanceDetail.Rows[rowAdd].Cells[6].Value = String.Format(fVND, "{0:N3} ₫", phieu.TienPhuCap);
            }
            txtTongPhuCap.Text = String.Format(fVND, "{0:N3} ₫", chiTietPhuCapBUS.TongPhuCapMotNhanVien(nhanVienPC));
            txtStaffID.Text = nhanVienPC;
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
        //////////////////////////////////////////////////////////////////////////////////////        
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmChiTietPhuCapMotNhanVien frmOpen = new FrmChiTietPhuCapMotNhanVien(maNV, nhanVienPC, check);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmbAllowance_TextChanged(object sender, EventArgs e)
        {
            PhuCap phuCap = phuCapBUS.ThongTinPhuCap(cmbAllowance.SelectedValue.ToString());
            if (string.IsNullOrEmpty(cmbAllowance.Text))
                btnAdd.Enabled = false;
            else
            {
                btnAdd.Enabled = true;
                txtAmount.Text = String.Format(fVND, "{0:N3} ₫", phuCap.TienPhuCap);
            }            
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac, string maTT)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = this.maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            ChiTietPhuCap chiTietPhuCap = new ChiTietPhuCap
            {
                MaNV = nhanVienPC,
                MaPC = cmbAllowance.SelectedValue.ToString(),                
            };
            if (chiTietPhuCapBUS.Save(chiTietPhuCap))
            {
                string thaoTac = $"Thêm phụ cấp {cmbAllowance.Text} cho nhân viên {nhanVienPC}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
            txtAmount.Text = string.Empty;
            Reload();
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
                dgvAllowanceDetail.Columns.Add(btnXoa);
            }
        }
        private void XoaPhuCap( string maPC, string tenPC)
        {
            ChiTietPhuCap chiTietPhuCap = new ChiTietPhuCap
            {
                MaPC = maPC,
                MaNV = maNV                
            };
            if (chiTietPhuCapBUS.Delete(chiTietPhuCap))
            {
                string thaoTac = $"Xoá phụ cấp {tenPC} của nhân viên {nhanVienPC}";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }
        }
        private void dgvAllowanceDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int rowIndex = e.RowIndex;
            if (rowIndex < 0)
                return;
            if (e.ColumnIndex == 7)
            {
                maPC_Chon = dgvAllowanceDetail.Rows[rowIndex].Cells[4].Value.ToString();
                string tenPC = dgvAllowanceDetail.Rows[rowIndex].Cells[5].Value.ToString();
                XoaPhuCap(maPC_Chon, tenPC);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            if(check == "nhanVien")
            {
                FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
                frmOpen.Show();
                this.Hide();
                frmOpen.FormClosed += CloseForm;
            }
            else
            {
                FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan(maNV);
                frmOpen.Show();
                this.Hide();
                frmOpen.FormClosed += CloseForm;
            }
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }        
    }
}
