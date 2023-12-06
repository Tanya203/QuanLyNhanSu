using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.utils;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmOperateHistory : Form
    {
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly InterfaceBUS interfaceBUS;
        private readonly OperationBUS operationBUS;
        private readonly OperateHistoryBUS operateHistoryBUS;
        private string time;
        private string form;
        private string operation;
        private Staff staff;
        private int check;
        public FrmOperateHistory(string staffID)
        {
            InitializeComponent();
            redirect = new FormHandle();
            staffBUS = new StaffBUS();
            interfaceBUS = new InterfaceBUS();
            operationBUS = new OperationBUS();
            operateHistoryBUS = new OperateHistoryBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);

        }
        private void frmLichSuThaoTac_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            LoadInput();
            LoadInterface();
            LoadOperation();
        }
        private void LoadInterface()
        {
            cmbInterface.ValueMember = "IT_ID";
            cmbInterface.DisplayMember = "InterfaceName";
            cmbInterface.DataSource = interfaceBUS.GetInterface();
            AutoAdjustComboBox.Adjust(cmbInterface);
        }
        private void LoadInput()
        {
            rbDate.Checked = true;
            rbAllInterface.Checked = true;
            rbAllOperation.Checked = true;
            dtpMonth.Enabled = false;
            dtpYear.Enabled = false;
            cmbInterface.Enabled = false;
            cmbOperation.Enabled = false;
        }
        private void LoadOperation()
        {
            cmbOperation.ValueMember = "OP_ID";
            cmbOperation.DisplayMember = "OperationName";
            if (rbSortInterface.Checked)
                cmbOperation.DataSource = operationBUS.GetOperation().Where(op => op.IT_ID == cmbInterface.SelectedValue.ToString()).ToList();
            if (rbAllInterface.Checked)
                cmbOperation.DataSource = operationBUS.GetOperation();
            AutoAdjustComboBox.Adjust(cmbOperation);
        }
        private void LoadOperationHistory()
        {
            Enabled = false;
            dgvOperateHistory.Rows.Clear();
            IEnumerable<OperateHistoryViewModels> operateHistories = operateHistoryBUS.GetOperationHistory(time, form, operation);
            foreach (var op in operateHistories)
            {
                int rowAdd = dgvOperateHistory.Rows.Add();
                string staffID = op.StaffID;
                if (staffID == null)
                    staffID = "Nhân viên đã bị xoá";
                dgvOperateHistory.Rows[rowAdd].Cells[0].Value = op.DateTime;
                dgvOperateHistory.Rows[rowAdd].Cells[1].Value = staffID;
                dgvOperateHistory.Rows[rowAdd].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(op.FullName);
                dgvOperateHistory.Rows[rowAdd].Cells[3].Value = op.Department;
                dgvOperateHistory.Rows[rowAdd].Cells[4].Value = op.Position;
                dgvOperateHistory.Rows[rowAdd].Cells[5].Value = op.Interface;
                dgvOperateHistory.Rows[rowAdd].Cells[6].Value = op.Operation;
                dgvOperateHistory.Rows[rowAdd].Cells[7].Value = op.OperationDetail;
            }
            Enabled = true;
        }
        private void LoadOperationHistorySearch(string search)
        {
            Enabled = false;
            dgvOperateHistory.Rows.Clear();
            IEnumerable<OperateHistoryViewModels> operateHistories = operateHistoryBUS.GetOperationHistorySearch(time, form, operation, search);
            foreach (var op in operateHistories)
            {
                int rowAdd = dgvOperateHistory.Rows.Add();
                string staffID = op.StaffID;
                if (staffID == null)
                    staffID = "Nhân viên đã bị xoá";
                dgvOperateHistory.Rows[rowAdd].Cells[0].Value = op.DateTime;
                dgvOperateHistory.Rows[rowAdd].Cells[1].Value = staffID;
                dgvOperateHistory.Rows[rowAdd].Cells[2].Value = StringAdjust.AddSpacesBetweenUppercaseLetters(op.FullName);
                dgvOperateHistory.Rows[rowAdd].Cells[3].Value = op.Department;
                dgvOperateHistory.Rows[rowAdd].Cells[4].Value = op.Position;
                dgvOperateHistory.Rows[rowAdd].Cells[5].Value = op.Interface;
                dgvOperateHistory.Rows[rowAdd].Cells[6].Value = op.Operation;
                dgvOperateHistory.Rows[rowAdd].Cells[7].Value = op.OperationDetail;
            }
            Enabled = true;
        }
        /////////////////////////////////////////////////////////////////////////////////////////    
        private void rbDate_CheckedChanged(object sender, EventArgs e)
        {
            if (rbDate.Checked)
            {
                time = dtpDate.Text;
                dtpDate.Enabled = true;
                dtpMonth.Enabled = false;
                dtpYear.Enabled = false;
                LoadOperationHistory();
            }
        }
        private void rbMonth_CheckedChanged(object sender, EventArgs e)
        {
            if (rbMonth.Checked)
            {
                time = dtpMonth.Text;
                dtpMonth.Enabled = true;
                dtpDate.Enabled = false;
                dtpYear.Enabled = false;
                LoadOperationHistory();
            }
        }
        private void rbYear_CheckedChanged(object sender, EventArgs e)
        {
            if (rbYear.Checked)
            {
                time = $"{dtpYear.Text}-";
                dtpYear.Enabled = true;
                dtpMonth.Enabled = false;
                dtpDate.Enabled = false;
                LoadOperationHistory();
            }
        }
        private void rbAllInterface_Click(object sender, EventArgs e)
        {
            if (rbAllInterface.Checked)
            {
                form = null;
                cmbInterface.Enabled = false;
                LoadOperation();
            }
        }
        private void rbSortInterface_CheckedChanged(object sender, EventArgs e)
        {
            if (rbSortInterface.Checked)
            {
                cmbInterface.Enabled = true;
                form = cmbInterface.Text;
                LoadOperation();
                if (!rbLSortOperation.Checked)
                    LoadOperationHistory();
            }
        }
        private void rbAllOperation_Click(object sender, EventArgs e)
        {
            if (rbAllOperation.Checked)
            {
                operation = null;
                cmbOperation.Enabled = false;
                LoadOperationHistory();
            }
        }
        private void rbSortOperation_CheckedChanged(object sender, EventArgs e)
        {
            if (rbLSortOperation.Checked)
            {
                cmbOperation.Enabled = true;
                operation = cmbOperation.Text;
                LoadOperationHistory();
            }
        }
        private void dtpDate_ValueChanged(object sender, EventArgs e)
        {
            time = dtpDate.Text;
            LoadOperationHistory();
        }
        private void dtpMonth_ValueChanged(object sender, EventArgs e)
        {
            time = dtpMonth.Text;
            LoadOperationHistory();
        }
        private void dtpYear_ValueChanged(object sender, EventArgs e)
        {
            time = dtpYear.Text;
            LoadOperationHistory();
        }
        private void cmbInterface_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (check == 0)
            {
                check++;
                return;
            }
            if (rbSortInterface.Checked)
            {
                form = cmbInterface.Text;
                LoadOperation();
                if (!rbLSortOperation.Checked)
                    LoadOperationHistory();
                return;
            }
            LoadOperationHistory();
        }
        private void cmbOperation_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (check == 1)
            {
                check++;
                return;
            }
            if (rbLSortOperation.Checked)
            {
                operation = cmbOperation.Text;
                LoadOperationHistory();
            }
        }
        /////////////////////////////////////////////////////////////////////////////////////////        
        private void Reload()
        {
            FrmOperateHistory open = new FrmOperateHistory(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void txtSearchTextChanged(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearch.Text))
                LoadOperationHistory();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
                LoadOperationHistorySearch(txtSearch.Text);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
    }
}
