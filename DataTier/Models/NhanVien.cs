namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("NhanVien")]
    public partial class NhanVien
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public NhanVien()
        {
            ChamCongs = new HashSet<ChamCong>();
            ChiTietLuongThangs = new HashSet<ChiTietLuongThang>();
            ChiTietPhieux = new HashSet<ChiTietPhieu>();
            ChiTietPhuCaps = new HashSet<ChiTietPhuCap>();
            LichLamViecs = new HashSet<LichLamViec>();
            LichSuThaoTacs = new HashSet<LichSuThaoTac>();
            Phieux = new HashSet<Phieu>();
        }

        [Key]
        [StringLength(15)]
        public string MaNV { get; set; }

        [Required]
        [StringLength(15)]
        public string MaCV { get; set; }

        [Required]
        [StringLength(15)]
        public string MaLHD { get; set; }

        [Required]
        [StringLength(20)]
        public string TaiKhoan { get; set; }

        [Required]
        [StringLength(255)]
        public string MatKhau { get; set; }

        [Required]
        [StringLength(12)]
        public string CCCD { get; set; }

        [StringLength(20)]
        public string Ho { get; set; }

        [StringLength(20)]
        public string TenLot { get; set; }

        [StringLength(20)]
        public string Ten { get; set; }

        [Column(TypeName = "date")]
        public DateTime NTNS { get; set; }

        [StringLength(20)]
        public string SoNha { get; set; }

        [StringLength(100)]
        public string TenDuong { get; set; }

        [StringLength(100)]
        public string Phuong_Xa { get; set; }

        [StringLength(100)]
        public string Quan_Huyen { get; set; }

        [StringLength(100)]
        public string Tinh_ThanhPho { get; set; }

        [Required]
        [StringLength(50)]
        public string GioiTinh { get; set; }

        [Required]
        [StringLength(10)]
        public string SDT { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string TrinhDoHocVan { get; set; }

        [Column(TypeName = "date")]
        public DateTime NgayVaoLam { get; set; }

        [Column(TypeName = "date")]
        public DateTime ThoiHanHopDong { get; set; }

        [StringLength(50)]
        public string TinhTrang { get; set; }

        public int SoNgayPhep { get; set; }

        public decimal LuongCoBan { get; set; }

        [StringLength(50)]
        public string Hinh { get; set; }

        public DateTime? NgayKhoa { get; set; }

        public decimal? SoTienNo { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChamCong> ChamCongs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietLuongThang> ChiTietLuongThangs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhieu> ChiTietPhieux { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ChiTietPhuCap> ChiTietPhuCaps { get; set; }

        public virtual ChucVu ChucVu { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichLamViec> LichLamViecs { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LichSuThaoTac> LichSuThaoTacs { get; set; }

        public virtual LoaiHopDong LoaiHopDong { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Phieu> Phieux { get; set; }
    }
}
