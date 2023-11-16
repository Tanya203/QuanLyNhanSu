namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Operation")]
    public partial class Operation
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OperateHistory> OperateHistories { get; set; }
    }
}
