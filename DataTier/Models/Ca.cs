namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Ca")]
    public partial class Ca
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Ca()
        {
            ChamCongs = new HashSet<ChamCong>();
        }

        [Key]
        [StringLength(15)]
        public string MaCa { get; set; }

        [StringLength(50)]
        public string TenCa { get; set; }

        public TimeSpan GioBatDau { get; set; }

        public TimeSpan GioKetThuc { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChamCong> ChamCongs { get; set; }
    }
}
