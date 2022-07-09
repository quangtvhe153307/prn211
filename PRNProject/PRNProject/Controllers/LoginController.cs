using Microsoft.AspNetCore.Mvc;
using PRNProject.Logics;
using PRNProject.Models;

namespace PRNProject.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View("Views/Login/Login.cshtml");
        }
        public IActionResult Login(string user, string pass, string remember)
        {   
            AccountManager accountManager = new AccountManager();
            Account a = accountManager.GetAccount(user, pass);
            if(a == null)
            {
                return View("Error");
            } else
            {
                return RedirectPermanent("~/home/home");
            }
        }
    }
}
