namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("LichLamViec")]
    public partial class LichLamViec
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public LichLamViec()
        {
            ChamCongs = new HashSet<ChamCong>();
        }

        [Key]
        [StringLength(15)]
        public string MaLLV { get; set; }

        [StringLength(15)]
        public string MaNV { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayLam { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChamCong> ChamCongs { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
