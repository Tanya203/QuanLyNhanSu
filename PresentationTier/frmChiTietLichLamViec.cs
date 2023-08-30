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
    public partial class FrmChiTietLichLamViec : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly ChiTietLichLamViecBUS chiTietLichLamViecBUS;
        private readonly LichLamViecBUS lichLamViecBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly QuanLyCaBUS caBUS;
        private readonly QuanLyLoaiCaBUS loaiCaBUS;
        private IEnumerable<ChiTietLichLamViecViewModels> chiTietLichLamViec;
        private IEnumerable<ChiTietLichLamViecViewModels> chiTietLichLamViecTimKiem;
        private IEnumerable<ChamCong> chamCong;
        private readonly NhanVien nv;
        private readonly LichLamViec llv;
        private readonly string maNV;
        private readonly string maLLV;
        private readonly string maPB;
        private readonly int countCa;
        private string maNV_Chon;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string now;
        public FrmChiTietLichLamViec(string maNV, string maLLV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietLichLamViecBUS = new ChiTietLichLamViecBUS();
            lichLamViecBUS = new LichLamViecBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            caBUS = new QuanLyCaBUS();
            loaiCaBUS = new QuanLyLoaiCaBUS();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            chamCong = chiTietLichLamViecBUS.GetChiTietLichLamViec().Where(ct => ct.MaLLV == maLLV);
            this.maNV = maNV;
            this.maLLV = maLLV;
            maPB = nv.ChucVu.PhongBan.MaPB;
            countCa = caBUS.GetCa().Count();
            MessageBoxManager.Register_OnceOnly();
            llv = lichLamViecBUS.GetLichLamViec().FirstOrDefault(llv => llv.MaLLV == maLLV); 
            now = DateTime.Now.ToString(formatDate);
        }
        private void FrmChiTietLichLamViec_Load(object sender, EventArgs e)
        {
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            cmbCa.DisplayMember = "TenCa";
            cmbCa.ValueMember = "MaCa";
            cmbLoaiCa.DisplayMember = "TenLoaiCa";
            cmbLoaiCa.ValueMember = "MaLC";
            LoadThongTinDangNhap();
            LoadThongTinLichLamViec();
            LoadChiTietLichLamViec();
            txtMaLLV.ReadOnly = true;
            txtMaNV.ReadOnly = true;
            txtPhongBan.ReadOnly = true;
            txtHoTenNV.ReadOnly = true;
            txtMaNV_Phep.ReadOnly = true;
            txtHoTenNhanVien_Phep.ReadOnly = true;
            dtpNgayLam.Enabled = false;
            cbPhep.Enabled = false;
            btnThem.Enabled = false;
            cmbCa.Enabled = false;
            cmbLoaiCa.Enabled = false;
            cmbNhanVien.Enabled = false;
            if (DateTime.Parse(dtpNgayLam.Text) >= DateTime.Parse(now))
            {
                XoaButton();
                btnThem.Enabled = true;
                cmbCa.Enabled = true;
                cmbLoaiCa.Enabled = true;
                cmbNhanVien.Enabled = true;
                LoadNhanVienTheoPhongBan();
                LoadCa(dtpNgayLam.Text, cmbNhanVien.SelectedValue.ToString());
                LoadLoaiCa();
            }                        
        }
        public void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.Ten}";
            else
                lblHoTenNV_DN.Text = $"{nv.Ho} {nv.TenLot} {nv.Ten}";
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        public void LoadThongTinLichLamViec()
        {
            txtMaLLV.Text = llv.MaLLV;
            txtMaNV.Text = llv.MaNV;
            txtPhongBan.Text = llv.NhanVien.ChucVu.PhongBan.TenPhongBan;
            dtpNgayLam.Text = llv.NgayLam.ToString();
        }
        public void LoadNhanVienTheoPhongBan()
        {            
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVien().Where(nv => nv.ChucVu.PhongBan.MaPB == maPB).ToList();   
            foreach(var nv in nhanVienList)
            {
                int count = chamCong.Where(x => x.MaNV == nv.MaNV).Count();
                if(count == countCa)
                    nhanVienList = nhanVienList.Where(x => x.MaNV != nv.MaNV).ToList();
            }                
            cmbNhanVien.DataSource = nhanVienList;
            if (string.IsNullOrEmpty(cmbNhanVien.Text))
            {
                cmbNhanVien.Enabled = false;
                txtHoTenNV.Text = string.Empty;
                btnThem.Enabled = false;
            }
            else
                cmbNhanVien.Enabled = true;
        }
        public void LoadCa(string ngayLam, string maNV)
        {
            List<Ca> ca = caBUS.GetCa().ToList();
            List<ChamCong> lichLamViec = chamCong.Where(nv => nv.MaNV == maNV /*&& nv.LichLamViec.NgayLam.ToString() == ngayLam*/).ToList();
            if(lichLamViec == null)
                cmbCa.DataSource = ca;
            else
                foreach(var nv in lichLamViec)
                    ca = ca.Where(x => x.MaCa != nv.MaCa).ToList();
            cmbCa.DataSource = ca;
            if (string.IsNullOrEmpty(cmbCa.Text))
            {
                cmbCa.Enabled = false;
                btnThem.Enabled = false;               
            }
            else
            {                             
                cmbCa.Enabled = true;
                btnThem.Enabled = true;
            }
        }
        public void LoadLoaiCa()
        {
            cmbLoaiCa.DataSource = loaiCaBUS.GetLoaiCa();
        }
        public void LoadChiTietLichLamViec()
        {
            Enabled = false;
            dgvChiTietLichLamViec.Rows.Clear();
            chiTietLichLamViec = chiTietLichLamViecBUS.GetChiTietLichLamViec(maLLV);
            int rowAdd;
            foreach (var nv in chiTietLichLamViec)
            {
                rowAdd = dgvChiTietLichLamViec.Rows.Add();
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[0].Value = nv.MaLLV;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[1].Value = nv.MaNV;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[2].Value = nv.HoTen;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[3].Value = nv.PhongBan;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[4].Value = nv.ChucVu;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[5].Value = nv.Ca;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[6].Value = nv.LoaiCa;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[7].Value = nv.ThoiGianDen;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[8].Value = nv.ThoiGianVe;
                if(nv.Phep)
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[9].Value = true;
                else
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[9].Value = false;
            } 
            Enabled = true;
        }
        public void LoadChiTietLichLamViecTimKiem(string timKiem)
        {
            Enabled = false;
            dgvChiTietLichLamViec.Rows.Clear();
            chiTietLichLamViecTimKiem = chiTietLichLamViecBUS.SearchChiTietLichLamViec(maLLV, timKiem);
            int rowAdd;
            foreach (var nv in chiTietLichLamViecTimKiem)
            {
                rowAdd = dgvChiTietLichLamViec.Rows.Add();
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[0].Value = nv.MaLLV;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[1].Value = nv.MaNV;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[2].Value = nv.HoTen;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[3].Value = nv.PhongBan;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[4].Value = nv.ChucVu;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[5].Value = nv.Ca;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[6].Value = nv.LoaiCa;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[7].Value = nv.ThoiGianDen;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[8].Value = nv.ThoiGianVe;
                if(nv.Phep)
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[9].Value = true;
                else
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[9].Value = false;                
            }
            Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmbNhanVien_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cmbNhanVien.Text))
            {
                NhanVien nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nhanVien => nhanVien.MaNV == cmbNhanVien.Text);
                txtHoTenNV.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
                btnThem.Enabled = true;
                LoadCa(dtpNgayLam.Text, cmbNhanVien.SelectedValue.ToString());
            }
            else
            {
                txtHoTenNV.Text = string.Empty;
                btnThem.Enabled = false;
            }                
        }
        private void txtMaNV_Phep_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtMaNV_Phep.Text) || (DateTime.Parse(dtpNgayLam.Text) < DateTime.Parse(now)))
                cbPhep.Enabled = false;
            else
                cbPhep.Enabled = true;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void CloseForm(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }
        private void Reload()
        {
            FrmChiTietLichLamViec frmOpen = new FrmChiTietLichLamViec(maNV, maLLV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void LichSuThaoTac(string thaoTac,string maNV)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = this.maNV,
                ThaoTacThucHien = $"{thaoTac} {maNV} lịch làm việc {maLLV} ngày {dtpNgayLam.Text}",
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChamCong newChamCong = new ChamCong
            {
                MaLLV = maLLV,
                MaNV = cmbNhanVien.SelectedValue.ToString(),
                MaCa = cmbCa.SelectedValue.ToString(),
                MaLC = cmbLoaiCa.SelectedValue.ToString(),
                Phep = false,
            };
            if (chiTietLichLamViecBUS.Save(newChamCong))
            {
                string maNV = cmbNhanVien.SelectedValue.ToString();
                string thaoTac = "Thêm nhân viên";
                LichSuThaoTac(thaoTac, maNV);
            }
            Reload();
        }      
        public void XoaButton()
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
                dgvChiTietLichLamViec.Columns.Add(btnXoa);
            }
        }
        public void XoaNhanVien()
        {
            ChamCong newChamCong = new ChamCong
            {
                MaLLV = maLLV,
                MaNV = maNV_Chon,
            };
            if (chiTietLichLamViecBUS.Delete(newChamCong))
            {
                string maNV = cmbNhanVien.SelectedValue.ToString();
                string thaoTac = "Xoá nhân viên";
                LichSuThaoTac(thaoTac, maNV);
                Reload();
            }
        }
        private void dgvChiTietLichLamViec_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            maNV_Chon = dgvChiTietLichLamViec.Rows[row].Cells[1].Value.ToString();
            txtMaNV_Phep.Text = dgvChiTietLichLamViec.Rows[row].Cells[1].Value.ToString();
            txtHoTenNhanVien_Phep.Text = dgvChiTietLichLamViec.Rows[row].Cells[2].Value.ToString();
            if((bool)dgvChiTietLichLamViec.Rows[row].Cells[9].Value)
                cbPhep.Checked = true;
            else
                cbPhep.Checked = false;
            if (e.ColumnIndex == 10)
            {
                XoaNhanVien();
            }
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            FrmLichLamViec frmOpen = new FrmLichLamViec(maNV);
            frmOpen.Show();
            this.Hide();
            frmOpen.FormClosed += CloseForm;
        }       
        
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void txtTimKiem_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(cmbNhanVien.Text))
                LoadChiTietLichLamViec();
        }

        private void txtTimKiem_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadChiTietLichLamViecTimKiem(txtTimKiem.Text);
        }

        private void cbPhep_Click(object sender, EventArgs e)
        {            
            ChamCong nv = chamCong.Where(x => x.MaNV == txtMaNV_Phep.Text).FirstOrDefault();
            string thongBao;
            string lichSu;
            if (cbPhep.Checked)
            {
                nv.Phep = true;
                thongBao = "Thêm phép của nhân viên";
                lichSu = "thêm phép cho nhân viên";
            }
            else
            {
                nv.Phep = false;
                thongBao = "Xoá phép của nhân viên";
                lichSu = "xoá phép của nhân viên";
            }                
            MessageBoxManager.Yes = "Có";
            MessageBoxManager.No = "Không";
            DialogResult ketQua = MessageBox.Show($"{thongBao} {txtMaNV_Phep.Text} vào ngày {dtpNgayLam.Text}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ketQua == DialogResult.Yes)
            {
                if (chiTietLichLamViecBUS.Save(nv))
                {
                    LichSuThaoTac newLstt = new LichSuThaoTac
                    {
                        NgayGio = DateTime.Now.ToString(formatDateTime),
                        MaNV = maNV,
                        ThaoTacThucHien = $"Nhân viên {maNV} {lichSu} {cmbNhanVien.SelectedValue} trong lịch làm việc {maLLV} ngày {dtpNgayLam.Text}",
                    };
                    lichSuThaoTacBUS.Save(newLstt);
                    Reload();
                }
            }
            if(ketQua == DialogResult.No)
            {
                if(cbPhep.Checked)
                    cbPhep.Checked = false;
                else
                    cbPhep.Checked = true;
            }    
        }
    }
}
