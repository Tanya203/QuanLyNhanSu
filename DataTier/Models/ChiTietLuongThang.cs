namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ChiTietLuongThang")]
    public partial class ChiTietLuongThang
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(20)]
        public string ThangNam { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string MaNV { get; set; }

        public decimal? TongGioLam { get; set; }

        public decimal? TongLuongTheoGio { get; set; }

        public decimal? TongThuong { get; set; }

        public decimal? TongPhat { get; set; }

        public decimal? TongPhuCap { get; set; }

        public virtual LuongThang LuongThang { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
