using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmKhoaTaiKhoan : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly NhanVien nv;
        private readonly NhanVien nvKhoa;
        private readonly string maNV;
        private readonly string maNV_Khoa;
        private readonly string maGD;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmKhoaTaiKhoan(string maNV, string maNV_Khoa)
        {
            InitializeComponent();

            nhanVienBUS = new QuanLyNhanVienBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý nhân viên").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tc => tc.MaGD == maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            nvKhoa = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV_Khoa);
            this.maNV = maNV;
            this.maNV_Khoa = maNV_Khoa;
            MessageBoxManager.Register_OnceOnly();
        }
        private void FrmKhoaTaiKhoan_Load(object sender, EventArgs e)
        {
            LoadThongTinDangNhap();
            lblLockAccount.Text += $" {nvKhoa.MaNV}";
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
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmKhoaTaiKhoan frmOpen = new FrmKhoaTaiKhoan(maNV, maNV_Khoa);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void btnBack_Click(object sender, EventArgs e)
        {
            this.Close();
        }
        private void LichSuThaoTac(string thaoTac, string maTT)
        {
            LichSuThaoTac newLichSuThaoTac = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                MaTT = maTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLichSuThaoTac);
        }
        private void btnLockAccount_Click(object sender, EventArgs e)
        {
            if(dtpLockDate.Value < DateTime.Now)
            {
                MessageBox.Show("Thời gian khoá phải lớn hơn thời gian hiện tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error); 
                return;
            }
            MessageBoxManager.Yes = "Có";
            MessageBoxManager.No = "Không";
            DialogResult ketQua = MessageBox.Show($"Xác nhận khoá tài khoản của nhân viên {maNV_Khoa} đến {dtpLockDate.Text}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ketQua == DialogResult.Yes)
            {
                nvKhoa.NgayKhoa = dtpLockDate.Value;
                if (nhanVienBUS.Save(nvKhoa))
                {
                    string thaoTac = $"Nhân viên {maNV} khoá tài khoản của nhân viên {maNV_Khoa} đến {dtpLockDate.Text}";
                    string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Khoá")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    this.Close();
                }
            }
            else
                return;        
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
