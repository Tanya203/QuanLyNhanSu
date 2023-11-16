using QuanLyNhanSu.DataTier;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;

namespace QuanLyNhanSu.LogicTier
{
    internal class OperateHistoryBUS
    {
        private readonly OperateHistoryDAL operateHistoryDAL;
        public OperateHistoryBUS()
        {
            operateHistoryDAL = new OperateHistoryDAL();
        }
        public IEnumerable<OperateHistoryViewModels> GetOperationHistory(string time, string form, string operation)
        {
            return operateHistoryDAL.GetOperationHistory(time, form, operation);
        }
        public IEnumerable<OperateHistoryViewModels> GetOperationHistorySearch(string time, string form, string operation, string search)
        {
            return operateHistoryDAL.GetOperationHistorySearch(time, form, operation, search);
        }
        public bool Save(OperateHistory operateHistory)
        {
            return operateHistoryDAL.Save(operateHistory);
        }
    }
}
