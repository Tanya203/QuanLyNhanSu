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

        public virtual DbSet<Allowance> Allowances { get; set; }
        public virtual DbSet<AllowanceDetail> AllowanceDetails { get; set; }
        public virtual DbSet<Authority> Authorities { get; set; }
        public virtual DbSet<Authorization> Authorizations { get; set; }
        public virtual DbSet<Card> Cards { get; set; }
        public virtual DbSet<CardDetail> CardDetails { get; set; }
        public virtual DbSet<CardType> CardTypes { get; set; }
        public virtual DbSet<ContractType> ContractTypes { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Interface> Interfaces { get; set; }
        public virtual DbSet<Month> Months { get; set; }
        public virtual DbSet<MonthSalaryDetail> MonthSalaryDetails { get; set; }
        public virtual DbSet<OperateHistory> OperateHistories { get; set; }
        public virtual DbSet<Operation> Operations { get; set; }
        public virtual DbSet<Position> Positions { get; set; }
        public virtual DbSet<Shift> Shifts { get; set; }
        public virtual DbSet<ShiftType> ShiftTypes { get; set; }
        public virtual DbSet<Staff> Staffs { get; set; }
        public virtual DbSet<TimeKeeping> TimeKeepings { get; set; }
        public virtual DbSet<TimeKeepingMethod> TimeKeepingMethods { get; set; }
        public virtual DbSet<WorkSchedule> WorkSchedules { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Allowance>()
                .Property(e => e.AL_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Allowance>()
                .Property(e => e.Amount)
                .HasPrecision(38, 3);

            modelBuilder.Entity<Allowance>()
                .HasMany(e => e.AllowanceDetails)
                .WithRequired(e => e.Allowance)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<AllowanceDetail>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<AllowanceDetail>()
                .Property(e => e.AL_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Authority>()
                .Property(e => e.AU_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Authority>()
                .Property(e => e.IT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Authorization>()
                .Property(e => e.PS_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Authorization>()
                .Property(e => e.AU_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Card>()
                .Property(e => e.CardID)
                .IsUnicode(false);

            modelBuilder.Entity<Card>()
                .Property(e => e.CT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Card>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<CardDetail>()
                .Property(e => e.CardID)
                .IsUnicode(false);

            modelBuilder.Entity<CardDetail>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<CardDetail>()
                .Property(e => e.Amount)
                .HasPrecision(38, 3);

            modelBuilder.Entity<CardDetail>()
                .Property(e => e.Deliver)
                .HasPrecision(38, 3);

            modelBuilder.Entity<CardType>()
                .Property(e => e.CT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<CardType>()
                .HasMany(e => e.Cards)
                .WithRequired(e => e.CardType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ContractType>()
                .Property(e => e.CT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<ContractType>()
                .Property(e => e.TKM_ID)
                .IsUnicode(false);

            modelBuilder.Entity<ContractType>()
                .HasMany(e => e.Staffs)
                .WithRequired(e => e.ContractType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.DP_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Interface>()
                .Property(e => e.IT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Interface>()
                .HasMany(e => e.Authorities)
                .WithRequired(e => e.Interface)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Month>()
                .Property(e => e.Month1)
                .IsUnicode(false);

            modelBuilder.Entity<Month>()
                .HasMany(e => e.MonthSalaryDetails)
                .WithRequired(e => e.Month1)
                .HasForeignKey(e => e.Month)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.Month)
                .IsUnicode(false);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.TotalWorkHours)
                .HasPrecision(38, 3);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.BasicSalary)
                .HasPrecision(38, 3);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.TotalBonus)
                .HasPrecision(38, 3);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.TotalFine)
                .HasPrecision(38, 3);

            modelBuilder.Entity<MonthSalaryDetail>()
                .Property(e => e.TotalAllowance)
                .HasPrecision(38, 3);

            modelBuilder.Entity<OperateHistory>()
                .Property(e => e.DateTime)
                .IsUnicode(false);

            modelBuilder.Entity<OperateHistory>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<OperateHistory>()
                .Property(e => e.OP_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Operation>()
                .Property(e => e.OP_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Operation>()
                .Property(e => e.IT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Position>()
                .Property(e => e.PS_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Position>()
                .Property(e => e.DP_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Position>()
                .HasMany(e => e.Staffs)
                .WithRequired(e => e.Position)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Shift>()
                .Property(e => e.ShiftID)
                .IsUnicode(false);

            modelBuilder.Entity<Shift>()
                .Property(e => e.BeginTime)
                .HasPrecision(0);

            modelBuilder.Entity<Shift>()
                .Property(e => e.EndTime)
                .HasPrecision(0);

            modelBuilder.Entity<Shift>()
                .HasMany(e => e.TimeKeepings)
                .WithRequired(e => e.Shift)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<ShiftType>()
                .Property(e => e.ST_ID)
                .IsUnicode(false);

            modelBuilder.Entity<ShiftType>()
                .Property(e => e.SalaryCoefficient)
                .HasPrecision(38, 3);

            modelBuilder.Entity<ShiftType>()
                .HasMany(e => e.TimeKeepings)
                .WithRequired(e => e.ShiftType)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.PS_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.CT_ID)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Account)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Password)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.CardID)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.HouseNumber)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Phone)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Email)
                .IsUnicode(false);

            modelBuilder.Entity<Staff>()
                .Property(e => e.BasicSalary)
                .HasPrecision(38, 3);

            modelBuilder.Entity<Staff>()
                .Property(e => e.Dept)
                .HasPrecision(38, 3);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.AllowanceDetails)
                .WithRequired(e => e.Staff)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.CardDetails)
                .WithRequired(e => e.Staff)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.MonthSalaryDetails)
                .WithRequired(e => e.Staff)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Staff>()
                .HasMany(e => e.TimeKeepings)
                .WithRequired(e => e.Staff)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<TimeKeeping>()
                .Property(e => e.WS_ID)
                .IsUnicode(false);

            modelBuilder.Entity<TimeKeeping>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<TimeKeeping>()
                .Property(e => e.ShiftID)
                .IsUnicode(false);

            modelBuilder.Entity<TimeKeeping>()
                .Property(e => e.ST_ID)
                .IsUnicode(false);

            modelBuilder.Entity<TimeKeeping>()
                .Property(e => e.CheckInTime)
                .HasPrecision(0);

            modelBuilder.Entity<TimeKeeping>()
                .Property(e => e.CheckOutTime)
                .HasPrecision(0);

            modelBuilder.Entity<TimeKeepingMethod>()
                .Property(e => e.TKM_ID)
                .IsUnicode(false);

            modelBuilder.Entity<WorkSchedule>()
                .Property(e => e.WS_ID)
                .IsUnicode(false);

            modelBuilder.Entity<WorkSchedule>()
                .Property(e => e.StaffID)
                .IsUnicode(false);

            modelBuilder.Entity<WorkSchedule>()
                .HasMany(e => e.TimeKeepings)
                .WithRequired(e => e.WorkSchedule)
                .WillCascadeOnDelete(false);
        }
    }
}
