namespace QuanLyNhanSu.DataTier.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Staff")]
    public partial class Staff
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Staff()
        {
            AllowanceDetails = new HashSet<AllowanceDetail>();
            Cards = new HashSet<Card>();
            CardDetails = new HashSet<CardDetail>();
            MonthSalaryDetails = new HashSet<MonthSalaryDetail>();
            OperateHistories = new HashSet<OperateHistory>();
            TimeKeepings = new HashSet<TimeKeeping>();
            WorkSchedules = new HashSet<WorkSchedule>();
        }

        [StringLength(15)]
        public string StaffID { get; set; }

        [Required]
        [StringLength(15)]
        public string PS_ID { get; set; }

        [Required]
        [StringLength(15)]
        public string CT_ID { get; set; }

        [Required]
        [StringLength(20)]
        public string Account { get; set; }

        [Required]
        [StringLength(255)]
        public string Password { get; set; }

        [Required]
        [StringLength(12)]
        public string CardID { get; set; }

        [StringLength(20)]
        public string LastName { get; set; }

        [StringLength(20)]
        public string MiddleName { get; set; }

        [StringLength(20)]
        public string FirstName { get; set; }

        [Column(TypeName = "date")]
        public DateTime Brithday { get; set; }

        [StringLength(20)]
        public string HouseNumber { get; set; }

        [StringLength(100)]
        public string Street { get; set; }

        [StringLength(100)]
        public string Ward { get; set; }

        [StringLength(100)]
        public string District { get; set; }

        [StringLength(100)]
        public string Province_City { get; set; }

        [Required]
        [StringLength(50)]
        public string Gender { get; set; }

        [Required]
        [StringLength(10)]
        public string Phone { get; set; }

        [Required]
        [StringLength(50)]
        public string Email { get; set; }

        [StringLength(50)]
        public string EducationLevel { get; set; }

        [Column(TypeName = "date")]
        public DateTime EntryDate { get; set; }

        [Column(TypeName = "date")]
        public DateTime ContractDuration { get; set; }

        [StringLength(50)]
        public string Status { get; set; }

        public int DayOffAmount { get; set; }

        public decimal BasicSalary { get; set; }

        [Column(TypeName = "image")]
        public byte[] Picture { get; set; }

        public DateTime? LockDate { get; set; }

        public decimal? Dept { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<AllowanceDetail> AllowanceDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Card> Cards { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CardDetail> CardDetails { get; set; }

        public virtual ContractType ContractType { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<MonthSalaryDetail> MonthSalaryDetails { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<OperateHistory> OperateHistories { get; set; }

        public virtual Position Position { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<TimeKeeping> TimeKeepings { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<WorkSchedule> WorkSchedules { get; set; }
    }
}
