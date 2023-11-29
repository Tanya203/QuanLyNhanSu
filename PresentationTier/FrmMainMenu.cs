using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmMainMenu : Form
    {     
        private readonly WorkScheduleDetailBUS workScheduleDetailBUS;        
        private readonly Authorizations authorization;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly string formatDate = "yyyy-MM-dd";
        private CheckAccountStatus status;
        private Staff staff;
        public FrmMainMenu(string staffID)
        {
            InitializeComponent(); 
            workScheduleDetailBUS = new WorkScheduleDetailBUS();
            staffBUS = new StaffBUS();
            redirect = new FormHandle();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorization = new Authorizations("Màn hình chính", staff);
            status = new CheckAccountStatus(staffID);
        }
        private void frmManHinhChinh_Load(object sender, EventArgs e)
        {
            status.Start();
            LoadHeader.LoadHeaderMainMenu(lblValueStaffID, lblValueFullName, lblValueDepartment, lblValuePosition, lblValueAbsence, staff);
            ImageHandle.LoadImage(pbStaffPicture, staff.Picture);
            ButtonStatus(false);
            LoadLichLamViec();
            Authorize();

        }
        private void ButtonStatus(bool value)
        {
            List<Button> listButtons = new List<Button> { btnStaffs, btnDepartment, btnPosition, btnShift, btnWorkSchedule, btnAllowance, btnCard, btnBonusDept ,btnStatistics, btnContractType, btnAuthorization, btnOperateHistory };
            for (int i = 0; i < listButtons.Count; i++)
            {
                typeof(Button).GetProperty("Visible").SetValue(listButtons[i], value);
            }
        }
        private void LoadLichLamViec()
        {
            dgvWorkSchedule.Rows.Clear();
            IEnumerable<TimeKeeping> workSchedule = new List<TimeKeeping>();
            DateTime workDate = DateTime.Parse(dtpWorkSchedule.Value.ToString(formatDate));
            workSchedule = workScheduleDetailBUS.GetWorkSchduleDetail().Where(ws => ws.StaffID == staff.StaffID && ws.WorkSchedule.WorkDate == workDate);
            int rowAdd;
            foreach (var nv in workSchedule)
            {
                rowAdd = dgvWorkSchedule.Rows.Add();
                dgvWorkSchedule.Rows[rowAdd].Cells[0].Value = nv.WS_ID;
                dgvWorkSchedule.Rows[rowAdd].Cells[1].Value = nv.StaffID;
                dgvWorkSchedule.Rows[rowAdd].Cells[2].Value = nv.WorkSchedule.WorkDate.ToString(formatDate);
                dgvWorkSchedule.Rows[rowAdd].Cells[3].Value = nv.Shift.ShiftName;
                dgvWorkSchedule.Rows[rowAdd].Cells[4].Value = nv.ShiftType.ShiftTypeName;
                dgvWorkSchedule.Rows[rowAdd].Cells[5].Value = nv.CheckInTime;
                dgvWorkSchedule.Rows[rowAdd].Cells[6].Value = nv.CheckOutTime;
                dgvWorkSchedule.Rows[rowAdd].Cells[7].Value = nv.AbsenceUse;
            }
        }
        private void Authorize()
        {
            Dictionary<object, object> button = new Dictionary<object, object>
            {
                { "nhân viên", btnStaffs },
                { "chức vụ", btnDepartment },
                { "phòng ban", btnPosition },
                { "ca", btnShift },
                { "lịch làm việc", btnWorkSchedule },
                { "phụ cấp", btnAllowance },
                { "phiếu", btnCard },
                { "thưởng - nợ", btnBonusDept },
                { "thống kê", btnStatistics },
                { "loại hợp đồng", btnContractType },
                { "phân quyền", btnAuthorization },
                { "lịch sử thao tác", btnOperateHistory }
            };
            authorization.AuthorizeMainMenu(button);
        }
        private void btnStaffs_Click(object sender, EventArgs e)
        {
            FrmStaff open = new FrmStaff(staff.StaffID);
            redirect.RedirectForm(open);
            
        }      
        private void btnDepartment_Click(object sender, EventArgs e)
        {
            FrmDepartment open = new FrmDepartment(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnPosition_Click(object sender, EventArgs e)
        {
            FrmPosition open = new FrmPosition(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnShift_Click(object sender, EventArgs e)
        {
            FrmShift open = new FrmShift(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnWorkSchedule_Click(object sender, EventArgs e)
        {
            FrmWorkSchedule open = new FrmWorkSchedule(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnAllowance_Click(object sender, EventArgs e)
        {
            FrmAllowance open = new FrmAllowance(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnCard_Click(object sender, EventArgs e)
        {
            FrmCard open = new FrmCard(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnStatistics_Click(object sender, EventArgs e)
        {
            Close();
            Thread thread = new Thread(OpenStatistisc);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            /*FrmStatistic open = new FrmStatistic(staff.StaffID);
            redirect.RedirectForm(open, this);*/
        }
        private void OpenStatistisc()
        {
            FrmStatistic open = new FrmStatistic(staff.StaffID);
            Application.Run(open);
        }
        private void btnContractType_Click(object sender, EventArgs e)
        {
            FrmContractType open = new FrmContractType(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnDecentralization_Click(object sender, EventArgs e)
        {
            FrmAuthorization open = new FrmAuthorization(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnOperateHistory_Click(object sender, EventArgs e)
        {
            FrmOperateHistory open = new FrmOperateHistory(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnAccountInfo_Click(object sender, EventArgs e)
        {
            FrmAccountInfo open = new FrmAccountInfo(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnLogOut_Click(object sender, EventArgs e)
        {
            CustomMessage.YesNoCustom("Có", " Không");
            DialogResult result = MessageBox.Show("Xác nhận đăng xuất", "Đăng xuất", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (result == DialogResult.Yes)
            {
                staff = null;
                FrmLogin open = new FrmLogin();
                status.Stop();
                status = null;
                redirect.RedirectForm(open);
            }           
        }
        private void dtpWorkSchedule_ValueChanged(object sender, EventArgs e)
        {
            LoadLichLamViec();
        }
        private void btnBonusDept_Click(object sender, EventArgs e)
        {
            FrmBonusDebt open = new FrmBonusDebt(staff.StaffID);
            redirect.RedirectForm(open);
        }

        private void btnBonusDept_Click_1(object sender, EventArgs e)
        {
            FrmBonusDebt open = new FrmBonusDebt(staff.StaffID);
            redirect.RedirectForm(open);
        }
    }
}
