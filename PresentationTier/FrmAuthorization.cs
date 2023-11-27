using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmAuthorization : Form
    {
        private readonly FormHandle redirect;
        private readonly StaffBUS staffBUS;
        private readonly AuthorizationBUS authorizationBUS;
        private readonly PositionBUS positionBUS;
        private readonly AuthorityBUS authorityBUS;
        private readonly SaveOperateHistory history;
        private readonly Authorizations authorizations;
        private readonly CheckExist checkExist;
        private Staff staff;
        private bool confirmPassoword;
        private int check;
        private bool operate;
        public FrmAuthorization(string staffID)
        {
            InitializeComponent();
            redirect = new FormHandle();
            staffBUS = new StaffBUS();
            positionBUS = new PositionBUS();
            authorityBUS = new AuthorityBUS();
            authorizationBUS = new AuthorizationBUS();
            checkExist = new CheckExist();
            history = new SaveOperateHistory("Phân quyền");
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Phân quyền",staff);
            operate = false;
            confirmPassoword = false;
        }
        private void FrmPhanQuyen_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            Authorizations();
            LoadPosition();
            LoadAuthority();
            Authorizations();
            rbSortByPosition.Checked = true;
        }
        private void Authorizations()
        {
            if(authorizations.AuthorizeForm(null, null) == "operate")
                operate = true;
        }
        private void LoadAuthorizations()
        {
            string sort = null;
            if (rbSortByPosition.Checked)
                sort = cmbPosition.SelectedValue.ToString();
            if (rbSortByAuthority.Checked)
                sort = cmbAuthority.SelectedValue.ToString();
            Enabled = false;
            dgvAuthorization.Rows.Clear();
            IEnumerable<AuthorizationViewModels> authorizations = authorizationBUS.GetAllAuthorization(sort);
            int rowAdd;
            foreach (AuthorizationViewModels au in authorizations)
            {
                rowAdd = dgvAuthorization.Rows.Add();
                dgvAuthorization.Rows[rowAdd].Cells[0].Value = au.AU_ID;
                dgvAuthorization.Rows[rowAdd].Cells[1].Value = au.PS_ID;
                dgvAuthorization.Rows[rowAdd].Cells[2].Value = au.PositionName;
                dgvAuthorization.Rows[rowAdd].Cells[3].Value = au.Interface;
                dgvAuthorization.Rows[rowAdd].Cells[4].Value = au.AuthorityName;
                dgvAuthorization.Rows[rowAdd].Cells[5].Value = au.Authorize;
            }
            Enabled = true;
        }
        private void LoadAuthorizationsSearch(string search)
        {
            string sort = null;
            if (rbSortByPosition.Checked)
                sort = cmbPosition.SelectedValue.ToString();
            if (rbSortByAuthority.Checked)
                sort = cmbAuthority.SelectedValue.ToString();
            Enabled = false;
            dgvAuthorization.Rows.Clear();
            IEnumerable<AuthorizationViewModels> authorizations = authorizationBUS.GetAllAuthorizationSearch(sort, search);
            int rowAdd;
            foreach (AuthorizationViewModels au in authorizations)
            {
                rowAdd = dgvAuthorization.Rows.Add();
                dgvAuthorization.Rows[rowAdd].Cells[0].Value = au.AU_ID;
                dgvAuthorization.Rows[rowAdd].Cells[1].Value = au.PS_ID;
                dgvAuthorization.Rows[rowAdd].Cells[2].Value = au.PositionName;
                dgvAuthorization.Rows[rowAdd].Cells[3].Value = au.Interface;
                dgvAuthorization.Rows[rowAdd].Cells[4].Value = au.AuthorityName;
                dgvAuthorization.Rows[rowAdd].Cells[5].Value = au.Authorize;
            }
            Enabled = true;
        }
        private void LoadPosition()
        {
            cmbPosition.DisplayMember = "PositionName";
            cmbPosition.ValueMember = "PS_ID";
            cmbPosition.DataSource = positionBUS.GetPosition();
            AutoAdjustComboBox.Adjust(cmbPosition);
        }
        private void LoadAuthority()
        {
            cmbAuthority.DisplayMember = "AuthorityName";
            cmbAuthority.ValueMember = "AU_ID";
            cmbAuthority.DataSource = authorityBUS.GetAuthority();
            AutoAdjustComboBox.Adjust(cmbAuthority);
        }
        /////////////////////////////////////////////////////////////////////////////////////////    
        private void rbSortByPosition_CheckedChanged(object sender, EventArgs e)
        {
            if (rbSortByPosition.Checked)
            {
                cmbPosition.Enabled = true;
                cmbAuthority.Enabled = false;
                LoadAuthorizations();
                return;
            }
        }
        private void rbSortByAuthority_CheckedChanged(object sender, EventArgs e)
        {
            if (rbSortByAuthority.Checked)
            {
                cmbAuthority.Enabled = true;
                cmbPosition.Enabled = false;
                LoadAuthorizations();
                return;
            }
        }
        private void cmbCheckChange(object sender, EventArgs e)
        {
            if (check != 2)
            {
                check++;
                return;
            }
            else
            {
                LoadAuthorizations();
            }
        }

        /////////////////////////////////////////////////////////////////////////////////////////        
        private void Reload()
        {
            FrmAuthorization open = new FrmAuthorization(staff.StaffID);
            redirect.RedirectForm(open);
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void UpdateAuthority(string psID, string auID, bool authorize, string operate, string operationDetail)
        {
            try
            {
                if (!checkExist.CheckPosition(psID))
                {
                    Reload();
                    return;
                }
                FrmConfirmPassword open = new FrmConfirmPassword(staff.StaffID);
                if (!confirmPassoword)
                {
                    open.ShowDialog();
                    if (open.Check)
                    {
                        confirmPassoword = true;
                        open.Check = false;
                    }
                }
                if (confirmPassoword)
                {
                    DataTier.Models.Authorization authorization = new DataTier.Models.Authorization
                    {
                        PS_ID = psID,
                        AU_ID = auID,
                        Authorize = authorize,
                    };
                    if (authorizationBUS.Save(authorization))
                        history.Save(staff.StaffID, operate, operationDetail);
                    if (string.IsNullOrEmpty(txtSearch.Text))
                        LoadAuthorizations();
                    else
                        LoadAuthorizationsSearch(txtSearch.Text);
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }

        private void dgvAuthorization_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            int column = e.ColumnIndex;
            if (row < 0)
                return;
            else if (operate)
            {
                if (column == 5)
                {
                    string auID = dgvAuthorization.Rows[row].Cells[0].Value.ToString();
                    string psID = dgvAuthorization.Rows[row].Cells[1].Value.ToString();
                    string authorityName = dgvAuthorization.Rows[row].Cells[4].Value.ToString();
                    string positionName = dgvAuthorization.Rows[row].Cells[2].Value.ToString();
                    bool authorize = (bool)dgvAuthorization.Rows[row].Cells[5].Value;
                    string announce;
                    string operate;
                    string operationDetail;
                    if (authorize)
                    {
                        authorize = false;
                        announce = $"Xác nhận xoá quyền hạn {authorityName} của chức vụ {positionName}?";
                        operate = "Xoá";
                        operationDetail = $"Xoá quyền hạn {authorityName} của chức vụ {positionName}";
                    }
                    else
                    {
                        authorize = true;
                        announce = $"Xác nhận thêm quyền hạn {authorityName} cho chức vụ {positionName}?";
                        operate = "Thêm";
                        operationDetail = $"Thêm quyền hạn {authorityName} cho chức vụ {positionName}";
                    }
                    CustomMessage.YesNoCustom("Xác nhận", "Huỷ");
                    DialogResult ketQua = MessageBox.Show(announce, "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                        UpdateAuthority(psID, auID, authorize, operate, operationDetail);
                    else
                        return;
                }
            }
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadAuthorizationsSearch(txtSearch.Text);
            }
        }
    }
}
