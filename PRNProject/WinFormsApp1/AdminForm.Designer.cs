namespace WinFormsApp1
{
    partial class AdminForm
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
            this.lbAdmin = new System.Windows.Forms.Label();
            this.button1 = new System.Windows.Forms.Button();
            this.btLogout = new System.Windows.Forms.Button();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.pnProfile = new System.Windows.Forms.Panel();
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
            this.panel1 = new System.Windows.Forms.Panel();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.button2 = new System.Windows.Forms.Button();
            this.pnAccount.SuspendLayout();
            this.pnProfile.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.panel1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // pnAccount
            // 
            this.pnAccount.BackColor = System.Drawing.Color.White;
            this.pnAccount.Controls.Add(this.button2);
            this.pnAccount.Controls.Add(this.lbAdmin);
            this.pnAccount.Controls.Add(this.button1);
            this.pnAccount.Controls.Add(this.btLogout);
            this.pnAccount.Controls.Add(this.textBox1);
            this.pnAccount.Location = new System.Drawing.Point(0, 0);
            this.pnAccount.Name = "pnAccount";
            this.pnAccount.Size = new System.Drawing.Size(280, 600);
            this.pnAccount.TabIndex = 1;
            // 
            // lbAdmin
            // 
            this.lbAdmin.AutoSize = true;
            this.lbAdmin.Font = new System.Drawing.Font("Segoe UI", 18F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.lbAdmin.Location = new System.Drawing.Point(12, 8);
            this.lbAdmin.Name = "lbAdmin";
            this.lbAdmin.Size = new System.Drawing.Size(112, 41);
            this.lbAdmin.TabIndex = 6;
            this.lbAdmin.Text = "Admin";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(12, 99);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(258, 59);
            this.button1.TabIndex = 3;
            this.button1.Text = "Profile";
            this.button1.UseVisualStyleBackColor = true;
            // 
            // btLogout
            // 
            this.btLogout.Location = new System.Drawing.Point(0, 548);
            this.btLogout.Name = "btLogout";
            this.btLogout.Size = new System.Drawing.Size(285, 59);
            this.btLogout.TabIndex = 2;
            this.btLogout.Text = "Logout";
            this.btLogout.UseVisualStyleBackColor = true;
            // 
            // textBox1
            // 
            this.textBox1.Enabled = false;
            this.textBox1.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.textBox1.Location = new System.Drawing.Point(12, 52);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(258, 27);
            this.textBox1.TabIndex = 1;
            // 
            // pnProfile
            // 
            this.pnProfile.Controls.Add(this.groupBox1);
            this.pnProfile.Location = new System.Drawing.Point(1254, 7);
            this.pnProfile.Name = "pnProfile";
            this.pnProfile.Size = new System.Drawing.Size(900, 600);
            this.pnProfile.TabIndex = 5;
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
            // panel1
            // 
            this.panel1.Controls.Add(this.dataGridView1);
            this.panel1.Location = new System.Drawing.Point(285, 1);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(900, 600);
            this.panel1.TabIndex = 6;
            // 
            // dataGridView1
            // 
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(37, 51);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 29;
            this.dataGridView1.Size = new System.Drawing.Size(824, 461);
            this.dataGridView1.TabIndex = 0;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(12, 176);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(258, 59);
            this.button2.TabIndex = 7;
            this.button2.Text = "Application List";
            this.button2.UseVisualStyleBackColor = true;
            // 
            // AdminForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1471, 602);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.pnProfile);
            this.Controls.Add(this.pnAccount);
            this.Name = "AdminForm";
            this.Text = "AdminForm";
            this.pnAccount.ResumeLayout(false);
            this.pnAccount.PerformLayout();
            this.pnProfile.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.panel1.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnAccount;
        private System.Windows.Forms.Label lbAdmin;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button btLogout;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Panel pnProfile;
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
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.DataGridView dataGridView1;
    }
}