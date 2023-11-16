using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.LogicTier
{
    internal class OperationBUS
    {
        private readonly OperationDAL operationDAL;
        public OperationBUS()
        {
            operationDAL = new OperationDAL();
        }
        public IEnumerable<Operation> GetOperation()
        {
            return operationDAL.GetOperation();
        }
    }
}
