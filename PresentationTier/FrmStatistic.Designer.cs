﻿namespace QuanLyNhanSu.PresentationTier
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
            this.tabControlMenu = new System.Windows.Forms.TabControl();
            this.tabPageThongKe = new System.Windows.Forms.TabPage();
            this.lblSearch = new System.Windows.Forms.Label();
            this.rbPosition = new System.Windows.Forms.RadioButton();
            this.cmbPosition = new System.Windows.Forms.ComboBox();
            this.rbDepartment = new System.Windows.Forms.RadioButton();
            this.rbAllStaff = new System.Windows.Forms.RadioButton();
            this.btnXuatExcel = new System.Windows.Forms.Button();
            this.btnThongKe = new System.Windows.Forms.Button();
            this.btnLuu = new System.Windows.Forms.Button();
            this.lblSalaryStatistics = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.lblMonth = new System.Windows.Forms.Label();
            this.cmbDepartment = new System.Windows.Forms.ComboBox();
            this.dtpMonth = new System.Windows.Forms.DateTimePicker();
            this.dgvThongKeLuong = new System.Windows.Forms.DataGridView();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongGioLam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongLuongTheoGio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongThuong = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongPhat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongPhuCap = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTienNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongLuongThang = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.pnlHeader.SuspendLayout();
            this.tabControlMenu.SuspendLayout();
            this.tabPageThongKe.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongKeLuong)).BeginInit();
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
            // tabControlMenu
            // 
            this.tabControlMenu.Appearance = System.Windows.Forms.TabAppearance.Buttons;
            this.tabControlMenu.Controls.Add(this.tabPageThongKe);
            this.tabControlMenu.Controls.Add(this.tabPage2);
            this.tabControlMenu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControlMenu.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed;
            this.tabControlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControlMenu.Location = new System.Drawing.Point(0, 113);
            this.tabControlMenu.Name = "tabControlMenu";
            this.tabControlMenu.SelectedIndex = 0;
            this.tabControlMenu.Size = new System.Drawing.Size(1924, 920);
            this.tabControlMenu.TabIndex = 68;
            this.tabControlMenu.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.tabControlMenu_DrawItem);
            // 
            // tabPageThongKe
            // 
            this.tabPageThongKe.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tabPageThongKe.Controls.Add(this.lblSearch);
            this.tabPageThongKe.Controls.Add(this.rbPosition);
            this.tabPageThongKe.Controls.Add(this.cmbPosition);
            this.tabPageThongKe.Controls.Add(this.rbDepartment);
            this.tabPageThongKe.Controls.Add(this.rbAllStaff);
            this.tabPageThongKe.Controls.Add(this.btnXuatExcel);
            this.tabPageThongKe.Controls.Add(this.btnThongKe);
            this.tabPageThongKe.Controls.Add(this.btnLuu);
            this.tabPageThongKe.Controls.Add(this.lblSalaryStatistics);
            this.tabPageThongKe.Controls.Add(this.txtSearch);
            this.tabPageThongKe.Controls.Add(this.lblMonth);
            this.tabPageThongKe.Controls.Add(this.cmbDepartment);
            this.tabPageThongKe.Controls.Add(this.dtpMonth);
            this.tabPageThongKe.Controls.Add(this.dgvThongKeLuong);
            this.tabPageThongKe.Location = new System.Drawing.Point(4, 37);
            this.tabPageThongKe.Name = "tabPageThongKe";
            this.tabPageThongKe.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageThongKe.Size = new System.Drawing.Size(1916, 879);
            this.tabPageThongKe.TabIndex = 0;
            this.tabPageThongKe.Text = "Thống kê lương";
            this.tabPageThongKe.Click += new System.EventHandler(this.tabPageThongKeLuong_Click);
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(392, 133);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 84;
            this.lblSearch.Text = "Tìm kiếm:";
            this.lblSearch.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // rbPosition
            // 
            this.rbPosition.AutoSize = true;
            this.rbPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbPosition.Location = new System.Drawing.Point(1165, 68);
            this.rbPosition.Name = "rbPosition";
            this.rbPosition.Size = new System.Drawing.Size(154, 36);
            this.rbPosition.TabIndex = 83;
            this.rbPosition.TabStop = true;
            this.rbPosition.Text = "Chức vụ:";
            this.rbPosition.UseVisualStyleBackColor = true;
            // 
            // cmbPosition
            // 
            this.cmbPosition.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPosition.FormattingEnabled = true;
            this.cmbPosition.Location = new System.Drawing.Point(1325, 74);
            this.cmbPosition.Name = "cmbPosition";
            this.cmbPosition.Size = new System.Drawing.Size(244, 33);
            this.cmbPosition.TabIndex = 82;
            // 
            // rbDepartment
            // 
            this.rbDepartment.AutoSize = true;
            this.rbDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbDepartment.Location = new System.Drawing.Point(718, 70);
            this.rbDepartment.Name = "rbDepartment";
            this.rbDepartment.Size = new System.Drawing.Size(191, 36);
            this.rbDepartment.TabIndex = 81;
            this.rbDepartment.TabStop = true;
            this.rbDepartment.Text = "Phòng ban:";
            this.rbDepartment.UseVisualStyleBackColor = true;
            // 
            // rbAllStaff
            // 
            this.rbAllStaff.AutoSize = true;
            this.rbAllStaff.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbAllStaff.Location = new System.Drawing.Point(425, 70);
            this.rbAllStaff.Name = "rbAllStaff";
            this.rbAllStaff.Size = new System.Drawing.Size(287, 36);
            this.rbAllStaff.TabIndex = 80;
            this.rbAllStaff.TabStop = true;
            this.rbAllStaff.Text = "Toàn bộ nhân viên";
            this.rbAllStaff.UseVisualStyleBackColor = true;
            // 
            // btnXuatExcel
            // 
            this.btnXuatExcel.AutoSize = true;
            this.btnXuatExcel.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnXuatExcel.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXuatExcel.FlatAppearance.BorderSize = 0;
            this.btnXuatExcel.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnXuatExcel.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXuatExcel.Image = global::QuanLyNhanSu.Properties.Resources.excel;
            this.btnXuatExcel.Location = new System.Drawing.Point(1156, 122);
            this.btnXuatExcel.Name = "btnXuatExcel";
            this.btnXuatExcel.Size = new System.Drawing.Size(179, 49);
            this.btnXuatExcel.TabIndex = 78;
            this.btnXuatExcel.Text = "Xuất Excel";
            this.btnXuatExcel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnXuatExcel.UseVisualStyleBackColor = false;
            // 
            // btnThongKe
            // 
            this.btnThongKe.AutoSize = true;
            this.btnThongKe.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnThongKe.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThongKe.FlatAppearance.BorderSize = 0;
            this.btnThongKe.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnThongKe.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThongKe.Image = global::QuanLyNhanSu.Properties.Resources.calculate;
            this.btnThongKe.Location = new System.Drawing.Point(976, 122);
            this.btnThongKe.Name = "btnThongKe";
            this.btnThongKe.Size = new System.Drawing.Size(165, 49);
            this.btnThongKe.TabIndex = 77;
            this.btnThongKe.Text = "Thống kê";
            this.btnThongKe.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnThongKe.UseVisualStyleBackColor = false;
            // 
            // btnLuu
            // 
            this.btnLuu.AutoSize = true;
            this.btnLuu.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnLuu.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuu.FlatAppearance.BorderSize = 0;
            this.btnLuu.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLuu.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLuu.Image = global::QuanLyNhanSu.Properties.Resources.save;
            this.btnLuu.Location = new System.Drawing.Point(848, 122);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(122, 49);
            this.btnLuu.TabIndex = 76;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnLuu.UseVisualStyleBackColor = false;
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
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(543, 133);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 74;
            // 
            // lblMonth
            // 
            this.lblMonth.AutoSize = true;
            this.lblMonth.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMonth.Location = new System.Drawing.Point(177, 70);
            this.lblMonth.Name = "lblMonth";
            this.lblMonth.Size = new System.Drawing.Size(109, 32);
            this.lblMonth.TabIndex = 72;
            this.lblMonth.Text = "Tháng:";
            this.lblMonth.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cmbDepartment
            // 
            this.cmbDepartment.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartment.FormattingEnabled = true;
            this.cmbDepartment.Location = new System.Drawing.Point(915, 74);
            this.cmbDepartment.Name = "cmbDepartment";
            this.cmbDepartment.Size = new System.Drawing.Size(244, 33);
            this.cmbDepartment.TabIndex = 70;
            // 
            // dtpMonth
            // 
            this.dtpMonth.CustomFormat = "MM/yyyy";
            this.dtpMonth.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpMonth.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpMonth.Location = new System.Drawing.Point(292, 72);
            this.dtpMonth.Name = "dtpMonth";
            this.dtpMonth.ShowUpDown = true;
            this.dtpMonth.Size = new System.Drawing.Size(127, 30);
            this.dtpMonth.TabIndex = 69;
            // 
            // dgvThongKeLuong
            // 
            this.dgvThongKeLuong.AllowUserToAddRows = false;
            this.dgvThongKeLuong.AllowUserToDeleteRows = false;
            this.dgvThongKeLuong.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvThongKeLuong.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongKeLuong.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongKeLuong.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaNV,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu,
            this.colTongGioLam,
            this.colTongLuongTheoGio,
            this.colTongThuong,
            this.colTongPhat,
            this.colTongPhuCap,
            this.colTienNo,
            this.colTongLuongThang});
            this.dgvThongKeLuong.Location = new System.Drawing.Point(-4, 177);
            this.dgvThongKeLuong.Name = "dgvThongKeLuong";
            this.dgvThongKeLuong.ReadOnly = true;
            this.dgvThongKeLuong.RowHeadersVisible = false;
            this.dgvThongKeLuong.RowHeadersWidth = 51;
            this.dgvThongKeLuong.RowTemplate.Height = 24;
            this.dgvThongKeLuong.Size = new System.Drawing.Size(1924, 706);
            this.dgvThongKeLuong.TabIndex = 68;
            // 
            // colMaNV
            // 
            this.colMaNV.HeaderText = "Mã nhân viên";
            this.colMaNV.MinimumWidth = 6;
            this.colMaNV.Name = "colMaNV";
            this.colMaNV.ReadOnly = true;
            // 
            // colHoTen
            // 
            this.colHoTen.HeaderText = "Họ tên";
            this.colHoTen.MinimumWidth = 6;
            this.colHoTen.Name = "colHoTen";
            this.colHoTen.ReadOnly = true;
            // 
            // colPhongBan
            // 
            this.colPhongBan.HeaderText = "Phòng ban";
            this.colPhongBan.MinimumWidth = 6;
            this.colPhongBan.Name = "colPhongBan";
            this.colPhongBan.ReadOnly = true;
            // 
            // colChucVu
            // 
            this.colChucVu.HeaderText = "Chức vụ";
            this.colChucVu.MinimumWidth = 6;
            this.colChucVu.Name = "colChucVu";
            this.colChucVu.ReadOnly = true;
            // 
            // colTongGioLam
            // 
            this.colTongGioLam.HeaderText = "Tổng giờ làm";
            this.colTongGioLam.MinimumWidth = 6;
            this.colTongGioLam.Name = "colTongGioLam";
            this.colTongGioLam.ReadOnly = true;
            // 
            // colTongLuongTheoGio
            // 
            this.colTongLuongTheoGio.HeaderText = "Tổng lương theo giờ";
            this.colTongLuongTheoGio.MinimumWidth = 6;
            this.colTongLuongTheoGio.Name = "colTongLuongTheoGio";
            this.colTongLuongTheoGio.ReadOnly = true;
            // 
            // colTongThuong
            // 
            this.colTongThuong.HeaderText = "Tổng thưởng";
            this.colTongThuong.MinimumWidth = 6;
            this.colTongThuong.Name = "colTongThuong";
            this.colTongThuong.ReadOnly = true;
            // 
            // colTongPhat
            // 
            this.colTongPhat.HeaderText = "Tổng phạt";
            this.colTongPhat.MinimumWidth = 6;
            this.colTongPhat.Name = "colTongPhat";
            this.colTongPhat.ReadOnly = true;
            // 
            // colTongPhuCap
            // 
            this.colTongPhuCap.HeaderText = "Tổng phụ cấp";
            this.colTongPhuCap.MinimumWidth = 6;
            this.colTongPhuCap.Name = "colTongPhuCap";
            this.colTongPhuCap.ReadOnly = true;
            // 
            // colTienNo
            // 
            this.colTienNo.HeaderText = "Tiền nợ";
            this.colTienNo.MinimumWidth = 6;
            this.colTienNo.Name = "colTienNo";
            this.colTienNo.ReadOnly = true;
            // 
            // colTongLuongThang
            // 
            this.colTongLuongThang.HeaderText = "Tổng lương tháng";
            this.colTongLuongThang.MinimumWidth = 6;
            this.colTongLuongThang.Name = "colTongLuongThang";
            this.colTongLuongThang.ReadOnly = true;
            // 
            // tabPage2
            // 
            this.tabPage2.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tabPage2.Location = new System.Drawing.Point(4, 37);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1916, 879);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Thống kê chấm công";
            // 
            // FrmThongKe
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1033);
            this.Controls.Add(this.tabControlMenu);
            this.Controls.Add(this.pnlHeader);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmThongKe";
            this.Text = "frmThongKeLuong";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmThongKeLuong_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.tabControlMenu.ResumeLayout(false);
            this.tabPageThongKe.ResumeLayout(false);
            this.tabPageThongKe.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongKeLuong)).EndInit();
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
        private System.Windows.Forms.TabControl tabControlMenu;
        private System.Windows.Forms.TabPage tabPageThongKe;
        private System.Windows.Forms.Button btnXuatExcel;
        private System.Windows.Forms.Button btnThongKe;
        private System.Windows.Forms.Button btnLuu;
        private System.Windows.Forms.Label lblSalaryStatistics;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label lblMonth;
        private System.Windows.Forms.ComboBox cmbDepartment;
        private System.Windows.Forms.DateTimePicker dtpMonth;
        private System.Windows.Forms.DataGridView dgvThongKeLuong;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongGioLam;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongLuongTheoGio;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongThuong;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongPhat;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongPhuCap;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTienNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongLuongThang;
        private System.Windows.Forms.RadioButton rbPosition;
        private System.Windows.Forms.ComboBox cmbPosition;
        private System.Windows.Forms.RadioButton rbDepartment;
        private System.Windows.Forms.RadioButton rbAllStaff;
        private System.Windows.Forms.Label lblSearch;
    }
}