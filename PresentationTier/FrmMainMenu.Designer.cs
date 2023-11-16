namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmMainMenu
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.btnLogOut = new System.Windows.Forms.Button();
            this.btnAccountInfo = new System.Windows.Forms.Button();
            this.btnOperateHistory = new System.Windows.Forms.Button();
            this.btnAuthorization = new System.Windows.Forms.Button();
            this.btnContractType = new System.Windows.Forms.Button();
            this.btnStatistics = new System.Windows.Forms.Button();
            this.btnCard = new System.Windows.Forms.Button();
            this.btnAllowance = new System.Windows.Forms.Button();
            this.btnWorkSchedule = new System.Windows.Forms.Button();
            this.btnShift = new System.Windows.Forms.Button();
            this.btnPosition = new System.Windows.Forms.Button();
            this.btnDepartment = new System.Windows.Forms.Button();
            this.btnStaffs = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblValueAbsence = new System.Windows.Forms.Label();
            this.lblAbsenceRemain = new System.Windows.Forms.Label();
            this.lblValueFullName = new System.Windows.Forms.Label();
            this.lblValuePosition = new System.Windows.Forms.Label();
            this.lblFullName = new System.Windows.Forms.Label();
            this.lblValueDepartment = new System.Windows.Forms.Label();
            this.lblPosition = new System.Windows.Forms.Label();
            this.lblDepartment = new System.Windows.Forms.Label();
            this.lblValueStaffID = new System.Windows.Forms.Label();
            this.lblStaffID = new System.Windows.Forms.Label();
            this.pbStaffPicture = new System.Windows.Forms.PictureBox();
            this.lblWorkSchedule = new System.Windows.Forms.Label();
            this.dtpWorkSchedule = new System.Windows.Forms.DateTimePicker();
            this.dgvWorkSchedule = new System.Windows.Forms.DataGridView();
            this.colMaLLV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNgayLam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colLoaiCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThoiGianDen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThoiGianVe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhep = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.pnlMenu.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbStaffPicture)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvWorkSchedule)).BeginInit();
            this.SuspendLayout();
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.pnlMenu.Controls.Add(this.btnLogOut);
            this.pnlMenu.Controls.Add(this.btnAccountInfo);
            this.pnlMenu.Controls.Add(this.btnOperateHistory);
            this.pnlMenu.Controls.Add(this.btnAuthorization);
            this.pnlMenu.Controls.Add(this.btnContractType);
            this.pnlMenu.Controls.Add(this.btnStatistics);
            this.pnlMenu.Controls.Add(this.btnCard);
            this.pnlMenu.Controls.Add(this.btnAllowance);
            this.pnlMenu.Controls.Add(this.btnWorkSchedule);
            this.pnlMenu.Controls.Add(this.btnShift);
            this.pnlMenu.Controls.Add(this.btnPosition);
            this.pnlMenu.Controls.Add(this.btnDepartment);
            this.pnlMenu.Controls.Add(this.btnStaffs);
            this.pnlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.pnlMenu.Location = new System.Drawing.Point(0, 0);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(1924, 100);
            this.pnlMenu.TabIndex = 17;
            // 
            // btnLogOut
            // 
            this.btnLogOut.AutoSize = true;
            this.btnLogOut.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnLogOut.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLogOut.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnLogOut.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnLogOut.FlatAppearance.BorderSize = 2;
            this.btnLogOut.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLogOut.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLogOut.Image = global::QuanLyNhanSu.Properties.Resources.log_out;
            this.btnLogOut.Location = new System.Drawing.Point(1821, 0);
            this.btnLogOut.Name = "btnLogOut";
            this.btnLogOut.Size = new System.Drawing.Size(103, 100);
            this.btnLogOut.TabIndex = 14;
            this.btnLogOut.Text = "Đăng xuất";
            this.btnLogOut.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnLogOut.UseVisualStyleBackColor = true;
            this.btnLogOut.Click += new System.EventHandler(this.btnLogOut_Click);
            // 
            // btnAccountInfo
            // 
            this.btnAccountInfo.AutoSize = true;
            this.btnAccountInfo.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnAccountInfo.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAccountInfo.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnAccountInfo.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnAccountInfo.FlatAppearance.BorderSize = 2;
            this.btnAccountInfo.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAccountInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAccountInfo.Image = global::QuanLyNhanSu.Properties.Resources.info_small;
            this.btnAccountInfo.Location = new System.Drawing.Point(1172, 0);
            this.btnAccountInfo.Name = "btnAccountInfo";
            this.btnAccountInfo.Size = new System.Drawing.Size(100, 100);
            this.btnAccountInfo.TabIndex = 13;
            this.btnAccountInfo.Text = "Tài khoản";
            this.btnAccountInfo.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnAccountInfo.UseVisualStyleBackColor = true;
            this.btnAccountInfo.Click += new System.EventHandler(this.btnAccountInfo_Click);
            // 
            // btnOperateHistory
            // 
            this.btnOperateHistory.AutoSize = true;
            this.btnOperateHistory.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnOperateHistory.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnOperateHistory.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnOperateHistory.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnOperateHistory.FlatAppearance.BorderSize = 2;
            this.btnOperateHistory.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnOperateHistory.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOperateHistory.Image = global::QuanLyNhanSu.Properties.Resources.history;
            this.btnOperateHistory.Location = new System.Drawing.Point(1017, 0);
            this.btnOperateHistory.Name = "btnOperateHistory";
            this.btnOperateHistory.Size = new System.Drawing.Size(155, 100);
            this.btnOperateHistory.TabIndex = 12;
            this.btnOperateHistory.Text = "Lịch sử thao tác";
            this.btnOperateHistory.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnOperateHistory.UseVisualStyleBackColor = true;
            this.btnOperateHistory.Click += new System.EventHandler(this.btnOperateHistory_Click);
            // 
            // btnAuthorization
            // 
            this.btnAuthorization.AutoSize = true;
            this.btnAuthorization.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnAuthorization.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAuthorization.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnAuthorization.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnAuthorization.FlatAppearance.BorderSize = 2;
            this.btnAuthorization.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAuthorization.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAuthorization.Image = global::QuanLyNhanSu.Properties.Resources.decentralization;
            this.btnAuthorization.Location = new System.Drawing.Point(901, 0);
            this.btnAuthorization.Name = "btnAuthorization";
            this.btnAuthorization.Size = new System.Drawing.Size(116, 100);
            this.btnAuthorization.TabIndex = 11;
            this.btnAuthorization.Text = "Phân quyền";
            this.btnAuthorization.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnAuthorization.UseVisualStyleBackColor = true;
            this.btnAuthorization.Click += new System.EventHandler(this.btnDecentralization_Click);
            // 
            // btnContractType
            // 
            this.btnContractType.AutoSize = true;
            this.btnContractType.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnContractType.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnContractType.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnContractType.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnContractType.FlatAppearance.BorderSize = 2;
            this.btnContractType.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnContractType.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnContractType.Image = global::QuanLyNhanSu.Properties.Resources.contract;
            this.btnContractType.Location = new System.Drawing.Point(764, 0);
            this.btnContractType.Name = "btnContractType";
            this.btnContractType.Size = new System.Drawing.Size(137, 100);
            this.btnContractType.TabIndex = 10;
            this.btnContractType.Text = "Loại hợp đồng";
            this.btnContractType.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnContractType.UseVisualStyleBackColor = true;
            this.btnContractType.Click += new System.EventHandler(this.btnContractType_Click);
            // 
            // btnStatistics
            // 
            this.btnStatistics.AutoSize = true;
            this.btnStatistics.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnStatistics.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnStatistics.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnStatistics.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnStatistics.FlatAppearance.BorderSize = 2;
            this.btnStatistics.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnStatistics.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnStatistics.Image = global::QuanLyNhanSu.Properties.Resources.chart;
            this.btnStatistics.Location = new System.Drawing.Point(669, 0);
            this.btnStatistics.Name = "btnStatistics";
            this.btnStatistics.Size = new System.Drawing.Size(95, 100);
            this.btnStatistics.TabIndex = 9;
            this.btnStatistics.Text = "Thống kê";
            this.btnStatistics.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnStatistics.UseVisualStyleBackColor = true;
            this.btnStatistics.Click += new System.EventHandler(this.btnStatistics_Click);
            // 
            // btnCard
            // 
            this.btnCard.AutoSize = true;
            this.btnCard.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnCard.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnCard.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnCard.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnCard.FlatAppearance.BorderSize = 2;
            this.btnCard.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCard.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCard.Image = global::QuanLyNhanSu.Properties.Resources.card;
            this.btnCard.Location = new System.Drawing.Point(568, 0);
            this.btnCard.Name = "btnCard";
            this.btnCard.Size = new System.Drawing.Size(101, 100);
            this.btnCard.TabIndex = 8;
            this.btnCard.Text = "Lập phiếu";
            this.btnCard.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnCard.UseVisualStyleBackColor = true;
            this.btnCard.Click += new System.EventHandler(this.btnCard_Click);
            // 
            // btnAllowance
            // 
            this.btnAllowance.AutoSize = true;
            this.btnAllowance.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnAllowance.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAllowance.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnAllowance.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnAllowance.FlatAppearance.BorderSize = 2;
            this.btnAllowance.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAllowance.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAllowance.Image = global::QuanLyNhanSu.Properties.Resources.allowance;
            this.btnAllowance.Location = new System.Drawing.Point(481, 0);
            this.btnAllowance.Name = "btnAllowance";
            this.btnAllowance.Size = new System.Drawing.Size(87, 100);
            this.btnAllowance.TabIndex = 7;
            this.btnAllowance.Text = "Phụ cấp";
            this.btnAllowance.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnAllowance.UseVisualStyleBackColor = true;
            this.btnAllowance.Click += new System.EventHandler(this.btnAllowance_Click);
            // 
            // btnWorkSchedule
            // 
            this.btnWorkSchedule.AutoSize = true;
            this.btnWorkSchedule.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnWorkSchedule.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnWorkSchedule.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnWorkSchedule.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnWorkSchedule.FlatAppearance.BorderSize = 2;
            this.btnWorkSchedule.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnWorkSchedule.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnWorkSchedule.Image = global::QuanLyNhanSu.Properties.Resources.timetable;
            this.btnWorkSchedule.Location = new System.Drawing.Point(350, 0);
            this.btnWorkSchedule.Name = "btnWorkSchedule";
            this.btnWorkSchedule.Size = new System.Drawing.Size(131, 100);
            this.btnWorkSchedule.TabIndex = 6;
            this.btnWorkSchedule.Text = "Lịch làm việc";
            this.btnWorkSchedule.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnWorkSchedule.UseVisualStyleBackColor = true;
            this.btnWorkSchedule.Click += new System.EventHandler(this.btnWorkSchedule_Click);
            // 
            // btnShift
            // 
            this.btnShift.AutoSize = true;
            this.btnShift.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnShift.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnShift.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnShift.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnShift.FlatAppearance.BorderSize = 2;
            this.btnShift.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnShift.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnShift.Image = global::QuanLyNhanSu.Properties.Resources.shitf1;
            this.btnShift.Location = new System.Drawing.Point(296, 0);
            this.btnShift.Name = "btnShift";
            this.btnShift.Size = new System.Drawing.Size(54, 100);
            this.btnShift.TabIndex = 4;
            this.btnShift.Text = "Ca";
            this.btnShift.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnShift.UseVisualStyleBackColor = true;
            this.btnShift.Click += new System.EventHandler(this.btnShift_Click);
            // 
            // btnPosition
            // 
            this.btnPosition.AutoSize = true;
            this.btnPosition.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnPosition.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnPosition.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnPosition.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnPosition.FlatAppearance.BorderSize = 2;
            this.btnPosition.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPosition.Image = global::QuanLyNhanSu.Properties.Resources.position;
            this.btnPosition.Location = new System.Drawing.Point(209, 0);
            this.btnPosition.Name = "btnPosition";
            this.btnPosition.Size = new System.Drawing.Size(87, 100);
            this.btnPosition.TabIndex = 3;
            this.btnPosition.Text = "Chức vụ";
            this.btnPosition.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnPosition.UseVisualStyleBackColor = true;
            this.btnPosition.Click += new System.EventHandler(this.btnPosition_Click);
            // 
            // btnDepartment
            // 
            this.btnDepartment.AutoSize = true;
            this.btnDepartment.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnDepartment.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDepartment.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnDepartment.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnDepartment.FlatAppearance.BorderSize = 2;
            this.btnDepartment.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDepartment.Image = global::QuanLyNhanSu.Properties.Resources.department;
            this.btnDepartment.Location = new System.Drawing.Point(102, 0);
            this.btnDepartment.Name = "btnDepartment";
            this.btnDepartment.Size = new System.Drawing.Size(107, 100);
            this.btnDepartment.TabIndex = 2;
            this.btnDepartment.Text = "Phòng ban";
            this.btnDepartment.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnDepartment.UseVisualStyleBackColor = true;
            this.btnDepartment.Click += new System.EventHandler(this.btnDepartment_Click);
            // 
            // btnStaffs
            // 
            this.btnStaffs.AutoSize = true;
            this.btnStaffs.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnStaffs.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnStaffs.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnStaffs.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnStaffs.FlatAppearance.BorderSize = 2;
            this.btnStaffs.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnStaffs.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnStaffs.Image = global::QuanLyNhanSu.Properties.Resources.staff;
            this.btnStaffs.Location = new System.Drawing.Point(0, 0);
            this.btnStaffs.Name = "btnStaffs";
            this.btnStaffs.Size = new System.Drawing.Size(102, 100);
            this.btnStaffs.TabIndex = 1;
            this.btnStaffs.Text = "Nhân viên";
            this.btnStaffs.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnStaffs.UseVisualStyleBackColor = true;
            this.btnStaffs.Click += new System.EventHandler(this.btnStaffs_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.Info;
            this.panel1.Controls.Add(this.lblValueAbsence);
            this.panel1.Controls.Add(this.lblAbsenceRemain);
            this.panel1.Controls.Add(this.lblValueFullName);
            this.panel1.Controls.Add(this.lblValuePosition);
            this.panel1.Controls.Add(this.lblFullName);
            this.panel1.Controls.Add(this.lblValueDepartment);
            this.panel1.Controls.Add(this.lblPosition);
            this.panel1.Controls.Add(this.lblDepartment);
            this.panel1.Controls.Add(this.lblValueStaffID);
            this.panel1.Controls.Add(this.lblStaffID);
            this.panel1.Controls.Add(this.pbStaffPicture);
            this.panel1.Location = new System.Drawing.Point(0, 100);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1924, 210);
            this.panel1.TabIndex = 18;
            // 
            // lblValueAbsence
            // 
            this.lblValueAbsence.AutoSize = true;
            this.lblValueAbsence.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblValueAbsence.Location = new System.Drawing.Point(1582, 92);
            this.lblValueAbsence.Name = "lblValueAbsence";
            this.lblValueAbsence.Size = new System.Drawing.Size(39, 36);
            this.lblValueAbsence.TabIndex = 24;
            this.lblValueAbsence.Text = "...";
            // 
            // lblAbsenceRemain
            // 
            this.lblAbsenceRemain.AutoSize = true;
            this.lblAbsenceRemain.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAbsenceRemain.Location = new System.Drawing.Point(1270, 90);
            this.lblAbsenceRemain.Name = "lblAbsenceRemain";
            this.lblAbsenceRemain.Size = new System.Drawing.Size(306, 38);
            this.lblAbsenceRemain.TabIndex = 23;
            this.lblAbsenceRemain.Text = "Số ngày phép còn:";
            // 
            // lblValueFullName
            // 
            this.lblValueFullName.AutoSize = true;
            this.lblValueFullName.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblValueFullName.Location = new System.Drawing.Point(249, 145);
            this.lblValueFullName.Name = "lblValueFullName";
            this.lblValueFullName.Size = new System.Drawing.Size(44, 38);
            this.lblValueFullName.TabIndex = 20;
            this.lblValueFullName.Text = "...";
            // 
            // lblValuePosition
            // 
            this.lblValuePosition.AutoSize = true;
            this.lblValuePosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblValuePosition.Location = new System.Drawing.Point(827, 145);
            this.lblValuePosition.Name = "lblValuePosition";
            this.lblValuePosition.Size = new System.Drawing.Size(44, 38);
            this.lblValuePosition.TabIndex = 22;
            this.lblValuePosition.Text = "...";
            // 
            // lblFullName
            // 
            this.lblFullName.AutoSize = true;
            this.lblFullName.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullName.Location = new System.Drawing.Point(12, 143);
            this.lblFullName.Name = "lblFullName";
            this.lblFullName.Size = new System.Drawing.Size(129, 38);
            this.lblFullName.TabIndex = 19;
            this.lblFullName.Text = "Họ tên:";
            // 
            // lblValueDepartment
            // 
            this.lblValueDepartment.AutoSize = true;
            this.lblValueDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblValueDepartment.Location = new System.Drawing.Point(827, 19);
            this.lblValueDepartment.Name = "lblValueDepartment";
            this.lblValueDepartment.Size = new System.Drawing.Size(44, 38);
            this.lblValueDepartment.TabIndex = 4;
            this.lblValueDepartment.Text = "...";
            // 
            // lblPosition
            // 
            this.lblPosition.AutoSize = true;
            this.lblPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPosition.Location = new System.Drawing.Point(628, 143);
            this.lblPosition.Name = "lblPosition";
            this.lblPosition.Size = new System.Drawing.Size(155, 38);
            this.lblPosition.TabIndex = 21;
            this.lblPosition.Text = "Chức vụ:";
            // 
            // lblDepartment
            // 
            this.lblDepartment.AutoSize = true;
            this.lblDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartment.Location = new System.Drawing.Point(628, 17);
            this.lblDepartment.Name = "lblDepartment";
            this.lblDepartment.Size = new System.Drawing.Size(193, 38);
            this.lblDepartment.TabIndex = 3;
            this.lblDepartment.Text = "Phòng ban:";
            // 
            // lblValueStaffID
            // 
            this.lblValueStaffID.AutoSize = true;
            this.lblValueStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblValueStaffID.Location = new System.Drawing.Point(249, 19);
            this.lblValueStaffID.Name = "lblValueStaffID";
            this.lblValueStaffID.Size = new System.Drawing.Size(44, 38);
            this.lblValueStaffID.TabIndex = 2;
            this.lblValueStaffID.Text = "...";
            // 
            // lblStaffID
            // 
            this.lblStaffID.AutoSize = true;
            this.lblStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffID.Location = new System.Drawing.Point(12, 17);
            this.lblStaffID.Name = "lblStaffID";
            this.lblStaffID.Size = new System.Drawing.Size(234, 38);
            this.lblStaffID.TabIndex = 1;
            this.lblStaffID.Text = "Mã nhân viên:";
            // 
            // pbStaffPicture
            // 
            this.pbStaffPicture.Dock = System.Windows.Forms.DockStyle.Right;
            this.pbStaffPicture.Image = global::QuanLyNhanSu.Properties.Resources.image;
            this.pbStaffPicture.Location = new System.Drawing.Point(1706, 0);
            this.pbStaffPicture.Name = "pbStaffPicture";
            this.pbStaffPicture.Size = new System.Drawing.Size(218, 210);
            this.pbStaffPicture.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbStaffPicture.TabIndex = 0;
            this.pbStaffPicture.TabStop = false;
            // 
            // lblWorkSchedule
            // 
            this.lblWorkSchedule.AutoSize = true;
            this.lblWorkSchedule.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblWorkSchedule.Location = new System.Drawing.Point(844, 313);
            this.lblWorkSchedule.Name = "lblWorkSchedule";
            this.lblWorkSchedule.Size = new System.Drawing.Size(264, 46);
            this.lblWorkSchedule.TabIndex = 19;
            this.lblWorkSchedule.Text = "Lịch làm việc";
            // 
            // dtpWorkSchedule
            // 
            this.dtpWorkSchedule.CustomFormat = "dddd dd/MM/yyyy";
            this.dtpWorkSchedule.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpWorkSchedule.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpWorkSchedule.Location = new System.Drawing.Point(829, 362);
            this.dtpWorkSchedule.Name = "dtpWorkSchedule";
            this.dtpWorkSchedule.Size = new System.Drawing.Size(308, 34);
            this.dtpWorkSchedule.TabIndex = 15;
            this.dtpWorkSchedule.ValueChanged += new System.EventHandler(this.dtpWorkSchedule_ValueChanged);
            // 
            // dgvWorkSchedule
            // 
            this.dgvWorkSchedule.AllowUserToAddRows = false;
            this.dgvWorkSchedule.AllowUserToDeleteRows = false;
            this.dgvWorkSchedule.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvWorkSchedule.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvWorkSchedule.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvWorkSchedule.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvWorkSchedule.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvWorkSchedule.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaLLV,
            this.colMaNV,
            this.colNgayLam,
            this.colCa,
            this.colLoaiCa,
            this.colThoiGianDen,
            this.colThoiGianVe,
            this.colPhep});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvWorkSchedule.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvWorkSchedule.Location = new System.Drawing.Point(0, 402);
            this.dgvWorkSchedule.Name = "dgvWorkSchedule";
            this.dgvWorkSchedule.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvWorkSchedule.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvWorkSchedule.RowHeadersVisible = false;
            this.dgvWorkSchedule.RowHeadersWidth = 51;
            this.dgvWorkSchedule.RowTemplate.Height = 24;
            this.dgvWorkSchedule.Size = new System.Drawing.Size(1924, 631);
            this.dgvWorkSchedule.TabIndex = 16;
            // 
            // colMaLLV
            // 
            this.colMaLLV.HeaderText = "Mã lịch làm việc";
            this.colMaLLV.MinimumWidth = 6;
            this.colMaLLV.Name = "colMaLLV";
            this.colMaLLV.ReadOnly = true;
            // 
            // colMaNV
            // 
            this.colMaNV.HeaderText = "Mã nhân viên";
            this.colMaNV.MinimumWidth = 6;
            this.colMaNV.Name = "colMaNV";
            this.colMaNV.ReadOnly = true;
            // 
            // colNgayLam
            // 
            this.colNgayLam.HeaderText = "Ngày làm";
            this.colNgayLam.MinimumWidth = 6;
            this.colNgayLam.Name = "colNgayLam";
            this.colNgayLam.ReadOnly = true;
            // 
            // colCa
            // 
            this.colCa.HeaderText = "Ca";
            this.colCa.MinimumWidth = 6;
            this.colCa.Name = "colCa";
            this.colCa.ReadOnly = true;
            // 
            // colLoaiCa
            // 
            this.colLoaiCa.HeaderText = "Loại ca";
            this.colLoaiCa.MinimumWidth = 6;
            this.colLoaiCa.Name = "colLoaiCa";
            this.colLoaiCa.ReadOnly = true;
            // 
            // colThoiGianDen
            // 
            this.colThoiGianDen.HeaderText = "Thời gian đến";
            this.colThoiGianDen.MinimumWidth = 6;
            this.colThoiGianDen.Name = "colThoiGianDen";
            this.colThoiGianDen.ReadOnly = true;
            // 
            // colThoiGianVe
            // 
            this.colThoiGianVe.HeaderText = "Thời gian về";
            this.colThoiGianVe.MinimumWidth = 6;
            this.colThoiGianVe.Name = "colThoiGianVe";
            this.colThoiGianVe.ReadOnly = true;
            // 
            // colPhep
            // 
            this.colPhep.HeaderText = "Phép";
            this.colPhep.MinimumWidth = 6;
            this.colPhep.Name = "colPhep";
            this.colPhep.ReadOnly = true;
            // 
            // FrmMainMenu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1033);
            this.Controls.Add(this.dgvWorkSchedule);
            this.Controls.Add(this.dtpWorkSchedule);
            this.Controls.Add(this.lblWorkSchedule);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.pnlMenu);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmMainMenu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = " ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmManHinhChinh_Load);
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbStaffPicture)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvWorkSchedule)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnStaffs;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Button btnContractType;
        private System.Windows.Forms.Button btnStatistics;
        private System.Windows.Forms.Button btnCard;
        private System.Windows.Forms.Button btnAllowance;
        private System.Windows.Forms.Button btnWorkSchedule;
        private System.Windows.Forms.Button btnShift;
        private System.Windows.Forms.Button btnPosition;
        private System.Windows.Forms.Button btnDepartment;
        private System.Windows.Forms.Button btnAuthorization;
        private System.Windows.Forms.Button btnAccountInfo;
        private System.Windows.Forms.Button btnLogOut;
        private System.Windows.Forms.Button btnOperateHistory;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblStaffID;
        private System.Windows.Forms.Label lblValueDepartment;
        private System.Windows.Forms.Label lblDepartment;
        private System.Windows.Forms.Label lblValueStaffID;
        private System.Windows.Forms.Label lblValueFullName;
        private System.Windows.Forms.Label lblValuePosition;
        private System.Windows.Forms.Label lblFullName;
        private System.Windows.Forms.Label lblPosition;
        private System.Windows.Forms.Label lblWorkSchedule;
        private System.Windows.Forms.DateTimePicker dtpWorkSchedule;
        private System.Windows.Forms.DataGridView dgvWorkSchedule;
        private System.Windows.Forms.Label lblValueAbsence;
        private System.Windows.Forms.Label lblAbsenceRemain;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaLLV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNgayLam;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colLoaiCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThoiGianDen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThoiGianVe;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colPhep;
        private System.Windows.Forms.PictureBox pbStaffPicture;
    }
}