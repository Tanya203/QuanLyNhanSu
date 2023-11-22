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
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly DepartmentBUS departmentBUS;
        private readonly PositionBUS positionBUS;
        private Staff staff;
        private string sortValue;
        
        public FrmStatistic(string staffID)
        {
            InitializeComponent();
            salaryStatistsicBUS = new SalaryStatistsicBUS();
            redirect = new FormHandle();
            staffBUS = new StaffBUS();
            departmentBUS = new DepartmentBUS();
            positionBUS = new PositionBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
        }
        private void FrmThongKeLuong_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
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

        //////////////////////////////////////////////////////////////////////////////
        public void LoadReportViewer(string sortValue)
        {
            List<MonthSalaryViewModels> salary = salaryStatistsicBUS.GetAllMonthSalary(dtpMonth.Text, sortValue).ToList();
            foreach (MonthSalaryViewModels model in salary)
                model.FullName = StringAdjust.AddSpacesBetweenUppercaseLetters(model.FullName);
            ReportDataSource reportDataSource = new ReportDataSource("Salary", salary);
            List<ReportParameter> parameters = new List<ReportParameter>
            {
                new ReportParameter("DateTime", DateTime.Now.ToString()),
                new ReportParameter("Month", dtpMonth.Text),
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
        private void LoadDepartment()
        {
            cmbDepartment.DisplayMember = "DepartmentName";
            cmbDepartment.ValueMember = "DP_ID";
            cmbDepartment.DataSource = departmentBUS.GetDepartment().ToList();
        }
        private void LoadPostion()
        {
            cmbPosition.DisplayMember = "PositionName";
            cmbPosition.ValueMember = "PS_ID";
            cmbPosition.DataSource = positionBUS.GetPosition().ToList();
        }
        private void Reload()
        {
            FrmStatistic open = new FrmStatistic(staff.StaffID);
            redirect.RedirectForm(open);
        }
        //////////////////////////////////////////////////////////////////////////////
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void RadioCheckChange(object sender, EventArgs e)
        {
            if (rbAllStaff.Checked)
            {
                sortValue = null;
                cmbDepartment.Enabled = false;
                cmbPosition.Enabled = false;
            }                
            else if (rbDepartment.Checked)
            {
                sortValue = cmbDepartment.SelectedValue.ToString();
                cmbDepartment.Enabled = true;
                cmbPosition.Enabled = false;
            }
                
            else if (rbPosition.Checked)
            {
                sortValue = cmbPosition.SelectedValue.ToString();
                cmbDepartment.Enabled = false;
                cmbPosition.Enabled = true;
            }
            LoadReportViewer(sortValue);
        }
        private void dtpMonth_ValueChanged(object sender, EventArgs e)
        {
            LoadReportViewer(sortValue);
        }
        private void cmbDepartment_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbDepartment.Checked)
            {
                sortValue = cmbDepartment.SelectedValue.ToString();
                LoadReportViewer(sortValue);
            }
                
        }
        private void cmbPosition_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbPosition.Checked)
            {
                sortValue = cmbPosition.SelectedValue.ToString();
                LoadReportViewer(sortValue);
            }
                
        }

        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
