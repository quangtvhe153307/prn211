using Microsoft.AspNetCore.Mvc;

namespace PRNProject.Controllers
{
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
