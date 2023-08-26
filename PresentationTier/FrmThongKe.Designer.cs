namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmThongKe
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
            this.tabControlMenu = new System.Windows.Forms.TabControl();
            this.tabPageThongKe = new System.Windows.Forms.TabPage();
            this.btnXuatExcel = new System.Windows.Forms.Button();
            this.btnThongKe = new System.Windows.Forms.Button();
            this.btnLuu = new System.Windows.Forms.Button();
            this.lblThongKeLuong = new System.Windows.Forms.Label();
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.lblThang = new System.Windows.Forms.Label();
            this.cmbPhongBan = new System.Windows.Forms.ComboBox();
            this.dtpThangNam = new System.Windows.Forms.DateTimePicker();
            this.dgvThongKeLuong = new System.Windows.Forms.DataGridView();
            this.tabPage2 = new System.Windows.Forms.TabPage();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhongBan = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colChucVu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongGioLam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongLuongTheoGio = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongThuong = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongPhat = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongPhuCap = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTienNo = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTongLuongThang = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.rbToanBoNhanVien = new System.Windows.Forms.RadioButton();
            this.rbPhongBan = new System.Windows.Forms.RadioButton();
            this.rbChucVu = new System.Windows.Forms.RadioButton();
            this.cmbChucVu = new System.Windows.Forms.ComboBox();
            this.lblTimKiem = new System.Windows.Forms.Label();
            this.pnlHeader.SuspendLayout();
            this.tabControlMenu.SuspendLayout();
            this.tabPageThongKe.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongKeLuong)).BeginInit();
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
            this.pnlHeader.TabIndex = 55;
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
            // lblChucVuNV_DN
            // 
            this.lblChucVuNV_DN.AutoSize = true;
            this.lblChucVuNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuNV_DN.Location = new System.Drawing.Point(1178, 72);
            this.lblChucVuNV_DN.Name = "lblChucVuNV_DN";
            this.lblChucVuNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblChucVuNV_DN.TabIndex = 8;
            this.lblChucVuNV_DN.Text = "...";
            // 
            // lblChucVuDN
            // 
            this.lblChucVuDN.AutoSize = true;
            this.lblChucVuDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuDN.Location = new System.Drawing.Point(1002, 72);
            this.lblChucVuDN.Name = "lblChucVuDN";
            this.lblChucVuDN.Size = new System.Drawing.Size(133, 32);
            this.lblChucVuDN.TabIndex = 7;
            this.lblChucVuDN.Text = "Chức vụ:";
            // 
            // lblPhongBanNV_DN
            // 
            this.lblPhongBanNV_DN.AutoSize = true;
            this.lblPhongBanNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV_DN.Location = new System.Drawing.Point(1178, 9);
            this.lblPhongBanNV_DN.Name = "lblPhongBanNV_DN";
            this.lblPhongBanNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblPhongBanNV_DN.TabIndex = 6;
            this.lblPhongBanNV_DN.Text = "...";
            // 
            // lblPhongBanDN
            // 
            this.lblPhongBanDN.AutoSize = true;
            this.lblPhongBanDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanDN.Location = new System.Drawing.Point(1002, 9);
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
            // tabControlMenu
            // 
            this.tabControlMenu.Appearance = System.Windows.Forms.TabAppearance.Buttons;
            this.tabControlMenu.Controls.Add(this.tabPageThongKe);
            this.tabControlMenu.Controls.Add(this.tabPage2);
            this.tabControlMenu.Dock = System.Windows.Forms.DockStyle.Fill;
            this.tabControlMenu.DrawMode = System.Windows.Forms.TabDrawMode.OwnerDrawFixed;
            this.tabControlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.tabControlMenu.Location = new System.Drawing.Point(0, 113);
            this.tabControlMenu.Name = "tabControlMenu";
            this.tabControlMenu.SelectedIndex = 0;
            this.tabControlMenu.Size = new System.Drawing.Size(1924, 920);
            this.tabControlMenu.TabIndex = 68;
            this.tabControlMenu.DrawItem += new System.Windows.Forms.DrawItemEventHandler(this.tabControlMenu_DrawItem);
            // 
            // tabPageThongKe
            // 
            this.tabPageThongKe.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tabPageThongKe.Controls.Add(this.lblTimKiem);
            this.tabPageThongKe.Controls.Add(this.rbChucVu);
            this.tabPageThongKe.Controls.Add(this.cmbChucVu);
            this.tabPageThongKe.Controls.Add(this.rbPhongBan);
            this.tabPageThongKe.Controls.Add(this.rbToanBoNhanVien);
            this.tabPageThongKe.Controls.Add(this.btnXuatExcel);
            this.tabPageThongKe.Controls.Add(this.btnThongKe);
            this.tabPageThongKe.Controls.Add(this.btnLuu);
            this.tabPageThongKe.Controls.Add(this.lblThongKeLuong);
            this.tabPageThongKe.Controls.Add(this.txtTimKiem);
            this.tabPageThongKe.Controls.Add(this.lblThang);
            this.tabPageThongKe.Controls.Add(this.cmbPhongBan);
            this.tabPageThongKe.Controls.Add(this.dtpThangNam);
            this.tabPageThongKe.Controls.Add(this.dgvThongKeLuong);
            this.tabPageThongKe.Location = new System.Drawing.Point(4, 37);
            this.tabPageThongKe.Name = "tabPageThongKe";
            this.tabPageThongKe.Padding = new System.Windows.Forms.Padding(3);
            this.tabPageThongKe.Size = new System.Drawing.Size(1916, 879);
            this.tabPageThongKe.TabIndex = 0;
            this.tabPageThongKe.Text = "Thống kê lương";
            this.tabPageThongKe.Click += new System.EventHandler(this.tabPageThongKeLuong_Click);
            // 
            // btnXuatExcel
            // 
            this.btnXuatExcel.AutoSize = true;
            this.btnXuatExcel.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnXuatExcel.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnXuatExcel.FlatAppearance.BorderSize = 0;
            this.btnXuatExcel.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnXuatExcel.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnXuatExcel.Image = global::QuanLyNhanSu.Properties.Resources.excel;
            this.btnXuatExcel.Location = new System.Drawing.Point(1156, 122);
            this.btnXuatExcel.Name = "btnXuatExcel";
            this.btnXuatExcel.Size = new System.Drawing.Size(179, 49);
            this.btnXuatExcel.TabIndex = 78;
            this.btnXuatExcel.Text = "Xuất Excel";
            this.btnXuatExcel.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnXuatExcel.UseVisualStyleBackColor = false;
            // 
            // btnThongKe
            // 
            this.btnThongKe.AutoSize = true;
            this.btnThongKe.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnThongKe.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnThongKe.FlatAppearance.BorderSize = 0;
            this.btnThongKe.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnThongKe.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnThongKe.Image = global::QuanLyNhanSu.Properties.Resources.calculate;
            this.btnThongKe.Location = new System.Drawing.Point(976, 122);
            this.btnThongKe.Name = "btnThongKe";
            this.btnThongKe.Size = new System.Drawing.Size(165, 49);
            this.btnThongKe.TabIndex = 77;
            this.btnThongKe.Text = "Thống kê";
            this.btnThongKe.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnThongKe.UseVisualStyleBackColor = false;
            // 
            // btnLuu
            // 
            this.btnLuu.AutoSize = true;
            this.btnLuu.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.btnLuu.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLuu.FlatAppearance.BorderSize = 0;
            this.btnLuu.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLuu.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLuu.Image = global::QuanLyNhanSu.Properties.Resources.save;
            this.btnLuu.Location = new System.Drawing.Point(848, 122);
            this.btnLuu.Name = "btnLuu";
            this.btnLuu.Size = new System.Drawing.Size(122, 49);
            this.btnLuu.TabIndex = 76;
            this.btnLuu.Text = "Lưu";
            this.btnLuu.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnLuu.UseVisualStyleBackColor = false;
            // 
            // lblThongKeLuong
            // 
            this.lblThongKeLuong.AutoSize = true;
            this.lblThongKeLuong.Font = new System.Drawing.Font("Microsoft Sans Serif", 25.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThongKeLuong.Location = new System.Drawing.Point(799, 10);
            this.lblThongKeLuong.Name = "lblThongKeLuong";
            this.lblThongKeLuong.Size = new System.Drawing.Size(332, 51);
            this.lblThongKeLuong.TabIndex = 75;
            this.lblThongKeLuong.Text = "Thống kê lương";
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.Location = new System.Drawing.Point(543, 133);
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(299, 30);
            this.txtTimKiem.TabIndex = 74;
            // 
            // lblThang
            // 
            this.lblThang.AutoSize = true;
            this.lblThang.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThang.Location = new System.Drawing.Point(177, 70);
            this.lblThang.Name = "lblThang";
            this.lblThang.Size = new System.Drawing.Size(109, 32);
            this.lblThang.TabIndex = 72;
            this.lblThang.Text = "Tháng:";
            this.lblThang.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // cmbPhongBan
            // 
            this.cmbPhongBan.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbPhongBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbPhongBan.FormattingEnabled = true;
            this.cmbPhongBan.Location = new System.Drawing.Point(915, 74);
            this.cmbPhongBan.Name = "cmbPhongBan";
            this.cmbPhongBan.Size = new System.Drawing.Size(244, 33);
            this.cmbPhongBan.TabIndex = 70;
            // 
            // dtpThangNam
            // 
            this.dtpThangNam.CustomFormat = "MM/yyyy";
            this.dtpThangNam.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpThangNam.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpThangNam.Location = new System.Drawing.Point(292, 72);
            this.dtpThangNam.Name = "dtpThangNam";
            this.dtpThangNam.ShowUpDown = true;
            this.dtpThangNam.Size = new System.Drawing.Size(127, 30);
            this.dtpThangNam.TabIndex = 69;
            // 
            // dgvThongKeLuong
            // 
            this.dgvThongKeLuong.AllowUserToAddRows = false;
            this.dgvThongKeLuong.AllowUserToDeleteRows = false;
            this.dgvThongKeLuong.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvThongKeLuong.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongKeLuong.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongKeLuong.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaNV,
            this.colHoTen,
            this.colPhongBan,
            this.colChucVu,
            this.colTongGioLam,
            this.colTongLuongTheoGio,
            this.colTongThuong,
            this.colTongPhat,
            this.colTongPhuCap,
            this.colTienNo,
            this.colTongLuongThang});
            this.dgvThongKeLuong.Location = new System.Drawing.Point(-4, 177);
            this.dgvThongKeLuong.Name = "dgvThongKeLuong";
            this.dgvThongKeLuong.ReadOnly = true;
            this.dgvThongKeLuong.RowHeadersVisible = false;
            this.dgvThongKeLuong.RowHeadersWidth = 51;
            this.dgvThongKeLuong.RowTemplate.Height = 24;
            this.dgvThongKeLuong.Size = new System.Drawing.Size(1924, 706);
            this.dgvThongKeLuong.TabIndex = 68;
            // 
            // tabPage2
            // 
            this.tabPage2.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.tabPage2.Location = new System.Drawing.Point(4, 37);
            this.tabPage2.Name = "tabPage2";
            this.tabPage2.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage2.Size = new System.Drawing.Size(1916, 879);
            this.tabPage2.TabIndex = 1;
            this.tabPage2.Text = "Thống kê chấm công";
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
            // colTongGioLam
            // 
            this.colTongGioLam.HeaderText = "Tổng giờ làm";
            this.colTongGioLam.MinimumWidth = 6;
            this.colTongGioLam.Name = "colTongGioLam";
            this.colTongGioLam.ReadOnly = true;
            // 
            // colTongLuongTheoGio
            // 
            this.colTongLuongTheoGio.HeaderText = "Tổng lương theo giờ";
            this.colTongLuongTheoGio.MinimumWidth = 6;
            this.colTongLuongTheoGio.Name = "colTongLuongTheoGio";
            this.colTongLuongTheoGio.ReadOnly = true;
            // 
            // colTongThuong
            // 
            this.colTongThuong.HeaderText = "Tổng thưởng";
            this.colTongThuong.MinimumWidth = 6;
            this.colTongThuong.Name = "colTongThuong";
            this.colTongThuong.ReadOnly = true;
            // 
            // colTongPhat
            // 
            this.colTongPhat.HeaderText = "Tổng phạt";
            this.colTongPhat.MinimumWidth = 6;
            this.colTongPhat.Name = "colTongPhat";
            this.colTongPhat.ReadOnly = true;
            // 
            // colTongPhuCap
            // 
            this.colTongPhuCap.HeaderText = "Tổng phụ cấp";
            this.colTongPhuCap.MinimumWidth = 6;
            this.colTongPhuCap.Name = "colTongPhuCap";
            this.colTongPhuCap.ReadOnly = true;
            // 
            // colTienNo
            // 
            this.colTienNo.HeaderText = "Tiền nợ";
            this.colTienNo.MinimumWidth = 6;
            this.colTienNo.Name = "colTienNo";
            this.colTienNo.ReadOnly = true;
            // 
            // colTongLuongThang
            // 
            this.colTongLuongThang.HeaderText = "Tổng lương tháng";
            this.colTongLuongThang.MinimumWidth = 6;
            this.colTongLuongThang.Name = "colTongLuongThang";
            this.colTongLuongThang.ReadOnly = true;
            // 
            // rbToanBoNhanVien
            // 
            this.rbToanBoNhanVien.AutoSize = true;
            this.rbToanBoNhanVien.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbToanBoNhanVien.Location = new System.Drawing.Point(425, 70);
            this.rbToanBoNhanVien.Name = "rbToanBoNhanVien";
            this.rbToanBoNhanVien.Size = new System.Drawing.Size(287, 36);
            this.rbToanBoNhanVien.TabIndex = 80;
            this.rbToanBoNhanVien.TabStop = true;
            this.rbToanBoNhanVien.Text = "Toàn bộ nhân viên";
            this.rbToanBoNhanVien.UseVisualStyleBackColor = true;
            // 
            // rbPhongBan
            // 
            this.rbPhongBan.AutoSize = true;
            this.rbPhongBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbPhongBan.Location = new System.Drawing.Point(718, 70);
            this.rbPhongBan.Name = "rbPhongBan";
            this.rbPhongBan.Size = new System.Drawing.Size(191, 36);
            this.rbPhongBan.TabIndex = 81;
            this.rbPhongBan.TabStop = true;
            this.rbPhongBan.Text = "Phòng ban:";
            this.rbPhongBan.UseVisualStyleBackColor = true;
            // 
            // rbChucVu
            // 
            this.rbChucVu.AutoSize = true;
            this.rbChucVu.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.rbChucVu.Location = new System.Drawing.Point(1165, 68);
            this.rbChucVu.Name = "rbChucVu";
            this.rbChucVu.Size = new System.Drawing.Size(154, 36);
            this.rbChucVu.TabIndex = 83;
            this.rbChucVu.TabStop = true;
            this.rbChucVu.Text = "Chức vụ:";
            this.rbChucVu.UseVisualStyleBackColor = true;
            // 
            // cmbChucVu
            // 
            this.cmbChucVu.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cmbChucVu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.cmbChucVu.FormattingEnabled = true;
            this.cmbChucVu.Location = new System.Drawing.Point(1325, 74);
            this.cmbChucVu.Name = "cmbChucVu";
            this.cmbChucVu.Size = new System.Drawing.Size(244, 33);
            this.cmbChucVu.TabIndex = 82;
            // 
            // lblTimKiem
            // 
            this.lblTimKiem.AutoSize = true;
            this.lblTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTimKiem.Location = new System.Drawing.Point(392, 133);
            this.lblTimKiem.Name = "lblTimKiem";
            this.lblTimKiem.Size = new System.Drawing.Size(145, 32);
            this.lblTimKiem.TabIndex = 84;
            this.lblTimKiem.Text = "Tìm kiếm:";
            this.lblTimKiem.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // FrmThongKeLuong
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1033);
            this.Controls.Add(this.tabControlMenu);
            this.Controls.Add(this.pnlHeader);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmThongKeLuong";
            this.Text = "frmThongKeLuong";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmThongKeLuong_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.tabControlMenu.ResumeLayout(false);
            this.tabPageThongKe.ResumeLayout(false);
            this.tabPageThongKe.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongKeLuong)).EndInit();
            this.ResumeLayout(false);

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
        private System.Windows.Forms.Button btnRefresh;
        private System.Windows.Forms.TabControl tabControlMenu;
        private System.Windows.Forms.TabPage tabPageThongKe;
        private System.Windows.Forms.Button btnXuatExcel;
        private System.Windows.Forms.Button btnThongKe;
        private System.Windows.Forms.Button btnLuu;
        private System.Windows.Forms.Label lblThongKeLuong;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.Label lblThang;
        private System.Windows.Forms.ComboBox cmbPhongBan;
        private System.Windows.Forms.DateTimePicker dtpThangNam;
        private System.Windows.Forms.DataGridView dgvThongKeLuong;
        private System.Windows.Forms.TabPage tabPage2;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colPhongBan;
        private System.Windows.Forms.DataGridViewTextBoxColumn colChucVu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongGioLam;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongLuongTheoGio;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongThuong;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongPhat;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongPhuCap;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTienNo;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTongLuongThang;
        private System.Windows.Forms.RadioButton rbChucVu;
        private System.Windows.Forms.ComboBox cmbChucVu;
        private System.Windows.Forms.RadioButton rbPhongBan;
        private System.Windows.Forms.RadioButton rbToanBoNhanVien;
        private System.Windows.Forms.Label lblTimKiem;
    }
}