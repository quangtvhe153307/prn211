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
            ViewBag.User = Request.Cookies["user"];
            ViewBag.Pass = Request.Cookies["pass"];
            ViewBag.Remember = Request.Cookies["remember"];
            return View("Views/Login/Login.cshtml");
        }
        public IActionResult Login(string user, string pass, string remember)
        {
            AccountManager accountManager = new AccountManager();
            Account a = accountManager.GetAccount(user, pass);
            if (a == null)
            {
                return View("Error");
            }
            else
            {
                HttpContext.Session.SetString("account", JsonConvert.SerializeObject(a));
                if (remember.Equals("on"))
                {
                    Response.Cookies.Append("user", user);
                    Response.Cookies.Append("pass", pass);
                    Response.Cookies.Append("remember", remember);
                }
                return RedirectPermanent("~/home/home");
            }
        }
    }
}
