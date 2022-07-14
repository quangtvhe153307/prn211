using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class AccountManager
    {
        PRNProjectContext context;

        public AccountManager()
        {
            context = new PRNProjectContext();
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
