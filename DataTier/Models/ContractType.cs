using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("ContractType")]
    public partial class ContractType
    {
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

        public virtual ICollection<Staff> Staffs { get; set; }
    }
}
