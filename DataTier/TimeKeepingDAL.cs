using QuanLyNhanSu.DataTier.Models;
using QuanLyNhanSu.Functions;
using System;
using System.Collections.Generic;
using System.Data.Entity.Migrations;
using System.Linq;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.DataTier
{
    internal class TimeKeepingDAL
    {
        private readonly QuanLyNhanSuContextDB quanLyNhanSu;
        public TimeKeepingDAL()
        {
            quanLyNhanSu = new QuanLyNhanSuContextDB();
        }
        public IEnumerable<TimeKeeping> GetWorkScheduleByDate(string date)
        {
            return quanLyNhanSu.TimeKeepings.Where(ws => ws.WorkSchedule.WorkDate.ToString() == date).ToList();
        }
        public bool TimeKeeping(List<TimeKeeping> staff, string operation)
        {
            try
            {
                foreach(TimeKeeping s in staff)
                {
                    quanLyNhanSu.TimeKeepings.AddOrUpdate(s);
                    quanLyNhanSu.SaveChanges();
                }
                MessageBox.Show(operation, "Thông báo", MessageBoxButtons.OK, MessageBoxIcon.Information);
                return true;
            }
            catch (Exception ex)
            {
                CustomMessage.ExecptionCustom(ex);
                return false;
            }
        }
    }
}
