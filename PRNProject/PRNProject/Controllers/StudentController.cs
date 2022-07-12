using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;

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
                return View(student);
            }
        }
    }
}
