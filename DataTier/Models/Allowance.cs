using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Allowance")]
    public partial class Allowance
    {
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

        public virtual ICollection<AllowanceDetail> AllowanceDetails { get; set; }
    }
}
