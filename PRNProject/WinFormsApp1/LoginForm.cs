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
            Environment.Exit(0);
        }

        private void btLogin_Click(object sender, EventArgs e)
        {
            AccountManager accountManager = new();
            Account account = accountManager.GetAccount(tbName.Text, tbPass.Text);
            if (account != null)
            {
                if (account.Role == 2)
                {

                    HomeForm frm = new HomeForm(account);
                    frm.Show();
                    frm.Activate();
                    this.Hide();
                } else if(account.Role == 3)
                {
                    AdminForm frm = new AdminForm(account);
                    frm.Show();
                    frm.Activate();
                    this.Hide();
                } else
                {
                    tbMessage.Text = "You don't have permission to access";
                }
            }
            else
            {
                tbMessage.Text = "Username or password is incorrect";
            }
        }

        private void LoginForm_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click_1(object sender, EventArgs e)
        {

        }
    }
}
