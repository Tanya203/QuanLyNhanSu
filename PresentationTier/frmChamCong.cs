using MDriven.WPF;
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
using static System.Windows.Forms.VisualStyles.VisualStyleElement.TextBox;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChamCong : Form
    {
        private readonly ChamCongBUS chamCongBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly QuanLyCaBUS caBUS;
        private readonly QuanLyNhanVienBUS nhanVienBUS;
        private readonly List<ChamCong> lichLamViec;
        private readonly List<ChamCong> lichCaDem;
        private readonly Ca caDau;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatTime = "HH:mm:ss";
        public FrmChamCong()
        {
            InitializeComponent();
            chamCongBUS = new ChamCongBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            caBUS = new QuanLyCaBUS();
            nhanVienBUS = new QuanLyNhanVienBUS();
            caDau = caBUS.GetCa().OrderBy(ca => ca.TenCa).FirstOrDefault();
            lichLamViec = chamCongBUS.GetLichLamViecTheoNgay(DateTime.Now.ToString(formatDate)).OrderBy(llv => llv.Ca.TenCa).ToList();
            lichCaDem = chamCongBUS.GetLichLamViecTheoNgay(DateTime.Now.AddDays(-1).ToString(formatDate)).Where(nv => nv.Ca.GioKetThuc < caDau.GioBatDau).ToList();
            MessageBoxManager.Register_OnceOnly();
        }
        private void FrmChamCong_Load(object sender, EventArgs e)
        {
            btnChamCong.Enabled = false;
        }        
        private void LichSuThaoTac(string maNV, string gio,string ca)
        {
            LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                ThaoTacThucHien = "Chấm công " + gio + "ca "+ ca,
            };
            lichSuThaoTacBUS.Save(newLstt);
        }
        public void ChamCongCaDem(List<ChamCong> caDem)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            if (caDem != null)
            {
                foreach (ChamCong nv in caDem)
                {
                    string ca = nv.Ca.TenCa;
                    if (nv.ThoiGianDen == null && timeNow < nv.Ca.GioKetThuc)
                    {
                        nv.ThoiGianDen = timeNow;                
                        if (chamCongBUS.ChamCong(nv))
                        {
                            string gio = "giờ vào ";
                            LichSuThaoTac(nv.MaNV, gio, ca);
                            txtMaNV.Text = string.Empty;
                            return;
                        }
                    }
                    if (nv.ThoiGianDen != null && nv.ThoiGianVe == null && timeNow < caDau.GioBatDau)
                    {
                        nv.ThoiGianVe = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            string gio = "giờ ra ";
                            LichSuThaoTac(nv.MaNV, gio, ca);
                            txtMaNV.Text = string.Empty;
                            return;
                        }
                    }
                }
            }
        }
        public void ChamCongTungCa(List<ChamCong> chamCong)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            string dateNow = DateTime.Now.ToString(formatDate);           
            int countMax = chamCong.Count;
            int count = 1;        
            foreach (ChamCong nv in chamCong)
            {                
                string ca = nv.Ca.TenCa;                
                if ( nv.ThoiGianDen == null && (timeNow < nv.Ca.GioKetThuc || nv.Ca.GioBatDau > nv.Ca.GioKetThuc))
                {                        
                    nv.ThoiGianDen = timeNow;
                    if (chamCongBUS.ChamCong(nv))
                    {
                        string gio = "giờ vào ";
                        LichSuThaoTac(nv.MaNV, gio, ca);
                        txtMaNV.Text = string.Empty;
                        count++;
                        return;
                    }
                }
                if (nv.ThoiGianDen != null && nv.ThoiGianVe == null)
                {
                    if(count < countMax)
                    {
                        if(timeNow < chamCong[count].Ca.GioBatDau)
                        {
                            nv.ThoiGianVe = timeNow;
                            if (chamCongBUS.ChamCong(nv))
                            {
                                string gio = "giờ vào ";
                                LichSuThaoTac(nv.MaNV, gio, ca);
                                txtMaNV.Text = string.Empty;
                                count++;
                                return;
                            }
                        }
                    }
                    else
                    {
                        nv.ThoiGianVe = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            string gio = "giờ ra ";
                            LichSuThaoTac(nv.MaNV, gio, ca);
                            txtMaNV.Text = string.Empty;
                            count++;
                            return;
                        }
                    }
                }
                count++;
            }
            MessageBox.Show("Nhân viên " + txtMaNV.Text + " đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày " + dateNow, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtMaNV.Text = string.Empty;
            return;            
        }
        public void ChamCongLienCa(List<ChamCong> chamCong)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            string dateNow = DateTime.Now.ToString(formatDate);  
            int checkThoiGianVaoCaDau = 0;
            int maxCa = chamCong.Count();
            int countCa = 0;
            foreach (ChamCong nv in chamCong)
            {
                countCa++;
                string ca = nv.Ca.TenCa;                
                if (nv.ThoiGianDen != null && nv.ThoiGianVe == null && timeNow < nv.Ca.GioBatDau)
                {
                    MessageBox.Show("Vẫn chưa vào ca " + ca + "!\n(" + nv.Ca.GioBatDau + " - " + nv.Ca.GioKetThuc + ")", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtMaNV.Text = string.Empty;
                    return;
                }
                if (nv.ThoiGianDen == null && (timeNow < nv.Ca.GioKetThuc || nv.Ca.GioBatDau > nv.Ca.GioKetThuc))
                {
                    nv.ThoiGianDen = timeNow;
                    if (chamCongBUS.ChamCong(nv))
                    {
                        string gio = "giờ vào ";
                        LichSuThaoTac(nv.MaNV, gio, ca);
                        txtMaNV.Text = string.Empty;
                        return;
                    }
                }                
                if (nv.ThoiGianDen != null  && nv.ThoiGianVe == null)
                {
                    checkThoiGianVaoCaDau = 1;
                    nv.ThoiGianVe = timeNow;
                    if (chamCongBUS.ChamCong(nv))
                    {
                        string gio = "giờ ra ";
                        LichSuThaoTac(nv.MaNV, gio, ca);
                        if (countCa == maxCa)
                        {
                            txtMaNV.Text = string.Empty;
                            return;
                        }
                        else
                            continue;
                    }
                }
                if (timeNow > nv.Ca.GioKetThuc && nv.ThoiGianDen == null && checkThoiGianVaoCaDau == 1)
                {
                    nv.ThoiGianDen = timeNow;
                    if (chamCongBUS.ChamCong(nv))
                    {
                        string gio = "giờ vào ";
                        LichSuThaoTac(nv.MaNV, gio, ca);
                    }
                }        
                if(timeNow > nv.Ca.GioKetThuc && nv.ThoiGianVe == null && checkThoiGianVaoCaDau == 1)
                {
                    nv.ThoiGianVe = timeNow;
                    if (chamCongBUS.ChamCong(nv))
                    {
                        string gio = "giờ ra ";
                        LichSuThaoTac(nv.MaNV, gio, ca);
                        if (countCa == maxCa)
                        {
                            txtMaNV.Text = string.Empty;
                            return;
                        }                                
                    }
                }                      
                if (nv.ThoiGianDen == null && timeNow > nv.Ca.GioKetThuc && checkThoiGianVaoCaDau == 0)
                {
                    if (countCa == maxCa)
                    {
                        txtMaNV.Text = string.Empty;
                        return;
                    }
                    continue;
                }               
                txtMaNV.Text = string.Empty;
            }
            MessageBox.Show("Nhân viên " + txtMaNV.Text + " đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày " + dateNow, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtMaNV.Text = string.Empty;
            return;
        }                     
        
        private void btnChamCong_Click(object sender, EventArgs e)
        {
            NhanVien nhanVien = nhanVienBUS.ThongTinNhanVien(txtMaNV.Text);
            if(nhanVien == null)
            {
                MessageBox.Show("Mã nhân viên không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtMaNV.Text = string.Empty;
                return;
            }
            else
            {
                string maNV = txtMaNV.Text;
                string dateNow = DateTime.Now.ToString(formatDate);
                List<ChamCong> caDem = lichCaDem.Where(nv => nv.MaNV == maNV).ToList();
                List<ChamCong> chamCong = lichLamViec.Where(nv => nv.MaNV == maNV).OrderBy(nv => nv.Ca.TenCa).ToList();
                ChamCongCaDem(caDem);
                if(chamCong.Count == 0)
                {
                    MessageBox.Show("Nhân viên " + maNV + " không có lịch làm việc trong hôm nay " + dateNow, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtMaNV.Text = string.Empty;
                    return;
                }
                if (nhanVien.LoaiHopDong.HinhThucChamCong.TenHinhThucChamCong == "Liên ca")
                    ChamCongLienCa(chamCong);
                else
                    ChamCongTungCa(chamCong);               
            }            
        }
        private void txtMaNV_TextChanged(object sender, EventArgs e)
        {
            if(string.IsNullOrEmpty(txtMaNV.Text))
                btnChamCong.Enabled = false;
            else
                btnChamCong.Enabled = true;
        }
    }
}
