namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmLichLamViec
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
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.lblThongTinLichLamViec = new System.Windows.Forms.Label();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.cmbLoaiCa = new System.Windows.Forms.ComboBox();
            this.lblLoaiCa = new System.Windows.Forms.Label();
            this.cmbCa = new System.Windows.Forms.ComboBox();
            this.lblCa = new System.Windows.Forms.Label();
            this.dtpNgayLam = new System.Windows.Forms.DateTimePicker();
            this.lblNgayLam = new System.Windows.Forms.Label();
            this.btnThem = new System.Windows.Forms.Button();
            this.dgvThongTinLichLamViec = new System.Windows.Forms.DataGridView();
            this.colMaLLV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNhanVienLapLich = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNgaylam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colLoaiCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.lblChucVuNV_DN = new System.Windows.Forms.Label();
            this.lblChucVuDN = new System.Windows.Forms.Label();
            this.lblPhongBanNV_DN = new System.Windows.Forms.Label();
            this.lblPhongBanDN = new System.Windows.Forms.Label();
            this.lblHoTenNV_DN = new System.Windows.Forms.Label();
            this.lblHoTenDN = new System.Windows.Forms.Label();
            this.lblMaNV_DN = new System.Windows.Forms.Label();
            this.lblMaNhanVienDN = new System.Windows.Forms.Label();
            this.lblTimKiem = new System.Windows.Forms.Label();
            this.pnlHeader = new System.Windows.Forms.Panel();
            this.btnRefresh = new System.Windows.Forms.Button();
            this.btnTroVe = new System.Windows.Forms.Button();
            this.pnlThongTinCa = new System.Windows.Forms.Panel();
            this.txtTenCa = new System.Windows.Forms.TextBox();
            this.lblTenCa = new System.Windows.Forms.Label();
            this.txtGioKetThuc = new System.Windows.Forms.TextBox();
            this.lblThoiGianKetThuc = new System.Windows.Forms.Label();
            this.txtGioBatDau = new System.Windows.Forms.TextBox();
            this.lblThoiGianBatDau = new System.Windows.Forms.Label();
            this.txtMaCa = new System.Windows.Forms.TextBox();
            this.lblMaCa = new System.Windows.Forms.Label();
            this.lblThongTinCa = new System.Windows.Forms.Label();
            this.pnlMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinLichLamViec)).BeginInit();
            this.pnlHeader.SuspendLayout();
            this.pnlThongTinCa.SuspendLayout();
            this.SuspendLayout();
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.Location = new System.Drawing.Point(884, 370);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(299, 30);
            this.txtTimKiem.TabIndex = 59;
            // 
            // lblThongTinLichLamViec
            // 
            this.lblThongTinLichLamViec.AutoSize = true;
            this.lblThongTinLichLamViec.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThongTinLichLamViec.Location = new System.Drawing.Point(958, 116);
            this.lblThongTinLichLamViec.Name = "lblThongTinLichLamViec";
            this.lblThongTinLichLamViec.Size = new System.Drawing.Size(318, 32);
            this.lblThongTinLichLamViec.TabIndex = 57;
            this.lblThongTinLichLamViec.Text = "Thông tin lịch làm việc";
            this.lblThongTinLichLamViec.Click += new System.EventHandler(this.lblThongTinLichLamViec_Click);
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.cmbLoaiCa);
            this.pnlMenu.Controls.Add(this.lblLoaiCa);
            this.pnlMenu.Controls.Add(this.cmbCa);
            this.pnlMenu.Controls.Add(this.lblCa);
            this.pnlMenu.Controls.Add(this.dtpNgayLam);
            this.pnlMenu.Controls.Add(this.lblNgayLam);
            this.pnlMenu.Controls.Add(this.btnThem);
            this.pnlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.pnlMenu.Location = new System.Drawing.Point(687, 176);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(875, 130);
            this.pnlMenu.TabIndex = 56;
            // 
            // cmbLoaiCa
            // 
            this.cmbLoaiCa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbLoaiCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbLoaiCa.FormattingEnabled = true;
            this.cmbLoaiCa.Location = new System.Drawing.Point(638, 12);
            this.cmbLoaiCa.Name = "cmbLoaiCa";
            this.cmbLoaiCa.Size = new System.Drawing.Size(216, 33);
            this.cmbLoaiCa.TabIndex = 55;
            // 
            // lblLoaiCa
            // 
            this.lblLoaiCa.AutoSize = true;
            this.lblLoaiCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLoaiCa.Location = new System.Drawing.Point(543, 19);
            this.lblLoaiCa.Name = "lblLoaiCa";
            this.lblLoaiCa.Size = new System.Drawing.Size(89, 25);
            this.lblLoaiCa.TabIndex = 54;
            this.lblLoaiCa.Text = "Loại ca:";
            // 
            // cmbCa
            // 
            this.cmbCa.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbCa.FormattingEnabled = true;
            this.cmbCa.Location = new System.Drawing.Point(320, 15);
            this.cmbCa.Name = "cmbCa";
            this.cmbCa.Size = new System.Drawing.Size(216, 33);
            this.cmbCa.TabIndex = 53;
            this.cmbCa.TextChanged += new System.EventHandler(this.cmbCa_TextChanged);
            // 
            // lblCa
            // 
            this.lblCa.AutoSize = true;
            this.lblCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblCa.Location = new System.Drawing.Point(267, 20);
            this.lblCa.Name = "lblCa";
            this.lblCa.Size = new System.Drawing.Size(47, 25);
            this.lblCa.TabIndex = 52;
            this.lblCa.Text = "Ca:";
            // 
            // dtpNgayLam
            // 
            this.dtpNgayLam.CustomFormat = "yyyy-MM-dd";
            this.dtpNgayLam.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpNgayLam.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpNgayLam.Location = new System.Drawing.Point(120, 15);
            this.dtpNgayLam.Name = "dtpNgayLam";
            this.dtpNgayLam.Size = new System.Drawing.Size(141, 30);
            this.dtpNgayLam.TabIndex = 51;
            this.dtpNgayLam.ValueChanged += new System.EventHandler(this.dtpNgayLam_ValueChanged);
            // 
            // lblNgayLam
            // 
            this.lblNgayLam.AutoSize = true;
            this.lblNgayLam.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblNgayLam.Location = new System.Drawing.Point(5, 15);
            this.lblNgayLam.Name = "lblNgayLam";
            this.lblNgayLam.Size = new System.Drawing.Size(109, 25);
            this.lblNgayLam.TabIndex = 50;
            this.lblNgayLam.Text = "Ngày làm:";
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
            this.btnThem.Location = new System.Drawing.Point(358, 65);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(122, 49);
            this.btnThem.TabIndex = 42;
            this.btnThem.Text = "Thêm";
            this.btnThem.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnThem.UseVisualStyleBackColor = false;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // dgvThongTinLichLamViec
            // 
            this.dgvThongTinLichLamViec.AllowUserToAddRows = false;
            this.dgvThongTinLichLamViec.AllowUserToDeleteRows = false;
            this.dgvThongTinLichLamViec.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongTinLichLamViec.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            this.dgvThongTinLichLamViec.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongTinLichLamViec.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaLLV,
            this.colNhanVienLapLich,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu,
            this.colNgaylam,
            this.colCa,
            this.colLoaiCa});
            this.dgvThongTinLichLamViec.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvThongTinLichLamViec.Location = new System.Drawing.Point(0, 406);
            this.dgvThongTinLichLamViec.Name = "dgvThongTinLichLamViec";
            this.dgvThongTinLichLamViec.ReadOnly = true;
            this.dgvThongTinLichLamViec.RowHeadersVisible = false;
            this.dgvThongTinLichLamViec.RowHeadersWidth = 51;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvThongTinLichLamViec.RowsDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvThongTinLichLamViec.RowTemplate.Height = 24;
            this.dgvThongTinLichLamViec.Size = new System.Drawing.Size(1924, 577);
            this.dgvThongTinLichLamViec.TabIndex = 55;
            // 
            // colMaLLV
            // 
            this.colMaLLV.HeaderText = "Mã lịch làm việc";
            this.colMaLLV.MinimumWidth = 6;
            this.colMaLLV.Name = "colMaLLV";
            this.colMaLLV.ReadOnly = true;
            // 
            // colNhanVienLapLich
            // 
            this.colNhanVienLapLich.HeaderText = "Nhân viên lập lịch";
            this.colNhanVienLapLich.MinimumWidth = 6;
            this.colNhanVienLapLich.Name = "colNhanVienLapLich";
            this.colNhanVienLapLich.ReadOnly = true;
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
            // colNgaylam
            // 
            this.colNgaylam.HeaderText = "Ngày làm";
            this.colNgaylam.MinimumWidth = 6;
            this.colNgaylam.Name = "colNgaylam";
            this.colNgaylam.ReadOnly = true;
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
            // lblChucVuNV_DN
            // 
            this.lblChucVuNV_DN.AutoSize = true;
            this.lblChucVuNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuNV_DN.Location = new System.Drawing.Point(1238, 72);
            this.lblChucVuNV_DN.Name = "lblChucVuNV_DN";
            this.lblChucVuNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblChucVuNV_DN.TabIndex = 8;
            this.lblChucVuNV_DN.Text = "...";
            // 
            // lblChucVuDN
            // 
            this.lblChucVuDN.AutoSize = true;
            this.lblChucVuDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuDN.Location = new System.Drawing.Point(1062, 72);
            this.lblChucVuDN.Name = "lblChucVuDN";
            this.lblChucVuDN.Size = new System.Drawing.Size(133, 32);
            this.lblChucVuDN.TabIndex = 7;
            this.lblChucVuDN.Text = "Chức vụ:";
            // 
            // lblPhongBanNV_DN
            // 
            this.lblPhongBanNV_DN.AutoSize = true;
            this.lblPhongBanNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV_DN.Location = new System.Drawing.Point(1238, 9);
            this.lblPhongBanNV_DN.Name = "lblPhongBanNV_DN";
            this.lblPhongBanNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblPhongBanNV_DN.TabIndex = 6;
            this.lblPhongBanNV_DN.Text = "...";
            // 
            // lblPhongBanDN
            // 
            this.lblPhongBanDN.AutoSize = true;
            this.lblPhongBanDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanDN.Location = new System.Drawing.Point(1062, 9);
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
            // lblTimKiem
            // 
            this.lblTimKiem.AutoSize = true;
            this.lblTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTimKiem.Location = new System.Drawing.Point(733, 368);
            this.lblTimKiem.Name = "lblTimKiem";
            this.lblTimKiem.Size = new System.Drawing.Size(145, 32);
            this.lblTimKiem.TabIndex = 58;
            this.lblTimKiem.Text = "Tìm kiếm:";
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
            this.btnRefresh.TabIndex = 68;
            this.btnRefresh.Text = "Refresh";
            this.btnRefresh.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnRefresh.UseVisualStyleBackColor = false;
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
            // pnlThongTinCa
            // 
            this.pnlThongTinCa.BackColor = System.Drawing.SystemColors.Info;
            this.pnlThongTinCa.Controls.Add(this.txtTenCa);
            this.pnlThongTinCa.Controls.Add(this.lblTenCa);
            this.pnlThongTinCa.Controls.Add(this.txtGioKetThuc);
            this.pnlThongTinCa.Controls.Add(this.lblThoiGianKetThuc);
            this.pnlThongTinCa.Controls.Add(this.txtGioBatDau);
            this.pnlThongTinCa.Controls.Add(this.lblThoiGianBatDau);
            this.pnlThongTinCa.Controls.Add(this.txtMaCa);
            this.pnlThongTinCa.Controls.Add(this.lblMaCa);
            this.pnlThongTinCa.Location = new System.Drawing.Point(200, 163);
            this.pnlThongTinCa.Name = "pnlThongTinCa";
            this.pnlThongTinCa.Size = new System.Drawing.Size(413, 202);
            this.pnlThongTinCa.TabIndex = 60;
            // 
            // txtTenCa
            // 
            this.txtTenCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenCa.Location = new System.Drawing.Point(198, 63);
            this.txtTenCa.Name = "txtTenCa";
            this.txtTenCa.Size = new System.Drawing.Size(194, 30);
            this.txtTenCa.TabIndex = 54;
            // 
            // lblTenCa
            // 
            this.lblTenCa.AutoSize = true;
            this.lblTenCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenCa.Location = new System.Drawing.Point(5, 68);
            this.lblTenCa.Name = "lblTenCa";
            this.lblTenCa.Size = new System.Drawing.Size(86, 25);
            this.lblTenCa.TabIndex = 53;
            this.lblTenCa.Text = "Tên ca:";
            // 
            // txtGioKetThuc
            // 
            this.txtGioKetThuc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGioKetThuc.Location = new System.Drawing.Point(198, 153);
            this.txtGioKetThuc.Name = "txtGioKetThuc";
            this.txtGioKetThuc.Size = new System.Drawing.Size(194, 30);
            this.txtGioKetThuc.TabIndex = 52;
            // 
            // lblThoiGianKetThuc
            // 
            this.lblThoiGianKetThuc.AutoSize = true;
            this.lblThoiGianKetThuc.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThoiGianKetThuc.Location = new System.Drawing.Point(3, 158);
            this.lblThoiGianKetThuc.Name = "lblThoiGianKetThuc";
            this.lblThoiGianKetThuc.Size = new System.Drawing.Size(191, 25);
            this.lblThoiGianKetThuc.TabIndex = 51;
            this.lblThoiGianKetThuc.Text = "Thời gian kết thúc:";
            // 
            // txtGioBatDau
            // 
            this.txtGioBatDau.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtGioBatDau.Location = new System.Drawing.Point(198, 110);
            this.txtGioBatDau.Name = "txtGioBatDau";
            this.txtGioBatDau.Size = new System.Drawing.Size(194, 30);
            this.txtGioBatDau.TabIndex = 50;
            // 
            // lblThoiGianBatDau
            // 
            this.lblThoiGianBatDau.AutoSize = true;
            this.lblThoiGianBatDau.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThoiGianBatDau.Location = new System.Drawing.Point(5, 115);
            this.lblThoiGianBatDau.Name = "lblThoiGianBatDau";
            this.lblThoiGianBatDau.Size = new System.Drawing.Size(187, 25);
            this.lblThoiGianBatDau.TabIndex = 49;
            this.lblThoiGianBatDau.Text = "Thời gian bắt đầu:";
            // 
            // txtMaCa
            // 
            this.txtMaCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaCa.Location = new System.Drawing.Point(198, 20);
            this.txtMaCa.Name = "txtMaCa";
            this.txtMaCa.Size = new System.Drawing.Size(194, 30);
            this.txtMaCa.TabIndex = 48;
            // 
            // lblMaCa
            // 
            this.lblMaCa.AutoSize = true;
            this.lblMaCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaCa.Location = new System.Drawing.Point(5, 25);
            this.lblMaCa.Name = "lblMaCa";
            this.lblMaCa.Size = new System.Drawing.Size(78, 25);
            this.lblMaCa.TabIndex = 47;
            this.lblMaCa.Text = "Mã ca:";
            // 
            // lblThongTinCa
            // 
            this.lblThongTinCa.AutoSize = true;
            this.lblThongTinCa.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThongTinCa.Location = new System.Drawing.Point(318, 128);
            this.lblThongTinCa.Name = "lblThongTinCa";
            this.lblThongTinCa.Size = new System.Drawing.Size(182, 32);
            this.lblThongTinCa.TabIndex = 61;
            this.lblThongTinCa.Text = "Thông tin ca";
            // 
            // FrmLichLamViec
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.lblThongTinCa);
            this.Controls.Add(this.pnlThongTinCa);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.lblThongTinLichLamViec);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.dgvThongTinLichLamViec);
            this.Controls.Add(this.lblTimKiem);
            this.Controls.Add(this.pnlHeader);
            this.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmLichLamViec";
            this.Text = "frmLichLamViec";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmLichLamViec_Load);
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinLichLamViec)).EndInit();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlThongTinCa.ResumeLayout(false);
            this.pnlThongTinCa.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.Label lblThongTinLichLamViec;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.DataGridView dgvThongTinLichLamViec;
        private System.Windows.Forms.Label lblChucVuNV_DN;
        private System.Windows.Forms.Label lblChucVuDN;
        private System.Windows.Forms.Label lblPhongBanNV_DN;
        private System.Windows.Forms.Label lblPhongBanDN;
        private System.Windows.Forms.Label lblHoTenNV_DN;
        private System.Windows.Forms.Label lblHoTenDN;
        private System.Windows.Forms.Label lblMaNV_DN;
        private System.Windows.Forms.Label lblMaNhanVienDN;
        private System.Windows.Forms.Button btnTroVe;
        private System.Windows.Forms.Label lblTimKiem;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.DateTimePicker dtpNgayLam;
        private System.Windows.Forms.Label lblNgayLam;
        private System.Windows.Forms.ComboBox cmbLoaiCa;
        private System.Windows.Forms.Label lblLoaiCa;
        private System.Windows.Forms.ComboBox cmbCa;
        private System.Windows.Forms.Label lblCa;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.Panel pnlThongTinCa;
        private System.Windows.Forms.TextBox txtGioKetThuc;
        private System.Windows.Forms.Label lblThoiGianKetThuc;
        private System.Windows.Forms.TextBox txtGioBatDau;
        private System.Windows.Forms.Label lblThoiGianBatDau;
        private System.Windows.Forms.TextBox txtMaCa;
        private System.Windows.Forms.Label lblMaCa;
        private System.Windows.Forms.Label lblThongTinCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaLLV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNhanVienLapLich;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNgaylam;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colLoaiCa;
        private System.Windows.Forms.TextBox txtTenCa;
        private System.Windows.Forms.Label lblTenCa;
    }
}