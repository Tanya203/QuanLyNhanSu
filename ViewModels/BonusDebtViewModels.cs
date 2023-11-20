using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.ViewModels
{
    internal class BonusDebtViewModels
    {
        public string StaffID { get; set; }
        public string CardID { get; set; }
        public string FullName { get; set; }  
        public string Department {  get; set; }
        public string Position { get; set; }
        public string CardType { get; set; }
        public decimal Amount { get; set; }
        public decimal Deliver {  get; set; }
        public string Note { get; set; }
        public string Caculation { get; set; }
    }
}
