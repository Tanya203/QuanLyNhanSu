namespace QuanLyNhanSu.ViewModels
{
    public class MonthSalaryStatisticViewModels
    {
        public string StaffID { get; set; } 
        public string Department {  get; set; }
        public string Position { get; set; }
        public string FullName {get; set; }
        public decimal BasicSalary { get; set; }
        public decimal TotalWorkHours {get; set; }
        public decimal TotalBonus {get; set; }
        public decimal TotalAllowance { get; set; }
        public decimal TotalDebt { get; set; }
        public decimal TotalDebtPaid { get; set; }
    }
}
