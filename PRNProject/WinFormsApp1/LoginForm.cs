using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using WinFormsApp1.Logics;
using WinFormsApp1.Models;

namespace WinFormsApp1
{
    public partial class LoginForm : Form
    {
        public LoginForm()
        {
            InitializeComponent();
            pnLogin.Left = (ClientSize.Width - pnLogin.Width) / 2;
            pnLogin.Top = (ClientSize.Height - pnLogin.Height) / 2;

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btExit_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            AccountManager accountManager = new();
            Account account = accountManager.GetAccount(tbName.Text, tbPass.Text);
            if(account != null)
            {
                //HomeForm frm = new HomeForm();
                //frm.ShowDialog();
                this.Close();
            }
            else
            {
                tbMessage.Text = "Your account is invalid";
            }
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {

        }
    }
}
