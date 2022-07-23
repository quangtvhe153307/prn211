using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    [TypeFilter(typeof(Authorize))]
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Home()
        {
            StudentManager studentManager = new StudentManager();
            ViewBag.Title = "Home";
            ViewBag.Test = studentManager.GetStudent(3);
            NewsManager newsManager = new NewsManager();
            List<News> newList = newsManager.GetLatestNews();
            ViewBag.News = newList;
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            ViewBag.Id = a.UserId;
            return View();
        }
        public IActionResult Login()
        {
            ViewBag.User = Request.Cookies["user"];
            ViewBag.Pass = Request.Cookies["pass"];
            ViewBag.Remember = Request.Cookies["remember"];
            return View();
        }
    }
}
