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
    public partial class frmChiTietLichLamViec : Form
    {
        Thread currentForm;
        public frmChiTietLichLamViec()
        {
            InitializeComponent();
        }
        public void ReturnQLLLV()
        {
            this.Close();
            Application.Run(new frmLichLamViec());
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
            currentForm = new Thread(ReturnQLLLV);
            currentForm.SetApartmentState(ApartmentState.STA);
            currentForm.Start();
        }
    }
}
