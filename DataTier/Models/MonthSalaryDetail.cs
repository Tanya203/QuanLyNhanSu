namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("MonthSalaryDetail")]
    public partial class MonthSalaryDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string MonthID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string StaffID { get; set; }

        public decimal BasicSalary { get; set; }

        public decimal TotalAllowance { get; set; }

        public virtual Month Month { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
