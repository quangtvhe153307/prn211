using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Profile()
        {
            StudentManager studentManager = new StudentManager();
            if (HttpContext.Session.GetString("account") == null)
            {
                return RedirectPermanent("");
            }
            else
            {
                Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
                Student student = studentManager.GetStudent(a.UserId);
                NewsManager newsManager = new NewsManager();
                List<News> newList = newsManager.GetLatestNews();
                ViewBag.News = newList;
                return View(student);
            }
        }
        public string UpdateProfile(Student s, Account a)
        {
            AccountManager accountManager = new();
            StudentManager studentManager = new();
            Account myAcc = new();
            if (HttpContext.Session.GetString("account") != null)
            {
                myAcc = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            }
            myAcc.Address = a.Address;
            myAcc.Email = a.Email;
            myAcc.Phone = a.Phone;
            accountManager.UpdateAccount(myAcc);
            HttpContext.Session.Remove("account");
            HttpContext.Session.SetString("account", JsonConvert.SerializeObject(myAcc));
            Student student = studentManager.GetStudent(myAcc.UserId);
            student.FirstName = s.FirstName; student.LastName = s.LastName;student.MidName = s.MidName;
            studentManager.UpdateStudent(student);
            return "successfully";
        }
    }
}
