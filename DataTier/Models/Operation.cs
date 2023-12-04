using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Operation")]
    public partial class Operation
    {
        public Operation()
        {
            OperateHistories = new HashSet<OperateHistory>();
        }

        [Key]
        [StringLength(15)]
        public string OP_ID { get; set; }

        [StringLength(15)]
        public string IT_ID { get; set; }

        [StringLength(100)]
        public string OperationName { get; set; }

        public virtual Interface Interface { get; set; }

        public virtual ICollection<OperateHistory> OperateHistories { get; set; }
    }
}
