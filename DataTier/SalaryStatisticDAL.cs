﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System.Collections.Generic;
using System.Linq;

namespace QuanLyNhanSu.DataTier
{
    public class SalaryStatisticDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public SalaryStatisticDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<MonthSalaryViewModels> GetAllMonthSalary(string month, string sort)
        {
            var listSalary = quanLyNhanSu.MonthSalaryDetails.Select(x => new MonthSalaryViewModels
            {
                MonthID = x.MonthID,
                StaffID = x.StaffID,
                DP_ID = x.Staff.Position.DP_ID,
                PS_ID = x.Staff.PS_ID,
                FullName = x.Staff.LastName + x.Staff.MiddleName + x.Staff.FirstName,
                Department = x.Staff.Position.Department.DepartmentName,
                Position = x.Staff.Position.PositionName,
                BasicSalary = x.BasicSalary,
                TotalAllownace = x.TotalAllowance,
            }).Where(x => x.MonthID == month);
            if(sort != null)
            {
                if (sort.Contains("DP"))
                    listSalary = listSalary.Where(x => x.DP_ID == sort);
                else if(sort.Contains("PS"))
                    listSalary = listSalary.Where(x => x.PS_ID == sort);
            }
            return listSalary;  
        }
    }
}
