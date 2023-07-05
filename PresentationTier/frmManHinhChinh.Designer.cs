namespace QuanLyNhanSu.PresentationTier
{
    partial class FrmManHinhChinh
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
            this.btnQLNV = new System.Windows.Forms.Button();
            this.pnlMenu = new System.Windows.Forms.Panel();
            this.btnDangXuat = new System.Windows.Forms.Button();
            this.btnTTTK = new System.Windows.Forms.Button();
            this.btnLSTT = new System.Windows.Forms.Button();
            this.btnQLPQ = new System.Windows.Forms.Button();
            this.btnQLLHD = new System.Windows.Forms.Button();
            this.btnQLTK = new System.Windows.Forms.Button();
            this.btnQLPP = new System.Windows.Forms.Button();
            this.btnQLPT = new System.Windows.Forms.Button();
            this.btnQLPC = new System.Windows.Forms.Button();
            this.btnQLLLV = new System.Windows.Forms.Button();
            this.btnQLCC = new System.Windows.Forms.Button();
            this.btnQLC = new System.Windows.Forms.Button();
            this.btnQLCV = new System.Windows.Forms.Button();
            this.btnQLPB = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.lblSoNgayPhepConNV = new System.Windows.Forms.Label();
            this.lblSoNgayPhepCon = new System.Windows.Forms.Label();
            this.lblHoTenNV = new System.Windows.Forms.Label();
            this.lblChucVuNV = new System.Windows.Forms.Label();
            this.lblHoTen = new System.Windows.Forms.Label();
            this.lblPhongBanNV = new System.Windows.Forms.Label();
            this.lblChucVu = new System.Windows.Forms.Label();
            this.lblPhongBan = new System.Windows.Forms.Label();
            this.lblMaNV = new System.Windows.Forms.Label();
            this.lblMaNhanVien = new System.Windows.Forms.Label();
            this.pbAnhNV = new System.Windows.Forms.PictureBox();
            this.lblLichLamViec = new System.Windows.Forms.Label();
            this.dtpLichLamViec = new System.Windows.Forms.DateTimePicker();
            this.dgvLichLamViec = new System.Windows.Forms.DataGridView();
            this.colMaNV = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colHoTen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colLoaiCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colCa = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colNgayLam = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colPhep = new System.Windows.Forms.DataGridViewCheckBoxColumn();
            this.colThoiGianDen = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.colThoiGianVe = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.pnlMenu.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbAnhNV)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLichLamViec)).BeginInit();
            this.SuspendLayout();
            // 
            // btnQLNV
            // 
            this.btnQLNV.AutoSize = true;
            this.btnQLNV.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLNV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLNV.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLNV.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLNV.FlatAppearance.BorderSize = 2;
            this.btnQLNV.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLNV.Image = global::QuanLyNhanSu.Properties.Resources.staff;
            this.btnQLNV.Location = new System.Drawing.Point(0, 0);
            this.btnQLNV.Name = "btnQLNV";
            this.btnQLNV.Size = new System.Drawing.Size(102, 100);
            this.btnQLNV.TabIndex = 1;
            this.btnQLNV.Text = "Nhân viên";
            this.btnQLNV.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLNV.UseVisualStyleBackColor = true;
            this.btnQLNV.Click += new System.EventHandler(this.btnQLNV_Click);
            // 
            // pnlMenu
            // 
            this.pnlMenu.BackColor = System.Drawing.SystemColors.ScrollBar;
            this.pnlMenu.Controls.Add(this.btnDangXuat);
            this.pnlMenu.Controls.Add(this.btnTTTK);
            this.pnlMenu.Controls.Add(this.btnLSTT);
            this.pnlMenu.Controls.Add(this.btnQLPQ);
            this.pnlMenu.Controls.Add(this.btnQLLHD);
            this.pnlMenu.Controls.Add(this.btnQLTK);
            this.pnlMenu.Controls.Add(this.btnQLPP);
            this.pnlMenu.Controls.Add(this.btnQLPT);
            this.pnlMenu.Controls.Add(this.btnQLPC);
            this.pnlMenu.Controls.Add(this.btnQLLLV);
            this.pnlMenu.Controls.Add(this.btnQLCC);
            this.pnlMenu.Controls.Add(this.btnQLC);
            this.pnlMenu.Controls.Add(this.btnQLCV);
            this.pnlMenu.Controls.Add(this.btnQLPB);
            this.pnlMenu.Controls.Add(this.btnQLNV);
            this.pnlMenu.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.pnlMenu.Location = new System.Drawing.Point(0, 0);
            this.pnlMenu.Name = "pnlMenu";
            this.pnlMenu.Size = new System.Drawing.Size(1924, 100);
            this.pnlMenu.TabIndex = 17;
            // 
            // btnDangXuat
            // 
            this.btnDangXuat.AutoSize = true;
            this.btnDangXuat.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnDangXuat.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnDangXuat.Dock = System.Windows.Forms.DockStyle.Right;
            this.btnDangXuat.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnDangXuat.FlatAppearance.BorderSize = 2;
            this.btnDangXuat.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnDangXuat.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnDangXuat.Image = global::QuanLyNhanSu.Properties.Resources.log_out;
            this.btnDangXuat.Location = new System.Drawing.Point(1821, 0);
            this.btnDangXuat.Name = "btnDangXuat";
            this.btnDangXuat.Size = new System.Drawing.Size(103, 100);
            this.btnDangXuat.TabIndex = 15;
            this.btnDangXuat.Text = "Đăng xuất";
            this.btnDangXuat.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnDangXuat.UseVisualStyleBackColor = true;
            // 
            // btnTTTK
            // 
            this.btnTTTK.AutoSize = true;
            this.btnTTTK.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnTTTK.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnTTTK.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnTTTK.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnTTTK.FlatAppearance.BorderSize = 2;
            this.btnTTTK.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnTTTK.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnTTTK.Image = global::QuanLyNhanSu.Properties.Resources.info_small;
            this.btnTTTK.Location = new System.Drawing.Point(1471, 0);
            this.btnTTTK.Name = "btnTTTK";
            this.btnTTTK.Size = new System.Drawing.Size(100, 100);
            this.btnTTTK.TabIndex = 14;
            this.btnTTTK.Text = "Tài khoản";
            this.btnTTTK.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnTTTK.UseVisualStyleBackColor = true;
            this.btnTTTK.Click += new System.EventHandler(this.btnTTTK_Click);
            // 
            // btnLSTT
            // 
            this.btnLSTT.AutoSize = true;
            this.btnLSTT.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnLSTT.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnLSTT.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnLSTT.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnLSTT.FlatAppearance.BorderSize = 2;
            this.btnLSTT.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnLSTT.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnLSTT.Image = global::QuanLyNhanSu.Properties.Resources.history;
            this.btnLSTT.Location = new System.Drawing.Point(1316, 0);
            this.btnLSTT.Name = "btnLSTT";
            this.btnLSTT.Size = new System.Drawing.Size(155, 100);
            this.btnLSTT.TabIndex = 13;
            this.btnLSTT.Text = "Lịch sử thao tác";
            this.btnLSTT.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnLSTT.UseVisualStyleBackColor = true;
            this.btnLSTT.Click += new System.EventHandler(this.btnLSTT_Click);
            // 
            // btnQLPQ
            // 
            this.btnQLPQ.AutoSize = true;
            this.btnQLPQ.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLPQ.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLPQ.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLPQ.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLPQ.FlatAppearance.BorderSize = 2;
            this.btnQLPQ.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLPQ.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLPQ.Image = global::QuanLyNhanSu.Properties.Resources.decentralization;
            this.btnQLPQ.Location = new System.Drawing.Point(1200, 0);
            this.btnQLPQ.Name = "btnQLPQ";
            this.btnQLPQ.Size = new System.Drawing.Size(116, 100);
            this.btnQLPQ.TabIndex = 12;
            this.btnQLPQ.Text = "Phân quyền";
            this.btnQLPQ.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLPQ.UseVisualStyleBackColor = true;
            this.btnQLPQ.Click += new System.EventHandler(this.btnQLPQ_Click);
            // 
            // btnQLLHD
            // 
            this.btnQLLHD.AutoSize = true;
            this.btnQLLHD.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLLHD.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLLHD.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLLHD.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLLHD.FlatAppearance.BorderSize = 2;
            this.btnQLLHD.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLLHD.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLLHD.Image = global::QuanLyNhanSu.Properties.Resources.contract;
            this.btnQLLHD.Location = new System.Drawing.Point(1063, 0);
            this.btnQLLHD.Name = "btnQLLHD";
            this.btnQLLHD.Size = new System.Drawing.Size(137, 100);
            this.btnQLLHD.TabIndex = 11;
            this.btnQLLHD.Text = "Loại hợp đồng";
            this.btnQLLHD.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLLHD.UseVisualStyleBackColor = true;
            this.btnQLLHD.Click += new System.EventHandler(this.btnQLLHD_Click);
            // 
            // btnQLTK
            // 
            this.btnQLTK.AutoSize = true;
            this.btnQLTK.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLTK.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLTK.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLTK.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLTK.FlatAppearance.BorderSize = 2;
            this.btnQLTK.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLTK.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLTK.Image = global::QuanLyNhanSu.Properties.Resources.salary;
            this.btnQLTK.Location = new System.Drawing.Point(917, 0);
            this.btnQLTK.Name = "btnQLTK";
            this.btnQLTK.Size = new System.Drawing.Size(146, 100);
            this.btnQLTK.TabIndex = 10;
            this.btnQLTK.Text = "Thống kê lương";
            this.btnQLTK.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLTK.UseVisualStyleBackColor = true;
            this.btnQLTK.Click += new System.EventHandler(this.btnQLTK_Click);
            // 
            // btnQLPP
            // 
            this.btnQLPP.AutoSize = true;
            this.btnQLPP.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLPP.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLPP.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLPP.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLPP.FlatAppearance.BorderSize = 2;
            this.btnQLPP.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLPP.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLPP.Image = global::QuanLyNhanSu.Properties.Resources.fine;
            this.btnQLPP.Location = new System.Drawing.Point(809, 0);
            this.btnQLPP.Name = "btnQLPP";
            this.btnQLPP.Size = new System.Drawing.Size(108, 100);
            this.btnQLPP.TabIndex = 9;
            this.btnQLPP.Text = "Phiếu phạt";
            this.btnQLPP.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLPP.UseVisualStyleBackColor = true;
            this.btnQLPP.Click += new System.EventHandler(this.btnQLPP_Click);
            // 
            // btnQLPT
            // 
            this.btnQLPT.AutoSize = true;
            this.btnQLPT.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLPT.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLPT.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLPT.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLPT.FlatAppearance.BorderSize = 2;
            this.btnQLPT.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLPT.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLPT.Image = global::QuanLyNhanSu.Properties.Resources.bonus;
            this.btnQLPT.Location = new System.Drawing.Point(681, 0);
            this.btnQLPT.Name = "btnQLPT";
            this.btnQLPT.Size = new System.Drawing.Size(128, 100);
            this.btnQLPT.TabIndex = 8;
            this.btnQLPT.Text = "Phiếu thưởng";
            this.btnQLPT.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLPT.UseVisualStyleBackColor = true;
            this.btnQLPT.Click += new System.EventHandler(this.btnQLPT_Click);
            // 
            // btnQLPC
            // 
            this.btnQLPC.AutoSize = true;
            this.btnQLPC.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLPC.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLPC.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLPC.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLPC.FlatAppearance.BorderSize = 2;
            this.btnQLPC.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLPC.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLPC.Image = global::QuanLyNhanSu.Properties.Resources.allowance;
            this.btnQLPC.Location = new System.Drawing.Point(594, 0);
            this.btnQLPC.Name = "btnQLPC";
            this.btnQLPC.Size = new System.Drawing.Size(87, 100);
            this.btnQLPC.TabIndex = 7;
            this.btnQLPC.Text = "Phụ cấp";
            this.btnQLPC.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLPC.UseVisualStyleBackColor = true;
            this.btnQLPC.Click += new System.EventHandler(this.btnQLPC_Click);
            // 
            // btnQLLLV
            // 
            this.btnQLLLV.AutoSize = true;
            this.btnQLLLV.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLLLV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLLLV.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLLLV.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLLLV.FlatAppearance.BorderSize = 2;
            this.btnQLLLV.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLLLV.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLLLV.Image = global::QuanLyNhanSu.Properties.Resources.timetable;
            this.btnQLLLV.Location = new System.Drawing.Point(463, 0);
            this.btnQLLLV.Name = "btnQLLLV";
            this.btnQLLLV.Size = new System.Drawing.Size(131, 100);
            this.btnQLLLV.TabIndex = 6;
            this.btnQLLLV.Text = "Lịch làm việc";
            this.btnQLLLV.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLLLV.UseVisualStyleBackColor = true;
            this.btnQLLLV.Click += new System.EventHandler(this.btnQLLLV_Click);
            // 
            // btnQLCC
            // 
            this.btnQLCC.AutoSize = true;
            this.btnQLCC.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLCC.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLCC.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLCC.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLCC.FlatAppearance.BorderSize = 2;
            this.btnQLCC.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLCC.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLCC.Image = global::QuanLyNhanSu.Properties.Resources.timekeeping;
            this.btnQLCC.Location = new System.Drawing.Point(350, 0);
            this.btnQLCC.Name = "btnQLCC";
            this.btnQLCC.Size = new System.Drawing.Size(113, 100);
            this.btnQLCC.TabIndex = 5;
            this.btnQLCC.Text = "Chấm công";
            this.btnQLCC.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLCC.UseVisualStyleBackColor = true;
            this.btnQLCC.Click += new System.EventHandler(this.btnQLCC_Click);
            // 
            // btnQLC
            // 
            this.btnQLC.AutoSize = true;
            this.btnQLC.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLC.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLC.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLC.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLC.FlatAppearance.BorderSize = 2;
            this.btnQLC.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLC.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLC.Image = global::QuanLyNhanSu.Properties.Resources.shitf1;
            this.btnQLC.Location = new System.Drawing.Point(296, 0);
            this.btnQLC.Name = "btnQLC";
            this.btnQLC.Size = new System.Drawing.Size(54, 100);
            this.btnQLC.TabIndex = 4;
            this.btnQLC.Text = "Ca";
            this.btnQLC.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLC.UseVisualStyleBackColor = true;
            this.btnQLC.Click += new System.EventHandler(this.btnQLC_Click);
            // 
            // btnQLCV
            // 
            this.btnQLCV.AutoSize = true;
            this.btnQLCV.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLCV.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLCV.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLCV.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLCV.FlatAppearance.BorderSize = 2;
            this.btnQLCV.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLCV.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLCV.Image = global::QuanLyNhanSu.Properties.Resources.position;
            this.btnQLCV.Location = new System.Drawing.Point(209, 0);
            this.btnQLCV.Name = "btnQLCV";
            this.btnQLCV.Size = new System.Drawing.Size(87, 100);
            this.btnQLCV.TabIndex = 3;
            this.btnQLCV.Text = "Chức vụ";
            this.btnQLCV.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLCV.UseVisualStyleBackColor = true;
            this.btnQLCV.Click += new System.EventHandler(this.btnQLCV_Click);
            // 
            // btnQLPB
            // 
            this.btnQLPB.AutoSize = true;
            this.btnQLPB.AutoSizeMode = System.Windows.Forms.AutoSizeMode.GrowAndShrink;
            this.btnQLPB.Cursor = System.Windows.Forms.Cursors.Hand;
            this.btnQLPB.Dock = System.Windows.Forms.DockStyle.Left;
            this.btnQLPB.FlatAppearance.BorderColor = System.Drawing.Color.DimGray;
            this.btnQLPB.FlatAppearance.BorderSize = 2;
            this.btnQLPB.FlatStyle = System.Windows.Forms.FlatStyle.Popup;
            this.btnQLPB.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnQLPB.Image = global::QuanLyNhanSu.Properties.Resources.department;
            this.btnQLPB.Location = new System.Drawing.Point(102, 0);
            this.btnQLPB.Name = "btnQLPB";
            this.btnQLPB.Size = new System.Drawing.Size(107, 100);
            this.btnQLPB.TabIndex = 2;
            this.btnQLPB.Text = "Phòng ban";
            this.btnQLPB.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btnQLPB.UseVisualStyleBackColor = true;
            this.btnQLPB.Click += new System.EventHandler(this.btnQLPB_Click);
            // 
            // panel1
            // 
            this.panel1.BackColor = System.Drawing.SystemColors.Info;
            this.panel1.Controls.Add(this.lblSoNgayPhepConNV);
            this.panel1.Controls.Add(this.lblSoNgayPhepCon);
            this.panel1.Controls.Add(this.lblHoTenNV);
            this.panel1.Controls.Add(this.lblChucVuNV);
            this.panel1.Controls.Add(this.lblHoTen);
            this.panel1.Controls.Add(this.lblPhongBanNV);
            this.panel1.Controls.Add(this.lblChucVu);
            this.panel1.Controls.Add(this.lblPhongBan);
            this.panel1.Controls.Add(this.lblMaNV);
            this.panel1.Controls.Add(this.lblMaNhanVien);
            this.panel1.Controls.Add(this.pbAnhNV);
            this.panel1.Location = new System.Drawing.Point(0, 100);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1924, 168);
            this.panel1.TabIndex = 18;
            // 
            // lblSoNgayPhepConNV
            // 
            this.lblSoNgayPhepConNV.AutoSize = true;
            this.lblSoNgayPhepConNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSoNgayPhepConNV.Location = new System.Drawing.Point(1589, 72);
            this.lblSoNgayPhepConNV.Name = "lblSoNgayPhepConNV";
            this.lblSoNgayPhepConNV.Size = new System.Drawing.Size(39, 36);
            this.lblSoNgayPhepConNV.TabIndex = 24;
            this.lblSoNgayPhepConNV.Text = "...";
            // 
            // lblSoNgayPhepCon
            // 
            this.lblSoNgayPhepCon.AutoSize = true;
            this.lblSoNgayPhepCon.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblSoNgayPhepCon.Location = new System.Drawing.Point(1277, 70);
            this.lblSoNgayPhepCon.Name = "lblSoNgayPhepCon";
            this.lblSoNgayPhepCon.Size = new System.Drawing.Size(306, 38);
            this.lblSoNgayPhepCon.TabIndex = 23;
            this.lblSoNgayPhepCon.Text = "Số ngày phép còn:";
            // 
            // lblHoTenNV
            // 
            this.lblHoTenNV.AutoSize = true;
            this.lblHoTenNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHoTenNV.Location = new System.Drawing.Point(249, 116);
            this.lblHoTenNV.Name = "lblHoTenNV";
            this.lblHoTenNV.Size = new System.Drawing.Size(39, 36);
            this.lblHoTenNV.TabIndex = 20;
            this.lblHoTenNV.Text = "...";
            // 
            // lblChucVuNV
            // 
            this.lblChucVuNV.AutoSize = true;
            this.lblChucVuNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVuNV.Location = new System.Drawing.Point(827, 116);
            this.lblChucVuNV.Name = "lblChucVuNV";
            this.lblChucVuNV.Size = new System.Drawing.Size(39, 36);
            this.lblChucVuNV.TabIndex = 22;
            this.lblChucVuNV.Text = "...";
            // 
            // lblHoTen
            // 
            this.lblHoTen.AutoSize = true;
            this.lblHoTen.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblHoTen.Location = new System.Drawing.Point(12, 114);
            this.lblHoTen.Name = "lblHoTen";
            this.lblHoTen.Size = new System.Drawing.Size(129, 38);
            this.lblHoTen.TabIndex = 19;
            this.lblHoTen.Text = "Họ tên:";
            // 
            // lblPhongBanNV
            // 
            this.lblPhongBanNV.AutoSize = true;
            this.lblPhongBanNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBanNV.Location = new System.Drawing.Point(827, 19);
            this.lblPhongBanNV.Name = "lblPhongBanNV";
            this.lblPhongBanNV.Size = new System.Drawing.Size(39, 36);
            this.lblPhongBanNV.TabIndex = 4;
            this.lblPhongBanNV.Text = "...";
            // 
            // lblChucVu
            // 
            this.lblChucVu.AutoSize = true;
            this.lblChucVu.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblChucVu.Location = new System.Drawing.Point(628, 114);
            this.lblChucVu.Name = "lblChucVu";
            this.lblChucVu.Size = new System.Drawing.Size(155, 38);
            this.lblChucVu.TabIndex = 21;
            this.lblChucVu.Text = "Chức vụ:";
            // 
            // lblPhongBan
            // 
            this.lblPhongBan.AutoSize = true;
            this.lblPhongBan.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblPhongBan.Location = new System.Drawing.Point(628, 17);
            this.lblPhongBan.Name = "lblPhongBan";
            this.lblPhongBan.Size = new System.Drawing.Size(193, 38);
            this.lblPhongBan.TabIndex = 3;
            this.lblPhongBan.Text = "Phòng ban:";
            // 
            // lblMaNV
            // 
            this.lblMaNV.AutoSize = true;
            this.lblMaNV.Font = new System.Drawing.Font("Microsoft Sans Serif", 18F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaNV.Location = new System.Drawing.Point(249, 19);
            this.lblMaNV.Name = "lblMaNV";
            this.lblMaNV.Size = new System.Drawing.Size(39, 36);
            this.lblMaNV.TabIndex = 2;
            this.lblMaNV.Text = "...";
            this.lblMaNV.Click += new System.EventHandler(this.lblMaNV_Click);
            // 
            // lblMaNhanVien
            // 
            this.lblMaNhanVien.AutoSize = true;
            this.lblMaNhanVien.Font = new System.Drawing.Font("Microsoft Sans Serif", 19.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblMaNhanVien.Location = new System.Drawing.Point(12, 17);
            this.lblMaNhanVien.Name = "lblMaNhanVien";
            this.lblMaNhanVien.Size = new System.Drawing.Size(234, 38);
            this.lblMaNhanVien.TabIndex = 1;
            this.lblMaNhanVien.Text = "Mã nhân viên:";
            // 
            // pbAnhNV
            // 
            this.pbAnhNV.Image = global::QuanLyNhanSu.Properties.Resources.image;
            this.pbAnhNV.Location = new System.Drawing.Point(1726, 0);
            this.pbAnhNV.Name = "pbAnhNV";
            this.pbAnhNV.Size = new System.Drawing.Size(168, 168);
            this.pbAnhNV.SizeMode = System.Windows.Forms.PictureBoxSizeMode.CenterImage;
            this.pbAnhNV.TabIndex = 0;
            this.pbAnhNV.TabStop = false;
            // 
            // lblLichLamViec
            // 
            this.lblLichLamViec.AutoSize = true;
            this.lblLichLamViec.Font = new System.Drawing.Font("Microsoft Sans Serif", 24F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lblLichLamViec.Location = new System.Drawing.Point(838, 271);
            this.lblLichLamViec.Name = "lblLichLamViec";
            this.lblLichLamViec.Size = new System.Drawing.Size(264, 46);
            this.lblLichLamViec.TabIndex = 19;
            this.lblLichLamViec.Text = "Lịch làm việc";
            this.lblLichLamViec.Click += new System.EventHandler(this.lblLichLamViec_Click);
            // 
            // dtpLichLamViec
            // 
            this.dtpLichLamViec.CustomFormat = "dddd dd/MM/yyyy";
            this.dtpLichLamViec.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.dtpLichLamViec.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpLichLamViec.Location = new System.Drawing.Point(823, 320);
            this.dtpLichLamViec.Name = "dtpLichLamViec";
            this.dtpLichLamViec.Size = new System.Drawing.Size(308, 34);
            this.dtpLichLamViec.TabIndex = 16;
            this.dtpLichLamViec.ValueChanged += new System.EventHandler(this.dtpLichLamViec_ValueChanged);
            // 
            // dgvLichLamViec
            // 
            this.dgvLichLamViec.AllowUserToAddRows = false;
            this.dgvLichLamViec.AllowUserToDeleteRows = false;
            this.dgvLichLamViec.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.dgvLichLamViec.AutoSizeColumnsMode = System.Windows.Forms.DataGridViewAutoSizeColumnsMode.Fill;
            this.dgvLichLamViec.AutoSizeRowsMode = System.Windows.Forms.DataGridViewAutoSizeRowsMode.AllCells;
            dataGridViewCellStyle4.Alignment = System.Windows.Forms.DataGridViewContentAlignment.MiddleCenter;
            dataGridViewCellStyle4.BackColor = System.Drawing.SystemColors.Control;
            dataGridViewCellStyle4.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            dataGridViewCellStyle4.ForeColor = System.Drawing.SystemColors.WindowText;
            dataGridViewCellStyle4.SelectionBackColor = System.Drawing.SystemColors.Highlight;
            dataGridViewCellStyle4.SelectionForeColor = System.Drawing.SystemColors.HighlightText;
            dataGridViewCellStyle4.WrapMode = System.Windows.Forms.DataGridViewTriState.True;
            this.dgvLichLamViec.ColumnHeadersDefaultCellStyle = dataGridViewCellStyle4;
            this.dgvLichLamViec.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvLichLamViec.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.colMaNV,
            this.colHoTen,
            this.colLoaiCa,
            this.colCa,
            this.colNgayLam,
            this.colPhep,
            this.colThoiGianDen,
            this.colThoiGianVe});
            this.dgvLichLamViec.Location = new System.Drawing.Point(0, 360);
            this.dgvLichLamViec.Name = "dgvLichLamViec";
            this.dgvLichLamViec.ReadOnly = true;
            this.dgvLichLamViec.RowHeadersVisible = false;
            this.dgvLichLamViec.RowHeadersWidth = 51;
            this.dgvLichLamViec.RowTemplate.Height = 24;
            this.dgvLichLamViec.Size = new System.Drawing.Size(1924, 673);
            this.dgvLichLamViec.TabIndex = 17;
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
            // colLoaiCa
            // 
            this.colLoaiCa.HeaderText = "Loại ca";
            this.colLoaiCa.MinimumWidth = 6;
            this.colLoaiCa.Name = "colLoaiCa";
            this.colLoaiCa.ReadOnly = true;
            // 
            // colCa
            // 
            this.colCa.HeaderText = "Ca";
            this.colCa.MinimumWidth = 6;
            this.colCa.Name = "colCa";
            this.colCa.ReadOnly = true;
            // 
            // colNgayLam
            // 
            this.colNgayLam.HeaderText = "Ngày làm";
            this.colNgayLam.MinimumWidth = 6;
            this.colNgayLam.Name = "colNgayLam";
            this.colNgayLam.ReadOnly = true;
            // 
            // colPhep
            // 
            this.colPhep.HeaderText = "Phép";
            this.colPhep.MinimumWidth = 6;
            this.colPhep.Name = "colPhep";
            this.colPhep.ReadOnly = true;
            // 
            // colThoiGianDen
            // 
            this.colThoiGianDen.HeaderText = "Thời gian đến";
            this.colThoiGianDen.MinimumWidth = 6;
            this.colThoiGianDen.Name = "colThoiGianDen";
            this.colThoiGianDen.ReadOnly = true;
            // 
            // colThoiGianVe
            // 
            this.colThoiGianVe.HeaderText = "Thời gian về";
            this.colThoiGianVe.MinimumWidth = 6;
            this.colThoiGianVe.Name = "colThoiGianVe";
            this.colThoiGianVe.ReadOnly = true;
            // 
            // FrmManHinhChinh
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(120F, 120F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.BackColor = System.Drawing.SystemColors.ActiveCaption;
            this.ClientSize = new System.Drawing.Size(1924, 1033);
            this.Controls.Add(this.dgvLichLamViec);
            this.Controls.Add(this.dtpLichLamViec);
            this.Controls.Add(this.lblLichLamViec);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.pnlMenu);
            this.MinimumSize = new System.Drawing.Size(1918, 1018);
            this.Name = "FrmManHinhChinh";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = " ";
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.Load += new System.EventHandler(this.frmManHinhChinh_Load);
            this.pnlMenu.ResumeLayout(false);
            this.pnlMenu.PerformLayout();
            this.panel1.ResumeLayout(false);
            this.panel1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pbAnhNV)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dgvLichLamViec)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnQLNV;
        private System.Windows.Forms.Panel pnlMenu;
        private System.Windows.Forms.Button btnQLLHD;
        private System.Windows.Forms.Button btnQLTK;
        private System.Windows.Forms.Button btnQLPP;
        private System.Windows.Forms.Button btnQLPT;
        private System.Windows.Forms.Button btnQLPC;
        private System.Windows.Forms.Button btnQLLLV;
        private System.Windows.Forms.Button btnQLCC;
        private System.Windows.Forms.Button btnQLC;
        private System.Windows.Forms.Button btnQLCV;
        private System.Windows.Forms.Button btnQLPB;
        private System.Windows.Forms.Button btnQLPQ;
        private System.Windows.Forms.Button btnTTTK;
        private System.Windows.Forms.Button btnDangXuat;
        private System.Windows.Forms.Button btnLSTT;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Label lblMaNhanVien;
        private System.Windows.Forms.PictureBox pbAnhNV;
        private System.Windows.Forms.Label lblPhongBanNV;
        private System.Windows.Forms.Label lblPhongBan;
        private System.Windows.Forms.Label lblMaNV;
        private System.Windows.Forms.Label lblHoTenNV;
        private System.Windows.Forms.Label lblChucVuNV;
        private System.Windows.Forms.Label lblHoTen;
        private System.Windows.Forms.Label lblChucVu;
        private System.Windows.Forms.Label lblLichLamViec;
        private System.Windows.Forms.DateTimePicker dtpLichLamViec;
        private System.Windows.Forms.DataGridView dgvLichLamViec;
        private System.Windows.Forms.Label lblSoNgayPhepConNV;
        private System.Windows.Forms.Label lblSoNgayPhepCon;
        private System.Windows.Forms.DataGridViewTextBoxColumn colMaNV;
        private System.Windows.Forms.DataGridViewTextBoxColumn colHoTen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colLoaiCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colCa;
        private System.Windows.Forms.DataGridViewTextBoxColumn colNgayLam;
        private System.Windows.Forms.DataGridViewCheckBoxColumn colPhep;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThoiGianDen;
        private System.Windows.Forms.DataGridViewTextBoxColumn colThoiGianVe;
    }
}