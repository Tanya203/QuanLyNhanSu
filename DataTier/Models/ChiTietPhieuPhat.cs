namespace QuanLyNhanSu.LogicTier
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietPhieuPhat")]
    public partial class ChiTietPhieuPhat
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string MaPP { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaNV { get; set; }

        public decimal TienPhat { get; set; }

        [StringLength(500)]
        public string GhiChu { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual PhieuPhat PhieuPhat { get; set; }
    }
}
