using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
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
                HttpContext.Session.SetString("account", JsonConvert.SerializeObject(a));
                return RedirectPermanent("~/home/home");
            }
        }
    }
}
