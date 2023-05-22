namespace QuanLyNhanSu.LogicTier
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
        public DateTime NgayGio { get; set; }

        [StringLength(15)]
        public string MaNV { get; set; }

        [StringLength(10)]
        public string ThaoTacThucHien { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}