using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;
using QuanLyNhanSu.LogicTier;
using System.Data.Entity.Migrations;
using QuanLyNhanSu.Functions;

namespace QuanLyNhanSu.DataTier
{
    internal class StaffDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        private readonly OperateHistoryBUS operateHistoryBUS;
        private readonly string formatDateTime = "HH:mm:ss.ffffff | dd/MM/yyyy";
        private int count;
        public StaffDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
            operateHistoryBUS = new OperateHistoryBUS();
        }
        public IEnumerable<StaffViewModel> GetAllStaff()
        {
            var staffList = quanLyNhanSu.Staffs.Select(s => new StaffViewModel
            {
                StaffID = s.StaffID,
                PS_ID = s.PS_ID,
                CT_ID = s.CT_ID,
                Account = s.Account,
                CardID = s.CardID,
                LastName = s.LastName,
                MiddleName = s.MiddleName,
                FirstName = s.FirstName,
                Brithday = s.Brithday,
                HouseNumber = s.HouseNumber,
                Street = s.Street,
                Ward = s.Ward,
                District = s.District,
                Province_City = s.Province_City,
                Gender = s.Gender,
                Phone = s.Phone,
                Email = s.Email,
                EducationLevel = s.EducationLevel,
                EntryDate = s.EntryDate,
                ContractDuration = s.ContractDuration,
                Status = s.Status,
                DayOffAmount = s.DayOffAmount,
                BasicSalary = s.BasicSalary,
                Picture = s.Picture,
                DepartmentName = s.Position.Department.DepartmentName,
                PositionName = s.Position.PositionName,
                ContractTypeName = s.ContractType.ContractTypeName,
                LockDate = s.LockDate,
            }).OrderBy(s => s.StaffID);                                   
            return staffList;
        }
        public IEnumerable<StaffViewModel> GetAllStaffSearch(string search)
        {
            var staffList = quanLyNhanSu.Staffs.Select(s => new StaffViewModel
            {
                StaffID = s.StaffID,
                PS_ID = s.PS_ID,
                CT_ID = s.CT_ID,
                Account = s.Account,
                CardID = s.CardID,
                LastName = s.LastName,
                MiddleName = s.MiddleName,
                FirstName = s.FirstName,
                Brithday = s.Brithday,
                HouseNumber = s.HouseNumber,
                Street = s.Street,
                Ward = s.Ward,
                District = s.District,
                Province_City = s.Province_City,
                Gender = s.Gender,
                Phone = s.Phone,
                Email = s.Email,
                EducationLevel = s.EducationLevel,
                EntryDate = s.EntryDate,
                ContractDuration = s.ContractDuration,
                Status = s.Status,
                DayOffAmount = s.DayOffAmount,
                BasicSalary = s.BasicSalary,
                Picture = s.Picture,
                DepartmentName = s.Position.Department.DepartmentName,
                PositionName = s.Position.PositionName,
                ContractTypeName = s.ContractType.ContractTypeName,
                LockDate = s.LockDate,
            }).Where(s => s.StaffID.Contains(search) ||
                s.DepartmentName.Contains(search) ||
                s.PositionName.Contains(search) ||
                s.ContractTypeName.Contains(search) ||
                s.Account.Contains(search) ||
                s.CardID.Contains(search) ||
                s.LastName.Contains(search) ||
                s.MiddleName.Contains(search) ||
                s.FirstName.Contains(search) ||
                s.Brithday.ToString().Contains(search) ||
                s.HouseNumber.Contains(search) ||
                s.Street.Contains(search) ||
                s.Ward.Contains(search) ||
                s.District.Contains(search) ||
                s.Province_City.Contains(search) ||
                s.Gender.Contains(search) ||
                s.Phone.Contains(search) ||
                s.Email.Contains(search) ||
                s.EducationLevel.Contains(search) ||
                s.EntryDate.ToString().Contains(search) ||
                s.ContractDuration.ToString().Contains(search) ||
                s.Status.Contains(search) ||
                s.DayOffAmount.ToString().Contains(search) ||
                s.BasicSalary.ToString().Contains(search) ||
                s.LockDate.ToString().Contains(search));
            return staffList;
        }
        public IEnumerable<Staff> GetStaff()
        {
            return quanLyNhanSu.Staffs.OrderBy(s => s.StaffID).ToList();
        }
        public bool Save(Staff staff)
        {
            try
            {
                quanLyNhanSu.Staffs.AddOrUpdate(staff);
                quanLyNhanSu.SaveChanges();
                MessageBox.Show("Đã lưu!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }            
        }     
        public bool Delete(string staffID)
        {
            try
            {
                Staff staff = quanLyNhanSu.Staffs.Where(s => s.StaffID == staffID).FirstOrDefault();
                if (staff != null)
                {
                    CustomMessage.YesNoCustom("Có", "Không");
                    DialogResult ketQua = MessageBox.Show($"Xác nhận xoá nhân viên {staffID}?", "Thông báo", MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                    if (ketQua == DialogResult.Yes)
                    { 
                        quanLyNhanSu.Staffs.Remove(staff);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Đã xoá nhân viên {staffID}", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public Staff LoginVerify(string account, string password)
        {
            var staff = quanLyNhanSu.Staffs.Where(x => x.Account == account).FirstOrDefault();            
            try
            {
                if(staff == null)
                {
                    MessageBox.Show("Tài khoản không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return null;
                }
                string staffID = staff.StaffID;
                string lockDate = staff.LockDate.ToString();
                if (staff.LockDate != null && staff.LockDate > DateTime.Now)
                {                    
                    MessageBox.Show($"Tài khoản {account} của nhân viên {staffID} đã bị khoá đến {lockDate}! Liên hệ phòng kỹ thuật để biết thêm chi tiết.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    return null;
                }
                if(staff != null && !BCrypt.Net.BCrypt.Verify(password, staff.Password))
                {
                    count++;
                    if (count == 3)
                    {
                        string op_ID = quanLyNhanSu.Operations.FirstOrDefault(tt => tt.OperationName == "Khoá tài khoản (Sai mật khẩu)").OP_ID;
                        staff.LockDate = DateTime.Now.AddMinutes(30);
                        quanLyNhanSu.SaveChanges();
                        MessageBox.Show($"Nhập sai mật khẩu lần 3! Tài khoản {account} của nhân viên {staffID} đã bị khoá đến {staff.LockDate}! Liên hệ phòng kỹ thuật để biết thêm chi tiết.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        count = 0;
                        OperateHistory operateHistory = new OperateHistory()
                        {
                            DateTime = DateTime.Now.ToString(formatDateTime),
                            StaffID = staffID,
                            OP_ID = op_ID,
                            DetailOperation = $"Tài khoản {account} bị khoá đến {staff.LockDate} (nhập sai mật khẩu 3 lần)",
                        };
                        operateHistoryBUS.Save(operateHistory);
                        return null;
                    }
                    else
                    {
                        MessageBox.Show($"Nhập sai mật khẩu lần thứ {count}! Lần thứ 3 tài khoản sẽ bị khoá!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return null;
                    }                    
                }                           
                else if(staff != null  && BCrypt.Net.BCrypt.Verify(password, staff.Password))
                {
                    if(staff.LockDate != null && staff.LockDate < DateTime.Now)
                    {
                        staff.LockDate = null;
                        quanLyNhanSu.SaveChanges();
                    }
                    MessageBox.Show($"Đăng nhập thành công! - {staffID}", "Thông báo", MessageBoxButtons.OK,MessageBoxIcon.Information);
                    return staff;
                }
                return null;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return null;
            }                       
        }
        public bool VerifyInfo(string staffID, string account, string cardID, string phone, string email)
        {
            try
            {
                Staff staff = quanLyNhanSu.Staffs.Where(s => s.StaffID == staffID).FirstOrDefault();
                if (staff != null)
                {
                    if(staff.Account == account && staff.CardID == cardID && staff.Phone == phone && staff.Email == email) 
                    {
                        MessageBox.Show($"Xác thực thành công! Nhân viên {staffID}.", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                MessageBox.Show("Thông tin xác thực không hợp lệ", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return false;
            }
            catch(Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
        public bool VerifyPassword(string staffID, string password)
        {
            try
            {
                Staff staff = quanLyNhanSu.Staffs.Where(s => s.StaffID == staffID).FirstOrDefault();
                if (staff != null)
                {
                    if (staff != null && BCrypt.Net.BCrypt.Verify(password, staff.Password))
                    {
                        MessageBox.Show($"Xác thực mật khẩu thành công!", "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        return true;
                    }
                }
                return false;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        } 
    }
}
