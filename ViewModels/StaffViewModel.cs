using System;

namespace QuanLyNhanSu.ViewModels
{
    public class StaffViewModel
    {
        public string StaffID { get; set; }
        public string PS_ID { get; set; }
        public string CT_ID { get; set; }
        public string Account { get; set; }
        public string CardID { get; set; }
        public string LastName { get; set; }
        public string MiddleName { get; set; }
        public string FirstName { get; set; }
        public DateTime Brithday { get; set; }
        public string HouseNumber { get; set;}
        public string Street { get; set; }
        public string Ward { get; set; }
        public string District { get; set; }
        public string Province_City { get; set; }
        public string Gender { get; set; }
        public string Phone { get; set;}
        public string Email { get; set;}
        public string EducationLevel { get; set;}
        public DateTime EntryDate { get; set; }
        public DateTime ContractDuration { get; set; }
        public string Status { get; set; }
        public int DayOffAmount { get; set; }
        public decimal BasicSalary { get; set; }
        public byte[] Picture { get; set; }
        public string DepartmentName { get; set; }
        public string PositionName { get; set; }
        public string ContractTypeName { get; set; }
        public decimal? Dept { get; set; }
        public DateTime? LockDate { get; set; }
    }
}
