namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("HinhThucChamCong")]
    public partial class HinhThucChamCong
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public HinhThucChamCong()
        {
            LoaiHopDongs = new HashSet<LoaiHopDong>();
        }

        [Key]
        [StringLength(15)]
        public string MaHTCC { get; set; }

        [Required]
        [StringLength(50)]
        public string TenHinhThucChamCong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoaiHopDong> LoaiHopDongs { get; set; }
    }
}
