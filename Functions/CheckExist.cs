using QuanLyNhanSu.LogicTier;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{
    public class CheckExist
    {
        private readonly StaffBUS staffBUS;
        private readonly DepartmentBUS departmentBUS;
        private readonly PositionBUS positionBUS;
        private readonly AllowanceBUS allowanceBUS;
        private readonly AllowanceDetailBUS allowanceDetailBUS;
        private readonly ShiftBUS shiftBUS;
        private readonly ShiftTypeBUS shiftTypeBUS;
        private readonly CardBUS cardBUS;
        private readonly CardDetailBUS cardDetailBUS;
        private readonly CardTypeBUS cardTypeBUS;
        private readonly WorkScheduleBUS workScheduleBUS;
        private readonly WorkScheduleDetailBUS workScheduleDetailBUS;
        private readonly ContractTypeBUS contractTypeBUS;
        public CheckExist()
        {
            staffBUS = new StaffBUS();
            departmentBUS = new DepartmentBUS();
            positionBUS = new PositionBUS();
            allowanceBUS = new AllowanceBUS();
            allowanceDetailBUS = new AllowanceDetailBUS();
            shiftBUS = new ShiftBUS();
            shiftTypeBUS = new ShiftTypeBUS();
            cardBUS = new CardBUS();
            cardTypeBUS = new CardTypeBUS();
            cardDetailBUS = new CardDetailBUS();
            workScheduleBUS = new WorkScheduleBUS();
            workScheduleDetailBUS = new WorkScheduleDetailBUS();
            contractTypeBUS = new ContractTypeBUS();
        }
        public bool CheckStaff(string staffID)
        {
            if(staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID) == null)
            {
                MessageBox.Show("Nhân viên không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckDepartment(string dpID)
        {
            if (departmentBUS.GetDepartment().FirstOrDefault(dp => dp.DP_ID == dpID) == null)
            {
                MessageBox.Show("Phòng ban không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckPosition(string psID)
        {
            if (positionBUS.GetPosition().FirstOrDefault(ps => ps.PS_ID == psID) == null)
            {
                MessageBox.Show("Chức vụ không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckAllowance(string alID)
        {
            if (allowanceBUS.GetAllowance().FirstOrDefault(al => al.AL_ID == alID) == null)
            {
                MessageBox.Show("Phụ cấp không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckAllowanceDetail(string alID, string staffID)
        {
            if (allowanceDetailBUS.GetAllowanceDetail().FirstOrDefault(al => al.AL_ID == alID && al.StaffID == staffID) == null)
            {
                MessageBox.Show("Nhân viên trong phụ cấp không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckShift(string shiftID)
        {
            if (shiftBUS.GetShift().FirstOrDefault(s => s.ShiftID == shiftID) == null)
            {
                MessageBox.Show("Ca không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckShiftType(string stID)
        {
            if (shiftTypeBUS.GetShiftType().FirstOrDefault(st => st.ST_ID == stID) == null)
            {
                MessageBox.Show("Loại ca không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckCardType(string ctID)
        {
            if (cardTypeBUS.GetCardType().FirstOrDefault(ct => ct.CT_ID == ctID) == null)
            {
                MessageBox.Show("Loại phiếu không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckCard(string cardID)
        {
            if (cardBUS.GetCard().FirstOrDefault(c => c.CardID == cardID) == null)
            {
                MessageBox.Show("Phiếu không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckCardDetail(string cardID, string staffID)
        {
            if (cardDetailBUS.GetCardDetail().FirstOrDefault(s => s.CardID == cardID && s.StaffID == staffID) == null)
            {
                MessageBox.Show("Nhân viên trong phiếu không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckWorkSchedule(string wsID)
        {
            if (workScheduleBUS.GetWorkSchedule().FirstOrDefault(ws => ws.WS_ID == wsID) == null)
            {
                MessageBox.Show("Lịch làm việc không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckWorkScheduleDetail(string wsID, string staffID)
        {
            if (workScheduleDetailBUS.GetWorkSchduleDetail().FirstOrDefault(s => s.WS_ID == wsID && s.StaffID == staffID) == null)
            {
                MessageBox.Show("Nhân viên trong lịch không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckContractType(string ctID)
        {
            if (contractTypeBUS.GetContractType().FirstOrDefault(ct => ct.CT_ID == ctID) == null)
            {
                MessageBox.Show("Loại hợp đồng không còn tồn tại trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
        public bool CheckAllowanceDetailInserted(string alID, string staffID)
        {
            if (allowanceDetailBUS.GetAllowanceDetail().FirstOrDefault(al => al.AL_ID == alID && al.StaffID == staffID) != null)
            {
                MessageBox.Show("Phụ cấp đã được thêm cho nhân viên trên cơ sở dữ liệu", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
            return true;
        }
    }
}
