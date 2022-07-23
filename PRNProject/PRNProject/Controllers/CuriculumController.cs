using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;

namespace PRNProject.Controllers
{
    [TypeFilter(typeof(Authorize))]
    public class CuriculumController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult StudentCuriculum()
        {
            if(HttpContext.Session.GetString("account") != null)
            {
                Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
                StudentManager studentManager = new StudentManager();
                Student student = studentManager.GetStudent(a.UserId);
                return View(student);
            }
            return View();
        }
    }
}
