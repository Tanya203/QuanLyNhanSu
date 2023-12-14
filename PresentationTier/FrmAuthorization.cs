using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
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
        private List<DataTier.Models.Authorization> listUpdateAuthorize;
        private Staff staff;
        private int check;
        public FrmAuthorization(string staffID)
        {
            InitializeComponent();
            redirect = new FormHandle();
            staffBUS = new StaffBUS();
            positionBUS = new PositionBUS();
            authorityBUS = new AuthorityBUS();
            authorizationBUS = new AuthorizationBUS();
            checkExist = new CheckExist();
            listUpdateAuthorize = new List<DataTier.Models.Authorization>();
            history = new SaveOperateHistory("Phân quyền");
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = new Authorizations("Phân quyền",staff);
        }
        private void FrmPhanQuyen_Load(object sender, EventArgs e)
        {
            LoadHeader.LoadHeaderInfo(lblStaffIDLoginValue, lblFullNameLoginValue, lblDepartmentLoginValue, lblPositionLoginValue, staff);
            btnUpdate.Visible = false;
            dgvAuthorization.ReadOnly = true;
            Authorizations();
            LoadPosition();
            LoadAuthority();
            Authorizations();
            rbSortByPosition.Checked = true;
        }
        private void Authorizations()
        {
            List<object> listFunction = new List<object> { btnUpdate };
            if (authorizations.AuthorizeForm(null, listFunction) == "operate")
                dgvAuthorization.ReadOnly = false;
        }
        private void UpdateList(string auID, string psID)
        {
            DataTier.Models.Authorization update = authorizationBUS.GetAuthorizations().FirstOrDefault(au => au.AU_ID ==  auID && au.PS_ID == psID);
            listUpdateAuthorize.Add(update);
        }
        private void LoadAuthorizations()
        {
            listUpdateAuthorize.Clear();
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
                UpdateList(au.AU_ID, au.PS_ID);
            }
            OnOffButton();
            Enabled = true;
        }
        private void OnOffButton()
        {
            if(listUpdateAuthorize.Count > 0)
            {
                btnUpdate.Enabled = true; 
                return;
            }
            btnUpdate.Enabled = false;
        }
        private void LoadAuthorizationsSearch(string search)
        {
            listUpdateAuthorize.Clear();
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
                UpdateList(au.AU_ID, au.PS_ID);
            }
            OnOffButton();
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
            redirect.RedirectForm(open, this);
        }
        /////////////////////////////////////////////////////////////////////////////////////////
        private void btnBack_Click(object sender, EventArgs e)
        {
            FrmMainMenu open = new FrmMainMenu(staff.StaffID);
            redirect.RedirectForm(open, this);
        }
        private void btnRefresh_Click(object sender, EventArgs e)
        {
            Reload();
        }
        private void txtSearch_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (e.KeyChar == (char)Keys.Enter)
            {
                LoadAuthorizationsSearch(txtSearch.Text);
            }
        }
        private void dgvAuthorization_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            int row = e.RowIndex;
            int column = e.ColumnIndex;
            bool update = false;
            if (row < 0)
                return;
            if (column == 5)
            {
                string auID = dgvAuthorization.Rows[row].Cells[0].Value.ToString();
                string psID = dgvAuthorization.Rows[row].Cells[1].Value.ToString();
                var checkBox = dgvAuthorization.Rows[row].Cells[5];
                if (checkBox is DataGridViewCheckBoxCell checkBoxCell)
                {
                    checkBoxCell.Value = !(bool)checkBoxCell.Value;
                    update = (bool)checkBoxCell.Value;
                }
                foreach (var au in listUpdateAuthorize)
                {
                    if (au.AU_ID == auID && au.PS_ID == psID)
                    {
                        au.Authorize = update;
                        break;
                    }
                }
            }
        }
        private void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                foreach(DataTier.Models.Authorization au in listUpdateAuthorize)
                {
                    if (!checkExist.CheckPosition(au.PS_ID))
                    {
                        Reload();
                        return;
                    }
                }
                CustomMessage.YesNoCustom("Xác nhận", "Huỷ");
                DialogResult ketQua = MessageBox.Show("Xác nhận cập nhật quyền hạn?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (ketQua == DialogResult.Yes)
                {
                    FrmConfirmPassword open = new FrmConfirmPassword(staff.StaffID);
                    open.ShowDialog();
                    if (open.Check)
                    {
                        open.Check = false;


                        string operationDetail = "Cập nhật quyền hạn";
                        string operate = "Cập nhật";
                        if (authorizationBUS.Save(listUpdateAuthorize))
                        {
                            history.Save(staff.StaffID, operate, operationDetail);
                            if (listUpdateAuthorize.FirstOrDefault(au => au.PS_ID == staff.PS_ID) == null)
                                Reload();
                        }

                    }
                }
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }

        private void cbCheckAll_CheckedChanged(object sender, EventArgs e)
        {
            foreach (DataGridViewRow row in dgvAuthorization.Rows)
                row.Cells[5].Value = cbCheckAll.Checked;
            foreach(DataTier.Models.Authorization au in listUpdateAuthorize)
                au.Authorize = cbCheckAll.Checked;
        }
    }
}
