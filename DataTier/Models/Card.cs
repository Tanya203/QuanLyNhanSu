namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Card")]
    public partial class Card
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CardDetail> CardDetails { get; set; }
    }
}
