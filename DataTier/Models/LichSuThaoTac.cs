namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichSuThaoTac")]
    public partial class LichSuThaoTac
    {
        [Key]
        [StringLength(100)]
        public string NgayGio { get; set; }

        [StringLength(15)]
        public string MaNV { get; set; }

        [StringLength(15)]
        public string MaTT { get; set; }

        [StringLength(500)]
        public string ThaoTacThucHien { get; set; }

        public virtual NhanVien NhanVien { get; set; }

        public virtual ThaoTac ThaoTac { get; set; }
    }
}
