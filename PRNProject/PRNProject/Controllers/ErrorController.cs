using Microsoft.AspNetCore.Mvc;

namespace PRNProject.Controllers
{
    public class ErrorController : Controller
    {
        public IActionResult Error()
        {
            return View();
        }
    }
}
