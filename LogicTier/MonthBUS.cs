using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class MonthBUS
    {
        private readonly MonthDAL monthDAL;
        public MonthBUS()
        {
            monthDAL = new MonthDAL();
        }
        public IEnumerable<Month> GetMonth()
        {
            return monthDAL.GetMonth();
        }
        public bool AddMonth(string month)
        {
            return monthDAL.AddMonth(month);
        }
    }
}
