using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace QuanLyNhanSu.PresentationTier
{
    public partial class frmTongPhuCapMotNhanVien : Form
    {
        Thread currentForm;
        public frmTongPhuCapMotNhanVien()
        {
            InitializeComponent();
        }
        public void ReturnQLNV()
        {
            this.Close();
            Application.Run(new frmQuanLyNhanVien());
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(ReturnQLNV);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
