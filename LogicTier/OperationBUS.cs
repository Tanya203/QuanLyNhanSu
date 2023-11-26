using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using System.Collections.Generic;

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
