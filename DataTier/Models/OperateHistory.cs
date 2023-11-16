namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

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
