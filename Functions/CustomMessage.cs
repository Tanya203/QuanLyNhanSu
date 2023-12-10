using System;
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
            MessageBox.Show(ex.Message, "UNEXPECTED ERROR!!!", MessageBoxButtons.OK, MessageBoxIcon.Error);
        }
    }
}
