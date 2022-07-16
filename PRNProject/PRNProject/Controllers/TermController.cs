using Microsoft.AspNetCore.Mvc;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class TermController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {   
            TermManager termManager = new TermManager();
            List<Term> terms = termManager.GetTerms();
            return View(terms);
        }
    }
}
