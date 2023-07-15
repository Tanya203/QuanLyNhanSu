namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Phieu")]
    public partial class Phieu
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Phieu()
        {
            ChiTietPhieux = new HashSet<ChiTietPhieu>();
        }

        [Key]
        [StringLength(15)]
        public string MaP { get; set; }

        [Required]
        [StringLength(15)]
        public string MaLP { get; set; }

        [StringLength(15)]
        public string MaNV { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayLap { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieu> ChiTietPhieux { get; set; }

        public virtual LoaiPhieu LoaiPhieu { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
