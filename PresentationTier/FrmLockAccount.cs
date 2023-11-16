using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using QuanLyNhanSu.LogicTier;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class FrmLockAccount : Form
    {
        private readonly StaffBUS staffBUS;
        private readonly SaveOperateHistory history;
        private Staff staff;
        private Staff lockStaff;
    
        public FrmLockAccount(string staffID, string lockStaffID)
        {
            InitializeComponent();
            staffBUS = new StaffBUS();
            history = new SaveOperateHistory("Nhân viên");
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            lockStaff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == lockStaffID);
        }
        private void FrmKhoaTaiKhoan_Load(object sender, EventArgs e)
        { 
            lblLockAccount.Text += $" {lockStaff.StaffID}";
        }
        /////////////////////////////////////////////////////////////////////////////////////////////
        private void btnLockAccount_Click(object sender, EventArgs e)
        {
            if (dtpLockDate.Value < DateTime.Now)
            {
                MessageBox.Show("Thời gian khoá phải lớn hơn thời gian hiện tại", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return;
            }
            CustomMessage.YesNoCustom("Có", "Không");
            DialogResult ketQua = MessageBox.Show($"Xác nhận khoá tài khoản của nhân viên {lockStaff.StaffID} đến {dtpLockDate.Text}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
            if (ketQua == DialogResult.Yes)
            {
                lockStaff.LockDate = dtpLockDate.Value;
                if (staffBUS.Save(lockStaff))
                {
                    string operate = "Khoá";
                    string detailOperate = $"Khoá tài khoản của nhân viên {lockStaff.StaffID} đến {dtpLockDate.Text}";
                    history.Save(staff.StaffID, operate, detailOperate);
                    Close();
                }
            }
            return;
        }
    }
}
