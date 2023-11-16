namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmTimeKeeping
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.lbTimeKeeping = new System.Windows.Forms.Label();
            this.lblEnterStaffID = new System.Windows.Forms.Label();
            this.txtStaffID = new System.Windows.Forms.TextBox();
            this.btnTimekeeping = new System.Windows.Forms.Button();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.pnlMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // lbTimeKeeping
            // 
            this.lbTimeKeeping.AutoSize = true;
            this.lbTimeKeeping.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.lbTimeKeeping.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbTimeKeeping.Location = new System.Drawing.Point(97, 59);
            this.lbTimeKeeping.Name = "lbTimeKeeping";
            this.lbTimeKeeping.Size = new System.Drawing.Size(297, 51);
            this.lbTimeKeeping.TabIndex = 0;
            this.lbTimeKeeping.Text = "CHẤM CÔNG";
            // 
            // lblEnterStaffID
            // 
            this.lblEnterStaffID.AutoSize = true;
            this.lblEnterStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblEnterStaffID.Location = new System.Drawing.Point(52, 25);
            this.lblEnterStaffID.Name = "lblEnterStaffID";
            this.lblEnterStaffID.Size = new System.Drawing.Size(235, 29);
            this.lblEnterStaffID.TabIndex = 1;
            this.lblEnterStaffID.Text = "Nhập mã nhân viên";
            // 
            // txtStaffID
            // 
            this.txtStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStaffID.Location = new System.Drawing.Point(30, 75);
            this.txtStaffID.MaxLength = 12;
            this.txtStaffID.Name = "txtStaffID";
            this.txtStaffID.Size = new System.Drawing.Size(280, 30);
            this.txtStaffID.TabIndex = 2;
            this.txtStaffID.TextChanged += new System.EventHandler(this.txtStaffID_TextChanged);
            // 
            // btnTimekeeping
            // 
            this.btnTimekeeping.AutoSize = true;
            this.btnTimekeeping.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnTimekeeping.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTimekeeping.FlatAppearance.BorderSize = 0;
            this.btnTimekeeping.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnTimekeeping.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTimekeeping.Image = global::QuanLyNhanSu.Properties.Resources.timekeeping;
            this.btnTimekeeping.Location = new System.Drawing.Point(79, 124);
            this.btnTimekeeping.Name = "btnTimekeeping";
            this.btnTimekeeping.Size = new System.Drawing.Size(182, 73);
            this.btnTimekeeping.TabIndex = 34;
            this.btnTimekeeping.Text = "Chấm công";
            this.btnTimekeeping.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnTimekeeping.UseVisualStyleBackColor = false;
            this.btnTimekeeping.Click += new System.EventHandler(this.btnTimekeeping_Click);
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.lblEnterStaffID);
            this.pnlMenu.Controls.Add(this.btnTimekeeping);
            this.pnlMenu.Controls.Add(this.txtStaffID);
            this.pnlMenu.Location = new System.Drawing.Point(80, 165);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(340, 220);
            this.pnlMenu.TabIndex = 35;
            // 
            // FrmChamCong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(482, 453);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.lbTimeKeeping);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(500, 500);
            this.MinimumSize = new System.Drawing.Size(500, 500);
            this.Name = "FrmChamCong";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmChamCong";
            this.Load += new System.EventHandler(this.FrmChamCong_Load);
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbTimeKeeping;
        private System.Windows.Forms.Label lblEnterStaffID;
        private System.Windows.Forms.TextBox txtStaffID;
        private System.Windows.Forms.Button btnTimekeeping;
        private System.Windows.Forms.Panel pnlMenu;
    }
}