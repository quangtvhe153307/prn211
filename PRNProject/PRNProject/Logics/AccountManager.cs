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
        public Account GetAccount(int id)
        {
            return context.Accounts.FirstOrDefault(x => x.UserId == id);
        }
    }
}
