namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("TimeKeepingMethod")]
    public partial class TimeKeepingMethod
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public TimeKeepingMethod()
        {
            ContractTypes = new HashSet<ContractType>();
        }

        [Key]
        [StringLength(15)]
        public string TKM_ID { get; set; }

        [Required]
        [StringLength(50)]
        public string TimeKeepingMethodName { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ContractType> ContractTypes { get; set; }
    }
}
