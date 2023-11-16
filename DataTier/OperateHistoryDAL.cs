using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class OperateHistoryDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public OperateHistoryDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<OperateHistoryViewModels> GetOperationHistory(string time, string form, string operation)
        {
            var operateHistory = quanLyNhanSu.OperateHistories.Select(x => new OperateHistoryViewModels
            {
                DateTime = x.DateTime,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName+x.Staff.MiddleName+x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Interface = x.Operation.Interface.InterfaceName,
                Operation = x.Operation.OperationName,
                OperationDetail = x.DetailOperation,
            });
            if (!string.IsNullOrEmpty(form) && string.IsNullOrEmpty(operation))
                operateHistory = operateHistory.Where(lstt => lstt.DateTime.Contains(time) && lstt.Interface == form);
            if(!string.IsNullOrEmpty(operation) && string.IsNullOrEmpty(form))
                operateHistory = operateHistory.Where(lstt => lstt.DateTime.Contains(time) && lstt.Operation == operation);
            if (!string.IsNullOrEmpty(operation) && !string.IsNullOrEmpty(form))
                operateHistory = operateHistory.Where(lstt => lstt.DateTime.Contains(time) && lstt.Operation == operation && lstt.Interface == form);
            else
                operateHistory = operateHistory.Where(lstt => lstt.DateTime.Contains(time));
            return operateHistory;
        }
        public IEnumerable<OperateHistoryViewModels> GetOperationHistorySearch(string time, string form, string operation, string search)
        {
            var operateHistorySearch = quanLyNhanSu.OperateHistories.Select(x => new OperateHistoryViewModels
            {
                DateTime = x.DateTime,
                StaffID = x.StaffID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                Interface = x.Operation.Interface.InterfaceName,
                Operation = x.Operation.OperationName,
                OperationDetail = x.DetailOperation,
            });
            if (!string.IsNullOrEmpty(form) && string.IsNullOrEmpty(operation))
                operateHistorySearch = operateHistorySearch.Where(lstt => lstt.DateTime.Contains(time) && lstt.Interface == form);
            if (!string.IsNullOrEmpty(operation) && string.IsNullOrEmpty(form))
                operateHistorySearch = operateHistorySearch.Where(lstt => lstt.DateTime.Contains(time) && lstt.Operation == operation);
            if (!string.IsNullOrEmpty(operation) && !string.IsNullOrEmpty(form))
                operateHistorySearch = operateHistorySearch.Where(lstt => lstt.DateTime.Contains(time) && lstt.Operation == operation && lstt.Interface == form);
            else
                operateHistorySearch = operateHistorySearch.Where(lstt => lstt.DateTime.Contains(time));
            operateHistorySearch = operateHistorySearch.Where(oh => oh.DateTime.Contains(time) && (oh.DateTime.Contains(time) ||
                     oh.StaffID.Contains(search) ||
                     oh.FullName.Contains(search) ||
                     oh.Department.Contains(search) ||
                     oh.Position.Contains(search) ||
                     oh.Interface.Contains(search) ||
                     oh.Operation.Contains(search) ||
                     oh.OperationDetail.Contains(search))).OrderBy(oh => oh.DateTime);            
            return operateHistorySearch;
        }
        public bool Save(OperateHistory operateHistory)
        {
            try
            {
                quanLyNhanSu.OperateHistories.Add(operateHistory);
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
