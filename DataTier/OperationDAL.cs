using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    internal class OperationDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public OperationDAL() 
        {
            quanLyNhanSu =  new QuanLyNhanSuContextDB();
        }
        public IEnumerable<Operation> GetOperation()
        {
            return quanLyNhanSu.Operations.OrderBy(op => op.OP_ID).ToList();
        }
    }
}
