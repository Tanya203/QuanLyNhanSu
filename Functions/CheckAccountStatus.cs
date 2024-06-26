﻿using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.LogicTier;
using System.Linq;
using System.Threading.Tasks;
using System.Threading;
using System.Windows.Forms;
using System;
using System.Collections.Generic;
using QuanLyNhanSu.PresentationTier;

namespace QuanLyNhanSu.Functions
{
    public class CheckAccountStatus
    {
        private CancellationTokenSource cancellationTokenSource;
        private Task backgroundTask;
        private string staffID;
        private StaffBUS staffBUS;
        private Staff staff;
        private AuthorizationBUS authorizationBUS;
        private List<Authorization> authorizations;
        private bool isRedirecting;
        public CheckAccountStatus(string staffID)
        {
            this.staffID = staffID;
            staffBUS = new StaffBUS();
            staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
            authorizationBUS = new AuthorizationBUS();
            authorizations = authorizationBUS.GetAuthorizations().Where(au => au.PS_ID == staff.PS_ID).ToList();
            isRedirecting = false;
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
                if(!isRedirecting)
                {
                    StaffBUS staffBUS = new StaffBUS();
                    AuthorizationBUS authorizationBUS = new AuthorizationBUS();
                    Staff staff = staffBUS.GetStaff().FirstOrDefault(s => s.StaffID == staffID);
                    if (staff == null)
                    {
                        isRedirecting = true;
                        RedirectForm("login");
                        MessageBox.Show(new Form { TopMost = true }, $"Tài khoản của bạn không còn tồn tại trên cơ sở dữ liệu. Liên hệ phòng kỹ thuật để biết thêm chi tiết", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        Stop();
                    }
                    else if (staff.LockDate != null)
                    {
                        isRedirecting = true;
                        RedirectForm("login");
                        MessageBox.Show(new Form { TopMost = true }, $"Tài khoản của bạn đã bị khoá đến {staff.LockDate}. Liên hệ phòng kỹ thuật để biết thêm chi tiết", "Lỗi", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        Stop();
                    }
                    else if (this.staff.Password != staff.Password)
                    {
                        isRedirecting = true;
                        RedirectForm("login");
                        MessageBox.Show(new Form { TopMost = true }, $"Đổi mật khẩu thành công", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        Stop();
                    }
                    else if (staff.PS_ID != this.staff.PS_ID)
                    {
                        isRedirecting = true;
                        RedirectForm("main");
                        MessageBox.Show(new Form { TopMost = true }, $"Chức vụ của nhân viên {staff.StaffID} đã được cập nhật", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        backgroundTask.Wait();
                    }
                    List<Authorization> update = new List<Authorization>();
                    update = authorizationBUS.GetAuthorizations().Where(au => au.PS_ID == staff.PS_ID).ToList();
                    for (int i = 0; i < update.Count(); i++)
                    {
                        if (authorizations[i].Authorize != update[i].Authorize)
                        {
                            isRedirecting = true;
                            RedirectForm("main");
                            MessageBox.Show(new Form { TopMost = true }, $"Quyền hạn chức vụ {staff.Position.PositionName} đã được cập nhật", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                            backgroundTask.Wait();
                        }
                    }
                }
                Thread.Sleep(1000);
            }
        }
        private void RedirectForm(string form)
        {
            try
            {
                Application.Exit();
                Thread newThread;
                if (form == "login")
                    newThread = new Thread(OpenLogin);
                else
                    newThread = new Thread(OpenMainMenu);
                newThread.SetApartmentState(ApartmentState.STA);
                newThread.Start(); 
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
            }
        }
        private void OpenLogin()
        {
            FrmLogin frmLogin = new  FrmLogin();
            Application.Run(frmLogin);
        }
        private void OpenMainMenu()
        {
            FrmMainMenu frmMainMenu = new FrmMainMenu(staffID);
            Application.Run(frmMainMenu);
        }
    }
}
