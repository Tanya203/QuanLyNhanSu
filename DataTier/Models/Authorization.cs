namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Authorization
    {
        [Key]
        [Column(Order = 0)]
        [StringLength(15)]
        public string PS_ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(15)]
        public string AU_ID { get; set; }

        public bool Authorize { get; set; }

        public virtual Authority Authority { get; set; }

        public virtual Position Position { get; set; }
    }
}
