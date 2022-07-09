using Microsoft.AspNetCore.Mvc;

namespace PRNProject.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Home()
        {   
            ViewBag.Title = "Home";
            return View();
        }
    }
}
