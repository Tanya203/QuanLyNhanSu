namespace QuanLyNhanSu.LogicTier
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("PhieuPhat")]
    public partial class PhieuPhat
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public PhieuPhat()
        {
            ChiTietPhieuPhats = new HashSet<ChiTietPhieuPhat>();
        }

        [Key]
        [StringLength(15)]
        public string MaPP { get; set; }

        [StringLength(15)]
        public string MaNV { get; set; }

        public DateTime? NgayLap { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieuPhat> ChiTietPhieuPhats { get; set; }

        public virtual NhanVien NhanVien { get; set; }
    }
}
