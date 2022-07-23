namespace WinFormsApp1
{
    partial class LoginForm
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.pnLogin = new System.Windows.Forms.Panel();
            this.tbMessage = new System.Windows.Forms.TextBox();
            this.btExit = new System.Windows.Forms.Button();
            this.btLogin = new System.Windows.Forms.Button();
            this.lbPass = new System.Windows.Forms.Label();
            this.tbPass = new System.Windows.Forms.TextBox();
            this.lbName = new System.Windows.Forms.Label();
            this.tbName = new System.Windows.Forms.TextBox();
            this.label1 = new System.Windows.Forms.Label();
            this.pnLogin.SuspendLayout();
            this.SuspendLayout();
            // 
            // pnLogin
            // 
            this.pnLogin.Anchor = ((System.Windows.Forms.AnchorStyles)((((System.Windows.Forms.AnchorStyles.Top | System.Windows.Forms.AnchorStyles.Bottom) 
            | System.Windows.Forms.AnchorStyles.Left) 
            | System.Windows.Forms.AnchorStyles.Right)));
            this.pnLogin.Controls.Add(this.label1);
            this.pnLogin.Controls.Add(this.tbMessage);
            this.pnLogin.Controls.Add(this.btExit);
            this.pnLogin.Controls.Add(this.btLogin);
            this.pnLogin.Controls.Add(this.lbPass);
            this.pnLogin.Controls.Add(this.tbPass);
            this.pnLogin.Controls.Add(this.lbName);
            this.pnLogin.Controls.Add(this.tbName);
            this.pnLogin.Location = new System.Drawing.Point(12, 12);
            this.pnLogin.Name = "pnLogin";
            this.pnLogin.Size = new System.Drawing.Size(444, 296);
            this.pnLogin.TabIndex = 0;
            // 
            // tbMessage
            // 
            this.tbMessage.BackColor = System.Drawing.SystemColors.Menu;
            this.tbMessage.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.tbMessage.Font = new System.Drawing.Font("Segoe UI", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.tbMessage.ForeColor = System.Drawing.Color.Red;
            this.tbMessage.Location = new System.Drawing.Point(57, 178);
            this.tbMessage.Name = "tbMessage";
            this.tbMessage.Size = new System.Drawing.Size(326, 20);
            this.tbMessage.TabIndex = 6;
            this.tbMessage.TextAlign = System.Windows.Forms.HorizontalAlignment.Center;
            // 
            // btExit
            // 
            this.btExit.Location = new System.Drawing.Point(240, 214);
            this.btExit.Name = "btExit";
            this.btExit.Size = new System.Drawing.Size(94, 29);
            this.btExit.TabIndex = 5;
            this.btExit.Text = "Exit";
            this.btExit.UseVisualStyleBackColor = true;
            this.btExit.Click += new System.EventHandler(this.btExit_Click);
            // 
            // btLogin
            // 
            this.btLogin.Location = new System.Drawing.Point(99, 214);
            this.btLogin.Name = "btLogin";
            this.btLogin.Size = new System.Drawing.Size(94, 29);
            this.btLogin.TabIndex = 4;
            this.btLogin.Text = "Login";
            this.btLogin.UseVisualStyleBackColor = true;
            this.btLogin.Click += new System.EventHandler(this.btLogin_Click);
            // 
            // lbPass
            // 
            this.lbPass.AutoSize = true;
            this.lbPass.Location = new System.Drawing.Point(57, 138);
            this.lbPass.Name = "lbPass";
            this.lbPass.Size = new System.Drawing.Size(70, 20);
            this.lbPass.TabIndex = 3;
            this.lbPass.Text = "Password";
            // 
            // tbPass
            // 
            this.tbPass.Location = new System.Drawing.Point(158, 135);
            this.tbPass.Name = "tbPass";
            this.tbPass.PasswordChar = '*';
            this.tbPass.Size = new System.Drawing.Size(225, 27);
            this.tbPass.TabIndex = 2;
            // 
            // lbName
            // 
            this.lbName.AutoSize = true;
            this.lbName.Location = new System.Drawing.Point(57, 86);
            this.lbName.Name = "lbName";
            this.lbName.Size = new System.Drawing.Size(75, 20);
            this.lbName.TabIndex = 1;
            this.lbName.Text = "Username";
            this.lbName.Click += new System.EventHandler(this.label1_Click);
            // 
            // tbName
            // 
            this.tbName.Location = new System.Drawing.Point(158, 86);
            this.tbName.Name = "tbName";
            this.tbName.Size = new System.Drawing.Size(225, 27);
            this.tbName.TabIndex = 0;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 13.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(57, 34);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(75, 31);
            this.label1.TabIndex = 7;
            this.label1.Text = "Login";
            // 
            // LoginForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(468, 320);
            this.Controls.Add(this.pnLogin);
            this.Name = "LoginForm";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Login";
            this.Load += new System.EventHandler(this.LoginForm_Load);
            this.pnLogin.ResumeLayout(false);
            this.pnLogin.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel pnLogin;
        private System.Windows.Forms.Button btExit;
        private System.Windows.Forms.Button btLogin;
        private System.Windows.Forms.Label lbPass;
        private System.Windows.Forms.TextBox tbPass;
        private System.Windows.Forms.Label lbName;
        private System.Windows.Forms.TextBox tbName;
        private System.Windows.Forms.TextBox tbMessage;
        private System.Windows.Forms.Label label1;
    }
}
