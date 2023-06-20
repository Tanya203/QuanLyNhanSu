namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChamCong")]
    public partial class ChamCong
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string MaLLV { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaNV { get; set; }

        public bool? Phep { get; set; }

        public TimeSpan? ThoiGianDen { get; set; }

        public TimeSpan? ThoiGianVe { get; set; }

        public virtual LichLamViec LichLamViec { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
