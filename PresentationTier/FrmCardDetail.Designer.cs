namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmCardDetail
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
            this.lblSearch = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.pnlInfo = new System.Windows.Forms.Panel();
            this.lblTotalDeliver = new System.Windows.Forms.Label();
            this.txtTotalDeliver = new System.Windows.Forms.TextBox();
            this.txtCardType = new System.Windows.Forms.TextBox();
            this.lblCardType = new System.Windows.Forms.Label();
            this.lblTotalAmount = new System.Windows.Forms.Label();
            this.txtTotalAmount = new System.Windows.Forms.TextBox();
            this.txtFullNameCreate = new System.Windows.Forms.TextBox();
            this.lblFullNameCreate = new System.Windows.Forms.Label();
            this.txtPosition = new System.Windows.Forms.TextBox();
            this.txtDepartment = new System.Windows.Forms.TextBox();
            this.lblPositionCreate = new System.Windows.Forms.Label();
            this.lblDepartmentCreate = new System.Windows.Forms.Label();
            this.txtCardID = new System.Windows.Forms.TextBox();
            this.txtStaffIDCreate = new System.Windows.Forms.TextBox();
            this.lblStaffCreate = new System.Windows.Forms.Label();
            this.lblCardID = new System.Windows.Forms.Label();
            this.dtpDateCreate = new System.Windows.Forms.DateTimePicker();
            this.lblDateCreate = new System.Windows.Forms.Label();
            this.cmbStaff = new System.Windows.Forms.ComboBox();
            this.lblNote = new System.Windows.Forms.Label();
            this.cmbDepartment = new System.Windows.Forms.ComboBox();
            this.txtAmount = new System.Windows.Forms.TextBox();
            this.lblAmount = new System.Windows.Forms.Label();
            this.lblDepartment = new System.Windows.Forms.Label();
            this.lblStaffIDAdd = new System.Windows.Forms.Label();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.lblPositionLoginValue = new System.Windows.Forms.Label();
            this.lblPositionLogin = new System.Windows.Forms.Label();
            this.lblDepartmentLoginValue = new System.Windows.Forms.Label();
            this.lblDepartmentLogin = new System.Windows.Forms.Label();
            this.lblFullNameLoginValue = new System.Windows.Forms.Label();
            this.lblFullNameLogin = new System.Windows.Forms.Label();
            this.lblStaffIDLoginValue = new System.Windows.Forms.Label();
            this.lblStaffLogin = new System.Windows.Forms.Label();
            this.btnBack = new System.Windows.Forms.Button();
            this.dgvCardDetail = new System.Windows.Forms.DataGridView();
            this.colMaP = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colLoaiPhieu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSoTien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colDeliver = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colGhiChu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtFullName = new System.Windows.Forms.TextBox();
            this.lblFullName = new System.Windows.Forms.Label();
            this.pnlFunction = new System.Windows.Forms.Panel();
            this.lblDeliver = new System.Windows.Forms.Label();
            this.txtDeliver = new System.Windows.Forms.TextBox();
            this.pbStaffPicture = new System.Windows.Forms.PictureBox();
            this.lblStaffIDEdit = new System.Windows.Forms.Label();
            this.txtStaffIDEdit = new System.Windows.Forms.TextBox();
            this.btnEdit = new System.Windows.Forms.Button();
            this.cmbPosition = new System.Windows.Forms.ComboBox();
            this.lblPosition = new System.Windows.Forms.Label();
            this.rtxtNote = new System.Windows.Forms.RichTextBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnCancel = new System.Windows.Forms.Button();
            this.lblAddStaff = new System.Windows.Forms.Label();
            this.lblCardInfo = new System.Windows.Forms.Label();
            this.errProvider = new System.Windows.Forms.ErrorProvider(this.components);
            this.pnlInfo.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCardDetail)).BeginInit();
            this.pnlFunction.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbStaffPicture)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).BeginInit();
            this.SuspendLayout();
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(1474, 472);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 58;
            this.lblSearch.Text = "Tìm kiếm:";
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(1625, 472);
            this.txtSearch.MaxLength = 50;
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 21;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearch_TextChanged);
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // pnlInfo
            // 
            this.pnlInfo.BackColor = System.Drawing.SystemColors.Info;
            this.pnlInfo.Controls.Add(this.lblTotalDeliver);
            this.pnlInfo.Controls.Add(this.txtTotalDeliver);
            this.pnlInfo.Controls.Add(this.txtCardType);
            this.pnlInfo.Controls.Add(this.lblCardType);
            this.pnlInfo.Controls.Add(this.lblTotalAmount);
            this.pnlInfo.Controls.Add(this.txtTotalAmount);
            this.pnlInfo.Controls.Add(this.txtFullNameCreate);
            this.pnlInfo.Controls.Add(this.lblFullNameCreate);
            this.pnlInfo.Controls.Add(this.txtPosition);
            this.pnlInfo.Controls.Add(this.txtDepartment);
            this.pnlInfo.Controls.Add(this.lblPositionCreate);
            this.pnlInfo.Controls.Add(this.lblDepartmentCreate);
            this.pnlInfo.Controls.Add(this.txtCardID);
            this.pnlInfo.Controls.Add(this.txtStaffIDCreate);
            this.pnlInfo.Controls.Add(this.lblStaffCreate);
            this.pnlInfo.Controls.Add(this.lblCardID);
            this.pnlInfo.Controls.Add(this.dtpDateCreate);
            this.pnlInfo.Controls.Add(this.lblDateCreate);
            this.pnlInfo.Location = new System.Drawing.Point(73, 152);
            this.pnlInfo.Name = "pnlInfo";
            this.pnlInfo.Size = new System.Drawing.Size(564, 350);
            this.pnlInfo.TabIndex = 56;
            // 
            // lblTotalDeliver
            // 
            this.lblTotalDeliver.AutoSize = true;
            this.lblTotalDeliver.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalDeliver.Location = new System.Drawing.Point(19, 305);
            this.lblTotalDeliver.Name = "lblTotalDeliver";
            this.lblTotalDeliver.Size = new System.Drawing.Size(146, 25);
            this.lblTotalDeliver.TabIndex = 77;
            this.lblTotalDeliver.Text = "Tổng đã giao:";
            // 
            // txtTotalDeliver
            // 
            this.txtTotalDeliver.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalDeliver.Location = new System.Drawing.Point(238, 302);
            this.txtTotalDeliver.Name = "txtTotalDeliver";
            this.txtTotalDeliver.Size = new System.Drawing.Size(309, 30);
            this.txtTotalDeliver.TabIndex = 76;
            // 
            // txtCardType
            // 
            this.txtCardType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCardType.Location = new System.Drawing.Point(238, 50);
            this.txtCardType.Name = "txtCardType";
            this.txtCardType.Size = new System.Drawing.Size(309, 30);
            this.txtCardType.TabIndex = 4;
            // 
            // lblCardType
            // 
            this.lblCardType.AutoSize = true;
            this.lblCardType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCardType.Location = new System.Drawing.Point(19, 55);
            this.lblCardType.Name = "lblCardType";
            this.lblCardType.Size = new System.Drawing.Size(119, 25);
            this.lblCardType.TabIndex = 75;
            this.lblCardType.Text = "Loại phiếu:";
            // 
            // lblTotalAmount
            // 
            this.lblTotalAmount.AutoSize = true;
            this.lblTotalAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTotalAmount.Location = new System.Drawing.Point(19, 271);
            this.lblTotalAmount.Name = "lblTotalAmount";
            this.lblTotalAmount.Size = new System.Drawing.Size(110, 25);
            this.lblTotalAmount.TabIndex = 74;
            this.lblTotalAmount.Text = "Tổng tiền:";
            // 
            // txtTotalAmount
            // 
            this.txtTotalAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTotalAmount.Location = new System.Drawing.Point(238, 266);
            this.txtTotalAmount.Name = "txtTotalAmount";
            this.txtTotalAmount.Size = new System.Drawing.Size(309, 30);
            this.txtTotalAmount.TabIndex = 10;
            // 
            // txtFullNameCreate
            // 
            this.txtFullNameCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFullNameCreate.Location = new System.Drawing.Point(238, 122);
            this.txtFullNameCreate.Name = "txtFullNameCreate";
            this.txtFullNameCreate.Size = new System.Drawing.Size(309, 30);
            this.txtFullNameCreate.TabIndex = 6;
            // 
            // lblFullNameCreate
            // 
            this.lblFullNameCreate.AutoSize = true;
            this.lblFullNameCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullNameCreate.Location = new System.Drawing.Point(19, 127);
            this.lblFullNameCreate.Name = "lblFullNameCreate";
            this.lblFullNameCreate.Size = new System.Drawing.Size(82, 25);
            this.lblFullNameCreate.TabIndex = 72;
            this.lblFullNameCreate.Text = "Họ tên:";
            // 
            // txtPosition
            // 
            this.txtPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtPosition.Location = new System.Drawing.Point(238, 194);
            this.txtPosition.Name = "txtPosition";
            this.txtPosition.Size = new System.Drawing.Size(309, 30);
            this.txtPosition.TabIndex = 8;
            // 
            // txtDepartment
            // 
            this.txtDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDepartment.Location = new System.Drawing.Point(238, 158);
            this.txtDepartment.Name = "txtDepartment";
            this.txtDepartment.Size = new System.Drawing.Size(309, 30);
            this.txtDepartment.TabIndex = 7;
            // 
            // lblPositionCreate
            // 
            this.lblPositionCreate.AutoSize = true;
            this.lblPositionCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionCreate.Location = new System.Drawing.Point(19, 199);
            this.lblPositionCreate.Name = "lblPositionCreate";
            this.lblPositionCreate.Size = new System.Drawing.Size(99, 25);
            this.lblPositionCreate.TabIndex = 69;
            this.lblPositionCreate.Text = "Chức vụ:";
            // 
            // lblDepartmentCreate
            // 
            this.lblDepartmentCreate.AutoSize = true;
            this.lblDepartmentCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentCreate.Location = new System.Drawing.Point(19, 163);
            this.lblDepartmentCreate.Name = "lblDepartmentCreate";
            this.lblDepartmentCreate.Size = new System.Drawing.Size(123, 25);
            this.lblDepartmentCreate.TabIndex = 56;
            this.lblDepartmentCreate.Text = "Phòng ban:";
            // 
            // txtCardID
            // 
            this.txtCardID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtCardID.Location = new System.Drawing.Point(238, 10);
            this.txtCardID.Name = "txtCardID";
            this.txtCardID.Size = new System.Drawing.Size(309, 30);
            this.txtCardID.TabIndex = 3;
            // 
            // txtStaffIDCreate
            // 
            this.txtStaffIDCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStaffIDCreate.Location = new System.Drawing.Point(238, 88);
            this.txtStaffIDCreate.Name = "txtStaffIDCreate";
            this.txtStaffIDCreate.Size = new System.Drawing.Size(309, 30);
            this.txtStaffIDCreate.TabIndex = 5;
            // 
            // lblStaffCreate
            // 
            this.lblStaffCreate.AutoSize = true;
            this.lblStaffCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffCreate.Location = new System.Drawing.Point(15, 93);
            this.lblStaffCreate.Name = "lblStaffCreate";
            this.lblStaffCreate.Size = new System.Drawing.Size(210, 25);
            this.lblStaffCreate.TabIndex = 4;
            this.lblStaffCreate.Text = "Nhân viên lập phiếu:";
            // 
            // lblCardID
            // 
            this.lblCardID.AutoSize = true;
            this.lblCardID.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCardID.Location = new System.Drawing.Point(17, 15);
            this.lblCardID.Name = "lblCardID";
            this.lblCardID.Size = new System.Drawing.Size(108, 25);
            this.lblCardID.TabIndex = 0;
            this.lblCardID.Text = "Mã phiếu:";
            // 
            // dtpDateCreate
            // 
            this.dtpDateCreate.CustomFormat = "yyyy-MM-dd";
            this.dtpDateCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpDateCreate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpDateCreate.Location = new System.Drawing.Point(238, 230);
            this.dtpDateCreate.Name = "dtpDateCreate";
            this.dtpDateCreate.Size = new System.Drawing.Size(309, 30);
            this.dtpDateCreate.TabIndex = 9;
            // 
            // lblDateCreate
            // 
            this.lblDateCreate.AutoSize = true;
            this.lblDateCreate.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDateCreate.Location = new System.Drawing.Point(17, 235);
            this.lblDateCreate.Name = "lblDateCreate";
            this.lblDateCreate.Size = new System.Drawing.Size(163, 25);
            this.lblDateCreate.TabIndex = 6;
            this.lblDateCreate.Text = "Ngày lập phiếu:";
            // 
            // cmbStaff
            // 
            this.cmbStaff.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbStaff.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbStaff.FormattingEnabled = true;
            this.cmbStaff.Location = new System.Drawing.Point(211, 66);
            this.cmbStaff.Name = "cmbStaff";
            this.cmbStaff.Size = new System.Drawing.Size(263, 33);
            this.cmbStaff.TabIndex = 13;
            this.cmbStaff.SelectedIndexChanged += new System.EventHandler(this.cmbStaffID_SelectedIndexChanged);
            this.cmbStaff.TextChanged += new System.EventHandler(this.OnOffButton);
            // 
            // lblNote
            // 
            this.lblNote.AutoSize = true;
            this.lblNote.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNote.Location = new System.Drawing.Point(5, 175);
            this.lblNote.Name = "lblNote";
            this.lblNote.Size = new System.Drawing.Size(93, 25);
            this.lblNote.TabIndex = 60;
            this.lblNote.Text = "Ghi chú:";
            // 
            // cmbDepartment
            // 
            this.cmbDepartment.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbDepartment.FormattingEnabled = true;
            this.cmbDepartment.Location = new System.Drawing.Point(211, 18);
            this.cmbDepartment.Name = "cmbDepartment";
            this.cmbDepartment.Size = new System.Drawing.Size(263, 33);
            this.cmbDepartment.TabIndex = 11;
            this.cmbDepartment.TextChanged += new System.EventHandler(this.cmbDepartment_TextChanged);
            // 
            // txtAmount
            // 
            this.txtAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtAmount.Location = new System.Drawing.Point(670, 121);
            this.txtAmount.MaxLength = 42;
            this.txtAmount.Name = "txtAmount";
            this.txtAmount.Size = new System.Drawing.Size(268, 30);
            this.txtAmount.TabIndex = 16;
            this.txtAmount.TextChanged += new System.EventHandler(this.OnOffButton);
            this.txtAmount.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtAmount_KeyPress);
            // 
            // lblAmount
            // 
            this.lblAmount.AutoSize = true;
            this.lblAmount.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAmount.Location = new System.Drawing.Point(481, 124);
            this.lblAmount.Name = "lblAmount";
            this.lblAmount.Size = new System.Drawing.Size(87, 25);
            this.lblAmount.TabIndex = 57;
            this.lblAmount.Text = "Số tiền:";
            // 
            // lblDepartment
            // 
            this.lblDepartment.AutoSize = true;
            this.lblDepartment.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartment.Location = new System.Drawing.Point(5, 21);
            this.lblDepartment.Name = "lblDepartment";
            this.lblDepartment.Size = new System.Drawing.Size(123, 25);
            this.lblDepartment.TabIndex = 55;
            this.lblDepartment.Text = "Phòng ban:";
            // 
            // lblStaffIDAdd
            // 
            this.lblStaffIDAdd.AutoSize = true;
            this.lblStaffIDAdd.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffIDAdd.Location = new System.Drawing.Point(5, 73);
            this.lblStaffIDAdd.Name = "lblStaffIDAdd";
            this.lblStaffIDAdd.Size = new System.Drawing.Size(202, 25);
            this.lblStaffIDAdd.TabIndex = 53;
            this.lblStaffIDAdd.Text = "Mã nhân viên thêm:";
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
            this.pnlHeader.Controls.Add(this.lblStaffLogin);
            this.pnlHeader.Controls.Add(this.btnBack);
            this.pnlHeader.Dock = System.Windows.Forms.DockStyle.Top;
            this.pnlHeader.Location = new System.Drawing.Point(0, 0);
            this.pnlHeader.Name = "pnlHeader";
            this.pnlHeader.Size = new System.Drawing.Size(1924, 113);
            this.pnlHeader.TabIndex = 54;
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
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1254, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1078, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1254, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1078, 9);
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
            // lblStaffLogin
            // 
            this.lblStaffLogin.AutoSize = true;
            this.lblStaffLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffLogin.Location = new System.Drawing.Point(318, 9);
            this.lblStaffLogin.Name = "lblStaffLogin";
            this.lblStaffLogin.Size = new System.Drawing.Size(205, 32);
            this.lblStaffLogin.TabIndex = 1;
            this.lblStaffLogin.Text = "Mã nhân viên:";
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
            // dgvCardDetail
            // 
            this.dgvCardDetail.AllowUserToAddRows = false;
            this.dgvCardDetail.AllowUserToDeleteRows = false;
            this.dgvCardDetail.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCardDetail.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvCardDetail.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCardDetail.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaP,
            this.colLoaiPhieu,
            this.colMaNV,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu,
            this.colSoTien,
            this.colDeliver,
            this.colGhiChu});
            this.dgvCardDetail.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvCardDetail.Location = new System.Drawing.Point(0, 508);
            this.dgvCardDetail.Name = "dgvCardDetail";
            this.dgvCardDetail.ReadOnly = true;
            this.dgvCardDetail.RowHeadersVisible = false;
            this.dgvCardDetail.RowHeadersWidth = 51;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvCardDetail.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvCardDetail.RowTemplate.Height = 24;
            this.dgvCardDetail.Size = new System.Drawing.Size(1924, 475);
            this.dgvCardDetail.TabIndex = 55;
            this.dgvCardDetail.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCardDetail_CellClick);
            // 
            // colMaP
            // 
            this.colMaP.HeaderText = "Mã phiếu";
            this.colMaP.MinimumWidth = 6;
            this.colMaP.Name = "colMaP";
            this.colMaP.ReadOnly = true;
            // 
            // colLoaiPhieu
            // 
            this.colLoaiPhieu.HeaderText = "Loại phiếu";
            this.colLoaiPhieu.MinimumWidth = 6;
            this.colLoaiPhieu.Name = "colLoaiPhieu";
            this.colLoaiPhieu.ReadOnly = true;
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
            // colSoTien
            // 
            this.colSoTien.HeaderText = "Số tiền";
            this.colSoTien.MinimumWidth = 6;
            this.colSoTien.Name = "colSoTien";
            this.colSoTien.ReadOnly = true;
            // 
            // colDeliver
            // 
            this.colDeliver.HeaderText = "Đã giao";
            this.colDeliver.MinimumWidth = 6;
            this.colDeliver.Name = "colDeliver";
            this.colDeliver.ReadOnly = true;
            // 
            // colGhiChu
            // 
            this.colGhiChu.HeaderText = "Ghi chú";
            this.colGhiChu.MinimumWidth = 6;
            this.colGhiChu.Name = "colGhiChu";
            this.colGhiChu.ReadOnly = true;
            // 
            // txtFullName
            // 
            this.txtFullName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtFullName.Location = new System.Drawing.Point(670, 70);
            this.txtFullName.Name = "txtFullName";
            this.txtFullName.Size = new System.Drawing.Size(268, 30);
            this.txtFullName.TabIndex = 14;
            // 
            // lblFullName
            // 
            this.lblFullName.AutoSize = true;
            this.lblFullName.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblFullName.Location = new System.Drawing.Point(481, 73);
            this.lblFullName.Name = "lblFullName";
            this.lblFullName.Size = new System.Drawing.Size(182, 25);
            this.lblFullName.TabIndex = 63;
            this.lblFullName.Text = "Họ tên nhân viên:";
            // 
            // pnlFunction
            // 
            this.pnlFunction.BackColor = System.Drawing.SystemColors.Info;
            this.pnlFunction.Controls.Add(this.lblDeliver);
            this.pnlFunction.Controls.Add(this.txtDeliver);
            this.pnlFunction.Controls.Add(this.pbStaffPicture);
            this.pnlFunction.Controls.Add(this.lblStaffIDEdit);
            this.pnlFunction.Controls.Add(this.txtStaffIDEdit);
            this.pnlFunction.Controls.Add(this.btnEdit);
            this.pnlFunction.Controls.Add(this.cmbPosition);
            this.pnlFunction.Controls.Add(this.lblPosition);
            this.pnlFunction.Controls.Add(this.rtxtNote);
            this.pnlFunction.Controls.Add(this.cmbDepartment);
            this.pnlFunction.Controls.Add(this.txtFullName);
            this.pnlFunction.Controls.Add(this.lblFullName);
            this.pnlFunction.Controls.Add(this.cmbStaff);
            this.pnlFunction.Controls.Add(this.btnAdd);
            this.pnlFunction.Controls.Add(this.btnCancel);
            this.pnlFunction.Controls.Add(this.lblStaffIDAdd);
            this.pnlFunction.Controls.Add(this.lblDepartment);
            this.pnlFunction.Controls.Add(this.lblNote);
            this.pnlFunction.Controls.Add(this.lblAmount);
            this.pnlFunction.Controls.Add(this.txtAmount);
            this.pnlFunction.Location = new System.Drawing.Point(700, 171);
            this.pnlFunction.Name = "pnlFunction";
            this.pnlFunction.Size = new System.Drawing.Size(1165, 277);
            this.pnlFunction.TabIndex = 64;
            // 
            // lblDeliver
            // 
            this.lblDeliver.AutoSize = true;
            this.lblDeliver.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDeliver.Location = new System.Drawing.Point(481, 175);
            this.lblDeliver.Name = "lblDeliver";
            this.lblDeliver.Size = new System.Drawing.Size(93, 25);
            this.lblDeliver.TabIndex = 85;
            this.lblDeliver.Text = "Đã giao:";
            // 
            // txtDeliver
            // 
            this.txtDeliver.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtDeliver.Location = new System.Drawing.Point(670, 172);
            this.txtDeliver.MaxLength = 42;
            this.txtDeliver.Name = "txtDeliver";
            this.txtDeliver.Size = new System.Drawing.Size(268, 30);
            this.txtDeliver.TabIndex = 84;
            this.txtDeliver.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtDeliver_KeyPress);
            // 
            // pbStaffPicture
            // 
            this.pbStaffPicture.Image = global::QuanLyNhanSu.Properties.Resources.image;
            this.pbStaffPicture.Location = new System.Drawing.Point(973, 59);
            this.pbStaffPicture.Name = "pbStaffPicture";
            this.pbStaffPicture.Size = new System.Drawing.Size(173, 177);
            this.pbStaffPicture.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbStaffPicture.TabIndex = 83;
            this.pbStaffPicture.TabStop = false;
            // 
            // lblStaffIDEdit
            // 
            this.lblStaffIDEdit.AutoSize = true;
            this.lblStaffIDEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblStaffIDEdit.Location = new System.Drawing.Point(5, 126);
            this.lblStaffIDEdit.Name = "lblStaffIDEdit";
            this.lblStaffIDEdit.Size = new System.Drawing.Size(190, 25);
            this.lblStaffIDEdit.TabIndex = 71;
            this.lblStaffIDEdit.Text = "Mã nhân viên sửa:";
            // 
            // txtStaffIDEdit
            // 
            this.txtStaffIDEdit.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtStaffIDEdit.Location = new System.Drawing.Point(211, 121);
            this.txtStaffIDEdit.MaxLength = 42;
            this.txtStaffIDEdit.Name = "txtStaffIDEdit";
            this.txtStaffIDEdit.Size = new System.Drawing.Size(263, 30);
            this.txtStaffIDEdit.TabIndex = 15;
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
            this.btnEdit.Location = new System.Drawing.Point(661, 219);
            this.btnEdit.Name = "btnEdit";
            this.btnEdit.Size = new System.Drawing.Size(100, 49);
            this.btnEdit.TabIndex = 19;
            this.btnEdit.Text = "Sửa";
            this.btnEdit.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnEdit.UseVisualStyleBackColor = false;
            this.btnEdit.Click += new System.EventHandler(this.btnEdit_Click);
            // 
            // cmbPosition
            // 
            this.cmbPosition.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPosition.FormattingEnabled = true;
            this.cmbPosition.Location = new System.Drawing.Point(670, 16);
            this.cmbPosition.Name = "cmbPosition";
            this.cmbPosition.Size = new System.Drawing.Size(268, 33);
            this.cmbPosition.TabIndex = 12;
            this.cmbPosition.TextChanged += new System.EventHandler(this.cmbPosition_TextChanged);
            // 
            // lblPosition
            // 
            this.lblPosition.AutoSize = true;
            this.lblPosition.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPosition.Location = new System.Drawing.Point(481, 22);
            this.lblPosition.Name = "lblPosition";
            this.lblPosition.Size = new System.Drawing.Size(99, 25);
            this.lblPosition.TabIndex = 68;
            this.lblPosition.Text = "Chức vụ:";
            // 
            // rtxtNote
            // 
            this.rtxtNote.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rtxtNote.Location = new System.Drawing.Point(211, 169);
            this.rtxtNote.MaxLength = 500;
            this.rtxtNote.Name = "rtxtNote";
            this.rtxtNote.Size = new System.Drawing.Size(263, 99);
            this.rtxtNote.TabIndex = 17;
            this.rtxtNote.Text = "";
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
            this.btnAdd.Location = new System.Drawing.Point(520, 219);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(109, 49);
            this.btnAdd.TabIndex = 18;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
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
            this.btnCancel.Location = new System.Drawing.Point(806, 219);
            this.btnCancel.Name = "btnCancel";
            this.btnCancel.Size = new System.Drawing.Size(99, 49);
            this.btnCancel.TabIndex = 20;
            this.btnCancel.Text = "Huỷ";
            this.btnCancel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCancel.UseVisualStyleBackColor = false;
            this.btnCancel.Click += new System.EventHandler(this.btnCancel_Click);
            // 
            // lblAddStaff
            // 
            this.lblAddStaff.AutoSize = true;
            this.lblAddStaff.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblAddStaff.Location = new System.Drawing.Point(1163, 136);
            this.lblAddStaff.Name = "lblAddStaff";
            this.lblAddStaff.Size = new System.Drawing.Size(231, 32);
            this.lblAddStaff.TabIndex = 65;
            this.lblAddStaff.Text = "Thêm nhân viên";
            // 
            // lblCardInfo
            // 
            this.lblCardInfo.AutoSize = true;
            this.lblCardInfo.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCardInfo.Location = new System.Drawing.Point(286, 117);
            this.lblCardInfo.Name = "lblCardInfo";
            this.lblCardInfo.Size = new System.Drawing.Size(234, 32);
            this.lblCardInfo.TabIndex = 66;
            this.lblCardInfo.Text = "Thông tin phiếu ";
            // 
            // errProvider
            // 
            this.errProvider.BlinkStyle = System.Windows.Forms.ErrorBlinkStyle.NeverBlink;
            this.errProvider.ContainerControl = this;
            // 
            // FrmCardDetail
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.lblCardInfo);
            this.Controls.Add(this.lblAddStaff);
            this.Controls.Add(this.pnlFunction);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.pnlInfo);
            this.Controls.Add(this.pnlHeader);
            this.Controls.Add(this.dgvCardDetail);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmCardDetail";
            this.Text = "frmChiTietPhieuThuong";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmChiTietPhieuThuong_Load);
            this.pnlInfo.ResumeLayout(false);
            this.pnlInfo.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCardDetail)).EndInit();
            this.pnlFunction.ResumeLayout(false);
            this.pnlFunction.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbStaffPicture)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.errProvider)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Panel pnlInfo;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Label lblPositionLoginValue;
        private System.Windows.Forms.Label lblPositionLogin;
        private System.Windows.Forms.Label lblDepartmentLoginValue;
        private System.Windows.Forms.Label lblDepartmentLogin;
        private System.Windows.Forms.Label lblFullNameLoginValue;
        private System.Windows.Forms.Label lblFullNameLogin;
        private System.Windows.Forms.Label lblStaffIDLoginValue;
        private System.Windows.Forms.Label lblStaffLogin;
        private System.Windows.Forms.TextBox txtAmount;
        private System.Windows.Forms.Label lblAmount;
        private System.Windows.Forms.Label lblDepartment;
        private System.Windows.Forms.Label lblStaffIDAdd;
        private System.Windows.Forms.Button btnCancel;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.ComboBox cmbDepartment;
        private System.Windows.Forms.DataGridView dgvCardDetail;
        private System.Windows.Forms.ComboBox cmbStaff;
        private System.Windows.Forms.Label lblNote;
        private System.Windows.Forms.TextBox txtFullName;
        private System.Windows.Forms.Label lblFullName;
        private System.Windows.Forms.Panel pnlFunction;
        private System.Windows.Forms.Label lblAddStaff;
        private System.Windows.Forms.Label lblCardInfo;
        private System.Windows.Forms.RichTextBox rtxtNote;
        private System.Windows.Forms.TextBox txtTotalAmount;
        private System.Windows.Forms.TextBox txtCardID;
        private System.Windows.Forms.TextBox txtStaffIDCreate;
        private System.Windows.Forms.Label lblStaffCreate;
        private System.Windows.Forms.Label lblCardID;
        private System.Windows.Forms.DateTimePicker dtpDateCreate;
        private System.Windows.Forms.Label lblDateCreate;
        private System.Windows.Forms.ComboBox cmbPosition;
        private System.Windows.Forms.Label lblPosition;
        private System.Windows.Forms.Button btnEdit;
        private System.Windows.Forms.TextBox txtPosition;
        private System.Windows.Forms.Label lblPositionCreate;
        private System.Windows.Forms.Label lblDepartmentCreate;
        private System.Windows.Forms.TextBox txtFullNameCreate;
        private System.Windows.Forms.Label lblFullNameCreate;
        private System.Windows.Forms.Label lblTotalAmount;
        private System.Windows.Forms.TextBox txtCardType;
        private System.Windows.Forms.Label lblCardType;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Label lblStaffIDEdit;
        private System.Windows.Forms.TextBox txtStaffIDEdit;
        private System.Windows.Forms.ErrorProvider errProvider;
        private System.Windows.Forms.TextBox txtDepartment;
        private System.Windows.Forms.PictureBox pbStaffPicture;
        private System.Windows.Forms.Label lblDeliver;
        private System.Windows.Forms.TextBox txtDeliver;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaP;
        private System.Windows.Forms.DataGridViewTextBoxColumn colLoaiPhieu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSoTien;
        private System.Windows.Forms.DataGridViewTextBoxColumn colDeliver;
        private System.Windows.Forms.DataGridViewTextBoxColumn colGhiChu;
        private System.Windows.Forms.Label lblTotalDeliver;
        private System.Windows.Forms.TextBox txtTotalDeliver;
    }
}