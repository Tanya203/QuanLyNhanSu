namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Allowance")]
    public partial class Allowance
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Allowance()
        {
            AllowanceDetails = new HashSet<AllowanceDetail>();
        }

        [Key]
        [StringLength(15)]
        public string AL_ID { get; set; }

        [StringLength(50)]
        public string AllowanceName { get; set; }

        public decimal Amount { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AllowanceDetail> AllowanceDetails { get; set; }
    }
}
