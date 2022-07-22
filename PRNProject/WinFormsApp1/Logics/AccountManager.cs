using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsApp1.Models;

namespace WinFormsApp1.Logics
{
    internal class AccountManager
    {
        PRNProjectContext context;

        public AccountManager()
        {
            context = new();
        }
        public List<Account> GetAccounts()
        {
            return context.Accounts.ToList();
        }
        public Account GetAccount(string username, string pass)
        {
            return context.Accounts.FirstOrDefault(x => x.Username.Equals(username) && x.Password.Equals(pass));
        }
        public void UpdateAccount(Account a)
        {
            context.Accounts.Update(a);
            context.SaveChanges();
        }
    }
}
