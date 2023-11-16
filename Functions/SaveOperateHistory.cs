using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{
    internal class SaveOperateHistory
    {
        private readonly OperateHistoryBUS operateHistoryBUS;
        private readonly OperationBUS operationBUS;
        private readonly List<Operation> operations;
        private string opID;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        public SaveOperateHistory(string form)
        {
            operateHistoryBUS = new OperateHistoryBUS();
            operationBUS = new OperationBUS();
            operations = operationBUS.GetOperation().Where(tt => tt.Interface.InterfaceName == form).ToList();
        }
        public bool Save(string staffID, string operate, string detailOperation)
        {
            try
            {
                opID = operations.FirstOrDefault(opr => opr.OperationName.Contains(operate)).OP_ID;                
                OperateHistory op = new OperateHistory
                {
                    DateTime = DateTime.Now.ToString(formatDateTime),
                    StaffID = staffID,
                    OP_ID = opID,
                    DetailOperation = detailOperation,
                };
                operateHistoryBUS.Save(op);
                return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
    }
}
