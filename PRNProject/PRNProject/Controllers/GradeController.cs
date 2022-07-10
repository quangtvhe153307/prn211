using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class GradeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult StudentGrade()
        {
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentCourseManager studentCourseManager = new StudentCourseManager();
            TermManager termManager = new TermManager();
            List<Term> terms = termManager.GetTerms(a.UserId);
            List<StudentCourse> studentCourse = studentCourseManager.GetStudentCourses(terms[terms.Count-1].TermId, a.UserId);
            ViewBag.Terms = terms;
            return View(studentCourse);
        }
    }
}
