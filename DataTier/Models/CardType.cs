using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("CardType")]
    public partial class CardType
    {
        public CardType()
        {
            Cards = new HashSet<Card>();
        }

        [Key]
        [StringLength(15)]
        public string CT_ID { get; set; }

        [StringLength(100)]
        public string CardTypeName { get; set; }

        [StringLength(100)]
        public string CaculateMethod { get; set; }

        public virtual ICollection<Card> Cards { get; set; }
    }
}
