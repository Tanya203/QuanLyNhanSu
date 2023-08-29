using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class ThaoTacBUS
    {
        private readonly ThaoTacDAL thaoTacDAL;
        public ThaoTacBUS()
        {
            thaoTacDAL = new ThaoTacDAL();
        }
        public IEnumerable<ThaoTac> GetThaoTac()
        {
            return thaoTacDAL.GetThaoTac();
        }
    }
}
