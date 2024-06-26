﻿namespace QuanLyNhanSu.ViewModels
{
    public class MonthSalaryViewModels
    {
        public string MonthID { get; set; }
        public string StaffID { get; set; }
        public string DP_ID { get; set; }
        public string PS_ID { get; set; }
        public string Department {  get; set; }
        public string Position { get; set; }
        public string FullName { get; set; }  
        public decimal BasicSalary { get; set; }
        public decimal TotalWorkHours { get; set; }
        public decimal TotalAllownace { get; set; }
        public decimal TotalBonus { get; set;}
    }
}
