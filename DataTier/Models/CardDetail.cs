namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("CardDetail")]
    public partial class CardDetail
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string CardID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string StaffID { get; set; }

        public decimal Amount { get; set; }

        [StringLength(500)]
        public string Note { get; set; }

        public virtual Card Card { get; set; }

        public virtual Staff Staff { get; set; }
    }
}
