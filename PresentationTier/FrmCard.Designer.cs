namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmCard
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(FrmCard));
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
            this.dgvCard = new System.Windows.Forms.DataGridView();
            this.colMaPT = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colLoaiPhieu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNgayLap = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongTien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colToltalDeliver = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblCard = new System.Windows.Forms.Label();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.btnCardType = new System.Windows.Forms.Button();
            this.cmbCardType = new System.Windows.Forms.ComboBox();
            this.lblCardType = new System.Windows.Forms.Label();
            this.btnAdd = new System.Windows.Forms.Button();
            this.lblSearch = new System.Windows.Forms.Label();
            this.txtSearch = new System.Windows.Forms.TextBox();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCard)).BeginInit();
            this.pnlMenu.SuspendLayout();
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
            this.lblPositionLoginValue.Location = new System.Drawing.Point(1207, 72);
            this.lblPositionLoginValue.Name = "lblPositionLoginValue";
            this.lblPositionLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblPositionLoginValue.TabIndex = 8;
            this.lblPositionLoginValue.Text = "...";
            // 
            // lblPositionLogin
            // 
            this.lblPositionLogin.AutoSize = true;
            this.lblPositionLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPositionLogin.Location = new System.Drawing.Point(1031, 72);
            this.lblPositionLogin.Name = "lblPositionLogin";
            this.lblPositionLogin.Size = new System.Drawing.Size(133, 32);
            this.lblPositionLogin.TabIndex = 7;
            this.lblPositionLogin.Text = "Chức vụ:";
            // 
            // lblDepartmentLoginValue
            // 
            this.lblDepartmentLoginValue.AutoSize = true;
            this.lblDepartmentLoginValue.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLoginValue.Location = new System.Drawing.Point(1207, 9);
            this.lblDepartmentLoginValue.Name = "lblDepartmentLoginValue";
            this.lblDepartmentLoginValue.Size = new System.Drawing.Size(38, 32);
            this.lblDepartmentLoginValue.TabIndex = 6;
            this.lblDepartmentLoginValue.Text = "...";
            // 
            // lblDepartmentLogin
            // 
            this.lblDepartmentLogin.AutoSize = true;
            this.lblDepartmentLogin.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblDepartmentLogin.Location = new System.Drawing.Point(1031, 9);
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
            // dgvCard
            // 
            this.dgvCard.AllowUserToAddRows = false;
            this.dgvCard.AllowUserToDeleteRows = false;
            this.dgvCard.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvCard.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCard.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvCard.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvCard.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaPT,
            this.colLoaiPhieu,
            this.colMaNV,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu,
            this.colNgayLap,
            this.colTongTien,
            this.colToltalDeliver});
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Window;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.ControlText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.False;
            this.dgvCard.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvCard.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvCard.Location = new System.Drawing.Point(0, 362);
            this.dgvCard.Name = "dgvCard";
            this.dgvCard.ReadOnly = true;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvCard.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvCard.RowHeadersVisible = false;
            this.dgvCard.RowHeadersWidth = 51;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvCard.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvCard.RowTemplate.Height = 24;
            this.dgvCard.Size = new System.Drawing.Size(1924, 621);
            this.dgvCard.TabIndex = 7;
            this.dgvCard.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvCard_CellClick);
            // 
            // colMaPT
            // 
            this.colMaPT.HeaderText = "Mã phiếu thưởng";
            this.colMaPT.MinimumWidth = 6;
            this.colMaPT.Name = "colMaPT";
            this.colMaPT.ReadOnly = true;
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
            this.colMaNV.HeaderText = "Nhân viên lập phiếu";
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
            // colNgayLap
            // 
            this.colNgayLap.HeaderText = "Ngày lập";
            this.colNgayLap.MinimumWidth = 6;
            this.colNgayLap.Name = "colNgayLap";
            this.colNgayLap.ReadOnly = true;
            // 
            // colTongTien
            // 
            this.colTongTien.HeaderText = "Tổng tiền";
            this.colTongTien.MinimumWidth = 6;
            this.colTongTien.Name = "colTongTien";
            this.colTongTien.ReadOnly = true;
            // 
            // colToltalDeliver
            // 
            this.colToltalDeliver.HeaderText = "Tổng đã giao";
            this.colToltalDeliver.MinimumWidth = 6;
            this.colToltalDeliver.Name = "colToltalDeliver";
            this.colToltalDeliver.ReadOnly = true;
            // 
            // lblCard
            // 
            this.lblCard.AutoSize = true;
            this.lblCard.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCard.Location = new System.Drawing.Point(832, 128);
            this.lblCard.Name = "lblCard";
            this.lblCard.Size = new System.Drawing.Size(226, 32);
            this.lblCard.TabIndex = 35;
            this.lblCard.Text = "Thông tin phiếu";
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.btnCardType);
            this.pnlMenu.Controls.Add(this.cmbCardType);
            this.pnlMenu.Controls.Add(this.lblCardType);
            this.pnlMenu.Controls.Add(this.btnAdd);
            this.pnlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.pnlMenu.Location = new System.Drawing.Point(566, 163);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(738, 151);
            this.pnlMenu.TabIndex = 34;
            // 
            // btnCardType
            // 
            this.btnCardType.AutoSize = true;
            this.btnCardType.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnCardType.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnCardType.FlatAppearance.BorderSize = 0;
            this.btnCardType.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnCardType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnCardType.Image = global::QuanLyNhanSu.Properties.Resources.card;
            this.btnCardType.Location = new System.Drawing.Point(442, 51);
            this.btnCardType.Name = "btnCardType";
            this.btnCardType.Size = new System.Drawing.Size(246, 59);
            this.btnCardType.TabIndex = 5;
            this.btnCardType.Text = "Quản lý loại phiếu";
            this.btnCardType.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnCardType.UseVisualStyleBackColor = false;
            this.btnCardType.Click += new System.EventHandler(this.btnCardType_Click);
            // 
            // cmbCardType
            // 
            this.cmbCardType.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCardType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCardType.FormattingEnabled = true;
            this.cmbCardType.Location = new System.Drawing.Point(162, 30);
            this.cmbCardType.Name = "cmbCardType";
            this.cmbCardType.Size = new System.Drawing.Size(243, 33);
            this.cmbCardType.TabIndex = 3;
            this.cmbCardType.TextChanged += new System.EventHandler(this.cmbCardType_TextChanged);
            // 
            // lblCardType
            // 
            this.lblCardType.AutoSize = true;
            this.lblCardType.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCardType.Location = new System.Drawing.Point(23, 33);
            this.lblCardType.Name = "lblCardType";
            this.lblCardType.Size = new System.Drawing.Size(119, 25);
            this.lblCardType.TabIndex = 50;
            this.lblCardType.Text = "Loại phiếu:";
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
            this.btnAdd.Location = new System.Drawing.Point(218, 83);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(122, 49);
            this.btnAdd.TabIndex = 4;
            this.btnAdd.Text = "Thêm";
            this.btnAdd.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnAdd.UseVisualStyleBackColor = false;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // lblSearch
            // 
            this.lblSearch.AutoSize = true;
            this.lblSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSearch.Location = new System.Drawing.Point(714, 321);
            this.lblSearch.Name = "lblSearch";
            this.lblSearch.Size = new System.Drawing.Size(145, 32);
            this.lblSearch.TabIndex = 52;
            this.lblSearch.Text = "Tìm kiếm:";
            // 
            // txtSearch
            // 
            this.txtSearch.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSearch.Location = new System.Drawing.Point(865, 320);
            this.txtSearch.MaxLength = 50;
            this.txtSearch.Name = "txtSearch";
            this.txtSearch.Size = new System.Drawing.Size(299, 30);
            this.txtSearch.TabIndex = 6;
            this.txtSearch.TextChanged += new System.EventHandler(this.txtSearch_TextChanged);
            this.txtSearch.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtSearch_KeyPress);
            // 
            // FrmCard
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.lblSearch);
            this.Controls.Add(this.txtSearch);
            this.Controls.Add(this.lblCard);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.dgvCard);
            this.Controls.Add(this.pnlHeader);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "FrmCard";
            this.Text = "Phiếu";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmPhieuThuong_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvCard)).EndInit();
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Label lblPositionLoginValue;
        private System.Windows.Forms.Label lblPositionLogin;
        private System.Windows.Forms.Label lblDepartmentLoginValue;
        private System.Windows.Forms.Label lblFullNameLoginValue;
        private System.Windows.Forms.Label lblFullNameLogin;
        private System.Windows.Forms.Label lblStaffIDLoginValue;
        private System.Windows.Forms.Label lblStaffIDLogin;
        private System.Windows.Forms.Button btnBack;
        private System.Windows.Forms.DataGridView dgvCard;
        private System.Windows.Forms.Label lblCard;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label lblSearch;
        private System.Windows.Forms.TextBox txtSearch;
        private System.Windows.Forms.Label lblCardType;
        private System.Windows.Forms.ComboBox cmbCardType;
        private System.Windows.Forms.Button btnCardType;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Label lblDepartmentLogin;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaPT;
        private System.Windows.Forms.DataGridViewTextBoxColumn colLoaiPhieu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNgayLap;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongTien;
        private System.Windows.Forms.DataGridViewTextBoxColumn colToltalDeliver;
    }
}