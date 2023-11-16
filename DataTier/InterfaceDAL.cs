using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class InterfaceDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public InterfaceDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<Interface> GetInterface()
        {
            return quanLyNhanSu.Interfaces.OrderBy(it => it.IT_ID).ToList();
        }
    }
}
