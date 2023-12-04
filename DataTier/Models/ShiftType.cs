using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("ShiftType")]
    public partial class ShiftType
    {
        public ShiftType()
        {
            TimeKeepings = new HashSet<TimeKeeping>();
        }

        [Key]
        [StringLength(15)]
        public string ST_ID { get; set; }

        [StringLength(50)]
        public string ShiftTypeName { get; set; }

        public decimal SalaryCoefficient { get; set; }

        public virtual ICollection<TimeKeeping> TimeKeepings { get; set; }
    }
}
