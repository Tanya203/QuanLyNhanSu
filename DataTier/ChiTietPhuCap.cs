namespace QuanLyNhanSu.LogicTier
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietPhuCap")]
    public partial class ChiTietPhuCap
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string MaNV { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaPC { get; set; }

        [StringLength(500)]
        public string GhiChu { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual PhuCap PhuCap { get; set; }
    }
}
