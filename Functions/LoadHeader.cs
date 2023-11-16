using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.utils;
using System.Collections.Generic;
using System.Windows.Forms;

namespace QuanLyNhanSu.Functions
{
    public class LoadHeader
    {
        public LoadHeader() { }
        public static void LoadHeaderMainMenu(Label staffID, Label fullName, Label department, Label position, Label dayOffAmount, Staff staff)
        {
            staffID.Text = staff.StaffID;
            fullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staff.LastName}{staff.MiddleName}{staff.FirstName}");
            department.Text = staff.Position.Department.DepartmentName;
            position.Text = staff.Position.PositionName;
            dayOffAmount.Text = staff.DayOffAmount.ToString();
        }
        public static void LoadHeaderInfo(Label staffID, Label fullName, Label department, Label position, Staff staff)
        {
            staffID.Text = staff.StaffID;
            fullName.Text = StringAdjust.AddSpacesBetweenUppercaseLetters($"{staff.LastName}{staff.MiddleName}{staff.FirstName}");
            department.Text = staff.Position.Department.DepartmentName;
            position.Text = staff.Position.PositionName;
        }
    }
}
