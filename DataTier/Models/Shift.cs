using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Shift")]
    public partial class Shift
    {
        public Shift()
        {
            TimeKeepings = new HashSet<TimeKeeping>();
        }

        [StringLength(15)]
        public string ShiftID { get; set; }

        [StringLength(50)]
        public string ShiftName { get; set; }

        public TimeSpan BeginTime { get; set; }

        public TimeSpan EndTime { get; set; }

        public virtual ICollection<TimeKeeping> TimeKeepings { get; set; }
    }
}
