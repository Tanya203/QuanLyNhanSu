using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace QuanLyNhanSu.DataTier.Models
{
    public partial class QuanLyNhanSuContextDB : DbContext
    {
        public QuanLyNhanSuContextDB()
            : base("name=QuanLyNhanSuContextDB")
        {
        }

        public virtual DbSet<Ca> Cas { get; set; }
        public virtual DbSet<ChamCong> ChamCongs { get; set; }
        public virtual DbSet<ChiTietLuongThang> ChiTietLuongThangs { get; set; }
        public virtual DbSet<ChiTietPhieu> ChiTietPhieux { get; set; }
        public virtual DbSet<ChiTietPhuCap> ChiTietPhuCaps { get; set; }
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<LichLamViec> LichLamViecs { get; set; }
        public virtual DbSet<LichSuThaoTac> LichSuThaoTacs { get; set; }
        public virtual DbSet<LoaiCa> LoaiCas { get; set; }
        public virtual DbSet<LoaiHopDong> LoaiHopDongs { get; set; }
        public virtual DbSet<LoaiPhieu> LoaiPhieux { get; set; }
        public virtual DbSet<LuongThang> LuongThangs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyens { get; set; }
        public virtual DbSet<Phieu> Phieux { get; set; }
        public virtual DbSet<PhongBan> PhongBans { get; set; }
        public virtual DbSet<PhuCap> PhuCaps { get; set; }
        public virtual DbSet<QuyenHan> QuyenHans { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Ca>()
                .Property(e => e.MaCa)
                .IsUnicode(false);

            modelBuilder.Entity<Ca>()
                .Property(e => e.GioBatDau)
                .HasPrecision(0);

            modelBuilder.Entity<Ca>()
                .Property(e => e.GioKetThuc)
                .HasPrecision(0);

            modelBuilder.Entity<Ca>()
                .HasMany(e => e.ChamCongs)
                .WithRequired(e => e.Ca)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.MaLLV)
                .IsUnicode(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.MaCa)
                .IsUnicode(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.MaLC)
                .IsUnicode(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.ThoiGianDen)
                .HasPrecision(0);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.ThoiGianVe)
                .HasPrecision(0);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.ThangNam)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.TongGioLam)
                .HasPrecision(38, 2);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.TongLuongTheoGio)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.TongThuong)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.TongPhat)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChiTietLuongThang>()
                .Property(e => e.TongPhuCap)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChiTietPhieu>()
                .Property(e => e.MaP)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieu>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieu>()
                .Property(e => e.SoTien)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChiTietPhuCap>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhuCap>()
                .Property(e => e.MaPC)
                .IsUnicode(false);

            modelBuilder.Entity<ChucVu>()
                .Property(e => e.MaCV)
                .IsUnicode(false);

            modelBuilder.Entity<ChucVu>()
                .Property(e => e.MaPB)
                .IsUnicode(false);

            modelBuilder.Entity<ChucVu>()
                .Property(e => e.LuongKhoiDiem)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChucVu>()
                .HasMany(e => e.NhanViens)
                .WithRequired(e => e.ChucVu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LichLamViec>()
                .Property(e => e.MaLLV)
                .IsUnicode(false);

            modelBuilder.Entity<LichLamViec>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<LichSuThaoTac>()
                .Property(e => e.NgayGio)
                .IsUnicode(false);

            modelBuilder.Entity<LichSuThaoTac>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiCa>()
                .Property(e => e.MaLC)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiCa>()
                .Property(e => e.HeSoLuong)
                .HasPrecision(38, 4);

            modelBuilder.Entity<LoaiCa>()
                .HasMany(e => e.ChamCongs)
                .WithRequired(e => e.LoaiCa)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LoaiHopDong>()
                .Property(e => e.MaLHD)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiHopDong>()
                .HasMany(e => e.NhanViens)
                .WithRequired(e => e.LoaiHopDong)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LoaiPhieu>()
                .Property(e => e.MaLP)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiPhieu>()
                .HasMany(e => e.Phieux)
                .WithRequired(e => e.LoaiPhieu)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LuongThang>()
                .Property(e => e.ThangNam)
                .IsUnicode(false);

            modelBuilder.Entity<LuongThang>()
                .HasMany(e => e.ChiTietLuongThangs)
                .WithRequired(e => e.LuongThang)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaCV)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MaLHD)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.TaiKhoan)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.MatKhau)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.CCCD)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SoNha)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SDT)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.LuongCoBan)
                .HasPrecision(38, 3);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.Hinh)
                .IsUnicode(false);

            modelBuilder.Entity<NhanVien>()
                .Property(e => e.SoTienNo)
                .HasPrecision(38, 3);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChamCongs)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietLuongThangs)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietPhieux)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietPhuCaps)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.LichSuThaoTacs)
                .WithOptional(e => e.NhanVien)
                .WillCascadeOnDelete();

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.Phieux)
                .WithOptional(e => e.NhanVien)
                .WillCascadeOnDelete();

            modelBuilder.Entity<PhanQuyen>()
                .Property(e => e.MaCV)
                .IsUnicode(false);

            modelBuilder.Entity<PhanQuyen>()
                .Property(e => e.MaQH)
                .IsUnicode(false);

            modelBuilder.Entity<Phieu>()
                .Property(e => e.MaP)
                .IsUnicode(false);

            modelBuilder.Entity<Phieu>()
                .Property(e => e.MaLP)
                .IsUnicode(false);

            modelBuilder.Entity<Phieu>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<PhongBan>()
                .Property(e => e.MaPB)
                .IsUnicode(false);

            modelBuilder.Entity<PhuCap>()
                .Property(e => e.MaPC)
                .IsUnicode(false);

            modelBuilder.Entity<PhuCap>()
                .Property(e => e.TienPhuCap)
                .HasPrecision(38, 3);

            modelBuilder.Entity<PhuCap>()
                .HasMany(e => e.ChiTietPhuCaps)
                .WithRequired(e => e.PhuCap)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<QuyenHan>()
                .Property(e => e.MaQH)
                .IsUnicode(false);

            modelBuilder.Entity<QuyenHan>()
                .HasMany(e => e.PhanQuyens)
                .WithRequired(e => e.QuyenHan)
                .WillCascadeOnDelete(false);
        }
    }
}
