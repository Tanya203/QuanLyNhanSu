namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Authority")]
    public partial class Authority
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Authority()
        {
            Authorizations = new HashSet<Authorization>();
        }

        [Key]
        [StringLength(15)]
        public string AU_ID { get; set; }

        [Required]
        [StringLength(15)]
        public string IT_ID { get; set; }

        [StringLength(100)]
        public string AuthorityName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Authorization> Authorizations { get; set; }

        public virtual Interface Interface { get; set; }
    }
}
