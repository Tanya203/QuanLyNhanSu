namespace QuanLyNhanSu
{
    partial class FrmLogin
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmLogin));
            this.lblAccount = new System.Windows.Forms.Label();
            this.lblPassword = new System.Windows.Forms.Label();
            this.cbShowpassword = new System.Windows.Forms.CheckBox();
            this.llblForgotPassword = new System.Windows.Forms.LinkLabel();
            this.txtAccount = new System.Windows.Forms.TextBox();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.pnlLogin = new System.Windows.Forms.Panel();
            this.btnLogin = new System.Windows.Forms.Button();
            this.lblLogin = new System.Windows.Forms.Label();
            this.pbUserIcon = new System.Windows.Forms.PictureBox();
            this.errProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.pnlLogin.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbUserIcon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // lblAccount
            // 
            this.lblAccount.AutoSize = true;
            this.lblAccount.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAccount.Location = new System.Drawing.Point(3, 43);
            this.lblAccount.Name = "lblAccount";
            this.lblAccount.Size = new System.Drawing.Size(157, 32);
            this.lblAccount.TabIndex = 1;
            this.lblAccount.Text = "Tài khoản:";
            // 
            // lblPassword
            // 
            this.lblPassword.AutoSize = true;
            this.lblPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPassword.Location = new System.Drawing.Point(3, 129);
            this.lblPassword.Name = "lblPassword";
            this.lblPassword.Size = new System.Drawing.Size(147, 32);
            this.lblPassword.TabIndex = 2;
            this.lblPassword.Text = "Mật khẩu:";
            // 
            // cbShowpassword
            // 
            this.cbShowpassword.AutoSize = true;
            this.cbShowpassword.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cbShowpassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbShowpassword.Location = new System.Drawing.Point(9, 190);
            this.cbShowpassword.Name = "cbShowpassword";
            this.cbShowpassword.Size = new System.Drawing.Size(162, 24);
            this.cbShowpassword.TabIndex = 3;
            this.cbShowpassword.Text = "Hiển thị mật khẩu";
            this.cbShowpassword.UseVisualStyleBackColor = true;
            this.cbShowpassword.CheckedChanged += new System.EventHandler(this.cbShowPassword_CheckedChanged);
            // 
            // llblForgotPassword
            // 
            this.llblForgotPassword.AutoSize = true;
            this.llblForgotPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.llblForgotPassword.Location = new System.Drawing.Point(333, 190);
            this.llblForgotPassword.Name = "llblForgotPassword";
            this.llblForgotPassword.Size = new System.Drawing.Size(122, 20);
            this.llblForgotPassword.TabIndex = 4;
            this.llblForgotPassword.TabStop = true;
            this.llblForgotPassword.Text = "Quên mật khẩu";
            this.llblForgotPassword.LinkClicked += new System.Windows.Forms.LinkLabelLinkClickedEventHandler(this.llblForgotPassword_LinkClicked);
            // 
            // txtAccount
            // 
            this.txtAccount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAccount.ForeColor = System.Drawing.SystemColors.WindowText;
            this.txtAccount.Location = new System.Drawing.Point(166, 46);
            this.txtAccount.MaxLength = 20;
            this.txtAccount.Name = "txtAccount";
            this.txtAccount.Size = new System.Drawing.Size(310, 30);
            this.txtAccount.TabIndex = 1;
            this.txtAccount.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // txtPassword
            // 
            this.txtPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPassword.Location = new System.Drawing.Point(166, 132);
            this.txtPassword.MaxLength = 20;
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(310, 30);
            this.txtPassword.TabIndex = 2;
            this.txtPassword.UseSystemPasswordChar = true;
            this.txtPassword.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // pnlLogin
            // 
            this.pnlLogin.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.pnlLogin.Controls.Add(this.cbShowpassword);
            this.pnlLogin.Controls.Add(this.txtPassword);
            this.pnlLogin.Controls.Add(this.lblPassword);
            this.pnlLogin.Controls.Add(this.llblForgotPassword);
            this.pnlLogin.Controls.Add(this.btnLogin);
            this.pnlLogin.Controls.Add(this.lblAccount);
            this.pnlLogin.Controls.Add(this.txtAccount);
            this.pnlLogin.Location = new System.Drawing.Point(75, 205);
            this.pnlLogin.Name = "pnlLogin";
            this.pnlLogin.Size = new System.Drawing.Size(500, 335);
            this.pnlLogin.TabIndex = 8;
            // 
            // btnLogin
            // 
            this.btnLogin.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLogin.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLogin.Image = global::QuanLyNhanSu.Properties.Resources.login;
            this.btnLogin.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnLogin.Location = new System.Drawing.Point(125, 240);
            this.btnLogin.Name = "btnLogin";
            this.btnLogin.Size = new System.Drawing.Size(250, 75);
            this.btnLogin.TabIndex = 5;
            this.btnLogin.Text = "Đăng nhập";
            this.btnLogin.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnLogin.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnLogin.UseCompatibleTextRendering = true;
            this.btnLogin.UseVisualStyleBackColor = true;
            this.btnLogin.Click += new System.EventHandler(this.btnLogin_Click);
            // 
            // lblLogin
            // 
            this.lblLogin.AutoSize = true;
            this.lblLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLogin.Location = new System.Drawing.Point(232, 153);
            this.lblLogin.Name = "lblLogin";
            this.lblLogin.Size = new System.Drawing.Size(185, 38);
            this.lblLogin.TabIndex = 9;
            this.lblLogin.Text = "Đăng nhập";
            // 
            // pbUserIcon
            // 
            this.pbUserIcon.Enabled = false;
            this.pbUserIcon.Image = global::QuanLyNhanSu.Properties.Resources.user;
            this.pbUserIcon.Location = new System.Drawing.Point(275, 30);
            this.pbUserIcon.Name = "pbUserIcon";
            this.pbUserIcon.Size = new System.Drawing.Size(120, 120);
            this.pbUserIcon.TabIndex = 10;
            this.pbUserIcon.TabStop = false;
            // 
            // errProvider
            // 
            this.errProvider.ContainerControl = this;
            // 
            // FrmLogin
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(632, 603);
            this.Controls.Add(this.pbUserIcon);
            this.Controls.Add(this.lblLogin);
            this.Controls.Add(this.pnlLogin);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(650, 650);
            this.MinimumSize = new System.Drawing.Size(650, 650);
            this.Name = "FrmLogin";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Đăng nhập";
            this.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.FrmDangNhap_KeyPress);
            this.pnlLogin.ResumeLayout(false);
            this.pnlLogin.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbUserIcon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label lblAccount;
        private System.Windows.Forms.Label lblPassword;
        private System.Windows.Forms.CheckBox cbShowpassword;
        private System.Windows.Forms.Button btnLogin;
        private System.Windows.Forms.LinkLabel llblForgotPassword;
        private System.Windows.Forms.TextBox txtAccount;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Panel pnlLogin;
        private System.Windows.Forms.Label lblLogin;
        private System.Windows.Forms.PictureBox pbUserIcon;
        private System.Windows.Forms.ErrorProvider errProvider;
    }
}

