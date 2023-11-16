namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("AllowanceDetail")]
    public partial class AllowanceDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string StaffID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string AL_ID { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public virtual Allowance Allowance { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
