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
        private readonly GiaoDienBUS giaoDienBUS;
        private readonly ThaoTacBUS thaoTacBUS;
        private readonly PhanQuyenBUS phanQuyenBUS;
        private IEnumerable<ChiTietLichLamViecViewModels> chiTietLichLamViec;
        private IEnumerable<ChiTietLichLamViecViewModels> chiTietLichLamViecTimKiem;
        private readonly IEnumerable<ChamCong> chamCong;
        private readonly IEnumerable<ThaoTac> listThaoTac;
        private readonly IEnumerable<PhanQuyen> phanQuyen;
        private readonly NhanVien nv;
        private readonly LichLamViec llv;
        private readonly string maNV;
        private readonly string maLLV;
        private readonly string maPB;
        private readonly string maGD;
        private readonly string maCV;
        private readonly int countCa;
        private string maNV_Chon;
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string now;
        private bool checkThaoTac;
        public FrmChiTietLichLamViec(string maNV, string maLLV)
        {
            InitializeComponent();
            nhanVienBUS = new QuanLyNhanVienBUS();
            chiTietLichLamViecBUS = new ChiTietLichLamViecBUS();
            lichLamViecBUS = new LichLamViecBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            caBUS = new QuanLyCaBUS();
            loaiCaBUS = new QuanLyLoaiCaBUS();
            giaoDienBUS = new GiaoDienBUS();
            thaoTacBUS = new ThaoTacBUS();
            phanQuyenBUS = new PhanQuyenBUS();
            maGD = giaoDienBUS.GetGiaoDiens().FirstOrDefault(gd => gd.TenGiaoDien == "Quản lý chi tiết lịch làm việc").MaGD;
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.MaGD ==  maGD).ToList();
            nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == maNV);
            chamCong = chiTietLichLamViecBUS.GetChiTietLichLamViec().Where(ct => ct.MaLLV == maLLV);
            this.maNV = maNV;
            this.maLLV = maLLV;
            maPB = nv.ChucVu.PhongBan.MaPB;
            maCV = nv.MaCV;
            phanQuyen = phanQuyenBUS.GetPhanQuyens().Where(pq => pq.QuyenHan.GiaoDien.MaGD == maGD && pq.MaCV == maCV).ToList();
            countCa = caBUS.GetCa().Count();
            llv = lichLamViecBUS.GetLichLamViec().FirstOrDefault(llv => llv.MaLLV == maLLV); 
            now = DateTime.Now.ToString(formatDate);
            checkThaoTac = false;
            MessageBoxManager.Register_OnceOnly();
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
            DisableDisplay();
            InputStatus(false);
            if (DateTime.Parse(dtpNgayLam.Text) >= DateTime.Parse(now))
            {
                PhanQuyen();
                if (checkThaoTac)
                {
                    LoadNhanVienTheoPhongBan();
                    LoadCa(cmbNhanVien.SelectedValue.ToString());
                    LoadLoaiCa();
                }           
            }
            LoadChiTietLichLamViec();
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
                else
                {
                    InputStatus(false);
                    continue;
                }
            }
        }
        private void InputStatus(bool value)
        {
            ButtonStatus(value);
            List<ComboBox> listComboBox = new List<ComboBox> { cmbCa, cmbLoaiCa, cmbNhanVien};
            for(int i =  0; i < listComboBox.Count; i++)
            {
                typeof(Button).GetProperty("Enabled").SetValue(listComboBox[i], value);
            }
        }
        private void ButtonStatus(bool value)
        {
            List<object> listButton = new List<object> { btnThem };
            if (value)
                XoaButton();
            for(int i = 0; i < listButton.Count; i++)
            {
                if (listButton[i] is Button)
                {
                    typeof(Button).GetProperty("Visible").SetValue(listButton[i], value);
                    continue;
                }
                else if(listButton[i] is CheckBox)
                {
                    typeof(CheckBox).GetProperty("Enabled").SetValue(listButton[i], false);
                    continue;
                }
            }
        }
        private void DisableDisplay()
        {
            List<object> listDisplay= new List<object> { txtMaLLV, txtMaNV, txtPhongBan, dtpNgayLam, txtHoTenNV};
            for(int i = 0; i< listDisplay.Count; i++)
            {
                if(listDisplay[i] is TextBox)
                {
                    typeof(TextBox).GetProperty("ReadOnly").SetValue(listDisplay[i], true);
                    continue;
                }
                else if (listDisplay[i] is DateTimePicker)
                {
                    typeof(DateTimePicker).GetProperty("Enabled").SetValue(listDisplay[i], false);
                    continue;
                }
            }
        }
        private void LoadThongTinLichLamViec()
        {
            txtMaLLV.Text = llv.MaLLV;
            txtMaNV.Text = llv.MaNV;
            txtPhongBan.Text = llv.NhanVien.ChucVu.PhongBan.TenPhongBan;
            dtpNgayLam.Text = llv.NgayLam.ToString();
        }
        private void LoadNhanVienTheoPhongBan()
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
            AutoAdjustComboBox(cmbNhanVien);
        }
        private void LoadCa(string maNV)
        {
            List<Ca> ca = caBUS.GetCa().ToList();
            List<ChamCong> lichLamViec = chamCong.Where(nv => nv.MaNV == maNV).ToList();
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
            AutoAdjustComboBox(cmbCa);
        }
        private void LoadLoaiCa()
        {
            cmbLoaiCa.DataSource = loaiCaBUS.GetLoaiCa();
            AutoAdjustComboBox(cmbLoaiCa);
        }
        private void LoadChiTietLichLamViec()
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
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[9].Value = nv.Phep;
            } 
            Enabled = true;
        }
        private void LoadChiTietLichLamViecTimKiem(string timKiem)
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
                dgvChiTietLichLamViec.Rows[rowAdd].Cells[9].Value = nv.Phep;
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
        //////////////////////////////////////////////////////////////////////////////////////
        private void cmbNhanVien_TextChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(cmbNhanVien.Text))
            {
                NhanVien nv = nhanVienBUS.GetNhanVien().FirstOrDefault(nhanVien => nhanVien.MaNV == cmbNhanVien.Text);
                txtHoTenNV.Text = nv.Ho + " " + nv.TenLot + " " + nv.Ten;
                btnThem.Enabled = true;
                LoadCa(cmbNhanVien.SelectedValue.ToString());
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
        private void LichSuThaoTac(string thaoTac,string maTT)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = this.maNV,
                MaTT = maTT,
                ThaoTacThucHien = $"{thaoTac} lịch làm việc {maLLV} ngày {dtpNgayLam.Text} - phòng ban {txtPhongBan.Text}",
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
                string thaoTac = $"Thêm nhân viên {maNV} vào";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm nhân viên")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
            }
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
                dgvChiTietLichLamViec.Columns.Add(btnXoa);
            }
        }
        private void XoaNhanVien()
        {
            ChamCong newChamCong = new ChamCong
            {
                MaLLV = maLLV,
                MaNV = maNV_Chon,
            };
            if (chiTietLichLamViecBUS.Delete(newChamCong))
            {                
                string thaoTac = $"Xoá nhân viên {maNV_Chon} khỏi";
                string maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá nhân viên")).MaTT;
                LichSuThaoTac(thaoTac, maTT);
                Reload();
            }
        }
        private void dgvChiTietLichLamViec_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            if (row < 0)
                return;
            maNV_Chon = dgvChiTietLichLamViec.Rows[row].Cells[1].Value.ToString();            
            if(e.ColumnIndex == 9 && checkThaoTac)
                CapNhatPhep();                
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
        public void CapNhatPhep()
        {
            ChamCong nv = chamCong.Where(x => x.MaNV == maNV_Chon).FirstOrDefault();
            string thongBao;
            if (!nv.Phep)
            {
                nv.Phep = true;
                thongBao = "Thêm phép cho nhân viên";
            }
            else
            {
                nv.Phep = false;
                thongBao = "Xoá phép của nhân viên";
            }                
            MessageBoxManager.Yes = "Có";
            MessageBoxManager.No = "Không";
            DialogResult ketQua = MessageBox.Show($"{thongBao} {maNV_Chon} vào ngày {dtpNgayLam.Text}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ketQua == DialogResult.Yes)
            {
                if (chiTietLichLamViecBUS.Save(nv))
                {
                    string thaoTac = $"{thongBao} {maNV_Chon} trong ";
                    string maTT;
                    if (thongBao.Contains("Thêm"))
                        maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Thêm phép")).MaTT;
                    else
                        maTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac.Contains("Xoá phép")).MaTT;
                    LichSuThaoTac(thaoTac, maTT);
                    Reload();
                }
            }
        }
    }
}
