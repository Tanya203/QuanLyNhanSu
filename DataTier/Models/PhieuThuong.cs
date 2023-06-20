namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuThuong")]
    public partial class PhieuThuong
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuThuong()
        {
            ChiTietPhieuThuongs = new HashSet<ChiTietPhieuThuong>();
        }

        [Key]
        [StringLength(15)]
        public string MaPT { get; set; }

        [StringLength(15)]
        public string MaNV { get; set; }

        public DateTime? NgayLap { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuThuong> ChiTietPhieuThuongs { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
