namespace WinFormsApp1
{
    partial class HomeForm
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
            this.pnAccount = new System.Windows.Forms.Panel();
            this.lbInstructor = new System.Windows.Forms.Label();
            this.button3 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.btLogout = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.pnGrade = new System.Windows.Forms.Panel();
            this.btSaveGrade = new System.Windows.Forms.Button();
            this.lbClassGrade = new System.Windows.Forms.ListBox();
            this.dgvGrade = new System.Windows.Forms.DataGridView();
            this.pnAttendance = new System.Windows.Forms.Panel();
            this.btSaveAttend = new System.Windows.Forms.Button();
            this.lbClassAttendance = new System.Windows.Forms.ListBox();
            this.dgvAttendance = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.tbMessage = new System.Windows.Forms.TextBox();
            this.btSave = new System.Windows.Forms.Button();
            this.tbAddress = new System.Windows.Forms.TextBox();
            this.tbEmail = new System.Windows.Forms.TextBox();
            this.tbPhone = new System.Windows.Forms.TextBox();
            this.tbLastName = new System.Windows.Forms.TextBox();
            this.tbMidName = new System.Windows.Forms.TextBox();
            this.tbFirstName = new System.Windows.Forms.TextBox();
            this.lbAddress = new System.Windows.Forms.Label();
            this.lbEmail = new System.Windows.Forms.Label();
            this.lbPhonee = new System.Windows.Forms.Label();
            this.lbLastName = new System.Windows.Forms.Label();
            this.lbMidName = new System.Windows.Forms.Label();
            this.lbFirstName = new System.Windows.Forms.Label();
            this.pnProfile = new System.Windows.Forms.Panel();
            this.pnAccount.SuspendLayout();
            this.pnGrade.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvGrade)).BeginInit();
            this.pnAttendance.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgvAttendance)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.pnProfile.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnAccount
            // 
            this.pnAccount.BackColor = System.Drawing.Color.White;
            this.pnAccount.Controls.Add(this.lbInstructor);
            this.pnAccount.Controls.Add(this.button3);
            this.pnAccount.Controls.Add(this.button2);
            this.pnAccount.Controls.Add(this.button1);
            this.pnAccount.Controls.Add(this.btLogout);
            this.pnAccount.Controls.Add(this.textBox1);
            this.pnAccount.Location = new System.Drawing.Point(0, 0);
            this.pnAccount.Name = "pnAccount";
            this.pnAccount.Size = new System.Drawing.Size(280, 600);
            this.pnAccount.TabIndex = 0;
            // 
            // lbInstructor
            // 
            this.lbInstructor.AutoSize = true;
            this.lbInstructor.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lbInstructor.Location = new System.Drawing.Point(12, 8);
            this.lbInstructor.Name = "lbInstructor";
            this.lbInstructor.Size = new System.Drawing.Size(157, 41);
            this.lbInstructor.TabIndex = 6;
            this.lbInstructor.Text = "Instructor";
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(12, 229);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(258, 59);
            this.button3.TabIndex = 5;
            this.button3.Text = "Send Grade";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(12, 164);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(258, 59);
            this.button2.TabIndex = 4;
            this.button2.Text = "Take attendance";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(12, 99);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(258, 59);
            this.button1.TabIndex = 3;
            this.button1.Text = "Profile";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // btLogout
            // 
            this.btLogout.Location = new System.Drawing.Point(0, 548);
            this.btLogout.Name = "btLogout";
            this.btLogout.Size = new System.Drawing.Size(285, 59);
            this.btLogout.TabIndex = 2;
            this.btLogout.Text = "Logout";
            this.btLogout.UseVisualStyleBackColor = true;
            this.btLogout.Click += new System.EventHandler(this.btLogout_Click);
            // 
            // textBox1
            // 
            this.textBox1.Enabled = false;
            this.textBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.textBox1.Location = new System.Drawing.Point(12, 52);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(258, 27);
            this.textBox1.TabIndex = 1;
            this.textBox1.Text = "safsafas";
            // 
            // pnGrade
            // 
            this.pnGrade.Controls.Add(this.btSaveGrade);
            this.pnGrade.Controls.Add(this.lbClassGrade);
            this.pnGrade.Controls.Add(this.dgvGrade);
            this.pnGrade.Location = new System.Drawing.Point(1200, 0);
            this.pnGrade.Name = "pnGrade";
            this.pnGrade.Size = new System.Drawing.Size(900, 600);
            this.pnGrade.TabIndex = 6;
            // 
            // btSaveGrade
            // 
            this.btSaveGrade.Location = new System.Drawing.Point(101, 474);
            this.btSaveGrade.Name = "btSaveGrade";
            this.btSaveGrade.Size = new System.Drawing.Size(94, 29);
            this.btSaveGrade.TabIndex = 2;
            this.btSaveGrade.Text = "Save";
            this.btSaveGrade.UseVisualStyleBackColor = true;
            this.btSaveGrade.Click += new System.EventHandler(this.btSaveGrade_Click);
            // 
            // lbClassGrade
            // 
            this.lbClassGrade.FormattingEnabled = true;
            this.lbClassGrade.ItemHeight = 20;
            this.lbClassGrade.Location = new System.Drawing.Point(45, 72);
            this.lbClassGrade.Name = "lbClassGrade";
            this.lbClassGrade.Size = new System.Drawing.Size(150, 104);
            this.lbClassGrade.TabIndex = 1;
            this.lbClassGrade.SelectedIndexChanged += new System.EventHandler(this.lbClassGrade_SelectedIndexChanged);
            // 
            // dgvGrade
            // 
            this.dgvGrade.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvGrade.Location = new System.Drawing.Point(251, 30);
            this.dgvGrade.Name = "dgvGrade";
            this.dgvGrade.RowHeadersWidth = 51;
            this.dgvGrade.RowTemplate.Height = 29;
            this.dgvGrade.Size = new System.Drawing.Size(629, 510);
            this.dgvGrade.TabIndex = 0;
            this.dgvGrade.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvGrade_CellFormatting);
            // 
            // pnAttendance
            // 
            this.pnAttendance.Controls.Add(this.btSaveAttend);
            this.pnAttendance.Controls.Add(this.lbClassAttendance);
            this.pnAttendance.Controls.Add(this.dgvAttendance);
            this.pnAttendance.Location = new System.Drawing.Point(294, 700);
            this.pnAttendance.Name = "pnAttendance";
            this.pnAttendance.Size = new System.Drawing.Size(900, 600);
            this.pnAttendance.TabIndex = 5;
            // 
            // btSaveAttend
            // 
            this.btSaveAttend.Location = new System.Drawing.Point(72, 483);
            this.btSaveAttend.Name = "btSaveAttend";
            this.btSaveAttend.Size = new System.Drawing.Size(94, 29);
            this.btSaveAttend.TabIndex = 3;
            this.btSaveAttend.Text = "Save";
            this.btSaveAttend.UseVisualStyleBackColor = true;
            this.btSaveAttend.Click += new System.EventHandler(this.btSaveAttend_Click);
            // 
            // lbClassAttendance
            // 
            this.lbClassAttendance.FormattingEnabled = true;
            this.lbClassAttendance.ItemHeight = 20;
            this.lbClassAttendance.Location = new System.Drawing.Point(45, 72);
            this.lbClassAttendance.Name = "lbClassAttendance";
            this.lbClassAttendance.Size = new System.Drawing.Size(150, 104);
            this.lbClassAttendance.TabIndex = 1;
            this.lbClassAttendance.SelectedIndexChanged += new System.EventHandler(this.lbClassAttendance_SelectedIndexChanged);
            this.lbClassAttendance.Format += new System.Windows.Forms.ListControlConvertEventHandler(this.lbClassAttendance_Format);
            // 
            // dgvAttendance
            // 
            this.dgvAttendance.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgvAttendance.Location = new System.Drawing.Point(251, 30);
            this.dgvAttendance.Name = "dgvAttendance";
            this.dgvAttendance.RowHeadersWidth = 51;
            this.dgvAttendance.RowTemplate.Height = 29;
            this.dgvAttendance.Size = new System.Drawing.Size(629, 510);
            this.dgvAttendance.TabIndex = 0;
            this.dgvAttendance.CellFormatting += new System.Windows.Forms.DataGridViewCellFormattingEventHandler(this.dgvAttendance_CellFormatting);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.tbMessage);
            this.groupBox1.Controls.Add(this.btSave);
            this.groupBox1.Controls.Add(this.tbAddress);
            this.groupBox1.Controls.Add(this.tbEmail);
            this.groupBox1.Controls.Add(this.tbPhone);
            this.groupBox1.Controls.Add(this.tbLastName);
            this.groupBox1.Controls.Add(this.tbMidName);
            this.groupBox1.Controls.Add(this.tbFirstName);
            this.groupBox1.Controls.Add(this.lbAddress);
            this.groupBox1.Controls.Add(this.lbEmail);
            this.groupBox1.Controls.Add(this.lbPhonee);
            this.groupBox1.Controls.Add(this.lbLastName);
            this.groupBox1.Controls.Add(this.lbMidName);
            this.groupBox1.Controls.Add(this.lbFirstName);
            this.groupBox1.Location = new System.Drawing.Point(256, 121);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(425, 431);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Instructor Information";
            // 
            // tbMessage
            // 
            this.tbMessage.BackColor = System.Drawing.SystemColors.MenuBar;
            this.tbMessage.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tbMessage.Location = new System.Drawing.Point(181, 346);
            this.tbMessage.Name = "tbMessage";
            this.tbMessage.Size = new System.Drawing.Size(215, 20);
            this.tbMessage.TabIndex = 13;
            // 
            // btSave
            // 
            this.btSave.Location = new System.Drawing.Point(81, 342);
            this.btSave.Name = "btSave";
            this.btSave.Size = new System.Drawing.Size(94, 29);
            this.btSave.TabIndex = 12;
            this.btSave.Text = "Save";
            this.btSave.UseVisualStyleBackColor = true;
            this.btSave.Click += new System.EventHandler(this.btSave_Click);
            // 
            // tbAddress
            // 
            this.tbAddress.Location = new System.Drawing.Point(152, 271);
            this.tbAddress.Name = "tbAddress";
            this.tbAddress.Size = new System.Drawing.Size(215, 27);
            this.tbAddress.TabIndex = 11;
            // 
            // tbEmail
            // 
            this.tbEmail.Location = new System.Drawing.Point(152, 229);
            this.tbEmail.Name = "tbEmail";
            this.tbEmail.Size = new System.Drawing.Size(215, 27);
            this.tbEmail.TabIndex = 10;
            // 
            // tbPhone
            // 
            this.tbPhone.Location = new System.Drawing.Point(152, 190);
            this.tbPhone.Name = "tbPhone";
            this.tbPhone.Size = new System.Drawing.Size(215, 27);
            this.tbPhone.TabIndex = 9;
            // 
            // tbLastName
            // 
            this.tbLastName.Location = new System.Drawing.Point(152, 144);
            this.tbLastName.Name = "tbLastName";
            this.tbLastName.Size = new System.Drawing.Size(215, 27);
            this.tbLastName.TabIndex = 8;
            // 
            // tbMidName
            // 
            this.tbMidName.Location = new System.Drawing.Point(152, 106);
            this.tbMidName.Name = "tbMidName";
            this.tbMidName.Size = new System.Drawing.Size(215, 27);
            this.tbMidName.TabIndex = 7;
            // 
            // tbFirstName
            // 
            this.tbFirstName.Location = new System.Drawing.Point(152, 60);
            this.tbFirstName.Name = "tbFirstName";
            this.tbFirstName.Size = new System.Drawing.Size(215, 27);
            this.tbFirstName.TabIndex = 6;
            // 
            // lbAddress
            // 
            this.lbAddress.AutoSize = true;
            this.lbAddress.Location = new System.Drawing.Point(53, 278);
            this.lbAddress.Name = "lbAddress";
            this.lbAddress.Size = new System.Drawing.Size(62, 20);
            this.lbAddress.TabIndex = 5;
            this.lbAddress.Text = "Address";
            this.lbAddress.Click += new System.EventHandler(this.label6_Click);
            // 
            // lbEmail
            // 
            this.lbEmail.AutoSize = true;
            this.lbEmail.Location = new System.Drawing.Point(53, 236);
            this.lbEmail.Name = "lbEmail";
            this.lbEmail.Size = new System.Drawing.Size(46, 20);
            this.lbEmail.TabIndex = 4;
            this.lbEmail.Text = "Email";
            // 
            // lbPhonee
            // 
            this.lbPhonee.AutoSize = true;
            this.lbPhonee.Location = new System.Drawing.Point(53, 197);
            this.lbPhonee.Name = "lbPhonee";
            this.lbPhonee.Size = new System.Drawing.Size(50, 20);
            this.lbPhonee.TabIndex = 3;
            this.lbPhonee.Text = "Phone";
            // 
            // lbLastName
            // 
            this.lbLastName.AutoSize = true;
            this.lbLastName.Location = new System.Drawing.Point(53, 151);
            this.lbLastName.Name = "lbLastName";
            this.lbLastName.Size = new System.Drawing.Size(75, 20);
            this.lbLastName.TabIndex = 2;
            this.lbLastName.Text = "LastName";
            // 
            // lbMidName
            // 
            this.lbMidName.AutoSize = true;
            this.lbMidName.Location = new System.Drawing.Point(53, 106);
            this.lbMidName.Name = "lbMidName";
            this.lbMidName.Size = new System.Drawing.Size(75, 20);
            this.lbMidName.TabIndex = 1;
            this.lbMidName.Text = "MidName";
            // 
            // lbFirstName
            // 
            this.lbFirstName.AutoSize = true;
            this.lbFirstName.Location = new System.Drawing.Point(53, 67);
            this.lbFirstName.Name = "lbFirstName";
            this.lbFirstName.Size = new System.Drawing.Size(76, 20);
            this.lbFirstName.TabIndex = 0;
            this.lbFirstName.Text = "FirstName";
            // 
            // pnProfile
            // 
            this.pnProfile.Controls.Add(this.groupBox1);
            this.pnProfile.Location = new System.Drawing.Point(1200, 700);
            this.pnProfile.Name = "pnProfile";
            this.pnProfile.Size = new System.Drawing.Size(900, 600);
            this.pnProfile.TabIndex = 4;
            // 
            // HomeForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1201, 601);
            this.Controls.Add(this.pnAttendance);
            this.Controls.Add(this.pnGrade);
            this.Controls.Add(this.pnProfile);
            this.Controls.Add(this.pnAccount);
            this.Name = "HomeForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "HomeForm";
            this.FormClosing += new System.Windows.Forms.FormClosingEventHandler(this.HomeForm_FormClosing);
            this.Load += new System.EventHandler(this.HomeForm_Load);
            this.pnAccount.ResumeLayout(false);
            this.pnAccount.PerformLayout();
            this.pnGrade.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvGrade)).EndInit();
            this.pnAttendance.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dgvAttendance)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.pnProfile.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnAccount;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button btLogout;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Panel pnAttendance;
        private System.Windows.Forms.Panel pnGrade;
        private System.Windows.Forms.ListBox lbClassGrade;
        private System.Windows.Forms.DataGridView dgvGrade;
        private System.Windows.Forms.ListBox lbClassAttendance;
        private System.Windows.Forms.DataGridView dgvAttendance;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.TextBox tbMessage;
        private System.Windows.Forms.Button btSave;
        private System.Windows.Forms.TextBox tbAddress;
        private System.Windows.Forms.TextBox tbEmail;
        private System.Windows.Forms.TextBox tbPhone;
        private System.Windows.Forms.TextBox tbLastName;
        private System.Windows.Forms.TextBox tbMidName;
        private System.Windows.Forms.TextBox tbFirstName;
        private System.Windows.Forms.Label lbAddress;
        private System.Windows.Forms.Label lbEmail;
        private System.Windows.Forms.Label lbPhonee;
        private System.Windows.Forms.Label lbLastName;
        private System.Windows.Forms.Label lbMidName;
        private System.Windows.Forms.Label lbFirstName;
        private System.Windows.Forms.Panel pnProfile;
        private System.Windows.Forms.Label lbInstructor;
        private System.Windows.Forms.Button btSaveGrade;
        private System.Windows.Forms.Button btSaveAttend;
    }
}