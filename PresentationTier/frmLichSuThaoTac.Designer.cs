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
            this.lblHoTenDN = new System.Windows.Forms.Label();
            this.lblChucVuNV_DN = new System.Windows.Forms.Label();
            this.lblChucVuDN = new System.Windows.Forms.Label();
            this.lblPhongBanNV_DN = new System.Windows.Forms.Label();
            this.lblPhongBanDN = new System.Windows.Forms.Label();
            this.lblHoTenNV_DN = new System.Windows.Forms.Label();
            this.lblMaNV_DN = new System.Windows.Forms.Label();
            this.lblMaNhanVienDN = new System.Windows.Forms.Label();
            this.btnTroVe = new System.Windows.Forms.Button();
            this.lblLichSuThaoTac = new System.Windows.Forms.Label();
            this.lblTimKiem = new System.Windows.Forms.Label();
            this.dgvLichSuThaoTac = new System.Windows.Forms.DataGridView();
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
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.dtpNgay = new System.Windows.Forms.DateTimePicker();
            this.dtpThang = new System.Windows.Forms.DateTimePicker();
            this.dtpNam = new System.Windows.Forms.DateTimePicker();
            this.pnlLocTheoThoiGian = new System.Windows.Forms.Panel();
            this.rbNam = new System.Windows.Forms.RadioButton();
            this.rbThang = new System.Windows.Forms.RadioButton();
            this.rbNgay = new System.Windows.Forms.RadioButton();
            this.lblLocTheoThoiGian = new System.Windows.Forms.Label();
            this.pnlLocTheoThaoTac = new System.Windows.Forms.Panel();
            this.rbLocTheoThaoTac = new System.Windows.Forms.RadioButton();
            this.rbToanBoThaoTac = new System.Windows.Forms.RadioButton();
            this.cmbThaoTac = new System.Windows.Forms.ComboBox();
            this.lblLocTheoThaoTac = new System.Windows.Forms.Label();
            this.panel1 = new System.Windows.Forms.Panel();
            this.rbLocTheoGiaoDien = new System.Windows.Forms.RadioButton();
            this.rbToanBoGiaoDien = new System.Windows.Forms.RadioButton();
            this.cmbGiaoDien = new System.Windows.Forms.ComboBox();
            this.lblLocTheoGiaoDien = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLichSuThaoTac)).BeginInit();
            this.pnlHeader.SuspendLayout();
            this.pnlLocTheoThoiGian.SuspendLayout();
            this.pnlLocTheoThaoTac.SuspendLayout();
            this.panel1.SuspendLayout();
            this.SuspendLayout();
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
            // lblChucVuNV_DN
            // 
            this.lblChucVuNV_DN.AutoSize = true;
            this.lblChucVuNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuNV_DN.Location = new System.Drawing.Point(1224, 72);
            this.lblChucVuNV_DN.Name = "lblChucVuNV_DN";
            this.lblChucVuNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblChucVuNV_DN.TabIndex = 8;
            this.lblChucVuNV_DN.Text = "...";
            // 
            // lblChucVuDN
            // 
            this.lblChucVuDN.AutoSize = true;
            this.lblChucVuDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuDN.Location = new System.Drawing.Point(1048, 72);
            this.lblChucVuDN.Name = "lblChucVuDN";
            this.lblChucVuDN.Size = new System.Drawing.Size(133, 32);
            this.lblChucVuDN.TabIndex = 7;
            this.lblChucVuDN.Text = "Chức vụ:";
            // 
            // lblPhongBanNV_DN
            // 
            this.lblPhongBanNV_DN.AutoSize = true;
            this.lblPhongBanNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV_DN.Location = new System.Drawing.Point(1224, 9);
            this.lblPhongBanNV_DN.Name = "lblPhongBanNV_DN";
            this.lblPhongBanNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblPhongBanNV_DN.TabIndex = 6;
            this.lblPhongBanNV_DN.Text = "...";
            // 
            // lblPhongBanDN
            // 
            this.lblPhongBanDN.AutoSize = true;
            this.lblPhongBanDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanDN.Location = new System.Drawing.Point(1048, 9);
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
            // lblLichSuThaoTac
            // 
            this.lblLichSuThaoTac.AutoSize = true;
            this.lblLichSuThaoTac.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLichSuThaoTac.Location = new System.Drawing.Point(797, 116);
            this.lblLichSuThaoTac.Name = "lblLichSuThaoTac";
            this.lblLichSuThaoTac.Size = new System.Drawing.Size(339, 51);
            this.lblLichSuThaoTac.TabIndex = 54;
            this.lblLichSuThaoTac.Text = "Lịch sử thao tác";
            // 
            // lblTimKiem
            // 
            this.lblTimKiem.AutoSize = true;
            this.lblTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTimKiem.Location = new System.Drawing.Point(740, 284);
            this.lblTimKiem.Name = "lblTimKiem";
            this.lblTimKiem.Size = new System.Drawing.Size(145, 32);
            this.lblTimKiem.TabIndex = 50;
            this.lblTimKiem.Text = "Tìm kiếm:";
            // 
            // dgvLichSuThaoTac
            // 
            this.dgvLichSuThaoTac.AllowUserToAddRows = false;
            this.dgvLichSuThaoTac.AllowUserToDeleteRows = false;
            this.dgvLichSuThaoTac.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvLichSuThaoTac.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLichSuThaoTac.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvLichSuThaoTac.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvLichSuThaoTac.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLichSuThaoTac.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
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
            this.dgvLichSuThaoTac.DefaultCellStyle = dataGridViewCellStyle2;
            this.dgvLichSuThaoTac.Location = new System.Drawing.Point(0, 323);
            this.dgvLichSuThaoTac.Name = "dgvLichSuThaoTac";
            this.dgvLichSuThaoTac.ReadOnly = true;
            dataGridViewCellStyle3.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle3.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle3.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle3.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle3.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle3.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvLichSuThaoTac.RowHeadersDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvLichSuThaoTac.RowHeadersVisible = false;
            this.dgvLichSuThaoTac.RowHeadersWidth = 51;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvLichSuThaoTac.RowsDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvLichSuThaoTac.RowTemplate.Height = 24;
            this.dgvLichSuThaoTac.Size = new System.Drawing.Size(1924, 710);
            this.dgvLichSuThaoTac.TabIndex = 5;
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
            // txtTimKiem
            // 
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.Location = new System.Drawing.Point(891, 287);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(299, 30);
            this.txtTimKiem.TabIndex = 3;
            this.txtTimKiem.TextChanged += new System.EventHandler(this.txtTimKiem_TextChanged);
            this.txtTimKiem.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtTimKiem_KeyPress);
            // 
            // dtpNgay
            // 
            this.dtpNgay.CustomFormat = "dd/MM/yyyy";
            this.dtpNgay.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpNgay.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpNgay.Location = new System.Drawing.Point(141, 62);
            this.dtpNgay.Name = "dtpNgay";
            this.dtpNgay.Size = new System.Drawing.Size(151, 30);
            this.dtpNgay.TabIndex = 4;
            this.dtpNgay.ValueChanged += new System.EventHandler(this.dtpNgay_ValueChanged);
            // 
            // dtpThang
            // 
            this.dtpThang.CustomFormat = "MM/yyyy";
            this.dtpThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpThang.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpThang.Location = new System.Drawing.Point(435, 62);
            this.dtpThang.Name = "dtpThang";
            this.dtpThang.ShowUpDown = true;
            this.dtpThang.Size = new System.Drawing.Size(136, 30);
            this.dtpThang.TabIndex = 56;
            this.dtpThang.ValueChanged += new System.EventHandler(this.dtpThang_ValueChanged);
            // 
            // dtpNam
            // 
            this.dtpNam.CustomFormat = "yyyy";
            this.dtpNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpNam.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpNam.Location = new System.Drawing.Point(690, 62);
            this.dtpNam.Name = "dtpNam";
            this.dtpNam.ShowUpDown = true;
            this.dtpNam.Size = new System.Drawing.Size(105, 30);
            this.dtpNam.TabIndex = 58;
            this.dtpNam.ValueChanged += new System.EventHandler(this.dtpNam_ValueChanged);
            // 
            // pnlLocTheoThoiGian
            // 
            this.pnlLocTheoThoiGian.BackColor = System.Drawing.SystemColors.Info;
            this.pnlLocTheoThoiGian.Controls.Add(this.rbNam);
            this.pnlLocTheoThoiGian.Controls.Add(this.rbThang);
            this.pnlLocTheoThoiGian.Controls.Add(this.rbNgay);
            this.pnlLocTheoThoiGian.Controls.Add(this.lblLocTheoThoiGian);
            this.pnlLocTheoThoiGian.Controls.Add(this.dtpNam);
            this.pnlLocTheoThoiGian.Controls.Add(this.dtpThang);
            this.pnlLocTheoThoiGian.Controls.Add(this.dtpNgay);
            this.pnlLocTheoThoiGian.Location = new System.Drawing.Point(19, 170);
            this.pnlLocTheoThoiGian.Name = "pnlLocTheoThoiGian";
            this.pnlLocTheoThoiGian.Size = new System.Drawing.Size(826, 111);
            this.pnlLocTheoThoiGian.TabIndex = 62;
            // 
            // rbNam
            // 
            this.rbNam.AutoSize = true;
            this.rbNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbNam.Location = new System.Drawing.Point(578, 59);
            this.rbNam.Name = "rbNam";
            this.rbNam.Size = new System.Drawing.Size(106, 36);
            this.rbNam.TabIndex = 65;
            this.rbNam.TabStop = true;
            this.rbNam.Text = "Năm:";
            this.rbNam.UseVisualStyleBackColor = true;
            this.rbNam.CheckedChanged += new System.EventHandler(this.rbNam_CheckedChanged);
            // 
            // rbThang
            // 
            this.rbThang.AutoSize = true;
            this.rbThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbThang.Location = new System.Drawing.Point(298, 59);
            this.rbThang.Name = "rbThang";
            this.rbThang.Size = new System.Drawing.Size(130, 36);
            this.rbThang.TabIndex = 64;
            this.rbThang.TabStop = true;
            this.rbThang.Text = "Tháng:";
            this.rbThang.UseVisualStyleBackColor = true;
            this.rbThang.CheckedChanged += new System.EventHandler(this.rbThang_CheckedChanged);
            // 
            // rbNgay
            // 
            this.rbNgay.AutoSize = true;
            this.rbNgay.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbNgay.Location = new System.Drawing.Point(21, 59);
            this.rbNgay.Name = "rbNgay";
            this.rbNgay.Size = new System.Drawing.Size(114, 36);
            this.rbNgay.TabIndex = 63;
            this.rbNgay.TabStop = true;
            this.rbNgay.Text = "Ngày:";
            this.rbNgay.UseVisualStyleBackColor = true;
            this.rbNgay.CheckedChanged += new System.EventHandler(this.rbNgay_CheckedChanged);
            // 
            // lblLocTheoThoiGian
            // 
            this.lblLocTheoThoiGian.AutoSize = true;
            this.lblLocTheoThoiGian.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLocTheoThoiGian.Location = new System.Drawing.Point(314, 12);
            this.lblLocTheoThoiGian.Name = "lblLocTheoThoiGian";
            this.lblLocTheoThoiGian.Size = new System.Drawing.Size(257, 32);
            this.lblLocTheoThoiGian.TabIndex = 62;
            this.lblLocTheoThoiGian.Text = "Lọc theo thời gian";
            // 
            // pnlLocTheoThaoTac
            // 
            this.pnlLocTheoThaoTac.BackColor = System.Drawing.SystemColors.Info;
            this.pnlLocTheoThaoTac.Controls.Add(this.rbLocTheoThaoTac);
            this.pnlLocTheoThaoTac.Controls.Add(this.rbToanBoThaoTac);
            this.pnlLocTheoThaoTac.Controls.Add(this.cmbThaoTac);
            this.pnlLocTheoThaoTac.Controls.Add(this.lblLocTheoThaoTac);
            this.pnlLocTheoThaoTac.Location = new System.Drawing.Point(1372, 170);
            this.pnlLocTheoThaoTac.Name = "pnlLocTheoThaoTac";
            this.pnlLocTheoThaoTac.Size = new System.Drawing.Size(515, 111);
            this.pnlLocTheoThaoTac.TabIndex = 63;
            // 
            // rbLocTheoThaoTac
            // 
            this.rbLocTheoThaoTac.AutoSize = true;
            this.rbLocTheoThaoTac.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbLocTheoThaoTac.Location = new System.Drawing.Point(164, 59);
            this.rbLocTheoThaoTac.Name = "rbLocTheoThaoTac";
            this.rbLocTheoThaoTac.Size = new System.Drawing.Size(93, 36);
            this.rbLocTheoThaoTac.TabIndex = 67;
            this.rbLocTheoThaoTac.TabStop = true;
            this.rbLocTheoThaoTac.Text = "Lọc:";
            this.rbLocTheoThaoTac.UseVisualStyleBackColor = true;
            this.rbLocTheoThaoTac.CheckedChanged += new System.EventHandler(this.rbLocTheoThaoTac_CheckedChanged);
            // 
            // rbToanBoThaoTac
            // 
            this.rbToanBoThaoTac.AutoSize = true;
            this.rbToanBoThaoTac.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbToanBoThaoTac.Location = new System.Drawing.Point(12, 59);
            this.rbToanBoThaoTac.Name = "rbToanBoThaoTac";
            this.rbToanBoThaoTac.Size = new System.Drawing.Size(146, 36);
            this.rbToanBoThaoTac.TabIndex = 66;
            this.rbToanBoThaoTac.TabStop = true;
            this.rbToanBoThaoTac.Text = "Toàn bộ";
            this.rbToanBoThaoTac.UseVisualStyleBackColor = true;
            this.rbToanBoThaoTac.Click += new System.EventHandler(this.rbToanBoThaoTac_Click);
            // 
            // cmbThaoTac
            // 
            this.cmbThaoTac.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbThaoTac.DropDownWidth = 233;
            this.cmbThaoTac.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbThaoTac.FormattingEnabled = true;
            this.cmbThaoTac.Location = new System.Drawing.Point(263, 62);
            this.cmbThaoTac.Name = "cmbThaoTac";
            this.cmbThaoTac.Size = new System.Drawing.Size(233, 33);
            this.cmbThaoTac.TabIndex = 65;
            this.cmbThaoTac.SelectedIndexChanged += new System.EventHandler(this.cmbThaoTac_SelectedIndexChanged);
            // 
            // lblLocTheoThaoTac
            // 
            this.lblLocTheoThaoTac.AutoSize = true;
            this.lblLocTheoThaoTac.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLocTheoThaoTac.Location = new System.Drawing.Point(139, 12);
            this.lblLocTheoThaoTac.Name = "lblLocTheoThaoTac";
            this.lblLocTheoThaoTac.Size = new System.Drawing.Size(248, 32);
            this.lblLocTheoThaoTac.TabIndex = 63;
            this.lblLocTheoThaoTac.Text = "Lọc theo thao tác";
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.Info;
            this.panel1.Controls.Add(this.rbLocTheoGiaoDien);
            this.panel1.Controls.Add(this.rbToanBoGiaoDien);
            this.panel1.Controls.Add(this.cmbGiaoDien);
            this.panel1.Controls.Add(this.lblLocTheoGiaoDien);
            this.panel1.Location = new System.Drawing.Point(851, 170);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(515, 111);
            this.panel1.TabIndex = 64;
            // 
            // rbLocTheoGiaoDien
            // 
            this.rbLocTheoGiaoDien.AutoSize = true;
            this.rbLocTheoGiaoDien.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbLocTheoGiaoDien.Location = new System.Drawing.Point(164, 59);
            this.rbLocTheoGiaoDien.Name = "rbLocTheoGiaoDien";
            this.rbLocTheoGiaoDien.Size = new System.Drawing.Size(93, 36);
            this.rbLocTheoGiaoDien.TabIndex = 67;
            this.rbLocTheoGiaoDien.TabStop = true;
            this.rbLocTheoGiaoDien.Text = "Lọc:";
            this.rbLocTheoGiaoDien.UseVisualStyleBackColor = true;
            this.rbLocTheoGiaoDien.CheckedChanged += new System.EventHandler(this.rbLocTheoGiaoDien_CheckedChanged);
            // 
            // rbToanBoGiaoDien
            // 
            this.rbToanBoGiaoDien.AutoSize = true;
            this.rbToanBoGiaoDien.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbToanBoGiaoDien.Location = new System.Drawing.Point(12, 59);
            this.rbToanBoGiaoDien.Name = "rbToanBoGiaoDien";
            this.rbToanBoGiaoDien.Size = new System.Drawing.Size(146, 36);
            this.rbToanBoGiaoDien.TabIndex = 66;
            this.rbToanBoGiaoDien.TabStop = true;
            this.rbToanBoGiaoDien.Text = "Toàn bộ";
            this.rbToanBoGiaoDien.UseVisualStyleBackColor = true;
            this.rbToanBoGiaoDien.Click += new System.EventHandler(this.rbToanBoGiaoDien_Click);
            // 
            // cmbGiaoDien
            // 
            this.cmbGiaoDien.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbGiaoDien.DropDownWidth = 233;
            this.cmbGiaoDien.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbGiaoDien.FormattingEnabled = true;
            this.cmbGiaoDien.Location = new System.Drawing.Point(263, 62);
            this.cmbGiaoDien.Name = "cmbGiaoDien";
            this.cmbGiaoDien.Size = new System.Drawing.Size(233, 33);
            this.cmbGiaoDien.TabIndex = 65;
            this.cmbGiaoDien.SelectedIndexChanged += new System.EventHandler(this.cmbGiaoDien_SelectedIndexChanged);
            // 
            // lblLocTheoGiaoDien
            // 
            this.lblLocTheoGiaoDien.AutoSize = true;
            this.lblLocTheoGiaoDien.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLocTheoGiaoDien.Location = new System.Drawing.Point(139, 12);
            this.lblLocTheoGiaoDien.Name = "lblLocTheoGiaoDien";
            this.lblLocTheoGiaoDien.Size = new System.Drawing.Size(265, 32);
            this.lblLocTheoGiaoDien.TabIndex = 63;
            this.lblLocTheoGiaoDien.Text = "Lọc theo giao diện";
            // 
            // FrmLichSuThaoTac
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1033);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.pnlLocTheoThaoTac);
            this.Controls.Add(this.pnlLocTheoThoiGian);
            this.Controls.Add(this.lblLichSuThaoTac);
            this.Controls.Add(this.lblTimKiem);
            this.Controls.Add(this.dgvLichSuThaoTac);
            this.Controls.Add(this.pnlHeader);
            this.Controls.Add(this.txtTimKiem);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmLichSuThaoTac";
            this.Text = "frmLichSuThaoTac";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmLichSuThaoTac_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgvLichSuThaoTac)).EndInit();
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlLocTheoThoiGian.ResumeLayout(false);
            this.pnlLocTheoThoiGian.PerformLayout();
            this.pnlLocTheoThaoTac.ResumeLayout(false);
            this.pnlLocTheoThaoTac.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lblHoTenDN;
        private System.Windows.Forms.Label lblChucVuNV_DN;
        private System.Windows.Forms.Label lblChucVuDN;
        private System.Windows.Forms.Label lblPhongBanNV_DN;
        private System.Windows.Forms.Label lblPhongBanDN;
        private System.Windows.Forms.Label lblHoTenNV_DN;
        private System.Windows.Forms.Label lblMaNV_DN;
        private System.Windows.Forms.Label lblMaNhanVienDN;
        private System.Windows.Forms.Button btnTroVe;
        private System.Windows.Forms.Label lblLichSuThaoTac;
        private System.Windows.Forms.Label lblTimKiem;
        private System.Windows.Forms.DataGridView dgvLichSuThaoTac;
        private System.Windows.Forms.Panel pnlHeader;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.DateTimePicker dtpNgay;
        private System.Windows.Forms.DateTimePicker dtpThang;
        private System.Windows.Forms.DateTimePicker dtpNam;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNgayio;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colGiaoDien;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThaoTac;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThaoTacThucHien;
        private System.Windows.Forms.Panel pnlLocTheoThoiGian;
        private System.Windows.Forms.Label lblLocTheoThoiGian;
        private System.Windows.Forms.Panel pnlLocTheoThaoTac;
        private System.Windows.Forms.ComboBox cmbThaoTac;
        private System.Windows.Forms.Label lblLocTheoThaoTac;
        private System.Windows.Forms.RadioButton rbNam;
        private System.Windows.Forms.RadioButton rbThang;
        private System.Windows.Forms.RadioButton rbNgay;
        private System.Windows.Forms.RadioButton rbLocTheoThaoTac;
        private System.Windows.Forms.RadioButton rbToanBoThaoTac;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.RadioButton rbLocTheoGiaoDien;
        private System.Windows.Forms.RadioButton rbToanBoGiaoDien;
        private System.Windows.Forms.ComboBox cmbGiaoDien;
        private System.Windows.Forms.Label lblLocTheoGiaoDien;
    }
}