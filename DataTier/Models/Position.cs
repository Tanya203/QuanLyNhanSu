using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Position")]
    public partial class Position
    {
        public Position()
        {
            Authorizations = new HashSet<Authorization>();
            Staffs = new HashSet<Staff>();
        }

        [Key]
        [StringLength(15)]
        public string PS_ID { get; set; }

        [StringLength(15)]
        public string DP_ID { get; set; }

        [StringLength(50)]
        public string PositionName { get; set; }

        public virtual ICollection<Authorization> Authorizations { get; set; }

        public virtual Department Department { get; set; }

        public virtual ICollection<Staff> Staffs { get; set; }
    }
}
