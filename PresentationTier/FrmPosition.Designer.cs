namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmPosition
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle1 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle2 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle3 = new System.Windows.Forms.DataGridViewCellStyle();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmPosition));
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
            this.dgvPosition = new System.Windows.Forms.DataGridView();
            this.colMaCV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTenChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongSoNhanVien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblPosition = new System.Windows.Forms.Label();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.cmbDepartment = new System.Windows.Forms.ComboBox();
            this.lblDepartment = new System.Windows.Forms.Label();
            this.btnCancel = new System.Windows.Forms.Button();
            this.btnEdit = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.txtTotalStaff = new System.Windows.Forms.TextBox();
            this.lblTotalStaff = new System.Windows.Forms.Label();
            this.txtPositionName = new System.Windows.Forms.TextBox();
            this.lblDepartmentName = new System.Windows.Forms.Label();
            this.txtPositionID = new System.Windows.Forms.TextBox();
            this.lblPositionID = new System.Windows.Forms.Label();
            this.lblSearch = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.errProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPosition)).BeginInit();
            this.pnlMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).BeginInit();
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
            this.pnlHeader.TabIndex = 1;
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
            // lblPositionLoginValue
            // 
            this.lblPositionLoginValue.AutoSize = true;
            this.lblPositionLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1181, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1005, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1181, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1005, 9);
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
            // dgvPosition
            // 
            this.dgvPosition.AllowUserToAddRows = false;
            this.dgvPosition.AllowUserToDeleteRows = false;
            this.dgvPosition.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvPosition.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvPosition.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvPosition.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvPosition.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaCV,
            this.colPhongBan,
            this.colTenChucVu,
            this.colTongSoNhanVien});
            this.dgvPosition.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvPosition.Location = new System.Drawing.Point(0, 363);
            this.dgvPosition.Name = "dgvPosition";
            this.dgvPosition.ReadOnly = true;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvPosition.RowHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvPosition.RowHeadersVisible = false;
            this.dgvPosition.RowHeadersWidth = 51;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvPosition.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvPosition.RowTemplate.Height = 24;
            this.dgvPosition.Size = new System.Drawing.Size(1924, 620);
            this.dgvPosition.TabIndex = 13;
            this.dgvPosition.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvPosition_CellClick);
            // 
            // colMaCV
            // 
            this.colMaCV.HeaderText = "Mã chức vụ";
            this.colMaCV.MinimumWidth = 6;
            this.colMaCV.Name = "colMaCV";
            this.colMaCV.ReadOnly = true;
            // 
            // colPhongBan
            // 
            this.colPhongBan.HeaderText = "Phòng ban";
            this.colPhongBan.MinimumWidth = 6;
            this.colPhongBan.Name = "colPhongBan";
            this.colPhongBan.ReadOnly = true;
            // 
            // colTenChucVu
            // 
            this.colTenChucVu.HeaderText = "Tên chức vụ";
            this.colTenChucVu.MinimumWidth = 6;
            this.colTenChucVu.Name = "colTenChucVu";
            this.colTenChucVu.ReadOnly = true;
            // 
            // colTongSoNhanVien
            // 
            this.colTongSoNhanVien.HeaderText = "Tổng số nhân viên";
            this.colTongSoNhanVien.MinimumWidth = 6;
            this.colTongSoNhanVien.Name = "colTongSoNhanVien";
            this.colTongSoNhanVien.ReadOnly = true;
            // 
            // lblPosition
            // 
            this.lblPosition.AutoSize = true;
            this.lblPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPosition.Location = new System.Drawing.Point(804, 116);
            this.lblPosition.Name = "lblPosition";
            this.lblPosition.Size = new System.Drawing.Size(254, 32);
            this.lblPosition.TabIndex = 31;
            this.lblPosition.Text = "Thông tin chức vụ";
            // 
            // pnlMenu
            // 
            this.pnlMenu.AutoSize = true;
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.cmbDepartment);
            this.pnlMenu.Controls.Add(this.lblDepartment);
            this.pnlMenu.Controls.Add(this.btnCancel);
            this.pnlMenu.Controls.Add(this.btnEdit);
            this.pnlMenu.Controls.Add(this.btnDelete);
            this.pnlMenu.Controls.Add(this.btnAdd);
            this.pnlMenu.Controls.Add(this.txtTotalStaff);
            this.pnlMenu.Controls.Add(this.lblTotalStaff);
            this.pnlMenu.Controls.Add(this.txtPositionName);
            this.pnlMenu.Controls.Add(this.lblDepartmentName);
            this.pnlMenu.Controls.Add(this.txtPositionID);
            this.pnlMenu.Controls.Add(this.lblPositionID);
            this.pnlMenu.Location = new System.Drawing.Point(447, 151);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(930, 170);
            this.pnlMenu.TabIndex = 30;
            // 
            // cmbDepartment
            // 
            this.cmbDepartment.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartment.FormattingEnabled = true;
            this.cmbDepartment.Location = new System.Drawing.Point(154, 54);
            this.cmbDepartment.Name = "cmbDepartment";
            this.cmbDepartment.Size = new System.Drawing.Size(240, 33);
            this.cmbDepartment.TabIndex = 4;
            // 
            // lblDepartment
            // 
            this.lblDepartment.AutoSize = true;
            this.lblDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartment.Location = new System.Drawing.Point(18, 57);
            this.lblDepartment.Name = "lblDepartment";
            this.lblDepartment.Size = new System.Drawing.Size(123, 25);
            this.lblDepartment.TabIndex = 43;
            this.lblDepartment.Text = "Phòng ban:";
            // 
            // btnCancel
            // 
            this.btnCancel.AutoSize = true;
            this.btnCancel.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnCancel.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnCancel.FlatAppearance.BorderSize = 0;
            this.btnCancel.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCancel.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCancel.Image = global::QuanLyNhanSu.Properties.Resources.cancel;
            this.btnCancel.Location = new System.Drawing.Point(638, 105);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(99, 49);
            this.btnCancel.TabIndex = 11;
            this.btnCancel.Text = "Huỷ";
            this.btnCancel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCancel.UseVisualStyleBackColor = false;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // btnEdit
            // 
            this.btnEdit.AutoSize = true;
            this.btnEdit.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnEdit.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnEdit.FlatAppearance.BorderSize = 0;
            this.btnEdit.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnEdit.Image = global::QuanLyNhanSu.Properties.Resources.fix;
            this.btnEdit.Location = new System.Drawing.Point(348, 105);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(100, 49);
            this.btnEdit.TabIndex = 9;
            this.btnEdit.Text = "Sửa";
            this.btnEdit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnEdit.UseVisualStyleBackColor = false;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.AutoSize = true;
            this.btnDelete.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnDelete.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDelete.FlatAppearance.BorderSize = 0;
            this.btnDelete.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnDelete.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDelete.Image = global::QuanLyNhanSu.Properties.Resources.delete;
            this.btnDelete.Location = new System.Drawing.Point(489, 105);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(102, 49);
            this.btnDelete.TabIndex = 10;
            this.btnDelete.Text = "Xoá";
            this.btnDelete.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnDelete.UseVisualStyleBackColor = false;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.AutoSize = true;
            this.btnAdd.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnAdd.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnAdd.FlatAppearance.BorderSize = 0;
            this.btnAdd.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAdd.Image = global::QuanLyNhanSu.Properties.Resources.add;
            this.btnAdd.Location = new System.Drawing.Point(190, 105);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(122, 49);
            this.btnAdd.TabIndex = 8;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // txtTotalStaff
            // 
            this.txtTotalStaff.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalStaff.Location = new System.Drawing.Point(622, 57);
            this.txtTotalStaff.Name = "txtTotalStaff";
            this.txtTotalStaff.Size = new System.Drawing.Size(234, 30);
            this.txtTotalStaff.TabIndex = 7;
            // 
            // lblTotalStaff
            // 
            this.lblTotalStaff.AutoSize = true;
            this.lblTotalStaff.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalStaff.Location = new System.Drawing.Point(417, 62);
            this.lblTotalStaff.Name = "lblTotalStaff";
            this.lblTotalStaff.Size = new System.Drawing.Size(198, 25);
            this.lblTotalStaff.TabIndex = 11;
            this.lblTotalStaff.Text = "Tổng số nhân viên:";
            // 
            // txtPositionName
            // 
            this.txtPositionName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPositionName.Location = new System.Drawing.Point(622, 15);
            this.txtPositionName.MaxLength = 50;
            this.txtPositionName.Name = "txtPositionName";
            this.txtPositionName.Size = new System.Drawing.Size(234, 30);
            this.txtPositionName.TabIndex = 5;
            this.txtPositionName.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // lblDepartmentName
            // 
            this.lblDepartmentName.AutoSize = true;
            this.lblDepartmentName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentName.Location = new System.Drawing.Point(417, 15);
            this.lblDepartmentName.Name = "lblDepartmentName";
            this.lblDepartmentName.Size = new System.Drawing.Size(138, 25);
            this.lblDepartmentName.TabIndex = 9;
            this.lblDepartmentName.Text = "Tên chức vụ:";
            // 
            // txtPositionID
            // 
            this.txtPositionID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPositionID.Location = new System.Drawing.Point(154, 12);
            this.txtPositionID.Name = "txtPositionID";
            this.txtPositionID.Size = new System.Drawing.Size(240, 30);
            this.txtPositionID.TabIndex = 3;
            this.txtPositionID.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // lblPositionID
            // 
            this.lblPositionID.AutoSize = true;
            this.lblPositionID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionID.Location = new System.Drawing.Point(18, 15);
            this.lblPositionID.Name = "lblPositionID";
            this.lblPositionID.Size = new System.Drawing.Size(130, 25);
            this.lblPositionID.TabIndex = 6;
            this.lblPositionID.Text = "Mã chức vụ:";
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(751, 328);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 33;
            this.lblSearch.Text = "Tìm kiếm:";
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(902, 327);
            this.txtSearch.MaxLength = 50;
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 12;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearch_TextChange);
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // errProvider
            // 
            this.errProvider.BlinkStyle = System.Windows.Forms.ErrorBlinkStyle.NeverBlink;
            this.errProvider.ContainerControl = this;
            // 
            // FrmPosition
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.dgvPosition);
            this.Controls.Add(this.lblPosition);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.pnlHeader);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmPosition";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Chức vụ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmQuanLyChucVu_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvPosition)).EndInit();
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

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
        private System.Windows.Forms.DataGridView dgvPosition;
        private System.Windows.Forms.Label lblPosition;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.TextBox txtTotalStaff;
        private System.Windows.Forms.Label lblTotalStaff;
        private System.Windows.Forms.TextBox txtPositionName;
        private System.Windows.Forms.Label lblDepartmentName;
        private System.Windows.Forms.TextBox txtPositionID;
        private System.Windows.Forms.Label lblPositionID;
        private System.Windows.Forms.ComboBox cmbDepartment;
        private System.Windows.Forms.Label lblDepartment;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.ErrorProvider errProvider;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaCV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTenChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongSoNhanVien;
    }
}