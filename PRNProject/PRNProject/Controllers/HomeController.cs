using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class HomeController : Controller
    {   
        //[ServiceFilter(typeof(Authorize))]
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Home()
        {   
            NewsManager newsManager = new NewsManager();
            StudentManager studentManager = new StudentManager();
            ViewBag.Title = "Home";
            ViewBag.Test = studentManager.GetStudent(3);
            List<News> newList = newsManager.GetNews();
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            ViewBag.Id = a.UserId;
            return View(newList);
        }
        public IActionResult Login()
        {
            return View();
        }
    }
}
