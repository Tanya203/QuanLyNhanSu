namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("WorkSchedule")]
    public partial class WorkSchedule
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public WorkSchedule()
        {
            TimeKeepings = new HashSet<TimeKeeping>();
        }

        [Key]
        [StringLength(15)]
        public string WS_ID { get; set; }

        [StringLength(15)]
        public string StaffID { get; set; }

        [Column(TypeName = "date")]
        public DateTime WorkDate { get; set; }

        public virtual Staff Staff { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeKeeping> TimeKeepings { get; set; }
    }
}
