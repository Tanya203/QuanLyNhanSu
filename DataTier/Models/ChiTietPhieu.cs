namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietPhieu")]
    public partial class ChiTietPhieu
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string MaP { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaNV { get; set; }

        public decimal SoTien { get; set; }

        [StringLength(500)]
        public string GhiChu { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual Phieu Phieu { get; set; }
    }
}
