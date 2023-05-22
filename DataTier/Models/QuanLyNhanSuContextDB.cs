using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace QuanLyNhanSu.LogicTier
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
        public virtual DbSet<ChiTietPhieuPhat> ChiTietPhieuPhats { get; set; }
        public virtual DbSet<ChiTietPhieuThuong> ChiTietPhieuThuongs { get; set; }
        public virtual DbSet<ChiTietPhuCap> ChiTietPhuCaps { get; set; }
        public virtual DbSet<ChucVu> ChucVus { get; set; }
        public virtual DbSet<LichLamViec> LichLamViecs { get; set; }
        public virtual DbSet<LichSuThaoTac> LichSuThaoTacs { get; set; }
        public virtual DbSet<LoaiCa> LoaiCas { get; set; }
        public virtual DbSet<LoaiHopDong> LoaiHopDongs { get; set; }
        public virtual DbSet<LuongThang> LuongThangs { get; set; }
        public virtual DbSet<NhanVien> NhanViens { get; set; }
        public virtual DbSet<PhanQuyen> PhanQuyens { get; set; }
        public virtual DbSet<PhieuPhat> PhieuPhats { get; set; }
        public virtual DbSet<PhieuThuong> PhieuThuongs { get; set; }
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
                .HasMany(e => e.LichLamViecs)
                .WithRequired(e => e.Ca)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.MaLLV)
                .IsUnicode(false);

            modelBuilder.Entity<ChamCong>()
                .Property(e => e.MaNV)
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

            modelBuilder.Entity<ChiTietPhieuPhat>()
                .Property(e => e.MaPP)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieuPhat>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieuPhat>()
                .Property(e => e.TienPhat)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ChiTietPhieuPhat>()
                .Property(e => e.GhiChu)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieuThuong>()
                .Property(e => e.MaPT)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieuThuong>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<ChiTietPhieuThuong>()
                .Property(e => e.TienThuong)
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

            modelBuilder.Entity<LichLamViec>()
                .Property(e => e.MaLC)
                .IsUnicode(false);

            modelBuilder.Entity<LichLamViec>()
                .Property(e => e.MaCa)
                .IsUnicode(false);

            modelBuilder.Entity<LichLamViec>()
                .HasMany(e => e.ChamCongs)
                .WithRequired(e => e.LichLamViec)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LichSuThaoTac>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<LichSuThaoTac>()
                .Property(e => e.ThaoTacThucHien)
                .IsFixedLength();

            modelBuilder.Entity<LoaiCa>()
                .Property(e => e.MaLC)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiCa>()
                .Property(e => e.HeSoLuong)
                .HasPrecision(19, 4);

            modelBuilder.Entity<LoaiCa>()
                .HasMany(e => e.LichLamViecs)
                .WithRequired(e => e.LoaiCa)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<LoaiHopDong>()
                .Property(e => e.MaLHD)
                .IsUnicode(false);

            modelBuilder.Entity<LoaiHopDong>()
                .HasMany(e => e.NhanViens)
                .WithRequired(e => e.LoaiHopDong)
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
                .Property(e => e.CCCD_CMND)
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
                .HasMany(e => e.ChamCongs)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietLuongThangs)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietPhieuPhats)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietPhieuThuongs)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.ChiTietPhuCaps)
                .WithRequired(e => e.NhanVien)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<NhanVien>()
                .HasMany(e => e.PhieuThuongs)
                .WithOptional(e => e.NhanVien)
                .WillCascadeOnDelete();

            modelBuilder.Entity<PhanQuyen>()
                .Property(e => e.MaCV)
                .IsUnicode(false);

            modelBuilder.Entity<PhanQuyen>()
                .Property(e => e.MaQH)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuPhat>()
                .Property(e => e.MaPP)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuPhat>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuPhat>()
                .HasMany(e => e.ChiTietPhieuPhats)
                .WithRequired(e => e.PhieuPhat)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<PhieuThuong>()
                .Property(e => e.MaPT)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuThuong>()
                .Property(e => e.MaNV)
                .IsUnicode(false);

            modelBuilder.Entity<PhieuThuong>()
                .HasMany(e => e.ChiTietPhieuThuongs)
                .WithRequired(e => e.PhieuThuong)
                .WillCascadeOnDelete(false);

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
