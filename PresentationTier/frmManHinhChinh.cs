using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmManHinhChinh : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly ChiTietLichLamViecBUS chiTietLichLamViecBUS;
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<ChamCong> lichLamViec;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly string maNV;
        private readonly string maCV;
        private readonly string maGD;
        private readonly string formatDate = "yyyy-MM-dd";
        public FrmManHinhChinh(string maNV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietLichLamViecBUS = new ChiTietLichLamViecBUS();
            giaoDienBUS = new GiaoDienBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Màn hính chính").MaGD;           
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            this.maNV = maNV;
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            MessageBoxManager.Register_OnceOnly();
        }
        private void frmManHinhChinh_Load(object sender, EventArgs e)
        {            
            LoadThongTinDangNhap();
            LoadLichLamViec();
            PhanQuyen();

        }
        private void LoadThongTinDangNhap()
        {
            lblValueStaffID.Text = nv.MaNV;
            if(string.IsNullOrEmpty(nv.TenLot))
                lblValueFullName.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblValueFullName.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblValueDepartment.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblValuePosition.Text = nv.ChucVu.TenChucVu;
            lblValueAbsence.Text = nv.SoNgayPhep.ToString();
        }
        private void LoadLichLamViec()
        {
            dgvWorkSchedule.Rows.Clear();
            DateTime ngayLam = DateTime.Parse(dtpWorkSchedule.Value.ToString(formatDate));
            lichLamViec = chiTietLichLamViecBUS.GetChiTietLichLamViec().Where(llv => llv.MaNV == maNV && llv.LichLamViec.NgayLam == ngayLam);
            int rowAdd;
            foreach (var nv in lichLamViec)
            {
                rowAdd = dgvWorkSchedule.Rows.Add();
                dgvWorkSchedule.Rows[rowAdd].Cells[0].Value = nv.MaLLV;
                dgvWorkSchedule.Rows[rowAdd].Cells[1].Value = nv.MaNV;
                dgvWorkSchedule.Rows[rowAdd].Cells[2].Value = nv.LichLamViec.NgayLam.ToString(formatDate);
                dgvWorkSchedule.Rows[rowAdd].Cells[3].Value = nv.Ca.TenCa;
                dgvWorkSchedule.Rows[rowAdd].Cells[4].Value = nv.LoaiCa.TenLoaiCa;
                dgvWorkSchedule.Rows[rowAdd].Cells[5].Value = nv.ThoiGianDen;
                dgvWorkSchedule.Rows[rowAdd].Cells[6].Value = nv.ThoiGianVe;
                dgvWorkSchedule.Rows[rowAdd].Cells[7].Value = nv.Phep;
            }
        }
        private void PhanQuyen()
        {
            int count = 0;            
            List<Button> button = new List<Button>{ btnStaffs, btnDepartment, btnPosition, btnShift, btnWorkSchedule, btnAllowance, btnCard, btnStatistics, btnContractType, btnAuthorization, btnOperateHistory};            
            foreach (PhanQuyen qh in phanQuyen)
            {
                if(!qh.CapQuyen)
                    typeof(Button).GetProperty("Visible").SetValue(button[count], false);
                count++;
            }
        }
        private void btnStaffs_Click(object sender, EventArgs e)
        {
            FrmQuanLyNhanVien frmOpen = new FrmQuanLyNhanVien(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }      
        private void btnDepartment_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhongBan frmOpen = new FrmQuanLyPhongBan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnPosition_Click(object sender, EventArgs e)
        {
            FrmQuanLyChucVu frmOpen = new FrmQuanLyChucVu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnShift_Click(object sender, EventArgs e)
        {
            FrmQuanLyCa frmOpen = new FrmQuanLyCa(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnWorkSchedule_Click(object sender, EventArgs e)
        {
            FrmLichLamViec frmOpen = new FrmLichLamViec(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnAllowance_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhuCap frmOpen = new FrmQuanLyPhuCap(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnCard_Click(object sender, EventArgs e)
        {
            FrmQuanLyPhieu frmOpen = new FrmQuanLyPhieu(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnStatistics_Click(object sender, EventArgs e)
        {
            FrmThongKe frmOpen = new FrmThongKe(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnContractType_Click(object sender, EventArgs e)
        {
            FrmQuanLyLoaiHopDong frmOpen = new FrmQuanLyLoaiHopDong(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnDecentralization_Click(object sender, EventArgs e)
        {
            FrmPhanQuyen frmOpen = new FrmPhanQuyen(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnOperateHistory_Click(object sender, EventArgs e)
        {
            FrmLichSuThaoTac frmOpen = new FrmLichSuThaoTac(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void btnAccountInfo_Click(object sender, EventArgs e)
        {
            FrmThongTinTaiKhoan frmOpen = new FrmThongTinTaiKhoan(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void btnLogOut_Click(object sender, EventArgs e)
        {
            MessageBoxManager.Yes = "Có";
            MessageBoxManager.No = "Không";
            DialogResult ketQua = MessageBox.Show("Xác nhận đăng xuất", "Đăng xuất", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ketQua == DialogResult.Yes)
            {
                FrmDangNhap frmOpen = new FrmDangNhap();
                frmOpen.Show();
                this.Hide();
                frmOpen.FormClosed += CloseForm;
            }           
        }
        private void dtpWorkSchedule_ValueChanged(object sender, EventArgs e)
        {
            LoadLichLamViec();
        }
    }
}
