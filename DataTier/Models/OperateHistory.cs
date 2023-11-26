using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("OperateHistory")]
    public partial class OperateHistory
    {
        [Key]
        [StringLength(100)]
        public string DateTime { get; set; }

        [StringLength(15)]
        public string StaffID { get; set; }

        [StringLength(15)]
        public string OP_ID { get; set; }

        [StringLength(4000)]
        public string DetailOperation { get; set; }

        public virtual Operation Operation { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
