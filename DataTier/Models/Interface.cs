using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Interface")]
    public partial class Interface
    {
        public Interface()
        {
            Authorities = new HashSet<Authority>();
            Operations = new HashSet<Operation>();
        }

        [Key]
        [StringLength(15)]
        public string IT_ID { get; set; }

        [StringLength(100)]
        public string InterfaceName { get; set; }

        public virtual ICollection<Authority> Authorities { get; set; }

        public virtual ICollection<Operation> Operations { get; set; }
    }
}
