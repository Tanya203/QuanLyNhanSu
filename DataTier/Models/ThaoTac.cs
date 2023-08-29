namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ThaoTac")]
    public partial class ThaoTac
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ThaoTac()
        {
            LichSuThaoTacs = new HashSet<LichSuThaoTac>();
        }

        [Key]
        [StringLength(15)]
        public string MaTT { get; set; }

        [StringLength(15)]
        public string MaGD { get; set; }

        [StringLength(100)]
        public string TenThaoTac { get; set; }

        public virtual GiaoDien GiaoDien { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichSuThaoTac> LichSuThaoTacs { get; set; }
    }
}
