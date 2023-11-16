namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ContractType")]
    public partial class ContractType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ContractType()
        {
            Staffs = new HashSet<Staff>();
        }

        [Key]
        [StringLength(15)]
        public string CT_ID { get; set; }

        [StringLength(15)]
        public string TKM_ID { get; set; }

        [StringLength(100)]
        public string ContractTypeName { get; set; }

        public virtual TimeKeepingMethod TimeKeepingMethod { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Staff> Staffs { get; set; }
    }
}
