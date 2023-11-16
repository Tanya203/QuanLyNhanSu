using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.LogicTier
{
    internal class InterfaceBUS
    {
        private readonly InterfaceDAL interfaceDAL;
        public InterfaceBUS()
        {
            interfaceDAL = new InterfaceDAL();
        }
        public IEnumerable<Interface> GetInterface()
        {
            return interfaceDAL.GetInterface().ToList();
        }
    }
}
