using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;
using static System.Net.WebRequestMethods;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChiTietLichLamViec : Form
    {
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly ChiTietLichLamViecBUS chiTietLichLamViecBUS;
        private readonly LichLamViecBUS lichLamViecBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private IEnumerable<ChiTietLichLamViecViewModels> chiTietLichLamViec;
        private IEnumerable<ChiTietLichLamViecViewModels> chiTietLichLamViecTimKiem;
        private IEnumerable<ChamCong> chamCong;
        private readonly NhanVien nv;
        private readonly LichLamViec llv;
        private readonly string maNV;
        private readonly string maLLV;
        private readonly string maPB;
        private string maNV_Chon;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public FrmChiTietLichLamViec(string maNV, string maLLV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietLichLamViecBUS = new ChiTietLichLamViecBUS();
            lichLamViecBUS = new LichLamViecBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            nv = nhanVienBUS.ThongTinNhanVien(maNV);            
            chamCong = chiTietLichLamViecBUS.ThongTinChamCong(maLLV);
            this.maNV = maNV;
            this.maLLV = maLLV;
            maPB = nv.ChucVu.PhongBan.MaPB;
            MessageBoxManager.Register_OnceOnly();
            llv = lichLamViecBUS.ThongTinLichLamViec(maLLV);
        }
        private void FrmChiTietLichLamViec_Load(object sender, EventArgs e)
        {
            cmbNhanVien.DisplayMember = "MaNV";
            cmbNhanVien.ValueMember = "MaNV";
            LoadThongTinDangNhap();
            LoadThongTinLichLamViec();
            XoaButton();
            LoadChiTietLichLamViec();
            LoadNhanVienTheoPhongBan();
            txtMaLLV.ReadOnly = true;
            txtMaNV.ReadOnly = true;
            txtPhongBan.ReadOnly = true;
            txtCa.ReadOnly = true;
            txtLoaiCa.ReadOnly = true;
            txtHoTenNV.ReadOnly = true;
            dtpNgayLam.Enabled = false;
        }
        public void LoadThongTinDangNhap()
        {
            lblMaNV_DN.Text = nv.MaNV;
            if (string.IsNullOrEmpty(nv.TenLot))
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.Ten;
            else
                lblHoTenNV_DN.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
            lblPhongBanNV_DN.Text = nv.ChucVu.PhongBan.TenPhongBan;
            lblChucVuNV_DN.Text = nv.ChucVu.TenChucVu;
        }
        public void LoadThongTinLichLamViec()
        {
            txtMaLLV.Text = llv.MaLLV;
            txtMaNV.Text = llv.MaNV;
            txtPhongBan.Text = llv.NhanVien.ChucVu.PhongBan.TenPhongBan;
            txtCa.Text = llv.Ca.TenCa;
            txtLoaiCa.Text = llv.LoaiCa.TenLoaiCa;
            dtpNgayLam.Text = llv.NgayLam.ToString();
        }
        public void LoadNhanVienTheoPhongBan()
        {
            List<NhanVien> nhanVienList = nhanVienBUS.GetNhanVienPhongBan(maPB).ToList();
            foreach (var nhanVien in chamCong)
                nhanVienList = nhanVienList.Where(nv => nv.MaNV != nhanVien.MaNV).ToList();
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
        public void LoadChiTietLichLamViec()
        {
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
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[5].Value = nv.ThoiGianDen;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[6].Value = nv.ThoiGianVe;
                if (nv.Phep)
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[7].Value = true;
                else
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[7].Value = false;
            }
        }
        public void LoadChiTietLichLamViecTimKiem(string timKiem)
        {
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
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[5].Value = nv.ThoiGianDen;
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[6].Value = nv.ThoiGianVe;
                if (nv.Phep)
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[7].Value = true;
                else
                    dgvChiTietLichLamViec.Rows[rowAdd].Cells[7].Value = false;
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmbNhanVien_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cmbNhanVien.Text))
            {
                NhanVien nv = nhanVienBUS.ThongTinNhanVien(cmbNhanVien.SelectedValue.ToString());
                txtHoTenNV.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
                btnThem.Enabled = true;
            }
            else
            {
                txtHoTenNV.Text = string.Empty;
                btnThem.Enabled = false;
            }                
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
        private void btnThem_Click(object sender, EventArgs e)
        {
            ChamCong newChamCong = new ChamCong
            {
                MaLLV = maLLV,
                MaNV = cmbNhanVien.SelectedValue.ToString(),
                Phep = false,
            };
            if (chiTietLichLamViecBUS.Save(newChamCong))
            {
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " thêm nhân viên " + cmbNhanVien.SelectedValue.ToString() + " vào " + "lịch làm việc " + maLLV,
                };
                lichSuThaoTacBUS.Save(newLstt);
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
                LichSuThaoTac newLstt = new LichSuThaoTac
                {
                    NgayGio = DateTime.Now.ToString(formatDateTime),
                    MaNV = maNV,
                    ThaoTacThucHien = "Nhân viên " + maNV + " xoá nhân viên " + maNV_Chon + " trong lịch làm việc " + maLLV,
                };
                lichSuThaoTacBUS.Save(newLstt);
                Reload();
            }
        }
        private void dgvChiTietLichLamViec_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            maNV_Chon = dgvChiTietLichLamViec.Rows[row].Cells[1].Value.ToString();                        
            string thongBao;
            string lichSu;
            ChamCong nv = chamCong.Where(x => x.MaNV == maNV_Chon).FirstOrDefault();
            bool phep = nv.Phep;
            if (e.ColumnIndex == 7)
            {
                MessageBoxManager.Yes = "Có";
                MessageBoxManager.No = "Không";
                if (phep)
                {
                    thongBao = "Xoá phép của nhân viên ";
                    lichSu = " thêm phép cho nhân viên ";
                }
                else
                {
                    thongBao = "Thêm phép cho nhân viên ";
                    lichSu = " xoá phép của nhân viên ";
                }

                DialogResult ketQua = MessageBox.Show(thongBao + maNV + "?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ketQua == DialogResult.Yes)
                {
                    if (phep)
                        nv.Phep = false;
                    else
                        nv.Phep = true;
                    if (chiTietLichLamViecBUS.Save(nv))
                    {
                        LichSuThaoTac newLstt = new LichSuThaoTac
                        {
                            NgayGio = DateTime.Now.ToString(formatDateTime),
                            MaNV = maNV,
                            ThaoTacThucHien = "Nhân viên " + maNV + lichSu + cmbNhanVien.SelectedValue.ToString() + " trong " + "lịch làm việc " + maLLV,
                        };
                        lichSuThaoTacBUS.Save(newLstt);
                        Reload();
                    }
                }
                
            }
            if(e.ColumnIndex == 8)
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
    }
}
