using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Department")]
    public partial class Department
    {
        public Department()
        {
            Positions = new HashSet<Position>();
        }

        [Key]
        [StringLength(15)]
        public string DP_ID { get; set; }

        [StringLength(50)]
        public string DepartmentName { get; set; }

        public virtual ICollection<Position> Positions { get; set; }
    }
}
