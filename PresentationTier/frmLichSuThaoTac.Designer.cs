namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmLichSuThaoTac
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            this.lblFullNameLogin = new System.Windows.Forms.Label();
            this.lblPositionLoginValue = new System.Windows.Forms.Label();
            this.lblPositionLogin = new System.Windows.Forms.Label();
            this.lblDepartmentLoginValue = new System.Windows.Forms.Label();
            this.lblDepartmentLogin = new System.Windows.Forms.Label();
            this.lblFullNameLoginValue = new System.Windows.Forms.Label();
            this.lblStaffIDLoginValue = new System.Windows.Forms.Label();
            this.lblStaffIDLogin = new System.Windows.Forms.Label();
            this.btnBack = new System.Windows.Forms.Button();
            this.lblOperateHistory = new System.Windows.Forms.Label();
            this.lblSearch = new System.Windows.Forms.Label();
            this.dgvOperateHistory = new System.Windows.Forms.DataGridView();
            this.colNgayio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colGiaoDien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThaoTac = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThaoTacThucHien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.dtpDate = new System.Windows.Forms.DateTimePicker();
            this.dtpMonth = new System.Windows.Forms.DateTimePicker();
            this.dtpYear = new System.Windows.Forms.DateTimePicker();
            this.pnlSortByTime = new System.Windows.Forms.Panel();
            this.rbYear = new System.Windows.Forms.RadioButton();
            this.rbMonth = new System.Windows.Forms.RadioButton();
            this.rbDate = new System.Windows.Forms.RadioButton();
            this.lblSortByTime = new System.Windows.Forms.Label();
            this.pnlSortByOperation = new System.Windows.Forms.Panel();
            this.rbLSortOperation = new System.Windows.Forms.RadioButton();
            this.rbAllOperation = new System.Windows.Forms.RadioButton();
            this.cmbOperation = new System.Windows.Forms.ComboBox();
            this.lblSortByOperation = new System.Windows.Forms.Label();
            this.pnlSortByInterface = new System.Windows.Forms.Panel();
            this.rbSortInterface = new System.Windows.Forms.RadioButton();
            this.rbAllInterface = new System.Windows.Forms.RadioButton();
            this.cmbInterface = new System.Windows.Forms.ComboBox();
            this.lblSortByInterface = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvOperateHistory)).BeginInit();
            this.pnlHeader.SuspendLayout();
            this.pnlSortByTime.SuspendLayout();
            this.pnlSortByOperation.SuspendLayout();
            this.pnlSortByInterface.SuspendLayout();
            this.SuspendLayout();
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
            // lblPositionLoginValue
            // 
            this.lblPositionLoginValue.AutoSize = true;
            this.lblPositionLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1224, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1048, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1224, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1048, 9);
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
            // lblOperateHistory
            // 
            this.lblOperateHistory.AutoSize = true;
            this.lblOperateHistory.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblOperateHistory.Location = new System.Drawing.Point(797, 116);
            this.lblOperateHistory.Name = "lblOperateHistory";
            this.lblOperateHistory.Size = new System.Drawing.Size(339, 51);
            this.lblOperateHistory.TabIndex = 54;
            this.lblOperateHistory.Text = "Lịch sử thao tác";
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(740, 284);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 50;
            this.lblSearch.Text = "Tìm kiếm:";
            // 
            // dgvOperateHistory
            // 
            this.dgvOperateHistory.AllowUserToAddRows = false;
            this.dgvOperateHistory.AllowUserToDeleteRows = false;
            this.dgvOperateHistory.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvOperateHistory.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvOperateHistory.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvOperateHistory.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvOperateHistory.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvOperateHistory.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colNgayio,
            this.colMaNV,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu,
            this.colGiaoDien,
            this.colThaoTac,
            this.colThaoTacThucHien});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvOperateHistory.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvOperateHistory.Location = new System.Drawing.Point(0, 323);
            this.dgvOperateHistory.Name = "dgvOperateHistory";
            this.dgvOperateHistory.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvOperateHistory.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvOperateHistory.RowHeadersVisible = false;
            this.dgvOperateHistory.RowHeadersWidth = 51;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvOperateHistory.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvOperateHistory.RowTemplate.Height = 24;
            this.dgvOperateHistory.Size = new System.Drawing.Size(1924, 710);
            this.dgvOperateHistory.TabIndex = 5;
            // 
            // colNgayio
            // 
            this.colNgayio.HeaderText = "Ngày giờ";
            this.colNgayio.MinimumWidth = 6;
            this.colNgayio.Name = "colNgayio";
            this.colNgayio.ReadOnly = true;
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
            // colGiaoDien
            // 
            this.colGiaoDien.HeaderText = "Giao diện";
            this.colGiaoDien.MinimumWidth = 6;
            this.colGiaoDien.Name = "colGiaoDien";
            this.colGiaoDien.ReadOnly = true;
            // 
            // colThaoTac
            // 
            this.colThaoTac.HeaderText = "Thao tác";
            this.colThaoTac.MinimumWidth = 6;
            this.colThaoTac.Name = "colThaoTac";
            this.colThaoTac.ReadOnly = true;
            // 
            // colThaoTacThucHien
            // 
            this.colThaoTacThucHien.HeaderText = "Thao tác thực hiện";
            this.colThaoTacThucHien.MinimumWidth = 6;
            this.colThaoTacThucHien.Name = "colThaoTacThucHien";
            this.colThaoTacThucHien.ReadOnly = true;
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
            this.pnlHeader.TabIndex = 48;
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
            this.btnRefresh.TabIndex = 2;
            this.btnRefresh.Text = "Refresh";
            this.btnRefresh.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnRefresh.UseVisualStyleBackColor = false;
            this.btnRefresh.Click += new System.EventHandler(this.btnRefresh_Click);
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(891, 287);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 3;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearchTextChanged);
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // dtpDate
            // 
            this.dtpDate.CustomFormat = "dd/MM/yyyy";
            this.dtpDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpDate.Location = new System.Drawing.Point(123, 62);
            this.dtpDate.Name = "dtpDate";
            this.dtpDate.Size = new System.Drawing.Size(151, 30);
            this.dtpDate.TabIndex = 4;
            this.dtpDate.ValueChanged += new System.EventHandler(this.dtpDate_ValueChanged);
            // 
            // dtpMonth
            // 
            this.dtpMonth.CustomFormat = "MM/yyyy";
            this.dtpMonth.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpMonth.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpMonth.Location = new System.Drawing.Point(416, 63);
            this.dtpMonth.Name = "dtpMonth";
            this.dtpMonth.ShowUpDown = true;
            this.dtpMonth.Size = new System.Drawing.Size(136, 30);
            this.dtpMonth.TabIndex = 56;
            this.dtpMonth.ValueChanged += new System.EventHandler(this.dtpMonth_ValueChanged);
            // 
            // dtpYear
            // 
            this.dtpYear.CustomFormat = "yyyy";
            this.dtpYear.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpYear.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpYear.Location = new System.Drawing.Point(670, 62);
            this.dtpYear.Name = "dtpYear";
            this.dtpYear.ShowUpDown = true;
            this.dtpYear.Size = new System.Drawing.Size(105, 30);
            this.dtpYear.TabIndex = 58;
            this.dtpYear.ValueChanged += new System.EventHandler(this.dtpYear_ValueChanged);
            // 
            // pnlSortByTime
            // 
            this.pnlSortByTime.BackColor = System.Drawing.SystemColors.Info;
            this.pnlSortByTime.Controls.Add(this.rbYear);
            this.pnlSortByTime.Controls.Add(this.rbMonth);
            this.pnlSortByTime.Controls.Add(this.rbDate);
            this.pnlSortByTime.Controls.Add(this.lblSortByTime);
            this.pnlSortByTime.Controls.Add(this.dtpYear);
            this.pnlSortByTime.Controls.Add(this.dtpMonth);
            this.pnlSortByTime.Controls.Add(this.dtpDate);
            this.pnlSortByTime.Location = new System.Drawing.Point(41, 170);
            this.pnlSortByTime.Name = "pnlSortByTime";
            this.pnlSortByTime.Size = new System.Drawing.Size(791, 111);
            this.pnlSortByTime.TabIndex = 62;
            // 
            // rbYear
            // 
            this.rbYear.AutoSize = true;
            this.rbYear.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbYear.Location = new System.Drawing.Point(558, 59);
            this.rbYear.Name = "rbYear";
            this.rbYear.Size = new System.Drawing.Size(106, 36);
            this.rbYear.TabIndex = 65;
            this.rbYear.TabStop = true;
            this.rbYear.Text = "Năm:";
            this.rbYear.UseVisualStyleBackColor = true;
            this.rbYear.CheckedChanged += new System.EventHandler(this.rbYear_CheckedChanged);
            // 
            // rbMonth
            // 
            this.rbMonth.AutoSize = true;
            this.rbMonth.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbMonth.Location = new System.Drawing.Point(280, 59);
            this.rbMonth.Name = "rbMonth";
            this.rbMonth.Size = new System.Drawing.Size(130, 36);
            this.rbMonth.TabIndex = 64;
            this.rbMonth.TabStop = true;
            this.rbMonth.Text = "Tháng:";
            this.rbMonth.UseVisualStyleBackColor = true;
            this.rbMonth.CheckedChanged += new System.EventHandler(this.rbMonth_CheckedChanged);
            // 
            // rbDate
            // 
            this.rbDate.AutoSize = true;
            this.rbDate.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbDate.Location = new System.Drawing.Point(3, 59);
            this.rbDate.Name = "rbDate";
            this.rbDate.Size = new System.Drawing.Size(114, 36);
            this.rbDate.TabIndex = 63;
            this.rbDate.TabStop = true;
            this.rbDate.Text = "Ngày:";
            this.rbDate.UseVisualStyleBackColor = true;
            this.rbDate.CheckedChanged += new System.EventHandler(this.rbDate_CheckedChanged);
            // 
            // lblSortByTime
            // 
            this.lblSortByTime.AutoSize = true;
            this.lblSortByTime.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSortByTime.Location = new System.Drawing.Point(295, 12);
            this.lblSortByTime.Name = "lblSortByTime";
            this.lblSortByTime.Size = new System.Drawing.Size(257, 32);
            this.lblSortByTime.TabIndex = 62;
            this.lblSortByTime.Text = "Lọc theo thời gian";
            // 
            // pnlSortByOperation
            // 
            this.pnlSortByOperation.BackColor = System.Drawing.SystemColors.Info;
            this.pnlSortByOperation.Controls.Add(this.rbLSortOperation);
            this.pnlSortByOperation.Controls.Add(this.rbAllOperation);
            this.pnlSortByOperation.Controls.Add(this.cmbOperation);
            this.pnlSortByOperation.Controls.Add(this.lblSortByOperation);
            this.pnlSortByOperation.Location = new System.Drawing.Point(1344, 170);
            this.pnlSortByOperation.Name = "pnlSortByOperation";
            this.pnlSortByOperation.Size = new System.Drawing.Size(515, 111);
            this.pnlSortByOperation.TabIndex = 63;
            // 
            // rbLSortOperation
            // 
            this.rbLSortOperation.AutoSize = true;
            this.rbLSortOperation.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbLSortOperation.Location = new System.Drawing.Point(155, 63);
            this.rbLSortOperation.Name = "rbLSortOperation";
            this.rbLSortOperation.Size = new System.Drawing.Size(93, 36);
            this.rbLSortOperation.TabIndex = 67;
            this.rbLSortOperation.TabStop = true;
            this.rbLSortOperation.Text = "Lọc:";
            this.rbLSortOperation.UseVisualStyleBackColor = true;
            this.rbLSortOperation.CheckedChanged += new System.EventHandler(this.rbSortOperation_CheckedChanged);
            // 
            // rbAllOperation
            // 
            this.rbAllOperation.AutoSize = true;
            this.rbAllOperation.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbAllOperation.Location = new System.Drawing.Point(3, 63);
            this.rbAllOperation.Name = "rbAllOperation";
            this.rbAllOperation.Size = new System.Drawing.Size(146, 36);
            this.rbAllOperation.TabIndex = 66;
            this.rbAllOperation.TabStop = true;
            this.rbAllOperation.Text = "Toàn bộ";
            this.rbAllOperation.UseVisualStyleBackColor = true;
            this.rbAllOperation.Click += new System.EventHandler(this.rbAllOperation_Click);
            // 
            // cmbOperation
            // 
            this.cmbOperation.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbOperation.DropDownWidth = 233;
            this.cmbOperation.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbOperation.FormattingEnabled = true;
            this.cmbOperation.Location = new System.Drawing.Point(254, 62);
            this.cmbOperation.Name = "cmbOperation";
            this.cmbOperation.Size = new System.Drawing.Size(233, 33);
            this.cmbOperation.TabIndex = 65;
            this.cmbOperation.SelectedIndexChanged += new System.EventHandler(this.cmbOperation_SelectedIndexChanged);
            // 
            // lblSortByOperation
            // 
            this.lblSortByOperation.AutoSize = true;
            this.lblSortByOperation.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSortByOperation.Location = new System.Drawing.Point(132, 12);
            this.lblSortByOperation.Name = "lblSortByOperation";
            this.lblSortByOperation.Size = new System.Drawing.Size(248, 32);
            this.lblSortByOperation.TabIndex = 63;
            this.lblSortByOperation.Text = "Lọc theo thao tác";
            // 
            // pnlSortByInterface
            // 
            this.pnlSortByInterface.BackColor = System.Drawing.SystemColors.Info;
            this.pnlSortByInterface.Controls.Add(this.rbSortInterface);
            this.pnlSortByInterface.Controls.Add(this.rbAllInterface);
            this.pnlSortByInterface.Controls.Add(this.cmbInterface);
            this.pnlSortByInterface.Controls.Add(this.lblSortByInterface);
            this.pnlSortByInterface.Location = new System.Drawing.Point(838, 170);
            this.pnlSortByInterface.Name = "pnlSortByInterface";
            this.pnlSortByInterface.Size = new System.Drawing.Size(500, 111);
            this.pnlSortByInterface.TabIndex = 64;
            // 
            // rbSortInterface
            // 
            this.rbSortInterface.AutoSize = true;
            this.rbSortInterface.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbSortInterface.Location = new System.Drawing.Point(155, 63);
            this.rbSortInterface.Name = "rbSortInterface";
            this.rbSortInterface.Size = new System.Drawing.Size(93, 36);
            this.rbSortInterface.TabIndex = 67;
            this.rbSortInterface.TabStop = true;
            this.rbSortInterface.Text = "Lọc:";
            this.rbSortInterface.UseVisualStyleBackColor = true;
            this.rbSortInterface.CheckedChanged += new System.EventHandler(this.rbSortInterface_CheckedChanged);
            // 
            // rbAllInterface
            // 
            this.rbAllInterface.AutoSize = true;
            this.rbAllInterface.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbAllInterface.Location = new System.Drawing.Point(3, 62);
            this.rbAllInterface.Name = "rbAllInterface";
            this.rbAllInterface.Size = new System.Drawing.Size(146, 36);
            this.rbAllInterface.TabIndex = 66;
            this.rbAllInterface.TabStop = true;
            this.rbAllInterface.Text = "Toàn bộ";
            this.rbAllInterface.UseVisualStyleBackColor = true;
            this.rbAllInterface.Click += new System.EventHandler(this.rbAllInterface_Click);
            // 
            // cmbInterface
            // 
            this.cmbInterface.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbInterface.DropDownWidth = 233;
            this.cmbInterface.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbInterface.FormattingEnabled = true;
            this.cmbInterface.Location = new System.Drawing.Point(254, 65);
            this.cmbInterface.Name = "cmbInterface";
            this.cmbInterface.Size = new System.Drawing.Size(233, 33);
            this.cmbInterface.TabIndex = 65;
            this.cmbInterface.SelectedIndexChanged += new System.EventHandler(this.cmbInterface_SelectedIndexChanged);
            // 
            // lblSortByInterface
            // 
            this.lblSortByInterface.AutoSize = true;
            this.lblSortByInterface.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSortByInterface.Location = new System.Drawing.Point(139, 12);
            this.lblSortByInterface.Name = "lblSortByInterface";
            this.lblSortByInterface.Size = new System.Drawing.Size(265, 32);
            this.lblSortByInterface.TabIndex = 63;
            this.lblSortByInterface.Text = "Lọc theo giao diện";
            // 
            // FrmLichSuThaoTac
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1033);
            this.Controls.Add(this.pnlSortByInterface);
            this.Controls.Add(this.pnlSortByOperation);
            this.Controls.Add(this.pnlSortByTime);
            this.Controls.Add(this.lblOperateHistory);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.dgvOperateHistory);
            this.Controls.Add(this.pnlHeader);
            this.Controls.Add(this.txtSearch);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmLichSuThaoTac";
            this.Text = "frmLichSuThaoTac";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmLichSuThaoTac_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvOperateHistory)).EndInit();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlSortByTime.ResumeLayout(false);
            this.pnlSortByTime.PerformLayout();
            this.pnlSortByOperation.ResumeLayout(false);
            this.pnlSortByOperation.PerformLayout();
            this.pnlSortByInterface.ResumeLayout(false);
            this.pnlSortByInterface.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblFullNameLogin;
        private System.Windows.Forms.Label lblPositionLoginValue;
        private System.Windows.Forms.Label lblPositionLogin;
        private System.Windows.Forms.Label lblDepartmentLoginValue;
        private System.Windows.Forms.Label lblDepartmentLogin;
        private System.Windows.Forms.Label lblFullNameLoginValue;
        private System.Windows.Forms.Label lblStaffIDLoginValue;
        private System.Windows.Forms.Label lblStaffIDLogin;
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.Label lblOperateHistory;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.DataGridView dgvOperateHistory;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.DateTimePicker dtpDate;
        private System.Windows.Forms.DateTimePicker dtpMonth;
        private System.Windows.Forms.DateTimePicker dtpYear;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNgayio;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colGiaoDien;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThaoTac;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThaoTacThucHien;
        private System.Windows.Forms.Panel pnlSortByTime;
        private System.Windows.Forms.Label lblSortByTime;
        private System.Windows.Forms.Panel pnlSortByOperation;
        private System.Windows.Forms.ComboBox cmbOperation;
        private System.Windows.Forms.Label lblSortByOperation;
        private System.Windows.Forms.RadioButton rbYear;
        private System.Windows.Forms.RadioButton rbMonth;
        private System.Windows.Forms.RadioButton rbDate;
        private System.Windows.Forms.RadioButton rbLSortOperation;
        private System.Windows.Forms.RadioButton rbAllOperation;
        private System.Windows.Forms.Panel pnlSortByInterface;
        private System.Windows.Forms.RadioButton rbSortInterface;
        private System.Windows.Forms.RadioButton rbAllInterface;
        private System.Windows.Forms.ComboBox cmbInterface;
        private System.Windows.Forms.Label lblSortByInterface;
    }
}