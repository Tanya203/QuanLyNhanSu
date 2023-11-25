using Microsoft.Reporting.WinForms;
using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Threading;
using System.Windows.Forms;
using System.Xml.Serialization;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmStatistic : Form
    {
        private readonly SalaryStatistsicBUS salaryStatistsicBUS;
        private readonly BonusDebtStatisticBUS bonusDebtStatistsicBUS;
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly DepartmentBUS departmentBUS;
        private readonly CardDetailBUS cardDetailBUS;
        private readonly PositionBUS positionBUS;
        private Staff staff;
        private string sortValue;

        public FrmStatistic(string staffID)
        {
            InitializeComponent();
            salaryStatistsicBUS = new SalaryStatistsicBUS();
            bonusDebtStatistsicBUS = new BonusDebtStatisticBUS();
            redirect = new FormHandle();
            staffBUS = new StaffBUS();
            cardDetailBUS = new CardDetailBUS();
            departmentBUS = new DepartmentBUS();
            positionBUS = new PositionBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
        }
        private void FrmThongKeLuong_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            DisableComboBox();
            LoadDepartment();
            LoadPostion();
        }
        private void tabControlMenu_DrawItem(object sender, DrawItemEventArgs e)
        {
            TabControl tabControl = (TabControl)sender;
            TabPage tabPage = tabControl.TabPages[e.Index];
            Font font = tabPage.Font;
            Brush brush = new SolidBrush(tabPage.ForeColor);
            Rectangle bounds = e.Bounds;
            e.Graphics.DrawString(tabPage.Text, font, brush, bounds);
        }
        private void DisableComboBox()
        {
            List<object> input = new List<object> { cmbDepartmentSalary, cmbPositionSalary, cmbDepartmentBonus, cmbPositionBonus, cmbDepartmentDebt, cmbPositionDebt };
            foreach(object inputItem in input)
            {
                if(inputItem is ComboBox)
                    typeof(ComboBox).GetProperty("Enabled").SetValue(inputItem, false);
            }
        }
        private void LoadDepartment()
        {
            cmbDepartmentSalary.DisplayMember = "DepartmentName";
            cmbDepartmentSalary.ValueMember = "DP_ID";
            cmbDepartmentBonus.DisplayMember = "DepartmentName";
            cmbDepartmentBonus.ValueMember = "DP_ID";
            cmbDepartmentDebt.DisplayMember = "DepartmentName";
            cmbDepartmentDebt.ValueMember = "DP_ID";
            List<Department> data = departmentBUS.GetDepartment().ToList();
            cmbDepartmentSalary.DataSource = data;
            cmbDepartmentBonus.DataSource = data;
            cmbDepartmentDebt.DataSource = data;
            AutoAdjustComboBox.Adjust(cmbDepartmentSalary);
            AutoAdjustComboBox.Adjust(cmbDepartmentBonus);
            AutoAdjustComboBox.Adjust(cmbDepartmentDebt);
        }
        private void LoadPostion()
        {
            cmbPositionSalary.DisplayMember = "PositionName";
            cmbPositionSalary.ValueMember = "PS_ID";
            cmbPositionBonus.DisplayMember = "PositionName";
            cmbPositionBonus.ValueMember = "PS_ID";
            cmbPositionDebt.DisplayMember = "PositionName";
            cmbPositionDebt.ValueMember = "PS_ID";
            List<Position> data = positionBUS.GetPosition().ToList();
            cmbPositionSalary.DataSource = data;
            cmbPositionBonus.DataSource = data;
            cmbPositionDebt.DataSource = data;
            AutoAdjustComboBox.Adjust(cmbPositionSalary);
            AutoAdjustComboBox.Adjust(cmbPositionBonus);
            AutoAdjustComboBox.Adjust(cmbPositionDebt);
        }
        private void Reload()
        {
            Close();
            Thread thread = new Thread(OpenStatistisc);
            thread.SetApartmentState(ApartmentState.STA);
            thread.Start();
            /*FrmStatistic open = new FrmStatistic(staff.StaffID);
            redirect.RedirectForm(open, this);*/
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void OpenStatistisc()
        {
            FrmStatistic open = new FrmStatistic(staff.StaffID);
            Application.Run(open);
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        //////////////////////////////////////////////////////////////////////////////
        ///Salary
        private void LoadSalaryReportViewer(string sortValue)
        {
            decimal total = 0;
            List<MonthSalaryViewModels> salary = salaryStatistsicBUS.GetAllMonthSalary(dtpMonthSalary.Text, sortValue).ToList();
            foreach (MonthSalaryViewModels staff in salary)
            {
                staff.FullName = StringAdjust.AddSpacesBetweenUppercaseLetters(staff.FullName);
                staff.TotalBonus = cardDetailBUS.TotalStaffMonthBonus(staff.StaffID, staff.MonthID);
                total += staff.BasicSalary * staff.TotalWorkHours + staff.TotalAllownace + staff.TotalBonus;
            }
            ReportDataSource reportDataSource = new ReportDataSource("Salary", salary);
            List<ReportParameter> parameters = new List<ReportParameter>
            {
                new ReportParameter("Total", total.ToString()),
                new ReportParameter("DateTime", DateTime.Now.ToString()),
                new ReportParameter("Month", dtpMonthSalary.Text),
                new ReportParameter("FullName", StringAdjust.AddSpacesBetweenUppercaseLetters(staff.LastName+staff.MiddleName+staff.FirstName)),
                new ReportParameter("StaffID", staff.StaffID),
                new ReportParameter("Department", staff.Position.Department.DepartmentName),
                new ReportParameter("Position", staff.Position.PositionName),
            };
            rptSalary.LocalReport.SetParameters(parameters);
            rptSalary.LocalReport.DataSources.Clear();
            rptSalary.LocalReport.DataSources.Add(reportDataSource);
            rptSalary.SetDisplayMode(DisplayMode.PrintLayout);
            rptSalary.ZoomMode = ZoomMode.Percent;
            rptSalary.ZoomPercent = 100;
            rptSalary.RefreshReport();
        }

        private void RadioSalaryCheckChange(object sender, EventArgs e)
        {
            if (rbAllStaffSalary.Checked)
            {
                sortValue = null;
                cmbDepartmentSalary.Enabled = false;
                cmbPositionSalary.Enabled = false;
            }
            else if (rbDepartmentSalary.Checked)
            {
                sortValue = cmbDepartmentSalary.SelectedValue.ToString();
                cmbDepartmentSalary.Enabled = true;
                cmbPositionSalary.Enabled = false;
            }

            else if (rbPositionSalary.Checked)
            {
                sortValue = cmbPositionSalary.SelectedValue.ToString();
                cmbDepartmentSalary.Enabled = false;
                cmbPositionSalary.Enabled = true;
            }
            LoadSalaryReportViewer(sortValue);
        }
        private void dtpMonthSalary_ValueChanged(object sender, EventArgs e)
        {
            LoadSalaryReportViewer(sortValue);
        }
        private void cmbDepartmentSalary_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbDepartmentSalary.Checked)
            {
                sortValue = cmbDepartmentSalary.SelectedValue.ToString();
                LoadSalaryReportViewer(sortValue);
            }
        }
        private void cmbPositionSalary_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbPositionSalary.Checked)
            {
                sortValue = cmbPositionSalary.SelectedValue.ToString();
                LoadSalaryReportViewer(sortValue);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////ư
        ///Bonus
        private void LoadBonusReportViewer(string sortValue)
        {
            List<MonthBonusDebtViewModels> bonus = bonusDebtStatistsicBUS.GetAllMonthBonus(dtpMonthBonus.Text, sortValue).ToList();
            foreach (MonthBonusDebtViewModels staff in bonus)
            {
                staff.FullName = StringAdjust.AddSpacesBetweenUppercaseLetters(staff.FullName);
                staff.Amount = cardDetailBUS.TotalStaffMonthBonus(staff.StaffID, staff.MonthID);
                staff.Deliver = cardDetailBUS.TotalStaffMonthBonusDeliver(staff.StaffID, staff.MonthID);
            }
            ReportDataSource reportDataSource = new ReportDataSource("Bonus", bonus);
            List<ReportParameter> parameters = new List<ReportParameter>
            {
                new ReportParameter("DateTime", DateTime.Now.ToString()),
                new ReportParameter("Month", dtpMonthSalary.Text),
                new ReportParameter("FullName", StringAdjust.AddSpacesBetweenUppercaseLetters(staff.LastName+staff.MiddleName+staff.FirstName)),
                new ReportParameter("StaffID", staff.StaffID),
                new ReportParameter("Department", staff.Position.Department.DepartmentName),
                new ReportParameter("Position", staff.Position.PositionName),
            };
            rptBonus.LocalReport.SetParameters(parameters);
            rptBonus.LocalReport.DataSources.Clear();
            rptBonus.LocalReport.DataSources.Add(reportDataSource);
            rptBonus.SetDisplayMode(DisplayMode.PrintLayout);
            rptBonus.ZoomMode = ZoomMode.Percent;
            rptBonus.ZoomPercent = 100;
            rptBonus.RefreshReport();
        }

        private void dtpMonthBonus_ValueChanged(object sender, EventArgs e)
        {
            LoadBonusReportViewer(sortValue);
        }

        private void RadioBonusCheckChange(object sender, EventArgs e)
        {
            if (rbAllStaffBonus.Checked)
            {
                sortValue = null;
                cmbDepartmentBonus.Enabled = false;
                cmbPositionBonus.Enabled = false;
            }
            else if (rbDepartmentBonus.Checked)
            {
                sortValue = cmbDepartmentBonus.SelectedValue.ToString();
                cmbDepartmentBonus.Enabled = true;
                cmbPositionBonus.Enabled = false;
            }
            else if (rbPositionBonus.Checked)
            {
                sortValue = cmbPositionBonus.SelectedValue.ToString();
                cmbDepartmentBonus.Enabled = false;
                cmbPositionBonus.Enabled = true;
            }
            LoadBonusReportViewer(sortValue);
        }

        private void cmbDepartmentBonus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbDepartmentBonus.Checked)
            {
                sortValue = cmbDepartmentBonus.SelectedValue.ToString();
                LoadBonusReportViewer(sortValue);
            }
        }
        private void cmbPositionBonus_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbPositionBonus.Checked)
            {
                sortValue = cmbPositionBonus.SelectedValue.ToString();
                LoadBonusReportViewer(sortValue);
            }
        }
        //////////////////////////////////////////////////////////////////////////////////////////////ư
        ///Debt
        private void LoadDebtReportViewer(string sortValue)
        {
            List<MonthBonusDebtViewModels> debt = bonusDebtStatistsicBUS.GetAllMonthDebt(dtpMonthDebt.Text, sortValue).ToList();
            foreach (MonthBonusDebtViewModels staff in debt)
                staff.FullName = StringAdjust.AddSpacesBetweenUppercaseLetters(staff.FullName);
            ReportDataSource reportDataSource = new ReportDataSource("Debt", debt);
            List<ReportParameter> parameters = new List<ReportParameter>
            {
                new ReportParameter("DateTime", DateTime.Now.ToString()),
                new ReportParameter("Month", dtpMonthSalary.Text),
                new ReportParameter("FullName", StringAdjust.AddSpacesBetweenUppercaseLetters(staff.LastName+staff.MiddleName+staff.FirstName)),
                new ReportParameter("StaffID", staff.StaffID),
                new ReportParameter("Department", staff.Position.Department.DepartmentName),
                new ReportParameter("Position", staff.Position.PositionName),
            };
            rptDebt.LocalReport.SetParameters(parameters);
            rptDebt.LocalReport.DataSources.Clear();
            rptDebt.LocalReport.DataSources.Add(reportDataSource);
            rptDebt.SetDisplayMode(DisplayMode.PrintLayout);
            rptDebt.ZoomMode = ZoomMode.Percent;
            rptDebt.ZoomPercent = 100;
            rptDebt.RefreshReport();
        }

        private void dtpMonthDebt_ValueChanged(object sender, EventArgs e)
        {
            LoadDebtReportViewer(sortValue);
        }

        private void RadioDebtCheckChange(object sender, EventArgs e)
        {
            if (rbAllStaffDebt.Checked)
            {
                sortValue = null;
                cmbDepartmentDebt.Enabled = false;
                cmbPositionDebt.Enabled = false;
            }
            else if (rbDepartmentDebt.Checked)
            {
                sortValue = cmbDepartmentDebt.SelectedValue.ToString();
                cmbDepartmentDebt.Enabled = true;
                cmbPositionDebt.Enabled = false;
            }
            else if (rbPositionDebt.Checked)
            {
                sortValue = cmbPositionDebt.SelectedValue.ToString();
                cmbDepartmentDebt.Enabled = false;
                cmbPositionDebt.Enabled = true;
            }
            LoadDebtReportViewer(sortValue);
        }

        private void cmbDepartmentDebt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbDepartmentDebt.Checked)
            {
                sortValue = cmbDepartmentDebt.SelectedValue.ToString();
                LoadDebtReportViewer(sortValue);
            }
        }
        private void cmbPositionDebt_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbPositionDebt.Checked)
            {
                sortValue = cmbPositionDebt.SelectedValue.ToString();
                LoadDebtReportViewer(sortValue);
            }
        }        
    }
}
