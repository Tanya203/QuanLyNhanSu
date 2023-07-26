namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmQuanLyChucVu
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
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.lblChucVuNV_DN = new System.Windows.Forms.Label();
            this.lblChucVuDN = new System.Windows.Forms.Label();
            this.lblPhongBanNV_DN = new System.Windows.Forms.Label();
            this.lblPhongBanDN = new System.Windows.Forms.Label();
            this.lblHoTenNV_DN = new System.Windows.Forms.Label();
            this.lblHoTenDN = new System.Windows.Forms.Label();
            this.lblMaNV_DN = new System.Windows.Forms.Label();
            this.lblMaNhanVienDN = new System.Windows.Forms.Label();
            this.btnTroVe = new System.Windows.Forms.Button();
            this.dgvThongTinChucVu = new System.Windows.Forms.DataGridView();
            this.colMaCV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTenChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colLuongKhoiDiem = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongSoNhanVien = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblThongTinChucVu = new System.Windows.Forms.Label();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.txtLuongKhoiDiem = new System.Windows.Forms.TextBox();
            this.lblLuongKhoiDiem = new System.Windows.Forms.Label();
            this.cmbPhongBan = new System.Windows.Forms.ComboBox();
            this.lblPhongBan = new System.Windows.Forms.Label();
            this.btnHuy = new System.Windows.Forms.Button();
            this.btnSua = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.txtTongSoNhanVien = new System.Windows.Forms.TextBox();
            this.lblTongSoNhanVien = new System.Windows.Forms.Label();
            this.txtTenCV = new System.Windows.Forms.TextBox();
            this.lblTenCV = new System.Windows.Forms.Label();
            this.txtMaCV = new System.Windows.Forms.TextBox();
            this.lblMaChucVu = new System.Windows.Forms.Label();
            this.lblTimKiem = new System.Windows.Forms.Label();
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.pnlHeader.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinChucVu)).BeginInit();
            this.pnlMenu.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnlHeader
            // 
            this.pnlHeader.BackColor = System.Drawing.SystemColors.Info;
            this.pnlHeader.Controls.Add(this.btnRefresh);
            this.pnlHeader.Controls.Add(this.lblChucVuNV_DN);
            this.pnlHeader.Controls.Add(this.lblChucVuDN);
            this.pnlHeader.Controls.Add(this.lblPhongBanNV_DN);
            this.pnlHeader.Controls.Add(this.lblPhongBanDN);
            this.pnlHeader.Controls.Add(this.lblHoTenNV_DN);
            this.pnlHeader.Controls.Add(this.lblHoTenDN);
            this.pnlHeader.Controls.Add(this.lblMaNV_DN);
            this.pnlHeader.Controls.Add(this.lblMaNhanVienDN);
            this.pnlHeader.Controls.Add(this.btnTroVe);
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
            // lblChucVuNV_DN
            // 
            this.lblChucVuNV_DN.AutoSize = true;
            this.lblChucVuNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuNV_DN.Location = new System.Drawing.Point(1181, 72);
            this.lblChucVuNV_DN.Name = "lblChucVuNV_DN";
            this.lblChucVuNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblChucVuNV_DN.TabIndex = 8;
            this.lblChucVuNV_DN.Text = "...";
            // 
            // lblChucVuDN
            // 
            this.lblChucVuDN.AutoSize = true;
            this.lblChucVuDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuDN.Location = new System.Drawing.Point(1005, 72);
            this.lblChucVuDN.Name = "lblChucVuDN";
            this.lblChucVuDN.Size = new System.Drawing.Size(133, 32);
            this.lblChucVuDN.TabIndex = 7;
            this.lblChucVuDN.Text = "Chức vụ:";
            // 
            // lblPhongBanNV_DN
            // 
            this.lblPhongBanNV_DN.AutoSize = true;
            this.lblPhongBanNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV_DN.Location = new System.Drawing.Point(1181, 9);
            this.lblPhongBanNV_DN.Name = "lblPhongBanNV_DN";
            this.lblPhongBanNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblPhongBanNV_DN.TabIndex = 6;
            this.lblPhongBanNV_DN.Text = "...";
            // 
            // lblPhongBanDN
            // 
            this.lblPhongBanDN.AutoSize = true;
            this.lblPhongBanDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanDN.Location = new System.Drawing.Point(1005, 9);
            this.lblPhongBanDN.Name = "lblPhongBanDN";
            this.lblPhongBanDN.Size = new System.Drawing.Size(170, 32);
            this.lblPhongBanDN.TabIndex = 5;
            this.lblPhongBanDN.Text = "Phòng ban:";
            // 
            // lblHoTenNV_DN
            // 
            this.lblHoTenNV_DN.AutoSize = true;
            this.lblHoTenNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHoTenNV_DN.Location = new System.Drawing.Point(529, 72);
            this.lblHoTenNV_DN.Name = "lblHoTenNV_DN";
            this.lblHoTenNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblHoTenNV_DN.TabIndex = 4;
            this.lblHoTenNV_DN.Text = "...";
            this.lblHoTenNV_DN.UseMnemonic = false;
            // 
            // lblHoTenDN
            // 
            this.lblHoTenDN.AutoSize = true;
            this.lblHoTenDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHoTenDN.Location = new System.Drawing.Point(318, 72);
            this.lblHoTenDN.Name = "lblHoTenDN";
            this.lblHoTenDN.Size = new System.Drawing.Size(112, 32);
            this.lblHoTenDN.TabIndex = 3;
            this.lblHoTenDN.Text = "Họ tên:";
            // 
            // lblMaNV_DN
            // 
            this.lblMaNV_DN.AutoSize = true;
            this.lblMaNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaNV_DN.Location = new System.Drawing.Point(529, 9);
            this.lblMaNV_DN.Name = "lblMaNV_DN";
            this.lblMaNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblMaNV_DN.TabIndex = 2;
            this.lblMaNV_DN.Text = "...";
            this.lblMaNV_DN.UseMnemonic = false;
            // 
            // lblMaNhanVienDN
            // 
            this.lblMaNhanVienDN.AutoSize = true;
            this.lblMaNhanVienDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaNhanVienDN.Location = new System.Drawing.Point(318, 9);
            this.lblMaNhanVienDN.Name = "lblMaNhanVienDN";
            this.lblMaNhanVienDN.Size = new System.Drawing.Size(205, 32);
            this.lblMaNhanVienDN.TabIndex = 1;
            this.lblMaNhanVienDN.Text = "Mã nhân viên:";
            // 
            // btnTroVe
            // 
            this.btnTroVe.AutoSize = true;
            this.btnTroVe.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTroVe.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnTroVe.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTroVe.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnTroVe.FlatAppearance.BorderSize = 0;
            this.btnTroVe.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnTroVe.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTroVe.Image = global::QuanLyNhanSu.Properties.Resources._return;
            this.btnTroVe.Location = new System.Drawing.Point(0, 0);
            this.btnTroVe.Name = "btnTroVe";
            this.btnTroVe.Size = new System.Drawing.Size(142, 113);
            this.btnTroVe.TabIndex = 1;
            this.btnTroVe.Text = "Trở về";
            this.btnTroVe.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnTroVe.UseVisualStyleBackColor = false;
            this.btnTroVe.Click += new System.EventHandler(this.btnTroVe_Click);
            // 
            // dgvThongTinChucVu
            // 
            this.dgvThongTinChucVu.AllowUserToAddRows = false;
            this.dgvThongTinChucVu.AllowUserToDeleteRows = false;
            this.dgvThongTinChucVu.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongTinChucVu.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvThongTinChucVu.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvThongTinChucVu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongTinChucVu.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaCV,
            this.colPhongBan,
            this.colTenChucVu,
            this.colLuongKhoiDiem,
            this.colTongSoNhanVien});
            this.dgvThongTinChucVu.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvThongTinChucVu.Location = new System.Drawing.Point(0, 363);
            this.dgvThongTinChucVu.Name = "dgvThongTinChucVu";
            this.dgvThongTinChucVu.ReadOnly = true;
            dataGridViewCellStyle2.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvThongTinChucVu.RowHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvThongTinChucVu.RowHeadersVisible = false;
            this.dgvThongTinChucVu.RowHeadersWidth = 51;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvThongTinChucVu.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvThongTinChucVu.RowTemplate.Height = 24;
            this.dgvThongTinChucVu.Size = new System.Drawing.Size(1924, 620);
            this.dgvThongTinChucVu.TabIndex = 13;
            this.dgvThongTinChucVu.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvThongTinChucVu_CellClick);
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
            // colLuongKhoiDiem
            // 
            this.colLuongKhoiDiem.HeaderText = "Lương khởi điểm";
            this.colLuongKhoiDiem.MinimumWidth = 6;
            this.colLuongKhoiDiem.Name = "colLuongKhoiDiem";
            this.colLuongKhoiDiem.ReadOnly = true;
            // 
            // colTongSoNhanVien
            // 
            this.colTongSoNhanVien.HeaderText = "Tổng số nhân viên";
            this.colTongSoNhanVien.MinimumWidth = 6;
            this.colTongSoNhanVien.Name = "colTongSoNhanVien";
            this.colTongSoNhanVien.ReadOnly = true;
            // 
            // lblThongTinChucVu
            // 
            this.lblThongTinChucVu.AutoSize = true;
            this.lblThongTinChucVu.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThongTinChucVu.Location = new System.Drawing.Point(804, 116);
            this.lblThongTinChucVu.Name = "lblThongTinChucVu";
            this.lblThongTinChucVu.Size = new System.Drawing.Size(254, 32);
            this.lblThongTinChucVu.TabIndex = 31;
            this.lblThongTinChucVu.Text = "Thông tin chức vụ";
            // 
            // pnlMenu
            // 
            this.pnlMenu.AutoSize = true;
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.txtLuongKhoiDiem);
            this.pnlMenu.Controls.Add(this.lblLuongKhoiDiem);
            this.pnlMenu.Controls.Add(this.cmbPhongBan);
            this.pnlMenu.Controls.Add(this.lblPhongBan);
            this.pnlMenu.Controls.Add(this.btnHuy);
            this.pnlMenu.Controls.Add(this.btnSua);
            this.pnlMenu.Controls.Add(this.btnXoa);
            this.pnlMenu.Controls.Add(this.btnThem);
            this.pnlMenu.Controls.Add(this.txtTongSoNhanVien);
            this.pnlMenu.Controls.Add(this.lblTongSoNhanVien);
            this.pnlMenu.Controls.Add(this.txtTenCV);
            this.pnlMenu.Controls.Add(this.lblTenCV);
            this.pnlMenu.Controls.Add(this.txtMaCV);
            this.pnlMenu.Controls.Add(this.lblMaChucVu);
            this.pnlMenu.Location = new System.Drawing.Point(289, 151);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(1318, 170);
            this.pnlMenu.TabIndex = 30;
            // 
            // txtLuongKhoiDiem
            // 
            this.txtLuongKhoiDiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtLuongKhoiDiem.Location = new System.Drawing.Point(622, 54);
            this.txtLuongKhoiDiem.MaxLength = 42;
            this.txtLuongKhoiDiem.Name = "txtLuongKhoiDiem";
            this.txtLuongKhoiDiem.Size = new System.Drawing.Size(234, 30);
            this.txtLuongKhoiDiem.TabIndex = 6;
            this.txtLuongKhoiDiem.TextChanged += new System.EventHandler(this.EnableButtons);
            this.txtLuongKhoiDiem.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtLuongKhoiDiem_KeyPress);
            // 
            // lblLuongKhoiDiem
            // 
            this.lblLuongKhoiDiem.AutoSize = true;
            this.lblLuongKhoiDiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLuongKhoiDiem.Location = new System.Drawing.Point(417, 57);
            this.lblLuongKhoiDiem.Name = "lblLuongKhoiDiem";
            this.lblLuongKhoiDiem.Size = new System.Drawing.Size(170, 25);
            this.lblLuongKhoiDiem.TabIndex = 46;
            this.lblLuongKhoiDiem.Text = "Lương khởi điểm";
            // 
            // cmbPhongBan
            // 
            this.cmbPhongBan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPhongBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPhongBan.FormattingEnabled = true;
            this.cmbPhongBan.Location = new System.Drawing.Point(154, 54);
            this.cmbPhongBan.Name = "cmbPhongBan";
            this.cmbPhongBan.Size = new System.Drawing.Size(240, 33);
            this.cmbPhongBan.TabIndex = 4;
            // 
            // lblPhongBan
            // 
            this.lblPhongBan.AutoSize = true;
            this.lblPhongBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBan.Location = new System.Drawing.Point(18, 57);
            this.lblPhongBan.Name = "lblPhongBan";
            this.lblPhongBan.Size = new System.Drawing.Size(123, 25);
            this.lblPhongBan.TabIndex = 43;
            this.lblPhongBan.Text = "Phòng ban:";
            // 
            // btnHuy
            // 
            this.btnHuy.AutoSize = true;
            this.btnHuy.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.FlatAppearance.BorderSize = 0;
            this.btnHuy.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnHuy.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHuy.Image = global::QuanLyNhanSu.Properties.Resources.cancel;
            this.btnHuy.Location = new System.Drawing.Point(787, 105);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(99, 49);
            this.btnHuy.TabIndex = 11;
            this.btnHuy.Text = "Huỷ";
            this.btnHuy.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnHuy.UseVisualStyleBackColor = false;
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnSua
            // 
            this.btnSua.AutoSize = true;
            this.btnSua.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnSua.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSua.FlatAppearance.BorderSize = 0;
            this.btnSua.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnSua.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSua.Image = global::QuanLyNhanSu.Properties.Resources.fix;
            this.btnSua.Location = new System.Drawing.Point(497, 105);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(100, 49);
            this.btnSua.TabIndex = 9;
            this.btnSua.Text = "Sửa";
            this.btnSua.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnSua.UseVisualStyleBackColor = false;
            this.btnSua.Click += new System.EventHandler(this.btnSua_Click);
            // 
            // btnXoa
            // 
            this.btnXoa.AutoSize = true;
            this.btnXoa.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnXoa.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXoa.FlatAppearance.BorderSize = 0;
            this.btnXoa.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnXoa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoa.Image = global::QuanLyNhanSu.Properties.Resources.delete;
            this.btnXoa.Location = new System.Drawing.Point(638, 105);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(102, 49);
            this.btnXoa.TabIndex = 10;
            this.btnXoa.Text = "Xoá";
            this.btnXoa.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnXoa.UseVisualStyleBackColor = false;
            this.btnXoa.Click += new System.EventHandler(this.btnXoa_Click);
            // 
            // btnThem
            // 
            this.btnThem.AutoSize = true;
            this.btnThem.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnThem.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThem.FlatAppearance.BorderSize = 0;
            this.btnThem.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnThem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.Image = global::QuanLyNhanSu.Properties.Resources.add;
            this.btnThem.Location = new System.Drawing.Point(339, 105);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(122, 49);
            this.btnThem.TabIndex = 8;
            this.btnThem.Text = "Thêm";
            this.btnThem.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnThem.UseVisualStyleBackColor = false;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // txtTongSoNhanVien
            // 
            this.txtTongSoNhanVien.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTongSoNhanVien.Location = new System.Drawing.Point(1066, 37);
            this.txtTongSoNhanVien.Name = "txtTongSoNhanVien";
            this.txtTongSoNhanVien.Size = new System.Drawing.Size(234, 30);
            this.txtTongSoNhanVien.TabIndex = 7;
            // 
            // lblTongSoNhanVien
            // 
            this.lblTongSoNhanVien.AutoSize = true;
            this.lblTongSoNhanVien.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTongSoNhanVien.Location = new System.Drawing.Point(862, 40);
            this.lblTongSoNhanVien.Name = "lblTongSoNhanVien";
            this.lblTongSoNhanVien.Size = new System.Drawing.Size(198, 25);
            this.lblTongSoNhanVien.TabIndex = 11;
            this.lblTongSoNhanVien.Text = "Tổng số nhân viên:";
            // 
            // txtTenCV
            // 
            this.txtTenCV.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenCV.Location = new System.Drawing.Point(622, 15);
            this.txtTenCV.MaxLength = 50;
            this.txtTenCV.Name = "txtTenCV";
            this.txtTenCV.Size = new System.Drawing.Size(234, 30);
            this.txtTenCV.TabIndex = 5;
            this.txtTenCV.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // lblTenCV
            // 
            this.lblTenCV.AutoSize = true;
            this.lblTenCV.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenCV.Location = new System.Drawing.Point(417, 15);
            this.lblTenCV.Name = "lblTenCV";
            this.lblTenCV.Size = new System.Drawing.Size(138, 25);
            this.lblTenCV.TabIndex = 9;
            this.lblTenCV.Text = "Tên chức vụ:";
            // 
            // txtMaCV
            // 
            this.txtMaCV.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaCV.Location = new System.Drawing.Point(154, 12);
            this.txtMaCV.Name = "txtMaCV";
            this.txtMaCV.Size = new System.Drawing.Size(240, 30);
            this.txtMaCV.TabIndex = 3;
            this.txtMaCV.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // lblMaChucVu
            // 
            this.lblMaChucVu.AutoSize = true;
            this.lblMaChucVu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaChucVu.Location = new System.Drawing.Point(18, 15);
            this.lblMaChucVu.Name = "lblMaChucVu";
            this.lblMaChucVu.Size = new System.Drawing.Size(130, 25);
            this.lblMaChucVu.TabIndex = 6;
            this.lblMaChucVu.Text = "Mã chức vụ:";
            // 
            // lblTimKiem
            // 
            this.lblTimKiem.AutoSize = true;
            this.lblTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTimKiem.Location = new System.Drawing.Point(751, 328);
            this.lblTimKiem.Name = "lblTimKiem";
            this.lblTimKiem.Size = new System.Drawing.Size(145, 32);
            this.lblTimKiem.TabIndex = 33;
            this.lblTimKiem.Text = "Tìm kiếm:";
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.Location = new System.Drawing.Point(902, 327);
            this.txtTimKiem.MaxLength = 50;
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(299, 30);
            this.txtTimKiem.TabIndex = 12;
            this.txtTimKiem.TextChanged += new System.EventHandler(this.TimKiem);
            this.txtTimKiem.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtTimKiem_KeyPress);
            // 
            // FrmQuanLyChucVu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.lblTimKiem);
            this.Controls.Add(this.dgvThongTinChucVu);
            this.Controls.Add(this.lblThongTinChucVu);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.pnlHeader);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmQuanLyChucVu";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmQuanLyChucVu";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmQuanLyChucVu_Load);
            this.TextChanged += new System.EventHandler(this.EnableButtons);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinChucVu)).EndInit();
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.Label lblChucVuNV_DN;
        private System.Windows.Forms.Label lblChucVuDN;
        private System.Windows.Forms.Label lblPhongBanNV_DN;
        private System.Windows.Forms.Label lblPhongBanDN;
        private System.Windows.Forms.Label lblHoTenNV_DN;
        private System.Windows.Forms.Label lblHoTenDN;
        private System.Windows.Forms.Label lblMaNV_DN;
        private System.Windows.Forms.Label lblMaNhanVienDN;
        private System.Windows.Forms.Button btnTroVe;
        private System.Windows.Forms.DataGridView dgvThongTinChucVu;
        private System.Windows.Forms.Label lblThongTinChucVu;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Button btnHuy;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.TextBox txtTongSoNhanVien;
        private System.Windows.Forms.Label lblTongSoNhanVien;
        private System.Windows.Forms.TextBox txtTenCV;
        private System.Windows.Forms.Label lblTenCV;
        private System.Windows.Forms.TextBox txtMaCV;
        private System.Windows.Forms.Label lblMaChucVu;
        private System.Windows.Forms.ComboBox cmbPhongBan;
        private System.Windows.Forms.Label lblPhongBan;
        private System.Windows.Forms.Label lblTimKiem;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaCV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTenChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colLuongKhoiDiem;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongSoNhanVien;
        private System.Windows.Forms.TextBox txtLuongKhoiDiem;
        private System.Windows.Forms.Label lblLuongKhoiDiem;
        private System.Windows.Forms.Button btnRefresh;
    }
}