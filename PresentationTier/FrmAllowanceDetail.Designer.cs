namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmAllowanceDetail
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
            this.pnlFunction = new System.Windows.Forms.Panel();
            this.pbStaffPicture = new System.Windows.Forms.PictureBox();
            this.cmbPosition = new System.Windows.Forms.ComboBox();
            this.lblPosition = new System.Windows.Forms.Label();
            this.cmbDepartment = new System.Windows.Forms.ComboBox();
            this.txtFullName = new System.Windows.Forms.TextBox();
            this.lblFullName = new System.Windows.Forms.Label();
            this.cmbStaffID = new System.Windows.Forms.ComboBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.lblStaffID = new System.Windows.Forms.Label();
            this.lblDepartment = new System.Windows.Forms.Label();
            this.pnlInfo = new System.Windows.Forms.Panel();
            this.txtTotalAmount = new System.Windows.Forms.TextBox();
            this.lblTotalAmount = new System.Windows.Forms.Label();
            this.txtAllowamceName = new System.Windows.Forms.TextBox();
            this.lblAllowanceName = new System.Windows.Forms.Label();
            this.txtStaffAmount = new System.Windows.Forms.TextBox();
            this.lblStaffAmount = new System.Windows.Forms.Label();
            this.txtAllowanceID = new System.Windows.Forms.TextBox();
            this.txtAmount = new System.Windows.Forms.TextBox();
            this.lblAllowanceAmount = new System.Windows.Forms.Label();
            this.lblAllowanceID = new System.Windows.Forms.Label();
            this.lblAllowanceDetail = new System.Windows.Forms.Label();
            this.dgvAllowanceDetail = new System.Windows.Forms.DataGridView();
            this.colMaPC = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblAddStaff = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.lblSearch = new System.Windows.Forms.Label();
            this.pnlHeader.SuspendLayout();
            this.pnlFunction.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbStaffPicture)).BeginInit();
            this.pnlInfo.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAllowanceDetail)).BeginInit();
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
            this.pnlHeader.Size = new System.Drawing.Size(1924, 110);
            this.pnlHeader.TabIndex = 11;
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
            this.btnRefresh.Size = new System.Drawing.Size(144, 110);
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
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1194, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1018, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1194, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1018, 9);
            this.lblDepartmentLogin.Name = "lblDepartmentLogin";
            this.lblDepartmentLogin.Size = new System.Drawing.Size(170, 32);
            this.lblDepartmentLogin.TabIndex = 5;
            this.lblDepartmentLogin.Text = "Phòng ban:";
            // 
            // lblFullNameLoginValue
            // 
            this.lblFullNameLoginValue.AutoSize = true;
            this.lblFullNameLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullNameLoginValue.Location = new System.Drawing.Point(534, 72);
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
            this.lblFullNameLogin.Location = new System.Drawing.Point(323, 72);
            this.lblFullNameLogin.Name = "lblFullNameLogin";
            this.lblFullNameLogin.Size = new System.Drawing.Size(112, 32);
            this.lblFullNameLogin.TabIndex = 3;
            this.lblFullNameLogin.Text = "Họ tên:";
            // 
            // lblStaffIDLoginValue
            // 
            this.lblStaffIDLoginValue.AutoSize = true;
            this.lblStaffIDLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffIDLoginValue.Location = new System.Drawing.Point(534, 9);
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
            this.lblStaffIDLogin.Location = new System.Drawing.Point(323, 9);
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
            this.btnBack.Size = new System.Drawing.Size(142, 110);
            this.btnBack.TabIndex = 1;
            this.btnBack.Text = "Trở về";
            this.btnBack.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnBack.UseVisualStyleBackColor = false;
            this.btnBack.Click += new System.EventHandler(this.btnBack_Click);
            // 
            // pnlFunction
            // 
            this.pnlFunction.BackColor = System.Drawing.SystemColors.Info;
            this.pnlFunction.Controls.Add(this.pbStaffPicture);
            this.pnlFunction.Controls.Add(this.cmbPosition);
            this.pnlFunction.Controls.Add(this.lblPosition);
            this.pnlFunction.Controls.Add(this.cmbDepartment);
            this.pnlFunction.Controls.Add(this.txtFullName);
            this.pnlFunction.Controls.Add(this.lblFullName);
            this.pnlFunction.Controls.Add(this.cmbStaffID);
            this.pnlFunction.Controls.Add(this.btnAdd);
            this.pnlFunction.Controls.Add(this.lblStaffID);
            this.pnlFunction.Controls.Add(this.lblDepartment);
            this.pnlFunction.Location = new System.Drawing.Point(681, 148);
            this.pnlFunction.Name = "pnlFunction";
            this.pnlFunction.Size = new System.Drawing.Size(1197, 204);
            this.pnlFunction.TabIndex = 66;
            // 
            // pbStaffPicture
            // 
            this.pbStaffPicture.Image = global::QuanLyNhanSu.Properties.Resources.image;
            this.pbStaffPicture.Location = new System.Drawing.Point(971, 9);
            this.pbStaffPicture.Name = "pbStaffPicture";
            this.pbStaffPicture.Size = new System.Drawing.Size(173, 177);
            this.pbStaffPicture.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbStaffPicture.TabIndex = 82;
            this.pbStaffPicture.TabStop = false;
            // 
            // cmbPosition
            // 
            this.cmbPosition.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPosition.FormattingEnabled = true;
            this.cmbPosition.Location = new System.Drawing.Point(648, 22);
            this.cmbPosition.Name = "cmbPosition";
            this.cmbPosition.Size = new System.Drawing.Size(268, 33);
            this.cmbPosition.TabIndex = 12;
            this.cmbPosition.SelectedIndexChanged += new System.EventHandler(this.cmbPositionSelectedIndexChanged);
            // 
            // lblPosition
            // 
            this.lblPosition.AutoSize = true;
            this.lblPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPosition.Location = new System.Drawing.Point(459, 25);
            this.lblPosition.Name = "lblPosition";
            this.lblPosition.Size = new System.Drawing.Size(99, 25);
            this.lblPosition.TabIndex = 68;
            this.lblPosition.Text = "Chức vụ:";
            // 
            // cmbDepartment
            // 
            this.cmbDepartment.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartment.FormattingEnabled = true;
            this.cmbDepartment.Location = new System.Drawing.Point(185, 22);
            this.cmbDepartment.Name = "cmbDepartment";
            this.cmbDepartment.Size = new System.Drawing.Size(263, 33);
            this.cmbDepartment.TabIndex = 11;
            this.cmbDepartment.SelectedIndexChanged += new System.EventHandler(this.cmbDepartment_SelectedIndexChanged);
            // 
            // txtFullName
            // 
            this.txtFullName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFullName.Location = new System.Drawing.Point(648, 76);
            this.txtFullName.Name = "txtFullName";
            this.txtFullName.Size = new System.Drawing.Size(268, 30);
            this.txtFullName.TabIndex = 14;
            // 
            // lblFullName
            // 
            this.lblFullName.AutoSize = true;
            this.lblFullName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullName.Location = new System.Drawing.Point(459, 79);
            this.lblFullName.Name = "lblFullName";
            this.lblFullName.Size = new System.Drawing.Size(182, 25);
            this.lblFullName.TabIndex = 63;
            this.lblFullName.Text = "Họ tên nhân viên:";
            // 
            // cmbStaffID
            // 
            this.cmbStaffID.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbStaffID.FormattingEnabled = true;
            this.cmbStaffID.Location = new System.Drawing.Point(185, 70);
            this.cmbStaffID.Name = "cmbStaffID";
            this.cmbStaffID.Size = new System.Drawing.Size(263, 33);
            this.cmbStaffID.TabIndex = 13;
            this.cmbStaffID.SelectedIndexChanged += new System.EventHandler(this.cmbStaffID_SelectedIndexChanged);
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
            this.btnAdd.Location = new System.Drawing.Point(446, 134);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(109, 49);
            this.btnAdd.TabIndex = 18;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // lblStaffID
            // 
            this.lblStaffID.AutoSize = true;
            this.lblStaffID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffID.Location = new System.Drawing.Point(23, 73);
            this.lblStaffID.Name = "lblStaffID";
            this.lblStaffID.Size = new System.Drawing.Size(149, 25);
            this.lblStaffID.TabIndex = 53;
            this.lblStaffID.Text = "Mã nhân viên:";
            // 
            // lblDepartment
            // 
            this.lblDepartment.AutoSize = true;
            this.lblDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartment.Location = new System.Drawing.Point(23, 21);
            this.lblDepartment.Name = "lblDepartment";
            this.lblDepartment.Size = new System.Drawing.Size(123, 25);
            this.lblDepartment.TabIndex = 55;
            this.lblDepartment.Text = "Phòng ban:";
            // 
            // pnlInfo
            // 
            this.pnlInfo.BackColor = System.Drawing.SystemColors.Info;
            this.pnlInfo.Controls.Add(this.txtTotalAmount);
            this.pnlInfo.Controls.Add(this.lblTotalAmount);
            this.pnlInfo.Controls.Add(this.txtAllowamceName);
            this.pnlInfo.Controls.Add(this.lblAllowanceName);
            this.pnlInfo.Controls.Add(this.txtStaffAmount);
            this.pnlInfo.Controls.Add(this.lblStaffAmount);
            this.pnlInfo.Controls.Add(this.txtAllowanceID);
            this.pnlInfo.Controls.Add(this.txtAmount);
            this.pnlInfo.Controls.Add(this.lblAllowanceAmount);
            this.pnlInfo.Controls.Add(this.lblAllowanceID);
            this.pnlInfo.Location = new System.Drawing.Point(76, 148);
            this.pnlInfo.Name = "pnlInfo";
            this.pnlInfo.Size = new System.Drawing.Size(536, 221);
            this.pnlInfo.TabIndex = 65;
            // 
            // txtTotalAmount
            // 
            this.txtTotalAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalAmount.Location = new System.Drawing.Point(229, 166);
            this.txtTotalAmount.Name = "txtTotalAmount";
            this.txtTotalAmount.Size = new System.Drawing.Size(285, 30);
            this.txtTotalAmount.TabIndex = 76;
            // 
            // lblTotalAmount
            // 
            this.lblTotalAmount.AutoSize = true;
            this.lblTotalAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalAmount.Location = new System.Drawing.Point(15, 168);
            this.lblTotalAmount.Name = "lblTotalAmount";
            this.lblTotalAmount.Size = new System.Drawing.Size(110, 25);
            this.lblTotalAmount.TabIndex = 77;
            this.lblTotalAmount.Text = "Tổng tiền:";
            // 
            // txtAllowamceName
            // 
            this.txtAllowamceName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAllowamceName.Location = new System.Drawing.Point(229, 58);
            this.txtAllowamceName.Name = "txtAllowamceName";
            this.txtAllowamceName.Size = new System.Drawing.Size(285, 30);
            this.txtAllowamceName.TabIndex = 4;
            // 
            // lblAllowanceName
            // 
            this.lblAllowanceName.AutoSize = true;
            this.lblAllowanceName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAllowanceName.Location = new System.Drawing.Point(15, 58);
            this.lblAllowanceName.Name = "lblAllowanceName";
            this.lblAllowanceName.Size = new System.Drawing.Size(140, 25);
            this.lblAllowanceName.TabIndex = 75;
            this.lblAllowanceName.Text = "Tên phụ cấp:";
            // 
            // txtStaffAmount
            // 
            this.txtStaffAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStaffAmount.Location = new System.Drawing.Point(229, 130);
            this.txtStaffAmount.Name = "txtStaffAmount";
            this.txtStaffAmount.Size = new System.Drawing.Size(285, 30);
            this.txtStaffAmount.TabIndex = 6;
            // 
            // lblStaffAmount
            // 
            this.lblStaffAmount.AutoSize = true;
            this.lblStaffAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffAmount.Location = new System.Drawing.Point(15, 132);
            this.lblStaffAmount.Name = "lblStaffAmount";
            this.lblStaffAmount.Size = new System.Drawing.Size(205, 25);
            this.lblStaffAmount.TabIndex = 72;
            this.lblStaffAmount.Text = "Số lượng nhân viên:";
            // 
            // txtAllowanceID
            // 
            this.txtAllowanceID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAllowanceID.Location = new System.Drawing.Point(229, 22);
            this.txtAllowanceID.Name = "txtAllowanceID";
            this.txtAllowanceID.Size = new System.Drawing.Size(285, 30);
            this.txtAllowanceID.TabIndex = 3;
            // 
            // txtAmount
            // 
            this.txtAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAmount.Location = new System.Drawing.Point(229, 94);
            this.txtAmount.Name = "txtAmount";
            this.txtAmount.Size = new System.Drawing.Size(285, 30);
            this.txtAmount.TabIndex = 5;
            // 
            // lblAllowanceAmount
            // 
            this.lblAllowanceAmount.AutoSize = true;
            this.lblAllowanceAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAllowanceAmount.Location = new System.Drawing.Point(15, 96);
            this.lblAllowanceAmount.Name = "lblAllowanceAmount";
            this.lblAllowanceAmount.Size = new System.Drawing.Size(145, 25);
            this.lblAllowanceAmount.TabIndex = 4;
            this.lblAllowanceAmount.Text = "Tiền phụ cấp:";
            // 
            // lblAllowanceID
            // 
            this.lblAllowanceID.AutoSize = true;
            this.lblAllowanceID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAllowanceID.Location = new System.Drawing.Point(15, 18);
            this.lblAllowanceID.Name = "lblAllowanceID";
            this.lblAllowanceID.Size = new System.Drawing.Size(132, 25);
            this.lblAllowanceID.TabIndex = 0;
            this.lblAllowanceID.Text = "Mã phụ cấp:";
            // 
            // lblAllowanceDetail
            // 
            this.lblAllowanceDetail.AutoSize = true;
            this.lblAllowanceDetail.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAllowanceDetail.Location = new System.Drawing.Point(171, 113);
            this.lblAllowanceDetail.Name = "lblAllowanceDetail";
            this.lblAllowanceDetail.Size = new System.Drawing.Size(357, 32);
            this.lblAllowanceDetail.TabIndex = 77;
            this.lblAllowanceDetail.Text = "Thông tin chi tiết phụ cấp";
            // 
            // dgvAllowanceDetail
            // 
            this.dgvAllowanceDetail.AllowUserToAddRows = false;
            this.dgvAllowanceDetail.AllowUserToDeleteRows = false;
            this.dgvAllowanceDetail.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvAllowanceDetail.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvAllowanceDetail.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvAllowanceDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAllowanceDetail.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaPC,
            this.colMaNV,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu});
            this.dgvAllowanceDetail.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvAllowanceDetail.Location = new System.Drawing.Point(0, 418);
            this.dgvAllowanceDetail.Name = "dgvAllowanceDetail";
            this.dgvAllowanceDetail.ReadOnly = true;
            this.dgvAllowanceDetail.RowHeadersVisible = false;
            this.dgvAllowanceDetail.RowHeadersWidthSizeMode = System.Windows.Forms.DataGridViewRowHeadersWidthSizeMode.AutoSizeToAllHeaders;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvAllowanceDetail.RowsDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvAllowanceDetail.RowTemplate.Height = 24;
            this.dgvAllowanceDetail.Size = new System.Drawing.Size(1924, 585);
            this.dgvAllowanceDetail.TabIndex = 78;
            this.dgvAllowanceDetail.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCardDetail_CellClick);
            // 
            // colMaPC
            // 
            this.colMaPC.HeaderText = "Mã phụ cấp";
            this.colMaPC.MinimumWidth = 6;
            this.colMaPC.Name = "colMaPC";
            this.colMaPC.ReadOnly = true;
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
            // lblAddStaff
            // 
            this.lblAddStaff.AutoSize = true;
            this.lblAddStaff.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAddStaff.Location = new System.Drawing.Point(1194, 113);
            this.lblAddStaff.Name = "lblAddStaff";
            this.lblAddStaff.Size = new System.Drawing.Size(231, 32);
            this.lblAddStaff.TabIndex = 79;
            this.lblAddStaff.Text = "Thêm nhân viên";
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(852, 370);
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 80;
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(701, 367);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 81;
            this.lblSearch.Text = "Tìm kiếm:";
            // 
            // FrmAllowanceDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1003);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.lblAddStaff);
            this.Controls.Add(this.dgvAllowanceDetail);
            this.Controls.Add(this.lblAllowanceDetail);
            this.Controls.Add(this.pnlFunction);
            this.Controls.Add(this.pnlInfo);
            this.Controls.Add(this.pnlHeader);
            this.Name = "FrmAllowanceDetail";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "FrmChiTietPhuCap";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmChiTietPhuCap_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlFunction.ResumeLayout(false);
            this.pnlFunction.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbStaffPicture)).EndInit();
            this.pnlInfo.ResumeLayout(false);
            this.pnlInfo.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAllowanceDetail)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Label lblPositionLoginValue;
        private System.Windows.Forms.Label lblPositionLogin;
        private System.Windows.Forms.Label lblDepartmentLoginValue;
        private System.Windows.Forms.Label lblDepartmentLogin;
        private System.Windows.Forms.Label lblFullNameLoginValue;
        private System.Windows.Forms.Label lblFullNameLogin;
        private System.Windows.Forms.Label lblStaffIDLoginValue;
        private System.Windows.Forms.Label lblStaffIDLogin;
        private System.Windows.Forms.Panel pnlFunction;
        private System.Windows.Forms.ComboBox cmbPosition;
        private System.Windows.Forms.Label lblPosition;
        private System.Windows.Forms.ComboBox cmbDepartment;
        private System.Windows.Forms.TextBox txtFullName;
        private System.Windows.Forms.Label lblFullName;
        private System.Windows.Forms.ComboBox cmbStaffID;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label lblStaffID;
        private System.Windows.Forms.Label lblDepartment;
        private System.Windows.Forms.Panel pnlInfo;
        private System.Windows.Forms.TextBox txtAllowamceName;
        private System.Windows.Forms.Label lblAllowanceName;
        private System.Windows.Forms.TextBox txtStaffAmount;
        private System.Windows.Forms.Label lblStaffAmount;
        private System.Windows.Forms.TextBox txtAllowanceID;
        private System.Windows.Forms.TextBox txtAmount;
        private System.Windows.Forms.Label lblAllowanceAmount;
        private System.Windows.Forms.Label lblAllowanceID;
        private System.Windows.Forms.TextBox txtTotalAmount;
        private System.Windows.Forms.Label lblTotalAmount;
        private System.Windows.Forms.Label lblAllowanceDetail;
        private System.Windows.Forms.DataGridView dgvAllowanceDetail;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaPC;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.Label lblAddStaff;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.PictureBox pbStaffPicture;
    }
}