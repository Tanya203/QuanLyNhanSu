using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System.Linq;
using System.Threading.Tasks;
using System.Threading;
using System.Windows.Forms;
using System;
using System.Drawing;
using System.Collections.Generic;

namespace QuanLyNhanSu.Functions
{
    public class CheckAccountStatus
    {
        private CancellationTokenSource cancellationTokenSource;
        private Task backgroundTask;
        private string staffID;
        private StaffBUS staffBUS;
        private AuthorizationBUS authorizationBUS;
        private List<Authorization> authorizations;
        public CheckAccountStatus(string staffID)
        {
            this.staffID = staffID;
            staffBUS = new StaffBUS();
            authorizationBUS = new AuthorizationBUS();
            Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizations = authorizationBUS.GetAuthorizations().Where(au => au.PS_ID == staff.PS_ID).ToList();
        }
        public void Start()
        {
            cancellationTokenSource = new CancellationTokenSource();
            backgroundTask = Task.Run(RunInBackground, cancellationTokenSource.Token);
        }
        public void Stop()
        {
            cancellationTokenSource.Cancel();
            backgroundTask.Wait();
            cancellationTokenSource.Dispose();
        }
        private void RunInBackground()
        {
            while (!cancellationTokenSource.Token.IsCancellationRequested)
            {
                StaffBUS staffBUS = new StaffBUS();
                AuthorizationBUS authorizationBUS = new AuthorizationBUS();
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
                if (staff == null)
                {
                    RedirectForm();
                    MessageBox.Show($"Tài khoản của bạn không còn tồn tại trên cơ sở dữ liệu. Liên hệ phòng kỹ thuật để biết thêm chi tiết", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    backgroundTask.Wait();
                    Stop();
                }
                else if (staff.LockDate != null)
                {
                    RedirectForm();
                    MessageBox.Show($"Tài khoản của bạn đã bị khoá đến {staff.LockDate}. Liên hệ phòng kỹ thuật để biết thêm chi tiết", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    backgroundTask.Wait();
                    Stop();
                }
                List<Authorization> update = new List<Authorization>();
                update = authorizationBUS.GetAuthorizations().Where(au => au.PS_ID == staff.PS_ID).ToList();
                for (int i = 0; i < update.Count(); i++)
                {
                    if (authorizations[i].Authorize != update[i].Authorize)
                        {
                            RedirectForm();
                            MessageBox.Show($"Quyền hạn chức vụ {staff.Position.PositionName} đã được cập nhật. Vui lòng đăng nhập lại.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            backgroundTask.Wait();
                            Stop();
                        }
                    }
                }
        }
        private bool RedirectForm()
        {
            try
            {
                Application.Exit();
                Thread newThread = new Thread(OpenForm);
                newThread.SetApartmentState(ApartmentState.STA);
                newThread.Start(); return true;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }
        private void OpenForm()
        {
            FrmLogin frmLogin = new FrmLogin();
            Application.Run(frmLogin);
        }
    }
}
