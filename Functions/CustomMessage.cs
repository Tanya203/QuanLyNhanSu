using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WECPOFLogic;

namespace QuanLyNhanSu.Functions
{
    public class CustomMessage
    {
        public static void YesNoCustom(string yes, string no)
        {
            MessageBoxManager.Yes = yes;
            MessageBoxManager.No = no;
            MessageBoxManager.Register_OnceOnly();
        }
        public static void ExecptionCustom(Exception ex)
        {
            MessageBoxManager.Yes = "OK";
            MessageBoxManager.No = "Chi tiết lỗi";
            MessageBoxManager.Register_OnceOnly();
            DialogResult ketQua = MessageBox.Show("UNEXPECTED ERROR!!!", "Lỗi", MessageBoxButtons.YesNo, MessageBoxIcon.Error);
            if (ketQua == DialogResult.No)
            {
                if (!string.IsNullOrEmpty(ex.InnerException.ToString()))
                    MessageBox.Show(ex.InnerException.ToString(), "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
                else
                    MessageBox.Show(ex.Message, "Chi tiết lỗi", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }
    }
}
