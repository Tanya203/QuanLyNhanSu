namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmQuanLyLoaiPhieu
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
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.txtSoLuongPhieuLap = new System.Windows.Forms.TextBox();
            this.lblSoLuongPhieuLap = new System.Windows.Forms.Label();
            this.txtMaLP = new System.Windows.Forms.TextBox();
            this.btnHuy = new System.Windows.Forms.Button();
            this.btnSua = new System.Windows.Forms.Button();
            this.btnXoa = new System.Windows.Forms.Button();
            this.btnThem = new System.Windows.Forms.Button();
            this.txtTenLoaiPhieu = new System.Windows.Forms.TextBox();
            this.lblTenLoaiPhieu = new System.Windows.Forms.Label();
            this.lblMaLoaiPhieu = new System.Windows.Forms.Label();
            this.lblThongTinLoaiPhieu = new System.Windows.Forms.Label();
            this.txtTimKiem = new System.Windows.Forms.TextBox();
            this.lblTimKiem = new System.Windows.Forms.Label();
            this.dgvThongTinLoaiPhieu = new System.Windows.Forms.DataGridView();
            this.colMaLP = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colTenLoaiPhieu = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colSoLuongPhieuLap = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlHeader.SuspendLayout();
            this.pnlMenu.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinLoaiPhieu)).BeginInit();
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
            this.pnlHeader.TabIndex = 2;
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
            this.lblChucVuNV_DN.Location = new System.Drawing.Point(1176, 72);
            this.lblChucVuNV_DN.Name = "lblChucVuNV_DN";
            this.lblChucVuNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblChucVuNV_DN.TabIndex = 8;
            this.lblChucVuNV_DN.Text = "...";
            // 
            // lblChucVuDN
            // 
            this.lblChucVuDN.AutoSize = true;
            this.lblChucVuDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuDN.Location = new System.Drawing.Point(1000, 72);
            this.lblChucVuDN.Name = "lblChucVuDN";
            this.lblChucVuDN.Size = new System.Drawing.Size(133, 32);
            this.lblChucVuDN.TabIndex = 7;
            this.lblChucVuDN.Text = "Chức vụ:";
            // 
            // lblPhongBanNV_DN
            // 
            this.lblPhongBanNV_DN.AutoSize = true;
            this.lblPhongBanNV_DN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV_DN.Location = new System.Drawing.Point(1176, 9);
            this.lblPhongBanNV_DN.Name = "lblPhongBanNV_DN";
            this.lblPhongBanNV_DN.Size = new System.Drawing.Size(38, 32);
            this.lblPhongBanNV_DN.TabIndex = 6;
            this.lblPhongBanNV_DN.Text = "...";
            // 
            // lblPhongBanDN
            // 
            this.lblPhongBanDN.AutoSize = true;
            this.lblPhongBanDN.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanDN.Location = new System.Drawing.Point(1000, 9);
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
            this.btnTroVe.TextChanged += new System.EventHandler(this.EnableButton);
            this.btnTroVe.Click += new System.EventHandler(this.btnTroVe_Click);
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.Info;
            this.pnlMenu.Controls.Add(this.txtSoLuongPhieuLap);
            this.pnlMenu.Controls.Add(this.lblSoLuongPhieuLap);
            this.pnlMenu.Controls.Add(this.txtMaLP);
            this.pnlMenu.Controls.Add(this.btnHuy);
            this.pnlMenu.Controls.Add(this.btnSua);
            this.pnlMenu.Controls.Add(this.btnXoa);
            this.pnlMenu.Controls.Add(this.btnThem);
            this.pnlMenu.Controls.Add(this.txtTenLoaiPhieu);
            this.pnlMenu.Controls.Add(this.lblTenLoaiPhieu);
            this.pnlMenu.Controls.Add(this.lblMaLoaiPhieu);
            this.pnlMenu.Location = new System.Drawing.Point(324, 169);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(1322, 150);
            this.pnlMenu.TabIndex = 18;
            // 
            // txtSoLuongPhieuLap
            // 
            this.txtSoLuongPhieuLap.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtSoLuongPhieuLap.Location = new System.Drawing.Point(1074, 27);
            this.txtSoLuongPhieuLap.Name = "txtSoLuongPhieuLap";
            this.txtSoLuongPhieuLap.Size = new System.Drawing.Size(241, 30);
            this.txtSoLuongPhieuLap.TabIndex = 5;
            // 
            // lblSoLuongPhieuLap
            // 
            this.lblSoLuongPhieuLap.AutoSize = true;
            this.lblSoLuongPhieuLap.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSoLuongPhieuLap.Location = new System.Drawing.Point(869, 30);
            this.lblSoLuongPhieuLap.Name = "lblSoLuongPhieuLap";
            this.lblSoLuongPhieuLap.Size = new System.Drawing.Size(199, 25);
            this.lblSoLuongPhieuLap.TabIndex = 48;
            this.lblSoLuongPhieuLap.Text = "Số lượng phiếu lập:";
            // 
            // txtMaLP
            // 
            this.txtMaLP.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtMaLP.Location = new System.Drawing.Point(180, 27);
            this.txtMaLP.Name = "txtMaLP";
            this.txtMaLP.Size = new System.Drawing.Size(234, 30);
            this.txtMaLP.TabIndex = 3;
            this.txtMaLP.TextChanged += new System.EventHandler(this.EnableButton);
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
            this.btnHuy.Location = new System.Drawing.Point(874, 76);
            this.btnHuy.Name = "btnHuy";
            this.btnHuy.Size = new System.Drawing.Size(99, 49);
            this.btnHuy.TabIndex = 9;
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
            this.btnSua.Location = new System.Drawing.Point(589, 76);
            this.btnSua.Name = "btnSua";
            this.btnSua.Size = new System.Drawing.Size(100, 49);
            this.btnSua.TabIndex = 7;
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
            this.btnXoa.Location = new System.Drawing.Point(729, 76);
            this.btnXoa.Name = "btnXoa";
            this.btnXoa.Size = new System.Drawing.Size(102, 49);
            this.btnXoa.TabIndex = 8;
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
            this.btnThem.Location = new System.Drawing.Point(425, 76);
            this.btnThem.Name = "btnThem";
            this.btnThem.Size = new System.Drawing.Size(122, 49);
            this.btnThem.TabIndex = 6;
            this.btnThem.Text = "Thêm";
            this.btnThem.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageBeforeText;
            this.btnThem.UseVisualStyleBackColor = false;
            this.btnThem.Click += new System.EventHandler(this.btnThem_Click);
            // 
            // txtTenLoaiPhieu
            // 
            this.txtTenLoaiPhieu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTenLoaiPhieu.Location = new System.Drawing.Point(601, 26);
            this.txtTenLoaiPhieu.MaxLength = 100;
            this.txtTenLoaiPhieu.Name = "txtTenLoaiPhieu";
            this.txtTenLoaiPhieu.Size = new System.Drawing.Size(245, 30);
            this.txtTenLoaiPhieu.TabIndex = 4;
            this.txtTenLoaiPhieu.TextChanged += new System.EventHandler(this.EnableButton);
            // 
            // lblTenLoaiPhieu
            // 
            this.lblTenLoaiPhieu.AutoSize = true;
            this.lblTenLoaiPhieu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTenLoaiPhieu.Location = new System.Drawing.Point(448, 29);
            this.lblTenLoaiPhieu.Name = "lblTenLoaiPhieu";
            this.lblTenLoaiPhieu.Size = new System.Drawing.Size(156, 25);
            this.lblTenLoaiPhieu.TabIndex = 4;
            this.lblTenLoaiPhieu.Text = "Tên loại phiếu:";
            // 
            // lblMaLoaiPhieu
            // 
            this.lblMaLoaiPhieu.AutoSize = true;
            this.lblMaLoaiPhieu.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaLoaiPhieu.Location = new System.Drawing.Point(26, 29);
            this.lblMaLoaiPhieu.Name = "lblMaLoaiPhieu";
            this.lblMaLoaiPhieu.Size = new System.Drawing.Size(148, 25);
            this.lblMaLoaiPhieu.TabIndex = 0;
            this.lblMaLoaiPhieu.Text = "Mã loại phiếu:";
            // 
            // lblThongTinLoaiPhieu
            // 
            this.lblThongTinLoaiPhieu.AutoSize = true;
            this.lblThongTinLoaiPhieu.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblThongTinLoaiPhieu.Location = new System.Drawing.Point(742, 134);
            this.lblThongTinLoaiPhieu.Name = "lblThongTinLoaiPhieu";
            this.lblThongTinLoaiPhieu.Size = new System.Drawing.Size(284, 32);
            this.lblThongTinLoaiPhieu.TabIndex = 49;
            this.lblThongTinLoaiPhieu.Text = "Thông tin loại phiếu";
            // 
            // txtTimKiem
            // 
            this.txtTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.txtTimKiem.Location = new System.Drawing.Point(797, 325);
            this.txtTimKiem.MaxLength = 50;
            this.txtTimKiem.Name = "txtTimKiem";
            this.txtTimKiem.Size = new System.Drawing.Size(299, 30);
            this.txtTimKiem.TabIndex = 10;
            this.txtTimKiem.TextChanged += new System.EventHandler(this.txtTimKiem_TextChanged);
            this.txtTimKiem.KeyPress += new System.Windows.Forms.KeyPressEventHandler(this.txtTimKiem_KeyPress);
            // 
            // lblTimKiem
            // 
            this.lblTimKiem.AutoSize = true;
            this.lblTimKiem.Font = new System.Drawing.Font("Microsoft Sans Serif", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblTimKiem.Location = new System.Drawing.Point(637, 322);
            this.lblTimKiem.Name = "lblTimKiem";
            this.lblTimKiem.Size = new System.Drawing.Size(145, 32);
            this.lblTimKiem.TabIndex = 51;
            this.lblTimKiem.Text = "Tìm kiếm:";
            // 
            // dgvThongTinLoaiPhieu
            // 
            this.dgvThongTinLoaiPhieu.AllowUserToAddRows = false;
            this.dgvThongTinLoaiPhieu.AllowUserToDeleteRows = false;
            this.dgvThongTinLoaiPhieu.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvThongTinLoaiPhieu.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle1.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleLeft;
            dataGridViewCellStyle1.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle1.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle1.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle1.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle1.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle1.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvThongTinLoaiPhieu.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle1;
            this.dgvThongTinLoaiPhieu.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvThongTinLoaiPhieu.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaLP,
            this.colTenLoaiPhieu,
            this.colSoLuongPhieuLap});
            this.dgvThongTinLoaiPhieu.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.dgvThongTinLoaiPhieu.Location = new System.Drawing.Point(0, 361);
            this.dgvThongTinLoaiPhieu.Name = "dgvThongTinLoaiPhieu";
            this.dgvThongTinLoaiPhieu.ReadOnly = true;
            dataGridViewCellStyle2.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle2.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle2.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle2.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle2.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle2.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvThongTinLoaiPhieu.RowHeadersDefaultCellStyle = dataGridViewCellStyle2;
            this.dgvThongTinLoaiPhieu.RowHeadersVisible = false;
            this.dgvThongTinLoaiPhieu.RowHeadersWidth = 51;
            dataGridViewCellStyle3.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dgvThongTinLoaiPhieu.RowsDefaultCellStyle = dataGridViewCellStyle3;
            this.dgvThongTinLoaiPhieu.RowTemplate.Height = 24;
            this.dgvThongTinLoaiPhieu.Size = new System.Drawing.Size(1924, 622);
            this.dgvThongTinLoaiPhieu.TabIndex = 11;
            this.dgvThongTinLoaiPhieu.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgvThongTinLoaiPhieu_CellClick);
            // 
            // colMaLP
            // 
            this.colMaLP.HeaderText = "Mã loại phiếu";
            this.colMaLP.MinimumWidth = 6;
            this.colMaLP.Name = "colMaLP";
            this.colMaLP.ReadOnly = true;
            // 
            // colTenLoaiPhieu
            // 
            this.colTenLoaiPhieu.HeaderText = "Tên loại phiếu";
            this.colTenLoaiPhieu.MinimumWidth = 6;
            this.colTenLoaiPhieu.Name = "colTenLoaiPhieu";
            this.colTenLoaiPhieu.ReadOnly = true;
            // 
            // colSoLuongPhieuLap
            // 
            this.colSoLuongPhieuLap.HeaderText = "Số lượng phiếu lập";
            this.colSoLuongPhieuLap.MinimumWidth = 6;
            this.colSoLuongPhieuLap.Name = "colSoLuongPhieuLap";
            this.colSoLuongPhieuLap.ReadOnly = true;
            // 
            // FrmQuanLyLoaiPhieu
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 983);
            this.Controls.Add(this.dgvThongTinLoaiPhieu);
            this.Controls.Add(this.txtTimKiem);
            this.Controls.Add(this.lblTimKiem);
            this.Controls.Add(this.lblThongTinLoaiPhieu);
            this.Controls.Add(this.pnlMenu);
            this.Controls.Add(this.pnlHeader);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmQuanLyLoaiPhieu";
            this.Text = "FrmQuanLyLoaiPhieu";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.FrmQuanLyLoaiPhieu_Load);
            this.pnlHeader.ResumeLayout(false);
            this.pnlHeader.PerformLayout();
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvThongTinLoaiPhieu)).EndInit();
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
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.TextBox txtSoLuongPhieuLap;
        private System.Windows.Forms.Label lblSoLuongPhieuLap;
        private System.Windows.Forms.TextBox txtMaLP;
        private System.Windows.Forms.Button btnHuy;
        private System.Windows.Forms.Button btnSua;
        private System.Windows.Forms.Button btnXoa;
        private System.Windows.Forms.Button btnThem;
        private System.Windows.Forms.TextBox txtTenLoaiPhieu;
        private System.Windows.Forms.Label lblTenLoaiPhieu;
        private System.Windows.Forms.Label lblMaLoaiPhieu;
        private System.Windows.Forms.Label lblThongTinLoaiPhieu;
        private System.Windows.Forms.TextBox txtTimKiem;
        private System.Windows.Forms.Label lblTimKiem;
        private System.Windows.Forms.DataGridView dgvThongTinLoaiPhieu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaLP;
        private System.Windows.Forms.DataGridViewTextBoxColumn colTenLoaiPhieu;
        private System.Windows.Forms.DataGridViewTextBoxColumn colSoLuongPhieuLap;
        private System.Windows.Forms.Button btnRefresh;
    }
}