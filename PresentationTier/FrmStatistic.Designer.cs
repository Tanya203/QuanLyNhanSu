namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmStatistic
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmStatistic));
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.lblPositionLoginValue = new System.Windows.Forms.Label();
            this.lblPositionLogin = new System.Windows.Forms.Label();
            this.lblDepartmentLoginValue = new System.Windows.Forms.Label();
            this.lblDepartmentLogin = new System.Windows.Forms.Label();
            this.lblFullNameLoginValue = new System.Windows.Forms.Label();
            this.lblFullNameLogin = new System.Windows.Forms.Label();
            this.lblStaffIDLoginValue = new System.Windows.Forms.Label();
            this.lblStaffIDLogin = new System.Windows.Forms.Label();
            this.btnBack = new System.Windows.Forms.Button();
            this.tbBonus = new System.Windows.Forms.TabPage();
            this.rptBonus = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rbPositionBonus = new System.Windows.Forms.RadioButton();
            this.cmbPositionBonus = new System.Windows.Forms.ComboBox();
            this.rbDepartmentBonus = new System.Windows.Forms.RadioButton();
            this.rbAllStaffBonus = new System.Windows.Forms.RadioButton();
            this.lbl = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.cmbDepartmentBonus = new System.Windows.Forms.ComboBox();
            this.dtpMonthBonus = new System.Windows.Forms.DateTimePicker();
            this.tabControlMenu = new System.Windows.Forms.TabControl();
            this.tbSalary = new System.Windows.Forms.TabPage();
            this.rptSalary = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rbPositionSalary = new System.Windows.Forms.RadioButton();
            this.cmbPositionSalary = new System.Windows.Forms.ComboBox();
            this.rbDepartmentSalary = new System.Windows.Forms.RadioButton();
            this.rbAllStaffSalary = new System.Windows.Forms.RadioButton();
            this.lblSalaryStatistics = new System.Windows.Forms.Label();
            this.lblMonth = new System.Windows.Forms.Label();
            this.cmbDepartmentSalary = new System.Windows.Forms.ComboBox();
            this.dtpMonthSalary = new System.Windows.Forms.DateTimePicker();
            this.tbDebt = new System.Windows.Forms.TabPage();
            this.rptDebt = new Microsoft.Reporting.WinForms.ReportViewer();
            this.rbPositionDebt = new System.Windows.Forms.RadioButton();
            this.cmbPositionDebt = new System.Windows.Forms.ComboBox();
            this.rbDepartmentDebt = new System.Windows.Forms.RadioButton();
            this.rbAllStaffDebt = new System.Windows.Forms.RadioButton();
            this.label1 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.cmbDepartmentDebt = new System.Windows.Forms.ComboBox();
            this.dtpMonthDebt = new System.Windows.Forms.DateTimePicker();
            this.pnlHeader.SuspendLayout();
            this.tbBonus.SuspendLayout();
            this.tabControlMenu.SuspendLayout();
            this.tbSalary.SuspendLayout();
            this.tbDebt.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlHeader
            // 
            this.pnlHeader.BackColor = System.Drawing.SystemColors.Info;
            this.pnlHeader.Controls.Add(this.btnRefresh);
            this.pnlHeader.Controls.Add(this.lblPositionLoginValue);
            this.pnlHeader.Controls.Add(this.lblPositionLogin);
            this.pnlHeader.Controls.Add(this.lblDepartmentLoginValue);
            this.pnlHeader.Controls.Add(this.lblDepartmentLogin);
            this.pnlHeader.Controls.Add(this.lblFullNameLoginValue);
            this.pnlHeader.Controls.Add(this.lblFullNameLogin);
            this.pnlHeader.Controls.Add(this.lblStaffIDLoginValue);
            this.pnlHeader.Controls.Add(this.lblStaffIDLogin);
            this.pnlHeader.Controls.Add(this.btnBack);
            this.pnlHeader.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlHeader.Location = new System.Drawing.Point(0, 0);
            this.pnlHeader.Name = "pnlHeader";
            this.pnlHeader.Size = new System.Drawing.Size(1924, 113);
            this.pnlHeader.TabIndex = 55;
            // 
            // btnRefresh
            // 
            this.btnRefresh.AutoSize = true;
            this.btnRefresh.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnRefresh.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnRefresh.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnRefresh.FlatAppearance.BorderSize = 0;
            this.btnRefresh.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnRefresh.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRefresh.Image = global::QuanLyNhanSu.Properties.Resources.refresh;
            this.btnRefresh.Location = new System.Drawing.Point(1780, 0);
            this.btnRefresh.Name = "btnRefresh";
            this.btnRefresh.Size = new System.Drawing.Size(144, 113);
            this.btnRefresh.TabIndex = 68;
            this.btnRefresh.Text = "Refresh";
            this.btnRefresh.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnRefresh.UseVisualStyleBackColor = false;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // lblPositionLoginValue
            // 
            this.lblPositionLoginValue.AutoSize = true;
            this.lblPositionLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1178, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1002, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1178, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1002, 9);
            this.lblDepartmentLogin.Name = "lblDepartmentLogin";
            this.lblDepartmentLogin.Size = new System.Drawing.Size(170, 32);
            this.lblDepartmentLogin.TabIndex = 5;
            this.lblDepartmentLogin.Text = "Phòng ban:";
            // 
            // lblFullNameLoginValue
            // 
            this.lblFullNameLoginValue.AutoSize = true;
            this.lblFullNameLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullNameLoginValue.Location = new System.Drawing.Point(529, 72);
            this.lblFullNameLoginValue.Name = "lblFullNameLoginValue";
            this.lblFullNameLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblFullNameLoginValue.TabIndex = 4;
            this.lblFullNameLoginValue.Text = "...";
            this.lblFullNameLoginValue.UseMnemonic = false;
            // 
            // lblFullNameLogin
            // 
            this.lblFullNameLogin.AutoSize = true;
            this.lblFullNameLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullNameLogin.Location = new System.Drawing.Point(318, 72);
            this.lblFullNameLogin.Name = "lblFullNameLogin";
            this.lblFullNameLogin.Size = new System.Drawing.Size(112, 32);
            this.lblFullNameLogin.TabIndex = 3;
            this.lblFullNameLogin.Text = "Họ tên:";
            // 
            // lblStaffIDLoginValue
            // 
            this.lblStaffIDLoginValue.AutoSize = true;
            this.lblStaffIDLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffIDLoginValue.Location = new System.Drawing.Point(529, 9);
            this.lblStaffIDLoginValue.Name = "lblStaffIDLoginValue";
            this.lblStaffIDLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblStaffIDLoginValue.TabIndex = 2;
            this.lblStaffIDLoginValue.Text = "...";
            this.lblStaffIDLoginValue.UseMnemonic = false;
            // 
            // lblStaffIDLogin
            // 
            this.lblStaffIDLogin.AutoSize = true;
            this.lblStaffIDLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffIDLogin.Location = new System.Drawing.Point(318, 9);
            this.lblStaffIDLogin.Name = "lblStaffIDLogin";
            this.lblStaffIDLogin.Size = new System.Drawing.Size(205, 32);
            this.lblStaffIDLogin.TabIndex = 1;
            this.lblStaffIDLogin.Text = "Mã nhân viên:";
            // 
            // btnBack
            // 
            this.btnBack.AutoSize = true;
            this.btnBack.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnBack.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnBack.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnBack.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnBack.FlatAppearance.BorderSize = 0;
            this.btnBack.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnBack.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnBack.Image = global::QuanLyNhanSu.Properties.Resources._return;
            this.btnBack.Location = new System.Drawing.Point(0, 0);
            this.btnBack.Name = "btnBack";
            this.btnBack.Size = new System.Drawing.Size(142, 113);
            this.btnBack.TabIndex = 1;
            this.btnBack.Text = "Trở về";
            this.btnBack.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnBack.UseVisualStyleBackColor = false;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // tbBonus
            // 
            this.tbBonus.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tbBonus.Controls.Add(this.rptBonus);
            this.tbBonus.Controls.Add(this.rbPositionBonus);
            this.tbBonus.Controls.Add(this.cmbPositionBonus);
            this.tbBonus.Controls.Add(this.rbDepartmentBonus);
            this.tbBonus.Controls.Add(this.rbAllStaffBonus);
            this.tbBonus.Controls.Add(this.lbl);
            this.tbBonus.Controls.Add(this.label2);
            this.tbBonus.Controls.Add(this.cmbDepartmentBonus);
            this.tbBonus.Controls.Add(this.dtpMonthBonus);
            this.tbBonus.Location = new System.Drawing.Point(4, 37);
            this.tbBonus.Name = "tbBonus";
            this.tbBonus.Padding = new System.Windows.Forms.Padding(3);
            this.tbBonus.Size = new System.Drawing.Size(1916, 829);
            this.tbBonus.TabIndex = 1;
            this.tbBonus.Text = "Thống kê thưởng";
            // 
            // rptBonus
            // 
            this.rptBonus.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.rptBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rptBonus.LocalReport.ReportEmbeddedResource = "QuanLyNhanSu.ReportViewer.RptBonus.rdlc";
            this.rptBonus.Location = new System.Drawing.Point(3, 110);
            this.rptBonus.Name = "rptBonus";
            this.rptBonus.ServerReport.BearerToken = null;
            this.rptBonus.Size = new System.Drawing.Size(1910, 716);
            this.rptBonus.TabIndex = 93;
            // 
            // rbPositionBonus
            // 
            this.rbPositionBonus.AutoSize = true;
            this.rbPositionBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbPositionBonus.Location = new System.Drawing.Point(1219, 71);
            this.rbPositionBonus.Name = "rbPositionBonus";
            this.rbPositionBonus.Size = new System.Drawing.Size(154, 36);
            this.rbPositionBonus.TabIndex = 92;
            this.rbPositionBonus.TabStop = true;
            this.rbPositionBonus.Text = "Chức vụ:";
            this.rbPositionBonus.UseVisualStyleBackColor = true;
            this.rbPositionBonus.CheckedChanged += new System.EventHandler(this.RadioBonusCheckChange);
            // 
            // cmbPositionBonus
            // 
            this.cmbPositionBonus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPositionBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPositionBonus.FormattingEnabled = true;
            this.cmbPositionBonus.Location = new System.Drawing.Point(1379, 71);
            this.cmbPositionBonus.Name = "cmbPositionBonus";
            this.cmbPositionBonus.Size = new System.Drawing.Size(244, 33);
            this.cmbPositionBonus.TabIndex = 91;
            this.cmbPositionBonus.SelectedIndexChanged += new System.EventHandler(this.cmbPositionBonus_SelectedIndexChanged);
            // 
            // rbDepartmentBonus
            // 
            this.rbDepartmentBonus.AutoSize = true;
            this.rbDepartmentBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbDepartmentBonus.Location = new System.Drawing.Point(773, 71);
            this.rbDepartmentBonus.Name = "rbDepartmentBonus";
            this.rbDepartmentBonus.Size = new System.Drawing.Size(191, 36);
            this.rbDepartmentBonus.TabIndex = 90;
            this.rbDepartmentBonus.TabStop = true;
            this.rbDepartmentBonus.Text = "Phòng ban:";
            this.rbDepartmentBonus.UseVisualStyleBackColor = true;
            this.rbDepartmentBonus.CheckedChanged += new System.EventHandler(this.RadioBonusCheckChange);
            // 
            // rbAllStaffBonus
            // 
            this.rbAllStaffBonus.AutoSize = true;
            this.rbAllStaffBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbAllStaffBonus.Location = new System.Drawing.Point(480, 71);
            this.rbAllStaffBonus.Name = "rbAllStaffBonus";
            this.rbAllStaffBonus.Size = new System.Drawing.Size(287, 36);
            this.rbAllStaffBonus.TabIndex = 89;
            this.rbAllStaffBonus.TabStop = true;
            this.rbAllStaffBonus.Text = "Toàn bộ nhân viên";
            this.rbAllStaffBonus.UseVisualStyleBackColor = true;
            this.rbAllStaffBonus.CheckedChanged += new System.EventHandler(this.RadioBonusCheckChange);
            // 
            // lbl
            // 
            this.lbl.AutoSize = true;
            this.lbl.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbl.Location = new System.Drawing.Point(799, 6);
            this.lbl.Name = "lbl";
            this.lbl.Size = new System.Drawing.Size(359, 51);
            this.lbl.TabIndex = 88;
            this.lbl.Text = "Thống kê thưởng";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label2.Location = new System.Drawing.Point(232, 73);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(109, 32);
            this.label2.TabIndex = 87;
            this.label2.Text = "Tháng:";
            this.label2.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cmbDepartmentBonus
            // 
            this.cmbDepartmentBonus.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartmentBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartmentBonus.FormattingEnabled = true;
            this.cmbDepartmentBonus.Location = new System.Drawing.Point(970, 73);
            this.cmbDepartmentBonus.Name = "cmbDepartmentBonus";
            this.cmbDepartmentBonus.Size = new System.Drawing.Size(244, 33);
            this.cmbDepartmentBonus.TabIndex = 86;
            this.cmbDepartmentBonus.SelectedIndexChanged += new System.EventHandler(this.cmbDepartmentBonus_SelectedIndexChanged);
            // 
            // dtpMonthBonus
            // 
            this.dtpMonthBonus.CustomFormat = "yyyy-MM";
            this.dtpMonthBonus.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpMonthBonus.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpMonthBonus.Location = new System.Drawing.Point(347, 75);
            this.dtpMonthBonus.Name = "dtpMonthBonus";
            this.dtpMonthBonus.ShowUpDown = true;
            this.dtpMonthBonus.Size = new System.Drawing.Size(127, 30);
            this.dtpMonthBonus.TabIndex = 85;
            this.dtpMonthBonus.ValueChanged += new System.EventHandler(this.dtpMonthBonus_ValueChanged);
            // 
            // tabControlMenu
            // 
            this.tabControlMenu.Appearance = System.Windows.Forms.TabAppearance.Buttons;
            this.tabControlMenu.Controls.Add(this.tbSalary);
            this.tabControlMenu.Controls.Add(this.tbBonus);
            this.tabControlMenu.Controls.Add(this.tbDebt);
            this.tabControlMenu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControlMenu.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed;
            this.tabControlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControlMenu.Location = new System.Drawing.Point(0, 113);
            this.tabControlMenu.Name = "tabControlMenu";
            this.tabControlMenu.SelectedIndex = 0;
            this.tabControlMenu.Size = new System.Drawing.Size(1924, 870);
            this.tabControlMenu.TabIndex = 68;
            this.tabControlMenu.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.tabControlMenu_DrawItem);
            // 
            // tbSalary
            // 
            this.tbSalary.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tbSalary.Controls.Add(this.rptSalary);
            this.tbSalary.Controls.Add(this.rbPositionSalary);
            this.tbSalary.Controls.Add(this.cmbPositionSalary);
            this.tbSalary.Controls.Add(this.rbDepartmentSalary);
            this.tbSalary.Controls.Add(this.rbAllStaffSalary);
            this.tbSalary.Controls.Add(this.lblSalaryStatistics);
            this.tbSalary.Controls.Add(this.lblMonth);
            this.tbSalary.Controls.Add(this.cmbDepartmentSalary);
            this.tbSalary.Controls.Add(this.dtpMonthSalary);
            this.tbSalary.Location = new System.Drawing.Point(4, 37);
            this.tbSalary.Name = "tbSalary";
            this.tbSalary.Padding = new System.Windows.Forms.Padding(3);
            this.tbSalary.Size = new System.Drawing.Size(1916, 829);
            this.tbSalary.TabIndex = 0;
            this.tbSalary.Text = "Thống kê lương";
            // 
            // rptSalary
            // 
            this.rptSalary.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.rptSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rptSalary.LocalReport.ReportEmbeddedResource = "QuanLyNhanSu.ReportViewer.RptSalary.rdlc";
            this.rptSalary.Location = new System.Drawing.Point(3, 110);
            this.rptSalary.Name = "rptSalary";
            this.rptSalary.ServerReport.BearerToken = null;
            this.rptSalary.Size = new System.Drawing.Size(1910, 716);
            this.rptSalary.TabIndex = 84;
            // 
            // rbPositionSalary
            // 
            this.rbPositionSalary.AutoSize = true;
            this.rbPositionSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbPositionSalary.Location = new System.Drawing.Point(1165, 72);
            this.rbPositionSalary.Name = "rbPositionSalary";
            this.rbPositionSalary.Size = new System.Drawing.Size(154, 36);
            this.rbPositionSalary.TabIndex = 83;
            this.rbPositionSalary.TabStop = true;
            this.rbPositionSalary.Text = "Chức vụ:";
            this.rbPositionSalary.UseVisualStyleBackColor = true;
            this.rbPositionSalary.CheckedChanged += new System.EventHandler(this.RadioSalaryCheckChange);
            // 
            // cmbPositionSalary
            // 
            this.cmbPositionSalary.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPositionSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPositionSalary.FormattingEnabled = true;
            this.cmbPositionSalary.Location = new System.Drawing.Point(1325, 74);
            this.cmbPositionSalary.Name = "cmbPositionSalary";
            this.cmbPositionSalary.Size = new System.Drawing.Size(244, 33);
            this.cmbPositionSalary.TabIndex = 82;
            this.cmbPositionSalary.SelectedIndexChanged += new System.EventHandler(this.cmbPositionSalary_SelectedIndexChanged);
            // 
            // rbDepartmentSalary
            // 
            this.rbDepartmentSalary.AutoSize = true;
            this.rbDepartmentSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbDepartmentSalary.Location = new System.Drawing.Point(718, 71);
            this.rbDepartmentSalary.Name = "rbDepartmentSalary";
            this.rbDepartmentSalary.Size = new System.Drawing.Size(191, 36);
            this.rbDepartmentSalary.TabIndex = 81;
            this.rbDepartmentSalary.TabStop = true;
            this.rbDepartmentSalary.Text = "Phòng ban:";
            this.rbDepartmentSalary.UseVisualStyleBackColor = true;
            this.rbDepartmentSalary.CheckedChanged += new System.EventHandler(this.RadioSalaryCheckChange);
            // 
            // rbAllStaffSalary
            // 
            this.rbAllStaffSalary.AutoSize = true;
            this.rbAllStaffSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbAllStaffSalary.Location = new System.Drawing.Point(425, 71);
            this.rbAllStaffSalary.Name = "rbAllStaffSalary";
            this.rbAllStaffSalary.Size = new System.Drawing.Size(287, 36);
            this.rbAllStaffSalary.TabIndex = 80;
            this.rbAllStaffSalary.TabStop = true;
            this.rbAllStaffSalary.Text = "Toàn bộ nhân viên";
            this.rbAllStaffSalary.UseVisualStyleBackColor = true;
            this.rbAllStaffSalary.CheckedChanged += new System.EventHandler(this.RadioSalaryCheckChange);
            // 
            // lblSalaryStatistics
            // 
            this.lblSalaryStatistics.AutoSize = true;
            this.lblSalaryStatistics.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSalaryStatistics.Location = new System.Drawing.Point(799, 10);
            this.lblSalaryStatistics.Name = "lblSalaryStatistics";
            this.lblSalaryStatistics.Size = new System.Drawing.Size(332, 51);
            this.lblSalaryStatistics.TabIndex = 75;
            this.lblSalaryStatistics.Text = "Thống kê lương";
            // 
            // lblMonth
            // 
            this.lblMonth.AutoSize = true;
            this.lblMonth.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMonth.Location = new System.Drawing.Point(177, 76);
            this.lblMonth.Name = "lblMonth";
            this.lblMonth.Size = new System.Drawing.Size(109, 32);
            this.lblMonth.TabIndex = 72;
            this.lblMonth.Text = "Tháng:";
            this.lblMonth.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cmbDepartmentSalary
            // 
            this.cmbDepartmentSalary.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartmentSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartmentSalary.FormattingEnabled = true;
            this.cmbDepartmentSalary.Location = new System.Drawing.Point(915, 74);
            this.cmbDepartmentSalary.Name = "cmbDepartmentSalary";
            this.cmbDepartmentSalary.Size = new System.Drawing.Size(244, 33);
            this.cmbDepartmentSalary.TabIndex = 70;
            this.cmbDepartmentSalary.SelectedIndexChanged += new System.EventHandler(this.cmbDepartmentSalary_SelectedIndexChanged);
            // 
            // dtpMonthSalary
            // 
            this.dtpMonthSalary.CustomFormat = "yyyy-MM";
            this.dtpMonthSalary.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpMonthSalary.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpMonthSalary.Location = new System.Drawing.Point(292, 78);
            this.dtpMonthSalary.Name = "dtpMonthSalary";
            this.dtpMonthSalary.ShowUpDown = true;
            this.dtpMonthSalary.Size = new System.Drawing.Size(127, 30);
            this.dtpMonthSalary.TabIndex = 69;
            this.dtpMonthSalary.ValueChanged += new System.EventHandler(this.dtpMonthSalary_ValueChanged);
            // 
            // tbDebt
            // 
            this.tbDebt.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tbDebt.Controls.Add(this.rptDebt);
            this.tbDebt.Controls.Add(this.rbPositionDebt);
            this.tbDebt.Controls.Add(this.cmbPositionDebt);
            this.tbDebt.Controls.Add(this.rbDepartmentDebt);
            this.tbDebt.Controls.Add(this.rbAllStaffDebt);
            this.tbDebt.Controls.Add(this.label1);
            this.tbDebt.Controls.Add(this.label3);
            this.tbDebt.Controls.Add(this.cmbDepartmentDebt);
            this.tbDebt.Controls.Add(this.dtpMonthDebt);
            this.tbDebt.Location = new System.Drawing.Point(4, 37);
            this.tbDebt.Name = "tbDebt";
            this.tbDebt.Padding = new System.Windows.Forms.Padding(3);
            this.tbDebt.Size = new System.Drawing.Size(1916, 829);
            this.tbDebt.TabIndex = 2;
            this.tbDebt.Text = "Thống kê nợ";
            // 
            // rptDebt
            // 
            this.rptDebt.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.rptDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rptDebt.LocalReport.ReportEmbeddedResource = "QuanLyNhanSu.ReportViewer.RptDebt.rdlc";
            this.rptDebt.Location = new System.Drawing.Point(3, 110);
            this.rptDebt.Name = "rptDebt";
            this.rptDebt.ServerReport.BearerToken = null;
            this.rptDebt.Size = new System.Drawing.Size(1910, 716);
            this.rptDebt.TabIndex = 104;
            // 
            // rbPositionDebt
            // 
            this.rbPositionDebt.AutoSize = true;
            this.rbPositionDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbPositionDebt.Location = new System.Drawing.Point(1218, 71);
            this.rbPositionDebt.Name = "rbPositionDebt";
            this.rbPositionDebt.Size = new System.Drawing.Size(154, 36);
            this.rbPositionDebt.TabIndex = 103;
            this.rbPositionDebt.TabStop = true;
            this.rbPositionDebt.Text = "Chức vụ:";
            this.rbPositionDebt.UseVisualStyleBackColor = true;
            this.rbPositionDebt.CheckedChanged += new System.EventHandler(this.RadioDebtCheckChange);
            // 
            // cmbPositionDebt
            // 
            this.cmbPositionDebt.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPositionDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPositionDebt.FormattingEnabled = true;
            this.cmbPositionDebt.Location = new System.Drawing.Point(1363, 71);
            this.cmbPositionDebt.Name = "cmbPositionDebt";
            this.cmbPositionDebt.Size = new System.Drawing.Size(244, 33);
            this.cmbPositionDebt.TabIndex = 102;
            this.cmbPositionDebt.SelectedIndexChanged += new System.EventHandler(this.cmbPositionDebt_SelectedIndexChanged);
            // 
            // rbDepartmentDebt
            // 
            this.rbDepartmentDebt.AutoSize = true;
            this.rbDepartmentDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbDepartmentDebt.Location = new System.Drawing.Point(785, 72);
            this.rbDepartmentDebt.Name = "rbDepartmentDebt";
            this.rbDepartmentDebt.Size = new System.Drawing.Size(191, 36);
            this.rbDepartmentDebt.TabIndex = 101;
            this.rbDepartmentDebt.TabStop = true;
            this.rbDepartmentDebt.Text = "Phòng ban:";
            this.rbDepartmentDebt.UseVisualStyleBackColor = true;
            this.rbDepartmentDebt.CheckedChanged += new System.EventHandler(this.RadioDebtCheckChange);
            // 
            // rbAllStaffDebt
            // 
            this.rbAllStaffDebt.AutoSize = true;
            this.rbAllStaffDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbAllStaffDebt.Location = new System.Drawing.Point(492, 72);
            this.rbAllStaffDebt.Name = "rbAllStaffDebt";
            this.rbAllStaffDebt.Size = new System.Drawing.Size(287, 36);
            this.rbAllStaffDebt.TabIndex = 100;
            this.rbAllStaffDebt.TabStop = true;
            this.rbAllStaffDebt.Text = "Toàn bộ nhân viên";
            this.rbAllStaffDebt.UseVisualStyleBackColor = true;
            this.rbAllStaffDebt.CheckedChanged += new System.EventHandler(this.RadioDebtCheckChange);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.Location = new System.Drawing.Point(799, 4);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(271, 51);
            this.label1.TabIndex = 99;
            this.label1.Text = "Thống kê nợ";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label3.Location = new System.Drawing.Point(241, 73);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(109, 32);
            this.label3.TabIndex = 98;
            this.label3.Text = "Tháng:";
            this.label3.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cmbDepartmentDebt
            // 
            this.cmbDepartmentDebt.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartmentDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartmentDebt.FormattingEnabled = true;
            this.cmbDepartmentDebt.Location = new System.Drawing.Point(968, 71);
            this.cmbDepartmentDebt.Name = "cmbDepartmentDebt";
            this.cmbDepartmentDebt.Size = new System.Drawing.Size(244, 33);
            this.cmbDepartmentDebt.TabIndex = 97;
            this.cmbDepartmentDebt.SelectedIndexChanged += new System.EventHandler(this.cmbDepartmentDebt_SelectedIndexChanged);
            // 
            // dtpMonthDebt
            // 
            this.dtpMonthDebt.CustomFormat = "yyyy-MM";
            this.dtpMonthDebt.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpMonthDebt.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpMonthDebt.Location = new System.Drawing.Point(356, 75);
            this.dtpMonthDebt.Name = "dtpMonthDebt";
            this.dtpMonthDebt.ShowUpDown = true;
            this.dtpMonthDebt.Size = new System.Drawing.Size(127, 30);
            this.dtpMonthDebt.TabIndex = 96;
            this.dtpMonthDebt.ValueChanged += new System.EventHandler(this.dtpMonthDebt_ValueChanged);
            // 
            // FrmStatistic
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.tabControlMenu);
            this.Controls.Add(this.pnlHeader);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmStatistic";
            this.Text = "Thống kê";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmThongKeLuong_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.tbBonus.ResumeLayout(false);
            this.tbBonus.PerformLayout();
            this.tabControlMenu.ResumeLayout(false);
            this.tbSalary.ResumeLayout(false);
            this.tbSalary.PerformLayout();
            this.tbDebt.ResumeLayout(false);
            this.tbDebt.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Label lblPositionLoginValue;
        private System.Windows.Forms.Label lblPositionLogin;
        private System.Windows.Forms.Label lblDepartmentLoginValue;
        private System.Windows.Forms.Label lblDepartmentLogin;
        private System.Windows.Forms.Label lblFullNameLoginValue;
        private System.Windows.Forms.Label lblFullNameLogin;
        private System.Windows.Forms.Label lblStaffIDLoginValue;
        private System.Windows.Forms.Label lblStaffIDLogin;
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.TabPage tbBonus;
        private System.Windows.Forms.TabControl tabControlMenu;
        private Microsoft.Reporting.WinForms.ReportViewer rptBonus;
        private System.Windows.Forms.RadioButton rbPositionBonus;
        private System.Windows.Forms.ComboBox cmbPositionBonus;
        private System.Windows.Forms.RadioButton rbDepartmentBonus;
        private System.Windows.Forms.RadioButton rbAllStaffBonus;
        private System.Windows.Forms.Label lbl;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.ComboBox cmbDepartmentBonus;
        private System.Windows.Forms.DateTimePicker dtpMonthBonus;
        private System.Windows.Forms.TabPage tbSalary;
        private Microsoft.Reporting.WinForms.ReportViewer rptSalary;
        private System.Windows.Forms.RadioButton rbPositionSalary;
        private System.Windows.Forms.ComboBox cmbPositionSalary;
        private System.Windows.Forms.RadioButton rbDepartmentSalary;
        private System.Windows.Forms.RadioButton rbAllStaffSalary;
        private System.Windows.Forms.Label lblSalaryStatistics;
        private System.Windows.Forms.Label lblMonth;
        private System.Windows.Forms.ComboBox cmbDepartmentSalary;
        private System.Windows.Forms.DateTimePicker dtpMonthSalary;
        private System.Windows.Forms.TabPage tbDebt;
        private Microsoft.Reporting.WinForms.ReportViewer rptDebt;
        private System.Windows.Forms.RadioButton rbPositionDebt;
        private System.Windows.Forms.ComboBox cmbPositionDebt;
        private System.Windows.Forms.RadioButton rbDepartmentDebt;
        private System.Windows.Forms.RadioButton rbAllStaffDebt;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cmbDepartmentDebt;
        private System.Windows.Forms.DateTimePicker dtpMonthDebt;
    }
}