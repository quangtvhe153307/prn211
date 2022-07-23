using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;

namespace PRNProject.Controllers
{
    public class AuthenticationController : Controller
    {
        public IActionResult Index()
        {
            if(HttpContext.Session.GetString("account") == null)
            {
                ViewBag.User = Request.Cookies["user"];
                ViewBag.Pass = Request.Cookies["pass"];
                ViewBag.Remember = Request.Cookies["remember"];
                return View("Views/Login/Login.cshtml");
            } else
            {
                return View("Views/Home/Home.cschtml");
            }
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
                if (!string.IsNullOrEmpty(remember))
                {
                    Response.Cookies.Append("user", user);
                    Response.Cookies.Append("pass", pass);
                    Response.Cookies.Append("remember", remember);
                } 
                return RedirectPermanent("~/home/home");
            }
        }
        [TypeFilter(typeof(Authorize))]
        public IActionResult Logout()
        {
            if(HttpContext.Session.GetString("account") != null)
            {
                HttpContext.Session.Remove("account");
            }
            ViewBag.User = Request.Cookies["user"];
            ViewBag.Pass = Request.Cookies["pass"];
            ViewBag.Remember = Request.Cookies["remember"];

            return View("Views/Login/Login.cshtml");
        }
    }
}