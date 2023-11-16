namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CardType")]
    public partial class CardType
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
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

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Card> Cards { get; set; }
    }
}
