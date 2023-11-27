namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmConfirmPassword
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmConfirmPassword));
            this.lblConfirmPassword = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btnConfirmPassoword = new System.Windows.Forms.Button();
            this.txtPassoword = new System.Windows.Forms.TextBox();
            this.lblPassword = new System.Windows.Forms.Label();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblConfirmPassword
            // 
            this.lblConfirmPassword.AutoSize = true;
            this.lblConfirmPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblConfirmPassword.Location = new System.Drawing.Point(182, 9);
            this.lblConfirmPassword.Name = "lblConfirmPassword";
            this.lblConfirmPassword.Size = new System.Drawing.Size(274, 32);
            this.lblConfirmPassword.TabIndex = 3;
            this.lblConfirmPassword.Text = "Xác nhận mật khẩu";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.Info;
            this.panel1.Controls.Add(this.btnConfirmPassoword);
            this.panel1.Controls.Add(this.txtPassoword);
            this.panel1.Controls.Add(this.lblPassword);
            this.panel1.Location = new System.Drawing.Point(25, 44);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(583, 184);
            this.panel1.TabIndex = 4;
            // 
            // btnConfirmPassoword
            // 
            this.btnConfirmPassoword.AutoSize = true;
            this.btnConfirmPassoword.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnConfirmPassoword.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnConfirmPassoword.FlatAppearance.BorderSize = 0;
            this.btnConfirmPassoword.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnConfirmPassoword.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConfirmPassoword.Image = global::QuanLyNhanSu.Properties.Resources.unlock;
            this.btnConfirmPassoword.Location = new System.Drawing.Point(199, 102);
            this.btnConfirmPassoword.Name = "btnConfirmPassoword";
            this.btnConfirmPassoword.Size = new System.Drawing.Size(232, 49);
            this.btnConfirmPassoword.TabIndex = 36;
            this.btnConfirmPassoword.Text = "Xác nhận mật khẩu";
            this.btnConfirmPassoword.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnConfirmPassoword.UseVisualStyleBackColor = false;
            this.btnConfirmPassoword.Click += new System.EventHandler(this.btnConfirmPassoword_Click);
            // 
            // txtPassoword
            // 
            this.txtPassoword.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassoword.Location = new System.Drawing.Point(192, 35);
            this.txtPassoword.Name = "txtPassoword";
            this.txtPassoword.Size = new System.Drawing.Size(311, 30);
            this.txtPassoword.TabIndex = 1;
            this.txtPassoword.UseSystemPasswordChar = true;
            this.txtPassoword.TextChanged += new System.EventHandler(this.txtPassoword_TextChanged);
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(28, 35);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(157, 25);
            this.lblPassword.TabIndex = 0;
            this.lblPassword.Text = "Nhập mật khẩu";
            // 
            // FrmConfirmPassword
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(642, 253);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.lblConfirmPassword);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(660, 300);
            this.MinimizeBox = false;
            this.MinimumSize = new System.Drawing.Size(660, 300);
            this.Name = "FrmConfirmPassword";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Xác nhận mật khẩu";
            this.Load += new System.EventHandler(this.FrmConfirmPassword_Load);
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.FrmConfirmPassword_KeyPress);
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblConfirmPassword;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.TextBox txtPassoword;
        private System.Windows.Forms.Button btnConfirmPassoword;
    }
}