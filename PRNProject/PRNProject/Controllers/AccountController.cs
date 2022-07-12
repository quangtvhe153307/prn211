using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;

namespace PRNProject.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public string GetAccount()
        {
            if (HttpContext.Session.GetString("account") != null)
            {
                Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
                if (account.Role == 1)
                {
                    StudentManager studentManager = new StudentManager();
                    Student student = studentManager.GetStudent(account.UserId);
                    return student.FirstName;
                }
                else if (account.Role == 2)
                {
                    InstructorManager instructorManager = new InstructorManager();
                    Instructor instructor = instructorManager.GetInstructor(account.UserId);
                    return JsonConvert.SerializeObject(instructor);
                }
                else
                {
                    return "test";
                }
            }
            return "";
            //return HttpContext.Session.GetString("account");
        }
    }
}
