namespace QuanLyNhanSu.PresentationTier
{
    partial class frmQuanLyCa
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
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle4 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle5 = new System.Windows.Forms.DataGridViewCellStyle();
            System.Windows.Forms.DataGridViewCellStyle dataGridViewCellStyle6 = new System.Windows.Forms.DataGridViewCellStyle();
            this.lblThongTinCa = new System.Windows.Forms.Label();
            this.dgvThongTinCa = new System.Windows.Forms.DataGridView();
            this.colMaCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTenCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThoiGianBatDau = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThoiGianKetThuc = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.txtTenCa = new System.Windows.Forms.TextBox();
            this.lblTenCa = new System.Windows.Forms.Label();
            this.lblMaCa = new System.Windows.Forms.Label();
            this.lblChucVuNV_DN = new System.Windows.Forms.Label();
            this.lblChucVuDN = new System.Windows.Forms.Label();
            this.lblPhongBanNV_DN = new System.Windows.Forms.Label();
            this.lblPhongBanDN = new System.Windows.Forms.Label();
            this.lblHoTenNV_DN = new System.Windows.Forms.Label();
            this.lblHoTenDN = new System.Windows.Forms.Label();
            this.lblMaNV_DN = new System.Windows.Forms.Label();
            this.lblMaNhanVienDN = new System.Windows.Forms.Label();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.btnQuanLyLoaiCa = new System.Windows.Forms.Button();
            this.dtpThoiGianKetThuc = new System.Windows.Forms.DateTimePicker();
            this.dtpThoiGianBatDau = new System.Windows.Forms.DateTimePicker();
            this.txtMaCa = new System.Windows.Forms.TextBox();
            this.btnHuy = new System.Windows.Forms.Button();
            this.btnSua = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.lblThoiGianKetThuc = new System.Windows.Forms.Label();
            this.lblThoiGianBatDau = new System.Windows.Forms.Label();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnTroVe = new System.Windows.Forms.Button();
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.lblTimKiem = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinCa)).BeginInit();
            this.pnlMenu.SuspendLayout();
            this.pnlHeader.SuspendLayout();
            this.SuspendLayout();
            // 
            // lblThongTinCa
            // 
            this.lblThongTinCa.AutoSize = true;
            this.lblThongTinCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThongTinCa.Location = new System.Drawing.Point(170, 131);
            this.lblThongTinCa.Name = "lblThongTinCa";
            this.lblThongTinCa.Size = new System.Drawing.Size(182, 32);
            this.lblThongTinCa.TabIndex = 14;
            this.lblThongTinCa.Text = "Thông tin ca";
            // 
            // dgvThongTinCa
            // 
            this.dgvThongTinCa.AllowUserToAddRows = false;
            this.dgvThongTinCa.AllowUserToDeleteRows = false;
            this.dgvThongTinCa.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongTinCa.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvThongTinCa.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvThongTinCa.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongTinCa.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaCa,
            this.colTenCa,
            this.colThoiGianBatDau,
            this.colThoiGianKetThuc});
            this.dgvThongTinCa.Location = new System.Drawing.Point(542, 180);
            this.dgvThongTinCa.Name = "dgvThongTinCa";
            this.dgvThongTinCa.ReadOnly = true;
            dataGridViewCellStyle5.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle5.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle5.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle5.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle5.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle5.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle5.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvThongTinCa.RowHeadersDefaultCellStyle = dataGridViewCellStyle5;
            this.dgvThongTinCa.RowHeadersVisible = false;
            this.dgvThongTinCa.RowHeadersWidth = 51;
            dataGridViewCellStyle6.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvThongTinCa.RowsDefaultCellStyle = dataGridViewCellStyle6;
            this.dgvThongTinCa.RowTemplate.Height = 24;
            this.dgvThongTinCa.Size = new System.Drawing.Size(708, 481);
            this.dgvThongTinCa.TabIndex = 12;
            this.dgvThongTinCa.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvThongTinCa_CellClick);
            // 
            // colMaCa
            // 
            this.colMaCa.HeaderText = "Mã ca";
            this.colMaCa.MinimumWidth = 6;
            this.colMaCa.Name = "colMaCa";
            this.colMaCa.ReadOnly = true;
            // 
            // colTenCa
            // 
            this.colTenCa.HeaderText = "Tên ca";
            this.colTenCa.MinimumWidth = 6;
            this.colTenCa.Name = "colTenCa";
            this.colTenCa.ReadOnly = true;
            // 
            // colThoiGianBatDau
            // 
            this.colThoiGianBatDau.HeaderText = "Thời gian bắt đầu";
            this.colThoiGianBatDau.MinimumWidth = 6;
            this.colThoiGianBatDau.Name = "colThoiGianBatDau";
            this.colThoiGianBatDau.ReadOnly = true;
            // 
            // colThoiGianKetThuc
            // 
            this.colThoiGianKetThuc.HeaderText = "Thời gian kết thúc";
            this.colThoiGianKetThuc.MinimumWidth = 6;
            this.colThoiGianKetThuc.Name = "colThoiGianKetThuc";
            this.colThoiGianKetThuc.ReadOnly = true;
            // 
            // txtTenCa
            // 
            this.txtTenCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenCa.Location = new System.Drawing.Point(148, 98);
            this.txtTenCa.Name = "txtTenCa";
            this.txtTenCa.Size = new System.Drawing.Size(336, 34);
            this.txtTenCa.TabIndex = 3;
            this.txtTenCa.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // lblTenCa
            // 
            this.lblTenCa.AutoSize = true;
            this.lblTenCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenCa.Location = new System.Drawing.Point(28, 103);
            this.lblTenCa.Name = "lblTenCa";
            this.lblTenCa.Size = new System.Drawing.Size(100, 29);
            this.lblTenCa.TabIndex = 4;
            this.lblTenCa.Text = "Tên ca:";
            // 
            // lblMaCa
            // 
            this.lblMaCa.AutoSize = true;
            this.lblMaCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaCa.Location = new System.Drawing.Point(27, 29);
            this.lblMaCa.Name = "lblMaCa";
            this.lblMaCa.Size = new System.Drawing.Size(89, 29);
            this.lblMaCa.TabIndex = 0;
            this.lblMaCa.Text = "Mã ca:";
            // 
            // lblChucVuNV_DN
            // 
            this.lblChucVuNV_DN.AutoSize = true;
            this.lblChucVuNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuNV_DN.Location = new System.Drawing.Point(947, 72);
            this.lblChucVuNV_DN.Name = "lblChucVuNV_DN";
            this.lblChucVuNV_DN.Size = new System.Drawing.Size(41, 32);
            this.lblChucVuNV_DN.TabIndex = 8;
            this.lblChucVuNV_DN.Text = "...";
            // 
            // lblChucVuDN
            // 
            this.lblChucVuDN.AutoSize = true;
            this.lblChucVuDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuDN.Location = new System.Drawing.Point(771, 72);
            this.lblChucVuDN.Name = "lblChucVuDN";
            this.lblChucVuDN.Size = new System.Drawing.Size(133, 32);
            this.lblChucVuDN.TabIndex = 7;
            this.lblChucVuDN.Text = "Chức vụ:";
            // 
            // lblPhongBanNV_DN
            // 
            this.lblPhongBanNV_DN.AutoSize = true;
            this.lblPhongBanNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV_DN.Location = new System.Drawing.Point(947, 9);
            this.lblPhongBanNV_DN.Name = "lblPhongBanNV_DN";
            this.lblPhongBanNV_DN.Size = new System.Drawing.Size(41, 32);
            this.lblPhongBanNV_DN.TabIndex = 6;
            this.lblPhongBanNV_DN.Text = "...";
            // 
            // lblPhongBanDN
            // 
            this.lblPhongBanDN.AutoSize = true;
            this.lblPhongBanDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanDN.Location = new System.Drawing.Point(771, 9);
            this.lblPhongBanDN.Name = "lblPhongBanDN";
            this.lblPhongBanDN.Size = new System.Drawing.Size(170, 32);
            this.lblPhongBanDN.TabIndex = 5;
            this.lblPhongBanDN.Text = "Phòng ban:";
            // 
            // lblHoTenNV_DN
            // 
            this.lblHoTenNV_DN.AutoSize = true;
            this.lblHoTenNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHoTenNV_DN.Location = new System.Drawing.Point(393, 72);
            this.lblHoTenNV_DN.Name = "lblHoTenNV_DN";
            this.lblHoTenNV_DN.Size = new System.Drawing.Size(41, 32);
            this.lblHoTenNV_DN.TabIndex = 4;
            this.lblHoTenNV_DN.Text = "...";
            this.lblHoTenNV_DN.UseMnemonic = false;
            // 
            // lblHoTenDN
            // 
            this.lblHoTenDN.AutoSize = true;
            this.lblHoTenDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHoTenDN.Location = new System.Drawing.Point(182, 72);
            this.lblHoTenDN.Name = "lblHoTenDN";
            this.lblHoTenDN.Size = new System.Drawing.Size(112, 32);
            this.lblHoTenDN.TabIndex = 3;
            this.lblHoTenDN.Text = "Họ tên:";
            // 
            // lblMaNV_DN
            // 
            this.lblMaNV_DN.AutoSize = true;
            this.lblMaNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaNV_DN.Location = new System.Drawing.Point(393, 9);
            this.lblMaNV_DN.Name = "lblMaNV_DN";
            this.lblMaNV_DN.Size = new System.Drawing.Size(41, 32);
            this.lblMaNV_DN.TabIndex = 2;
            this.lblMaNV_DN.Text = "...";
            this.lblMaNV_DN.UseMnemonic = false;
            // 
            // lblMaNhanVienDN
            // 
            this.lblMaNhanVienDN.AutoSize = true;
            this.lblMaNhanVienDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaNhanVienDN.Location = new System.Drawing.Point(182, 9);
            this.lblMaNhanVienDN.Name = "lblMaNhanVienDN";
            this.lblMaNhanVienDN.Size = new System.Drawing.Size(205, 32);
            this.lblMaNhanVienDN.TabIndex = 1;
            this.lblMaNhanVienDN.Text = "Mã nhân viên:";
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.btnQuanLyLoaiCa);
            this.pnlMenu.Controls.Add(this.dtpThoiGianKetThuc);
            this.pnlMenu.Controls.Add(this.dtpThoiGianBatDau);
            this.pnlMenu.Controls.Add(this.txtMaCa);
            this.pnlMenu.Controls.Add(this.btnHuy);
            this.pnlMenu.Controls.Add(this.btnSua);
            this.pnlMenu.Controls.Add(this.btnXoa);
            this.pnlMenu.Controls.Add(this.btnThem);
            this.pnlMenu.Controls.Add(this.lblThoiGianKetThuc);
            this.pnlMenu.Controls.Add(this.lblThoiGianBatDau);
            this.pnlMenu.Controls.Add(this.txtTenCa);
            this.pnlMenu.Controls.Add(this.lblTenCa);
            this.pnlMenu.Controls.Add(this.lblMaCa);
            this.pnlMenu.Location = new System.Drawing.Point(12, 181);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(512, 466);
            this.pnlMenu.TabIndex = 13;
            // 
            // btnQuanLyLoaiCa
            // 
            this.btnQuanLyLoaiCa.AutoSize = true;
            this.btnQuanLyLoaiCa.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnQuanLyLoaiCa.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQuanLyLoaiCa.FlatAppearance.BorderSize = 0;
            this.btnQuanLyLoaiCa.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQuanLyLoaiCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQuanLyLoaiCa.Image = global::QuanLyNhanSu.Properties.Resources.shitf1;
            this.btnQuanLyLoaiCa.Location = new System.Drawing.Point(132, 386);
            this.btnQuanLyLoaiCa.Name = "btnQuanLyLoaiCa";
            this.btnQuanLyLoaiCa.Size = new System.Drawing.Size(248, 66);
            this.btnQuanLyLoaiCa.TabIndex = 49;
            this.btnQuanLyLoaiCa.Text = "Quản lý loại ca";
            this.btnQuanLyLoaiCa.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnQuanLyLoaiCa.UseVisualStyleBackColor = false;
            this.btnQuanLyLoaiCa.Click += new System.EventHandler(this.btnQuanLyLoaiCa_Click);
            // 
            // dtpThoiGianKetThuc
            // 
            this.dtpThoiGianKetThuc.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpThoiGianKetThuc.CustomFormat = "HH:mm";
            this.dtpThoiGianKetThuc.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpThoiGianKetThuc.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpThoiGianKetThuc.Location = new System.Drawing.Point(260, 236);
            this.dtpThoiGianKetThuc.Name = "dtpThoiGianKetThuc";
            this.dtpThoiGianKetThuc.ShowUpDown = true;
            this.dtpThoiGianKetThuc.Size = new System.Drawing.Size(103, 34);
            this.dtpThoiGianKetThuc.TabIndex = 48;
            // 
            // dtpThoiGianBatDau
            // 
            this.dtpThoiGianBatDau.CalendarFont = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpThoiGianBatDau.CustomFormat = "HH:mm";
            this.dtpThoiGianBatDau.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpThoiGianBatDau.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpThoiGianBatDau.Location = new System.Drawing.Point(260, 162);
            this.dtpThoiGianBatDau.Name = "dtpThoiGianBatDau";
            this.dtpThoiGianBatDau.ShowUpDown = true;
            this.dtpThoiGianBatDau.Size = new System.Drawing.Size(102, 34);
            this.dtpThoiGianBatDau.TabIndex = 47;
            // 
            // txtMaCa
            // 
            this.txtMaCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaCa.Location = new System.Drawing.Point(148, 29);
            this.txtMaCa.Name = "txtMaCa";
            this.txtMaCa.Size = new System.Drawing.Size(336, 34);
            this.txtMaCa.TabIndex = 46;
            this.txtMaCa.TextChanged += new System.EventHandler(this.EnableButtons);
            // 
            // btnHuy
            // 
            this.btnHuy.AutoSize = true;
            this.btnHuy.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnHuy.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnHuy.FlatAppearance.BorderSize = 0;
            this.btnHuy.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnHuy.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnHuy.Image = global::QuanLyNhanSu.Properties.Resources.cancel;
            this.btnHuy.Location = new System.Drawing.Point(397, 311);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(99, 49);
            this.btnHuy.TabIndex = 45;
            this.btnHuy.Text = "Huỷ";
            this.btnHuy.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnHuy.UseVisualStyleBackColor = false;
            this.btnHuy.TextChanged += new System.EventHandler(this.EnableButtons);
            this.btnHuy.Click += new System.EventHandler(this.btnHuy_Click);
            // 
            // btnSua
            // 
            this.btnSua.AutoSize = true;
            this.btnSua.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnSua.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnSua.FlatAppearance.BorderSize = 0;
            this.btnSua.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnSua.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnSua.Image = global::QuanLyNhanSu.Properties.Resources.fix;
            this.btnSua.Location = new System.Drawing.Point(151, 311);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(100, 49);
            this.btnSua.TabIndex = 44;
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
            this.btnXoa.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXoa.Image = global::QuanLyNhanSu.Properties.Resources.delete;
            this.btnXoa.Location = new System.Drawing.Point(273, 311);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(102, 49);
            this.btnXoa.TabIndex = 43;
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
            this.btnThem.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThem.Image = global::QuanLyNhanSu.Properties.Resources.add;
            this.btnThem.Location = new System.Drawing.Point(5, 311);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(122, 49);
            this.btnThem.TabIndex = 42;
            this.btnThem.Text = "Thêm";
            this.btnThem.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnThem.UseVisualStyleBackColor = false;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // lblThoiGianKetThuc
            // 
            this.lblThoiGianKetThuc.AutoSize = true;
            this.lblThoiGianKetThuc.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThoiGianKetThuc.Location = new System.Drawing.Point(27, 241);
            this.lblThoiGianKetThuc.Name = "lblThoiGianKetThuc";
            this.lblThoiGianKetThuc.Size = new System.Drawing.Size(227, 29);
            this.lblThoiGianKetThuc.TabIndex = 8;
            this.lblThoiGianKetThuc.Text = "Thời gian kết thúc:";
            // 
            // lblThoiGianBatDau
            // 
            this.lblThoiGianBatDau.AutoSize = true;
            this.lblThoiGianBatDau.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThoiGianBatDau.Location = new System.Drawing.Point(28, 167);
            this.lblThoiGianBatDau.Name = "lblThoiGianBatDau";
            this.lblThoiGianBatDau.Size = new System.Drawing.Size(223, 29);
            this.lblThoiGianBatDau.TabIndex = 6;
            this.lblThoiGianBatDau.Text = "Thời gian bắt đầu:";
            // 
            // pnlHeader
            // 
            this.pnlHeader.BackColor = System.Drawing.SystemColors.Info;
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
            this.pnlHeader.Size = new System.Drawing.Size(1262, 110);
            this.pnlHeader.TabIndex = 10;
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
            this.btnTroVe.Size = new System.Drawing.Size(142, 110);
            this.btnTroVe.TabIndex = 1;
            this.btnTroVe.Text = "Trở về";
            this.btnTroVe.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnTroVe.UseVisualStyleBackColor = false;
            this.btnTroVe.Click += new System.EventHandler(this.btnTroVe_Click);
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.Location = new System.Drawing.Point(816, 144);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(299, 30);
            this.txtTimKiem.TabIndex = 42;
            this.txtTimKiem.TextChanged += new System.EventHandler(this.TimKiem);
            // 
            // lblTimKiem
            // 
            this.lblTimKiem.AutoSize = true;
            this.lblTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTimKiem.Location = new System.Drawing.Point(665, 145);
            this.lblTimKiem.Name = "lblTimKiem";
            this.lblTimKiem.Size = new System.Drawing.Size(145, 32);
            this.lblTimKiem.TabIndex = 41;
            this.lblTimKiem.Text = "Tìm kiếm:";
            // 
            // frmQuanLyCa
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.AutoSize = true;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1262, 673);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.lblTimKiem);
            this.Controls.Add(this.lblThongTinCa);
            this.Controls.Add(this.dgvThongTinCa);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.pnlHeader);
            this.MaximizeBox = false;
            this.MaximumSize = new System.Drawing.Size(1280, 720);
            this.MinimumSize = new System.Drawing.Size(1280, 720);
            this.Name = "frmQuanLyCa";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "frmQuanLyCa";
            this.Load += new System.EventHandler(this.frmQuanLyCa_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinCa)).EndInit();
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnTroVe;
        private System.Windows.Forms.Label lblThongTinCa;
        private System.Windows.Forms.DataGridView dgvThongTinCa;
        private System.Windows.Forms.TextBox txtTenCa;
        private System.Windows.Forms.Label lblTenCa;
        private System.Windows.Forms.Label lblMaCa;
        private System.Windows.Forms.Label lblChucVuNV_DN;
        private System.Windows.Forms.Label lblChucVuDN;
        private System.Windows.Forms.Label lblPhongBanNV_DN;
        private System.Windows.Forms.Label lblPhongBanDN;
        private System.Windows.Forms.Label lblHoTenNV_DN;
        private System.Windows.Forms.Label lblHoTenDN;
        private System.Windows.Forms.Label lblMaNV_DN;
        private System.Windows.Forms.Label lblMaNhanVienDN;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTenCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThoiGianBatDau;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThoiGianKetThuc;
        private System.Windows.Forms.Label lblThoiGianKetThuc;
        private System.Windows.Forms.Label lblThoiGianBatDau;
        private System.Windows.Forms.Button btnHuy;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.TextBox txtMaCa;
        private System.Windows.Forms.DateTimePicker dtpThoiGianBatDau;
        private System.Windows.Forms.DateTimePicker dtpThoiGianKetThuc;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.Label lblTimKiem;
        private System.Windows.Forms.Button btnQuanLyLoaiCa;
    }
}