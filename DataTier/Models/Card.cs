using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace QuanLyNhanSu.DataTier.Models
{
    [Table("Card")]
    public partial class Card
    {
        public Card()
        {
            CardDetails = new HashSet<CardDetail>();
        }

        [StringLength(15)]
        public string CardID { get; set; }

        [Required]
        [StringLength(15)]
        public string CT_ID { get; set; }

        [StringLength(15)]
        public string StaffID { get; set; }

        [Column(TypeName = "date")]
        public DateTime DateCreated { get; set; }

        public virtual CardType CardType { get; set; }

        public virtual Staff Staff { get; set; }

        public virtual ICollection<CardDetail> CardDetails { get; set; }
    }
}
