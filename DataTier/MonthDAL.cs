using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier
{
    internal class MonthDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public MonthDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<Month> GetMonth()
        {
            return quanLyNhanSu.Months.OrderBy(m => m.MonthID);
        }
        public bool AddMonth(string month)
        {
            try
            {
                Month newMonth = new Month
                {
                    MonthID = month,
                };
                quanLyNhanSu.Months.Add(newMonth);
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
