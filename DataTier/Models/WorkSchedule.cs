using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("WorkSchedule")]
    public partial class WorkSchedule
    {
        public WorkSchedule()
        {
            TimeKeepings = new HashSet<TimeKeeping>();
        }

        [Key]
        [StringLength(15)]
        public string WS_ID { get; set; }

        [StringLength(15)]
        public string StaffID { get; set; }

        [Column(TypeName = "date")]
        public DateTime WorkDate { get; set; }

        public virtual Staff Staff { get; set; }

        public virtual ICollection<TimeKeeping> TimeKeepings { get; set; }
    }
}
