using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{

    [Table("TimeKeepingMethod")]
    public partial class TimeKeepingMethod
    {
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

        public virtual ICollection<ContractType> ContractTypes { get; set; }
    }
}
