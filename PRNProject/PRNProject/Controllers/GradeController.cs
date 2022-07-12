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
        public IActionResult StudentGrade(int termId)
        {
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentCourseManager studentCourseManager = new StudentCourseManager();
            StudentManager studentManager = new StudentManager();
            TermManager termManager = new TermManager();

            List<Term> terms = termManager.GetTerms(a.UserId);
            ViewBag.Terms = terms;

            Student s = studentManager.GetStudent(a.UserId);
            ViewBag.Name = s.FirstName + " " + s.MidName + " " + s.LastName;
            if (termId == 0)
            {
                termId = terms[terms.Count - 1].TermId;
            }

            NewsManager newsManager = new NewsManager();
            List<News> newList = newsManager.GetNews();
            ViewBag.News = newList;
            List<StudentCourse> studentCourses = studentCourseManager.GetStudentCourses(termId, a.UserId);
            return View(studentCourses);
        }
    }
}
