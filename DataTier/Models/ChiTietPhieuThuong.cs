namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietPhieuThuong")]
    public partial class ChiTietPhieuThuong
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string MaPT { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaNV { get; set; }

        public decimal TienThuong { get; set; }

        [StringLength(500)]
        public string GhiChu { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual PhieuThuong PhieuThuong { get; set; }
    }
}
