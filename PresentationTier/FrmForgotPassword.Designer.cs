namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmForgotPassword
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
            this.grpVerifyInfo = new System.Windows.Forms.GroupBox();
            this.btnVerifyInfo = new System.Windows.Forms.Button();
            this.txtStaffID = new System.Windows.Forms.TextBox();
            this.lblAccount = new System.Windows.Forms.Label();
            this.txtPhone = new System.Windows.Forms.TextBox();
            this.lblIDCard = new System.Windows.Forms.Label();
            this.lblStaffID = new System.Windows.Forms.Label();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.lblPhone = new System.Windows.Forms.Label();
            this.lblEmail = new System.Windows.Forms.Label();
            this.txtAccount = new System.Windows.Forms.TextBox();
            this.txtIDCard = new System.Windows.Forms.TextBox();
            this.lblForgotPassword = new System.Windows.Forms.Label();
            this.grpChangePassword = new System.Windows.Forms.GroupBox();
            this.txtNewPassword = new System.Windows.Forms.TextBox();
            this.txtReEnterNewPassword = new System.Windows.Forms.TextBox();
            this.btnChangePassword = new System.Windows.Forms.Button();
            this.cbShowPassword = new System.Windows.Forms.CheckBox();
            this.lblReEnterNewPassword = new System.Windows.Forms.Label();
            this.lblNewPassword = new System.Windows.Forms.Label();
            this.pbPassIcon = new System.Windows.Forms.PictureBox();
            this.pbInfo = new System.Windows.Forms.PictureBox();
            this.pbQuestionIcon = new System.Windows.Forms.PictureBox();
            this.btnBack = new System.Windows.Forms.Button();
            this.errProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.grpVerifyInfo.SuspendLayout();
            this.grpChangePassword.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbPassIcon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbInfo)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbQuestionIcon)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // grpVerifyInfo
            // 
            this.grpVerifyInfo.Controls.Add(this.btnVerifyInfo);
            this.grpVerifyInfo.Controls.Add(this.txtStaffID);
            this.grpVerifyInfo.Controls.Add(this.lblAccount);
            this.grpVerifyInfo.Controls.Add(this.txtPhone);
            this.grpVerifyInfo.Controls.Add(this.lblIDCard);
            this.grpVerifyInfo.Controls.Add(this.lblStaffID);
            this.grpVerifyInfo.Controls.Add(this.txtEmail);
            this.grpVerifyInfo.Controls.Add(this.lblPhone);
            this.grpVerifyInfo.Controls.Add(this.lblEmail);
            this.grpVerifyInfo.Controls.Add(this.txtAccount);
            this.grpVerifyInfo.Controls.Add(this.txtIDCard);
            this.grpVerifyInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpVerifyInfo.Location = new System.Drawing.Point(50, 140);
            this.grpVerifyInfo.Name = "grpVerifyInfo";
            this.grpVerifyInfo.Size = new System.Drawing.Size(550, 372);
            this.grpVerifyInfo.TabIndex = 0;
            this.grpVerifyInfo.TabStop = false;
            this.grpVerifyInfo.Text = "Xác thực thông tin";
            // 
            // btnVerifyInfo
            // 
            this.btnVerifyInfo.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnVerifyInfo.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnVerifyInfo.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnVerifyInfo.Image = global::QuanLyNhanSu.Properties.Resources.verify;
            this.btnVerifyInfo.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnVerifyInfo.Location = new System.Drawing.Point(239, 281);
            this.btnVerifyInfo.Name = "btnVerifyInfo";
            this.btnVerifyInfo.Size = new System.Drawing.Size(269, 73);
            this.btnVerifyInfo.TabIndex = 7;
            this.btnVerifyInfo.Text = "Xác thực thông tin";
            this.btnVerifyInfo.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnVerifyInfo.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnVerifyInfo.UseVisualStyleBackColor = false;
            this.btnVerifyInfo.Click += new System.EventHandler(this.btnVerfifyInfo_Click);
            // 
            // txtStaffID
            // 
            this.txtStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStaffID.Location = new System.Drawing.Point(207, 45);
            this.txtStaffID.MaxLength = 12;
            this.txtStaffID.Name = "txtStaffID";
            this.txtStaffID.Size = new System.Drawing.Size(329, 30);
            this.txtStaffID.TabIndex = 2;
            this.txtStaffID.TextChanged += new System.EventHandler(this.VerifyEmptyCheck);
            // 
            // lblAccount
            // 
            this.lblAccount.AutoSize = true;
            this.lblAccount.Location = new System.Drawing.Point(37, 95);
            this.lblAccount.Name = "lblAccount";
            this.lblAccount.Size = new System.Drawing.Size(115, 25);
            this.lblAccount.TabIndex = 1;
            this.lblAccount.Text = "Tài khoản:";
            // 
            // txtPhone
            // 
            this.txtPhone.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPhone.Location = new System.Drawing.Point(207, 195);
            this.txtPhone.MaxLength = 10;
            this.txtPhone.Name = "txtPhone";
            this.txtPhone.Size = new System.Drawing.Size(329, 30);
            this.txtPhone.TabIndex = 5;
            this.txtPhone.TextChanged += new System.EventHandler(this.VerifyEmptyCheck);
            this.txtPhone.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtIDCardAndPhone_KeyPress);
            // 
            // lblIDCard
            // 
            this.lblIDCard.AutoSize = true;
            this.lblIDCard.Location = new System.Drawing.Point(37, 145);
            this.lblIDCard.Name = "lblIDCard";
            this.lblIDCard.Size = new System.Drawing.Size(82, 25);
            this.lblIDCard.TabIndex = 2;
            this.lblIDCard.Text = "CCCD:";
            // 
            // lblStaffID
            // 
            this.lblStaffID.AutoSize = true;
            this.lblStaffID.Location = new System.Drawing.Point(37, 50);
            this.lblStaffID.Name = "lblStaffID";
            this.lblStaffID.Size = new System.Drawing.Size(149, 25);
            this.lblStaffID.TabIndex = 0;
            this.lblStaffID.Text = "Mã nhân viên:";
            // 
            // txtEmail
            // 
            this.txtEmail.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtEmail.Location = new System.Drawing.Point(207, 245);
            this.txtEmail.MaxLength = 50;
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(329, 30);
            this.txtEmail.TabIndex = 6;
            this.txtEmail.TextChanged += new System.EventHandler(this.VerifyEmptyCheck);
            // 
            // lblPhone
            // 
            this.lblPhone.AutoSize = true;
            this.lblPhone.Location = new System.Drawing.Point(37, 195);
            this.lblPhone.Name = "lblPhone";
            this.lblPhone.Size = new System.Drawing.Size(146, 25);
            this.lblPhone.TabIndex = 3;
            this.lblPhone.Text = "Số điện thoại:";
            // 
            // lblEmail
            // 
            this.lblEmail.AutoSize = true;
            this.lblEmail.Location = new System.Drawing.Point(37, 245);
            this.lblEmail.Name = "lblEmail";
            this.lblEmail.Size = new System.Drawing.Size(72, 25);
            this.lblEmail.TabIndex = 4;
            this.lblEmail.Text = "Email:";
            // 
            // txtAccount
            // 
            this.txtAccount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAccount.Location = new System.Drawing.Point(207, 95);
            this.txtAccount.MaxLength = 20;
            this.txtAccount.Name = "txtAccount";
            this.txtAccount.Size = new System.Drawing.Size(329, 30);
            this.txtAccount.TabIndex = 3;
            this.txtAccount.TextChanged += new System.EventHandler(this.VerifyEmptyCheck);
            // 
            // txtIDCard
            // 
            this.txtIDCard.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtIDCard.Location = new System.Drawing.Point(207, 145);
            this.txtIDCard.MaxLength = 12;
            this.txtIDCard.Name = "txtIDCard";
            this.txtIDCard.Size = new System.Drawing.Size(329, 30);
            this.txtIDCard.TabIndex = 4;
            this.txtIDCard.TextChanged += new System.EventHandler(this.VerifyEmptyCheck);
            this.txtIDCard.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtIDCardAndPhone_KeyPress);
            // 
            // lblForgotPassword
            // 
            this.lblForgotPassword.AutoSize = true;
            this.lblForgotPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblForgotPassword.Location = new System.Drawing.Point(250, 23);
            this.lblForgotPassword.Name = "lblForgotPassword";
            this.lblForgotPassword.Size = new System.Drawing.Size(253, 38);
            this.lblForgotPassword.TabIndex = 1;
            this.lblForgotPassword.Text = "Quên mật khẩu";
            // 
            // grpChangePassword
            // 
            this.grpChangePassword.Controls.Add(this.txtNewPassword);
            this.grpChangePassword.Controls.Add(this.txtReEnterNewPassword);
            this.grpChangePassword.Controls.Add(this.btnChangePassword);
            this.grpChangePassword.Controls.Add(this.cbShowPassword);
            this.grpChangePassword.Controls.Add(this.lblReEnterNewPassword);
            this.grpChangePassword.Controls.Add(this.lblNewPassword);
            this.grpChangePassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.grpChangePassword.Location = new System.Drawing.Point(50, 599);
            this.grpChangePassword.Name = "grpChangePassword";
            this.grpChangePassword.Size = new System.Drawing.Size(550, 231);
            this.grpChangePassword.TabIndex = 2;
            this.grpChangePassword.TabStop = false;
            this.grpChangePassword.Text = "Đổi mật khẩu";
            // 
            // txtNewPassword
            // 
            this.txtNewPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtNewPassword.Location = new System.Drawing.Point(261, 53);
            this.txtNewPassword.MaxLength = 20;
            this.txtNewPassword.Name = "txtNewPassword";
            this.txtNewPassword.Size = new System.Drawing.Size(263, 27);
            this.txtNewPassword.TabIndex = 8;
            this.txtNewPassword.UseSystemPasswordChar = true;
            this.txtNewPassword.TextChanged += new System.EventHandler(this.ChangePasswordEmptyCheck);
            // 
            // txtReEnterNewPassword
            // 
            this.txtReEnterNewPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtReEnterNewPassword.Location = new System.Drawing.Point(261, 110);
            this.txtReEnterNewPassword.MaxLength = 20;
            this.txtReEnterNewPassword.Name = "txtReEnterNewPassword";
            this.txtReEnterNewPassword.Size = new System.Drawing.Size(263, 27);
            this.txtReEnterNewPassword.TabIndex = 9;
            this.txtReEnterNewPassword.UseSystemPasswordChar = true;
            this.txtReEnterNewPassword.TextChanged += new System.EventHandler(this.ChangePasswordEmptyCheck);
            // 
            // btnChangePassword
            // 
            this.btnChangePassword.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnChangePassword.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnChangePassword.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnChangePassword.Image = global::QuanLyNhanSu.Properties.Resources.passchange;
            this.btnChangePassword.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnChangePassword.Location = new System.Drawing.Point(287, 152);
            this.btnChangePassword.Name = "btnChangePassword";
            this.btnChangePassword.Size = new System.Drawing.Size(221, 73);
            this.btnChangePassword.TabIndex = 11;
            this.btnChangePassword.Text = "Đổi mật khẩu";
            this.btnChangePassword.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnChangePassword.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnChangePassword.UseVisualStyleBackColor = false;
            this.btnChangePassword.Click += new System.EventHandler(this.btnChangePassword_Click);
            // 
            // cbShowPassword
            // 
            this.cbShowPassword.AutoSize = true;
            this.cbShowPassword.Cursor = System.Windows.Forms.Cursors.Hand;
            this.cbShowPassword.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbShowPassword.Location = new System.Drawing.Point(20, 179);
            this.cbShowPassword.Name = "cbShowPassword";
            this.cbShowPassword.Size = new System.Drawing.Size(162, 24);
            this.cbShowPassword.TabIndex = 10;
            this.cbShowPassword.Text = "Hiển thị mật khẩu";
            this.cbShowPassword.UseVisualStyleBackColor = true;
            this.cbShowPassword.CheckedChanged += new System.EventHandler(this.cbShowPassword_CheckedChanged);
            // 
            // lblReEnterNewPassword
            // 
            this.lblReEnterNewPassword.AutoSize = true;
            this.lblReEnterNewPassword.Location = new System.Drawing.Point(15, 112);
            this.lblReEnterNewPassword.Name = "lblReEnterNewPassword";
            this.lblReEnterNewPassword.Size = new System.Drawing.Size(232, 25);
            this.lblReEnterNewPassword.TabIndex = 1;
            this.lblReEnterNewPassword.Text = "Nhập lại mật khẩu mới:";
            // 
            // lblNewPassword
            // 
            this.lblNewPassword.AutoSize = true;
            this.lblNewPassword.Location = new System.Drawing.Point(15, 55);
            this.lblNewPassword.Name = "lblNewPassword";
            this.lblNewPassword.Size = new System.Drawing.Size(204, 25);
            this.lblNewPassword.TabIndex = 0;
            this.lblNewPassword.Text = "Nhập mật khẩu mới:";
            // 
            // pbPassIcon
            // 
            this.pbPassIcon.Enabled = false;
            this.pbPassIcon.Image = global::QuanLyNhanSu.Properties.Resources.pass;
            this.pbPassIcon.Location = new System.Drawing.Point(285, 518);
            this.pbPassIcon.Name = "pbPassIcon";
            this.pbPassIcon.Size = new System.Drawing.Size(120, 120);
            this.pbPassIcon.TabIndex = 6;
            this.pbPassIcon.TabStop = false;
            // 
            // pbInfo
            // 
            this.pbInfo.Enabled = false;
            this.pbInfo.Image = global::QuanLyNhanSu.Properties.Resources.info;
            this.pbInfo.Location = new System.Drawing.Point(285, 65);
            this.pbInfo.Name = "pbInfo";
            this.pbInfo.Size = new System.Drawing.Size(120, 120);
            this.pbInfo.TabIndex = 5;
            this.pbInfo.TabStop = false;
            // 
            // pbQuestionIcon
            // 
            this.pbQuestionIcon.Enabled = false;
            this.pbQuestionIcon.Image = global::QuanLyNhanSu.Properties.Resources.question_mark;
            this.pbQuestionIcon.Location = new System.Drawing.Point(187, 12);
            this.pbQuestionIcon.Name = "pbQuestionIcon";
            this.pbQuestionIcon.Size = new System.Drawing.Size(70, 70);
            this.pbQuestionIcon.TabIndex = 4;
            this.pbQuestionIcon.TabStop = false;
            // 
            // btnBack
            // 
            this.btnBack.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnBack.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnBack.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBack.Image = global::QuanLyNhanSu.Properties.Resources.return_small;
            this.btnBack.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBack.Location = new System.Drawing.Point(12, 20);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(123, 53);
            this.btnBack.TabIndex = 1;
            this.btnBack.Text = "Trở về";
            this.btnBack.TextAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btnBack.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnBack.UseVisualStyleBackColor = false;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // errProvider
            // 
            this.errProvider.ContainerControl = this;
            // 
            // FrmForgotPassword
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(652, 843);
            this.Controls.Add(this.pbPassIcon);
            this.Controls.Add(this.pbInfo);
            this.Controls.Add(this.pbQuestionIcon);
            this.Controls.Add(this.btnBack);
            this.Controls.Add(this.grpChangePassword);
            this.Controls.Add(this.lblForgotPassword);
            this.Controls.Add(this.grpVerifyInfo);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(670, 890);
            this.MinimumSize = new System.Drawing.Size(670, 890);
            this.Name = "FrmForgotPassword";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Quên mật khẩu";
            this.Load += new System.EventHandler(this.FrmQuenMatKhau_Load);
            this.grpVerifyInfo.ResumeLayout(false);
            this.grpVerifyInfo.PerformLayout();
            this.grpChangePassword.ResumeLayout(false);
            this.grpChangePassword.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbPassIcon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbInfo)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pbQuestionIcon)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox grpVerifyInfo;
        private System.Windows.Forms.Label lblEmail;
        private System.Windows.Forms.Label lblPhone;
        private System.Windows.Forms.Label lblIDCard;
        private System.Windows.Forms.Label lblAccount;
        private System.Windows.Forms.Label lblStaffID;
        private System.Windows.Forms.Label lblForgotPassword;
        private System.Windows.Forms.GroupBox grpChangePassword;
        private System.Windows.Forms.TextBox txtPhone;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.TextBox txtAccount;
        private System.Windows.Forms.TextBox txtIDCard;
        private System.Windows.Forms.TextBox txtStaffID;
        private System.Windows.Forms.Button btnVerifyInfo;
        private System.Windows.Forms.TextBox txtNewPassword;
        private System.Windows.Forms.TextBox txtReEnterNewPassword;
        private System.Windows.Forms.Button btnChangePassword;
        private System.Windows.Forms.CheckBox cbShowPassword;
        private System.Windows.Forms.Label lblReEnterNewPassword;
        private System.Windows.Forms.Label lblNewPassword;
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.PictureBox pbQuestionIcon;
        private System.Windows.Forms.PictureBox pbInfo;
        private System.Windows.Forms.PictureBox pbPassIcon;
        private System.Windows.Forms.ErrorProvider errProvider;
    }
}