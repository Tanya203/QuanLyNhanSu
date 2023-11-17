using QuanLyNhanSu.DataTier;
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
        public bool AddMonth(string month)
        {
            return monthDAL.AddMonth(month);
        }
    }
}
