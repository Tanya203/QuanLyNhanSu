using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.ViewModels
{
    public class MonthBonusDebtViewModels
    {
        public string MonthID { get; set; }
        public string StaffID { get; set; }
        public string DP_ID { get; set; }
        public string PS_ID { get; set; }
        public string Caculate {  get; set; }
        public string Department { get; set; }
        public string Position { get; set; }
        public string FullName { get; set; }
        public decimal Amount { get; set; }
        public decimal Deliver { get; set; }
        
    }
}
