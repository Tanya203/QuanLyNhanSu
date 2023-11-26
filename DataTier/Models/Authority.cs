using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Authority")]
    public partial class Authority
    {
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

        public virtual ICollection<Authorization> Authorizations { get; set; }

        public virtual Interface Interface { get; set; }
    }
}
