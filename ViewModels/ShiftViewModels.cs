using System;

namespace QuanLyNhanSu.ViewModels
{
    public class ShiftViewModels
    {
        public string ShiftID { get; set; }
        public string ShiftName { get; set; }
        public TimeSpan BeginTime { get; set; }
        public TimeSpan EndTime { get; set; }
    }
}
