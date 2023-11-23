﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace QuanLyNhanSu.DataTier
{
    internal class MonthSalaryDetailDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public MonthSalaryDetailDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<MonthSalaryDetail> GetMonthSalaryDetails()
        {
            return quanLyNhanSu.MonthSalaryDetails;
        }
        public bool Save(MonthSalaryDetail salary)
        {
            try
            {
                quanLyNhanSu.MonthSalaryDetails.AddOrUpdate(salary);
                quanLyNhanSu.SaveChanges();
                return true;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public decimal GetStaffMonthTotalDebt(string staffID, string month)
        {
            MonthSalaryDetail staff = quanLyNhanSu.MonthSalaryDetails.FirstOrDefault(s => s.StaffID == staffID && s.MonthID == month && s.MonthID == month);
            if(staff == null)
                return 0;
            return staff.TotalDebt - staff.TotalDebtPaid;
        }
    }
}