using System;

namespace QuanLyNhanSu.ViewModels
{
    public class WorkScheduleDetailViewModels
    {
        public string StaffID { get; set; }
        public string WS_ID { get; set; }
        public string FullName { get; set; }
        public string Department { get; set; }
        public string Position { get; set; }
        public string CheckInTime { get; set; }
        public string CheckOutTime { get; set; }
        public DateTime WorkDate { get; set; }
        public string Shift { get; set; }
        public string ShiftType { get; set; }
        public bool AbsenceUse { get; set; }
        public int DayOffAmount { get; set; }
    }
}
