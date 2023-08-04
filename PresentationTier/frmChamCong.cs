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

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmChamCong : Form
    {
        private readonly ChamCongBUS chamCongBUS;
        private readonly LichSuThaoTacBUS lichSuThaoTacBUS;
        private readonly List<ChamCong> lichLamViec;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatTime = "HH:mm:ss";
        public FrmChamCong()
        {
            InitializeComponent();
            chamCongBUS = new ChamCongBUS();
            lichSuThaoTacBUS = new LichSuThaoTacBUS();
            lichLamViec = chamCongBUS.GetLichLamViecTheoNgay(DateTime.Now.ToString(formatDate)).OrderBy(llv => llv.Ca.TenCa).ToList();
            MessageBoxManager.Register_OnceOnly();
        }
        private void FrmChamCong_Load(object sender, EventArgs e)
        {
            LoadLichLamViec();
            btnChamCong.Enabled = false;
        }
        private void LoadLichLamViec()
        {
            List<ChamCong> lichCaDem = chamCongBUS.GetLichLamViecTheoNgay(DateTime.Now.AddDays(-1).ToString(formatDate)).ToList();
            int count = 0;
            if(lichCaDem.Count > 0)
            {
                foreach(ChamCong nv in lichCaDem)
                {
                    if(nv.Ca.GioBatDau > nv.Ca.GioKetThuc)
                        lichLamViec.Insert(count, nv);
                    count++;
                }
            }
        }
        public void ChamCong(string maNV)
        {
            TimeSpan timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            string dateNow = DateTime.Now.ToString(formatDate);
            List<ChamCong> chamCong = lichLamViec.Where(nv => nv.MaNV == maNV).ToList();
            if (chamCong.Count == 0)
            {
                MessageBox.Show("Mã nhân viên không hợp lệ hoặc nhân viên không có lịch làm việc trong hôm nay " + dateNow, "Thông báo" , MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            else
            {
                int checkThoiGianVaoCaDau = 0;
                int maxCa = chamCong.Count();
                int countCa = 0;
                foreach (ChamCong nv in chamCong)
                {
                    countCa++;
                    string hoTen = nv.NhanVien.Ho + " " + nv.NhanVien.TenLot + " " + nv.NhanVien.Ten;
                    string ca = nv.Ca.TenCa;
                    if (nv.Ca.GioBatDau > nv.Ca.GioKetThuc && nv.ThoiGianDen != null)
                    {
                        nv.ThoiGianVe = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            LichSuThaoTac newLstt = new LichSuThaoTac
                            {
                                NgayGio = DateTime.Now.ToString(formatDateTime),
                                MaNV = maNV,
                                ThaoTacThucHien = "Nhân viên " + hoTen + " chấm công giờ ra ca " + ca,
                            };
                            lichSuThaoTacBUS.Save(newLstt);
                            txtMaNV.Text = string.Empty;
                            return;
                        }
                    }
                    if (countCa == 1 && nv.ThoiGianDen == null)
                        continue;
                    if (timeNow > nv.Ca.GioKetThuc && nv.ThoiGianDen == null)
                    {
                        if (checkThoiGianVaoCaDau == 0)
                            continue;
                    }
                    if (nv.ThoiGianDen == null && checkThoiGianVaoCaDau == 1)
                    {
                        nv.ThoiGianDen = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            LichSuThaoTac newLstt = new LichSuThaoTac
                            {
                                NgayGio = DateTime.Now.ToString(formatDateTime),
                                MaNV = maNV,
                                ThaoTacThucHien = "Nhân viên " + hoTen + " chấm công giờ vào ca " + ca,
                            };
                            lichSuThaoTacBUS.Save(newLstt);
                            if(checkThoiGianVaoCaDau != 1)
                                continue;
                        }
                    }
                    if (timeNow > nv.Ca.GioKetThuc && nv.ThoiGianDen != null && nv.ThoiGianVe == null)
                    {
                        checkThoiGianVaoCaDau = 1;
                        nv.ThoiGianVe = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            LichSuThaoTac newLstt = new LichSuThaoTac
                            {
                                NgayGio = DateTime.Now.ToString(formatDateTime),
                                MaNV = maNV,
                                ThaoTacThucHien = "Nhân viên " + hoTen + " chấm công giờ vào ca " + ca,
                            };
                            lichSuThaoTacBUS.Save(newLstt);
                            if (countCa == maxCa)
                            {
                                txtMaNV.Text = string.Empty;
                                checkThoiGianVaoCaDau = 0;
                                return;
                            }                                
                            continue;
                        }
                    }                    
                    if (nv.ThoiGianDen == null)
                    {
                        nv.ThoiGianDen = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            LichSuThaoTac newLstt = new LichSuThaoTac
                            {
                                NgayGio = DateTime.Now.ToString(formatDateTime),
                                MaNV = maNV,
                                ThaoTacThucHien = "Nhân viên " + hoTen + " chấm công giờ vào ca " + ca,
                            };
                            lichSuThaoTacBUS.Save(newLstt);
                            txtMaNV.Text = string.Empty;
                            return;
                        }                        
                    }                   
                    if(nv.ThoiGianVe == null)
                    {
                        if(timeNow < nv.Ca.GioBatDau)
                        {
                            MessageBox.Show("Vẫn chưa vào ca " + ca +"!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                            txtMaNV.Text = string.Empty;
                            return;
                        }
                        nv.ThoiGianVe = timeNow;
                        if (chamCongBUS.ChamCong(nv))
                        {
                            LichSuThaoTac newLstt = new LichSuThaoTac
                            {
                                NgayGio = DateTime.Now.ToString(formatDateTime),
                                MaNV = maNV,
                                ThaoTacThucHien = "Nhân viên " + hoTen + " chấm công giờ ra ca " + ca,
                            };
                            lichSuThaoTacBUS.Save(newLstt);
                            txtMaNV.Text = string.Empty;
                            return;
                        }
                    }
                }
                MessageBox.Show("Nhân viên " + maNV + " đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày " + dateNow, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                txtMaNV.Text = string.Empty;
                return;
            }                     
        }
        private void btnChamCong_Click(object sender, EventArgs e)
        {
            ChamCong(txtMaNV.Text);
            return;
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
