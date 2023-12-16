namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmAuthorization
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmAuthorization));
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.lblSearch = new System.Windows.Forms.Label();
            this.dgvAuthorization = new System.Windows.Forms.DataGridView();
            this.colMaQH = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMaCV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTenChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colGiaoDien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTenQuyenHan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCapQuyen = new System.Windows.Forms.DataGridViewCheckBoxColumn();
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
            this.cmbPosition = new System.Windows.Forms.ComboBox();
            this.lblAuthorization = new System.Windows.Forms.Label();
            this.rbSortByPosition = new System.Windows.Forms.RadioButton();
            this.rbSortByAuthority = new System.Windows.Forms.RadioButton();
            this.cmbAuthority = new System.Windows.Forms.ComboBox();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.cbCheckAll = new System.Windows.Forms.CheckBox();
            this.lblFontSỉze = new System.Windows.Forms.Label();
            this.nudFontSize = new System.Windows.Forms.NumericUpDown();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAuthorization)).BeginInit();
            this.pnlHeader.SuspendLayout();
            this.pnlMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudFontSize)).BeginInit();
            this.SuspendLayout();
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(972, 268);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 38;
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(821, 265);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 37;
            this.lblSearch.Text = "Tìm kiếm:";
            // 
            // dgvAuthorization
            // 
            this.dgvAuthorization.AllowUserToAddRows = false;
            this.dgvAuthorization.AllowUserToDeleteRows = false;
            this.dgvAuthorization.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvAuthorization.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvAuthorization.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvAuthorization.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAuthorization.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaQH,
            this.colMaCV,
            this.colTenChucVu,
            this.colGiaoDien,
            this.colTenQuyenHan,
            this.colCapQuyen});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 7.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvAuthorization.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvAuthorization.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvAuthorization.Location = new System.Drawing.Point(0, 302);
            this.dgvAuthorization.Name = "dgvAuthorization";
            this.dgvAuthorization.ReadOnly = true;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvAuthorization.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvAuthorization.RowHeadersVisible = false;
            this.dgvAuthorization.RowHeadersWidth = 51;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvAuthorization.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvAuthorization.RowTemplate.Height = 24;
            this.dgvAuthorization.Size = new System.Drawing.Size(1924, 691);
            this.dgvAuthorization.TabIndex = 36;
            this.dgvAuthorization.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvAuthorization_CellContentClick);
            // 
            // colMaQH
            // 
            this.colMaQH.FillWeight = 89.01614F;
            this.colMaQH.HeaderText = "Mã quyền hạn";
            this.colMaQH.MinimumWidth = 6;
            this.colMaQH.Name = "colMaQH";
            this.colMaQH.ReadOnly = true;
            // 
            // colMaCV
            // 
            this.colMaCV.FillWeight = 97.75209F;
            this.colMaCV.HeaderText = "Mã chức vụ";
            this.colMaCV.MinimumWidth = 6;
            this.colMaCV.Name = "colMaCV";
            this.colMaCV.ReadOnly = true;
            // 
            // colTenChucVu
            // 
            this.colTenChucVu.FillWeight = 104.9646F;
            this.colTenChucVu.HeaderText = "Tên chức vụ";
            this.colTenChucVu.MinimumWidth = 6;
            this.colTenChucVu.Name = "colTenChucVu";
            this.colTenChucVu.ReadOnly = true;
            // 
            // colGiaoDien
            // 
            this.colGiaoDien.FillWeight = 106.5138F;
            this.colGiaoDien.HeaderText = "Tên giao diện";
            this.colGiaoDien.MinimumWidth = 6;
            this.colGiaoDien.Name = "colGiaoDien";
            this.colGiaoDien.ReadOnly = true;
            // 
            // colTenQuyenHan
            // 
            this.colTenQuyenHan.FillWeight = 101.8007F;
            this.colTenQuyenHan.HeaderText = "Tên quyền hạn";
            this.colTenQuyenHan.MinimumWidth = 6;
            this.colTenQuyenHan.Name = "colTenQuyenHan";
            this.colTenQuyenHan.ReadOnly = true;
            // 
            // colCapQuyen
            // 
            this.colCapQuyen.FillWeight = 99.95273F;
            this.colCapQuyen.HeaderText = "Cấp quyền";
            this.colCapQuyen.MinimumWidth = 6;
            this.colCapQuyen.Name = "colCapQuyen";
            this.colCapQuyen.ReadOnly = true;
            this.colCapQuyen.Resizable = System.Windows.Forms.DataGridViewTriState.True;
            this.colCapQuyen.SortMode = System.Windows.Forms.DataGridViewColumnSortMode.Automatic;
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
            this.pnlHeader.TabIndex = 35;
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
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1229, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1053, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1229, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1053, 9);
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
            // cmbPosition
            // 
            this.cmbPosition.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPosition.FormattingEnabled = true;
            this.cmbPosition.Location = new System.Drawing.Point(250, 30);
            this.cmbPosition.Name = "cmbPosition";
            this.cmbPosition.Size = new System.Drawing.Size(264, 33);
            this.cmbPosition.TabIndex = 46;
            this.cmbPosition.SelectedIndexChanged += new System.EventHandler(this.cmbCheckChange);
            // 
            // lblAuthorization
            // 
            this.lblAuthorization.AutoSize = true;
            this.lblAuthorization.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAuthorization.Location = new System.Drawing.Point(858, 116);
            this.lblAuthorization.Name = "lblAuthorization";
            this.lblAuthorization.Size = new System.Drawing.Size(262, 51);
            this.lblAuthorization.TabIndex = 47;
            this.lblAuthorization.Text = "Phân quyền";
            // 
            // rbSortByPosition
            // 
            this.rbSortByPosition.AutoSize = true;
            this.rbSortByPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbSortByPosition.Location = new System.Drawing.Point(9, 31);
            this.rbSortByPosition.Name = "rbSortByPosition";
            this.rbSortByPosition.Size = new System.Drawing.Size(235, 33);
            this.rbSortByPosition.TabIndex = 48;
            this.rbSortByPosition.TabStop = true;
            this.rbSortByPosition.Text = "Lọc theo chức vụ:";
            this.rbSortByPosition.UseVisualStyleBackColor = true;
            this.rbSortByPosition.CheckedChanged += new System.EventHandler(this.rbSortByPosition_CheckedChanged);
            // 
            // rbSortByAuthority
            // 
            this.rbSortByAuthority.AutoSize = true;
            this.rbSortByAuthority.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbSortByAuthority.Location = new System.Drawing.Point(516, 31);
            this.rbSortByAuthority.Name = "rbSortByAuthority";
            this.rbSortByAuthority.Size = new System.Drawing.Size(267, 33);
            this.rbSortByAuthority.TabIndex = 50;
            this.rbSortByAuthority.TabStop = true;
            this.rbSortByAuthority.Text = "Lọc theo quyền hạn:";
            this.rbSortByAuthority.UseVisualStyleBackColor = true;
            this.rbSortByAuthority.CheckedChanged += new System.EventHandler(this.rbSortByAuthority_CheckedChanged);
            // 
            // cmbAuthority
            // 
            this.cmbAuthority.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbAuthority.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbAuthority.FormattingEnabled = true;
            this.cmbAuthority.Location = new System.Drawing.Point(789, 31);
            this.cmbAuthority.Name = "cmbAuthority";
            this.cmbAuthority.Size = new System.Drawing.Size(251, 33);
            this.cmbAuthority.TabIndex = 49;
            this.cmbAuthority.SelectedIndexChanged += new System.EventHandler(this.cmbCheckChange);
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.btnUpdate);
            this.pnlMenu.Controls.Add(this.cmbPosition);
            this.pnlMenu.Controls.Add(this.rbSortByPosition);
            this.pnlMenu.Controls.Add(this.cmbAuthority);
            this.pnlMenu.Controls.Add(this.rbSortByAuthority);
            this.pnlMenu.Location = new System.Drawing.Point(424, 170);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(1295, 87);
            this.pnlMenu.TabIndex = 51;
            // 
            // btnUpdate
            // 
            this.btnUpdate.AutoSize = true;
            this.btnUpdate.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnUpdate.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnUpdate.FlatAppearance.BorderSize = 0;
            this.btnUpdate.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnUpdate.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnUpdate.Image = global::QuanLyNhanSu.Properties.Resources.save;
            this.btnUpdate.Location = new System.Drawing.Point(1082, 17);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(158, 60);
            this.btnUpdate.TabIndex = 52;
            this.btnUpdate.Text = "Cập nhật";
            this.btnUpdate.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnUpdate.UseVisualStyleBackColor = false;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // cbCheckAll
            // 
            this.cbCheckAll.AutoSize = true;
            this.cbCheckAll.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cbCheckAll.Location = new System.Drawing.Point(1747, 263);
            this.cbCheckAll.Name = "cbCheckAll";
            this.cbCheckAll.Size = new System.Drawing.Size(165, 33);
            this.cbCheckAll.TabIndex = 52;
            this.cbCheckAll.Text = "Chọn tất cả";
            this.cbCheckAll.UseVisualStyleBackColor = true;
            this.cbCheckAll.CheckedChanged += new System.EventHandler(this.cbCheckAll_CheckedChanged);
            // 
            // lblFontSỉze
            // 
            this.lblFontSỉze.AutoSize = true;
            this.lblFontSỉze.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFontSỉze.Location = new System.Drawing.Point(1520, 268);
            this.lblFontSỉze.Name = "lblFontSỉze";
            this.lblFontSỉze.Size = new System.Drawing.Size(118, 32);
            this.lblFontSỉze.TabIndex = 68;
            this.lblFontSỉze.Text = "Cỡ chữ:";
            // 
            // nudFontSize
            // 
            this.nudFontSize.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.nudFontSize.Location = new System.Drawing.Point(1644, 265);
            this.nudFontSize.Minimum = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudFontSize.Name = "nudFontSize";
            this.nudFontSize.Size = new System.Drawing.Size(64, 34);
            this.nudFontSize.TabIndex = 67;
            this.nudFontSize.Value = new decimal(new int[] {
            1,
            0,
            0,
            0});
            this.nudFontSize.ValueChanged += new System.EventHandler(this.nudFontSize_ValueChanged);
            // 
            // FrmAuthorization
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 993);
            this.Controls.Add(this.lblFontSỉze);
            this.Controls.Add(this.nudFontSize);
            this.Controls.Add(this.cbCheckAll);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.lblAuthorization);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.dgvAuthorization);
            this.Controls.Add(this.pnlHeader);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmAuthorization";
            this.Text = "Phân quyền";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmPhanQuyen_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAuthorization)).EndInit();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.nudFontSize)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.DataGridView dgvAuthorization;
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
        private System.Windows.Forms.ComboBox cmbPosition;
        private System.Windows.Forms.Label lblAuthorization;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.RadioButton rbSortByPosition;
        private System.Windows.Forms.RadioButton rbSortByAuthority;
        private System.Windows.Forms.ComboBox cmbAuthority;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.CheckBox cbCheckAll;
        private System.Windows.Forms.Label lblFontSỉze;
        private System.Windows.Forms.NumericUpDown nudFontSize;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaQH;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaCV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTenChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colGiaoDien;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTenQuyenHan;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colCapQuyen;
    }
}