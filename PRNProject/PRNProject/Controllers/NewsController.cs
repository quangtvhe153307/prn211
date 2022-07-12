using Microsoft.AspNetCore.Mvc;

namespace PRNProject.Controllers
{
    public class NewsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {
       
            return View();
        }
    }
}
