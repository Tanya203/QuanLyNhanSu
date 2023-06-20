namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhuCap")]
    public partial class PhuCap
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhuCap()
        {
            ChiTietPhuCaps = new HashSet<ChiTietPhuCap>();
        }

        [Key]
        [StringLength(15)]
        public string MaPC { get; set; }

        [StringLength(50)]
        public string TenPhuCap { get; set; }

        public decimal TienPhuCap { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhuCap> ChiTietPhuCaps { get; set; }
    }
}
