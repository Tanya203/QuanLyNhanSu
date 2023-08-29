namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhanQuyen")]
    public partial class PhanQuyen
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string MaCV { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaTT { get; set; }

        [Key]
        [Column(Order = 2)]
        [StringLength(15)]
        public string MaGD { get; set; }

        public bool? CapQuyen { get; set; }

        public virtual ChucVu ChucVu { get; set; }
    }
}
