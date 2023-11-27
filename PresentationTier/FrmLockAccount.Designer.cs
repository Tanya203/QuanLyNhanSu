namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmLockAccount
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmLockAccount));
            this.lblLockAccount = new System.Windows.Forms.Label();
            this.dtpLockDate = new System.Windows.Forms.DateTimePicker();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.lblChooseLockTime = new System.Windows.Forms.Label();
            this.btnLockAccount = new System.Windows.Forms.Button();
            this.pnlMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblLockAccount
            // 
            this.lblLockAccount.AutoSize = true;
            this.lblLockAccount.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLockAccount.Location = new System.Drawing.Point(52, 9);
            this.lblLockAccount.Name = "lblLockAccount";
            this.lblLockAccount.Size = new System.Drawing.Size(359, 32);
            this.lblLockAccount.TabIndex = 2;
            this.lblLockAccount.Text = "Khoá tài khoản nhân viên";
            // 
            // dtpLockDate
            // 
            this.dtpLockDate.CustomFormat = "HH:mm:ss dd/MM/yyyy";
            this.dtpLockDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpLockDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpLockDate.Location = new System.Drawing.Point(144, 59);
            this.dtpLockDate.Name = "dtpLockDate";
            this.dtpLockDate.Size = new System.Drawing.Size(349, 41);
            this.dtpLockDate.TabIndex = 3;
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.lblChooseLockTime);
            this.pnlMenu.Controls.Add(this.btnLockAccount);
            this.pnlMenu.Controls.Add(this.dtpLockDate);
            this.pnlMenu.Location = new System.Drawing.Point(44, 44);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(621, 221);
            this.pnlMenu.TabIndex = 37;
            // 
            // lblChooseLockTime
            // 
            this.lblChooseLockTime.AutoSize = true;
            this.lblChooseLockTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChooseLockTime.Location = new System.Drawing.Point(185, 13);
            this.lblChooseLockTime.Name = "lblChooseLockTime";
            this.lblChooseLockTime.Size = new System.Drawing.Size(286, 32);
            this.lblChooseLockTime.TabIndex = 37;
            this.lblChooseLockTime.Text = "Chọn thời gian khoá";
            // 
            // btnLockAccount
            // 
            this.btnLockAccount.AutoSize = true;
            this.btnLockAccount.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnLockAccount.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLockAccount.FlatAppearance.BorderSize = 0;
            this.btnLockAccount.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLockAccount.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLockAccount.Image = global::QuanLyNhanSu.Properties.Resources.lock_big;
            this.btnLockAccount.Location = new System.Drawing.Point(173, 117);
            this.btnLockAccount.Name = "btnLockAccount";
            this.btnLockAccount.Size = new System.Drawing.Size(276, 81);
            this.btnLockAccount.TabIndex = 36;
            this.btnLockAccount.Text = "Khoá tài khoản";
            this.btnLockAccount.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnLockAccount.UseVisualStyleBackColor = false;
            this.btnLockAccount.Click += new System.EventHandler(this.btnLockAccount_Click);
            // 
            // FrmLockAccount
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(702, 293);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.lblLockAccount);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(720, 340);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(720, 340);
            this.Name = "FrmLockAccount";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Khoá tài khoản";
            this.Load += new System.EventHandler(this.FrmKhoaTaiKhoan_Load);
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblLockAccount;
        private System.Windows.Forms.DateTimePicker dtpLockDate;
        private System.Windows.Forms.Button btnLockAccount;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Label lblChooseLockTime;
    }
}