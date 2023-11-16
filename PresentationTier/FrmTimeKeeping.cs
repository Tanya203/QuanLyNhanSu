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
    public partial class FrmTimeKeeping : Form
    {
        private readonly TimeKeepingBUS chamCongBUS;
        private readonly OperateHistoryBUS lichSuThaoTacBUS;
        private readonly ShiftBUS caBUS;
        private readonly StaffBUS nhanVienBUS;
        private readonly OperationBUS thaoTacBUS;
       /* private readonly List<ChamCong> lichLamViec;
        private readonly List<ChamCong> lichCaDem;
        private List<ChamCong> chamCong;
        private readonly List<ThaoTac> listThaoTac;
        private readonly Ca caDau;*/
        private TimeSpan timeNow;
        private string dateNow;
        private readonly string thaoTac;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private readonly string formatDate = "yyyy-MM-dd";
        private readonly string formatTime = "HH:mm:ss";
        private FrmTimeKeeping()
        {
            InitializeComponent();
            chamCongBUS = new TimeKeepingBUS();
            lichSuThaoTacBUS = new OperateHistoryBUS();
            caBUS = new ShiftBUS();
            nhanVienBUS = new StaffBUS();
            thaoTacBUS = new OperationBUS();
           /* chamCong = new List<ChamCong>();
            listThaoTac = thaoTacBUS.GetThaoTac().Where(tt => tt.GiaoDien.TenGiaoDien == "Chấm công").ToList();
            caDau = caBUS.GetCa().OrderBy(ca => ca.TenCa).FirstOrDefault();
            lichLamViec = chamCongBUS.GetLichLamViecTheoNgay(DateTime.Now.ToString(formatDate)).OrderBy(llv => llv.Ca.TenCa).ToList();
            lichCaDem = chamCongBUS.GetLichLamViecTheoNgay(DateTime.Now.AddDays(-1).ToString(formatDate)).Where(nv => nv.Ca.GioKetThuc < caDau.GioBatDau).ToList();*/
            thaoTac = "Chấm công";
        }
        private void FrmChamCong_Load(object sender, EventArgs e)
        {
            btnTimekeeping.Enabled = false;
        }
        private void LichSuThaoTac(string maNV, string thaoTac)
        {
           /* LichSuThaoTac newLstt = new LichSuThaoTac
            {
                NgayGio = DateTime.Now.ToString(formatDateTime),
                MaNV = maNV,
                MaTT = listThaoTac.FirstOrDefault(tt => tt.TenThaoTac == this.thaoTac).MaTT,
                ThaoTacThucHien = thaoTac,
            };
            lichSuThaoTacBUS.Save(newLstt);*/
        }
        /*private bool ChamCongCaDem(List<ChamCong> caDem)
        {
            timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            dateNow = DateTime.Now.ToString(formatDate);
            if (caDem != null)
            {
                foreach (ChamCong nv in caDem)
                {
                    string ca = nv.Ca.TenCa;
                    string ngayLam = nv.LichLamViec.NgayLam.ToString(formatDate);
                    string thaoTac = $"Nhân viên {nv.MaNV} chấm công lúc {timeNow} ngày {dateNow} (lịch ngày: {ngayLam}) cho:\n";
                    if (nv.ThoiGianDen == null && timeNow < nv.Ca.GioKetThuc)
                    {
                        nv.ThoiGianDen = timeNow;
                        thaoTac += $"- Giờ vào ca {ca}";
                        chamCong.Add(nv);
                        if (chamCongBUS.ChamCong(chamCong, thaoTac))
                        {
                            LichSuThaoTac(nv.MaNV, thaoTac);
                            txtStaffID.Text = string.Empty;
                            chamCong.Clear();
                            return true;
                        }
                    }
                    if (nv.ThoiGianDen != null && nv.ThoiGianVe == null && timeNow < caDau.GioBatDau)
                    {
                        nv.ThoiGianVe = timeNow;
                        thaoTac += $"- Giờ ra ca {ca}";
                        chamCong.Add(nv);
                        if (chamCongBUS.ChamCong(chamCong, thaoTac))
                        {
                            LichSuThaoTac(nv.MaNV, thaoTac);
                            txtStaffID.Text = string.Empty;
                            chamCong.Clear();
                            return true;
                        }
                    }
                }
            }
            return false;
        }
        private void ChamCongTungCa(List<ChamCong> llv)
        {
            timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            dateNow = DateTime.Now.ToString(formatDate);
            int countMax = llv.Count;
            int count = 1;
            foreach (ChamCong nv in llv)
            {
                string ca = nv.Ca.TenCa;
                string thaoTac = $"Nhân viên {nv.MaNV} chấm công lúc {timeNow} ngày {dateNow} cho:\n";
                if (nv.ThoiGianDen == null && (timeNow < nv.Ca.GioKetThuc || nv.Ca.GioBatDau > nv.Ca.GioKetThuc))
                {
                    nv.ThoiGianDen = timeNow;
                    thaoTac += $"- Giờ vào ca {ca}";
                    chamCong.Add(nv);
                    if (chamCongBUS.ChamCong(chamCong, thaoTac))
                    {
                        LichSuThaoTac(nv.MaNV, thaoTac);
                        txtStaffID.Text = string.Empty;
                        chamCong.Clear();
                        count++;
                        return;
                    }
                }
                if (nv.ThoiGianDen != null && nv.ThoiGianVe == null)
                {
                    if (count < countMax)
                    {
                        if (timeNow < nv.Ca.GioBatDau)
                        {
                            nv.ThoiGianVe = timeNow;
                            thaoTac += $"- Giờ ra ca {ca}";
                            chamCong.Add(nv);
                            if (chamCongBUS.ChamCong(chamCong, thaoTac))
                            {
                                LichSuThaoTac(nv.MaNV, thaoTac);
                                txtStaffID.Text = string.Empty;
                                chamCong.Clear();
                                count++;
                                return;
                            }
                        }
                    }
                    else
                    {
                        nv.ThoiGianVe = timeNow;
                        thaoTac += $"- Giờ ra ca {ca}";
                        if (chamCongBUS.ChamCong(chamCong, thaoTac))
                        {
                            chamCong.Add(nv);
                            LichSuThaoTac(nv.MaNV, thaoTac);
                            txtStaffID.Text = string.Empty;
                            chamCong.Clear();
                            count++;
                            return;
                        }
                    }
                }
                count++;
            }
            MessageBox.Show($"Nhân viên {txtStaffID.Text} đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày {dateNow}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtStaffID.Text = string.Empty;
            return;
        }
        private void ChamCongLienCa(List<ChamCong> llv)
        {
            timeNow = TimeSpan.Parse(DateTime.Now.ToString(formatTime));
            dateNow = DateTime.Now.ToString(formatDate);
            int checkThoiGianVaoCaDau = 0;
            int maxCa = llv.Count();
            int countCa = 0;
            string maNV = llv.FirstOrDefault().MaNV;
            string thaoTac = $"Nhân viên {maNV} chấm công lúc {timeNow} ngày {dateNow} cho:";
            foreach (ChamCong nv in llv)
            {
                countCa++;
                string ca = nv.Ca.TenCa;
                if (nv.ThoiGianDen != null && nv.ThoiGianVe == null && timeNow < nv.Ca.GioBatDau)
                {
                    MessageBox.Show($"Vẫn chưa vào ca {ca}!\n({nv.Ca.GioBatDau} - {nv.Ca.GioKetThuc})", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    txtStaffID.Text = string.Empty;
                    return;
                }
                if (nv.ThoiGianDen == null && (timeNow < nv.Ca.GioKetThuc || nv.Ca.GioBatDau > nv.Ca.GioKetThuc))
                {
                    nv.ThoiGianDen = timeNow;
                    thaoTac += $"\n- Giờ vào ca {ca}";
                    chamCong.Add(nv);
                    if (nv.Ca.GioBatDau > nv.Ca.GioKetThuc)
                    {
                        if (chamCongBUS.ChamCong(chamCong, thaoTac))
                        {
                            LichSuThaoTac(nv.MaNV, thaoTac);
                            txtStaffID.Text = string.Empty;
                            chamCong.Clear();
                            return;
                        }
                    }
                }
                if (nv.ThoiGianDen != null && nv.ThoiGianVe == null)
                {
                    checkThoiGianVaoCaDau = 1;
                    nv.ThoiGianVe = timeNow;
                    thaoTac += $"\n- Giờ ra ca {ca}";
                    chamCong.Add(nv);
                    if (countCa == maxCa)
                    {
                        if (chamCongBUS.ChamCong(chamCong, thaoTac))
                        {
                            LichSuThaoTac(nv.MaNV, thaoTac);
                            txtStaffID.Text = string.Empty;
                            chamCong.Clear();
                            return;
                        }
                    }
                    else
                        continue;
                }
                if (timeNow > nv.Ca.GioKetThuc && nv.ThoiGianDen == null && checkThoiGianVaoCaDau == 1)
                {
                    nv.ThoiGianDen = timeNow;
                    thaoTac += $"\n- Giờ vào ca {ca}";
                    chamCong.Add(nv);
                }
                if (timeNow > nv.Ca.GioKetThuc && nv.ThoiGianVe == null && checkThoiGianVaoCaDau == 1)
                {
                    if (nv.Ca.GioBatDau > nv.Ca.GioKetThuc)
                        continue;
                    nv.ThoiGianVe = timeNow;
                    thaoTac += $"\n- Giờ ra ca {ca}";
                    chamCong.Add(nv);
                    if (countCa == maxCa)
                    {
                        if (chamCongBUS.ChamCong(chamCong, thaoTac))
                        {
                            LichSuThaoTac(nv.MaNV, thaoTac);
                            txtStaffID.Text = string.Empty;
                            chamCong.Clear();
                            return;
                        }
                    }
                }
            }
            MessageBox.Show($"Nhân viên {txtStaffID.Text} đã chấm công hết các ca trong ngày hoặc đã quá giờ chấm công ngày {dateNow}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
            txtStaffID.Text = string.Empty;
            return;
        }*/

        private void btnTimekeeping_Click(object sender, EventArgs e)
        {
           /* NhanVien nhanVien = nhanVienBUS.GetNhanVien().FirstOrDefault(nv => nv.MaNV == txtStaffID.Text);
            if (nhanVien == null)
            {
                MessageBox.Show("Mã nhân viên không hợp lệ!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtStaffID.Text = string.Empty;
                return;
            }
            else
            {
                string maNV = txtStaffID.Text;
                string dateNow = DateTime.Now.ToString(formatDate);
                List<ChamCong> caDem = lichCaDem.Where(nv => nv.MaNV == maNV).ToList();
                List<ChamCong> chamCong = lichLamViec.Where(nv => nv.MaNV == maNV).OrderBy(nv => nv.Ca.TenCa).ToList();
                if (ChamCongCaDem(caDem))
                    return;
                if (chamCong.Count == 0)
                {
                    MessageBox.Show($"Nhân viên {maNV} không có lịch làm việc trong hôm nay {dateNow}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    txtStaffID.Text = string.Empty;
                    return;
                }
                if (nhanVien.LoaiHopDong.HinhThucChamCong.TenHinhThucChamCong == "Liên ca")
                    ChamCongLienCa(chamCong);
                else
                    ChamCongTungCa(chamCong);
            }*/
        }
        private void txtStaffID_TextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtStaffID.Text))
                btnTimekeeping.Enabled = false;
            else
                btnTimekeeping.Enabled = true;
        }
    }
}
