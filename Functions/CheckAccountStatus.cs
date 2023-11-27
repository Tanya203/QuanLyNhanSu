using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System.Linq;
using System.Threading.Tasks;
using System.Threading;
using System.Windows.Forms;
using System;
using System.Drawing;

namespace QuanLyNhanSu.Functions
{
    public class CheckAccountStatus
    {
        private CancellationTokenSource cancellationTokenSource;
        private Task backgroundTask;
        private readonly string staffID;
        public CheckAccountStatus(string staffID)
        {
            this.staffID = staffID;
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
                Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
                if (staff.LockDate != null)
                {
                    RedirectForm();
                    MessageBox.Show($"Tài khoản của bạn đã bị khoá đến {staff.LockDate}. Liên hệ phòng kỹ thuật để biết thêm chi tiết", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    backgroundTask.Wait();
                    Stop();
                }
                else if (staff == null)
                {
                    RedirectForm();
                    MessageBox.Show($"Tài khoản của bạn không còn tồn tại trên. Liên hệ phòng kỹ thuật để biết thêm chi tiết", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    backgroundTask.Wait();
                    Stop();
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
