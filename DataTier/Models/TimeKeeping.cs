using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("TimeKeeping")]
    public partial class TimeKeeping
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string WS_ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string StaffID { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(15)]
        public string ShiftID { get; set; }

        [Key]
        [Column(Order = 3)]
        [StringLength(15)]
        public string ST_ID { get; set; }

        public bool AbsenceUse { get; set; }

        public TimeSpan? CheckInTime { get; set; }

        public TimeSpan? CheckOutTime { get; set; }

        public virtual Shift Shift { get; set; }

        public virtual ShiftType ShiftType { get; set; }

        public virtual Staff Staff { get; set; }

        public virtual WorkSchedule WorkSchedule { get; set; }
    }
}
