using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    [TypeFilter(typeof(Authorize))]
    public class GradeController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult StudentGrade(int id)
        {
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentCourseManager studentCourseManager = new StudentCourseManager();
            StudentManager studentManager = new StudentManager();
            TermManager termManager = new TermManager();

            List<Term> terms = termManager.GetTerms(a.UserId);
            ViewBag.Terms = terms;

            Student s = studentManager.GetStudent(a.UserId);
            ViewBag.Name = s.FirstName + " " + s.MidName + " " + s.LastName;
            if (id == 0)
            {
                id = terms[terms.Count - 1].TermId;
            }

            NewsManager newsManager = new NewsManager();
            List<News> newList = newsManager.GetLatestNews();
            ViewBag.News = newList;
            List<StudentCourse> studentCourses = studentCourseManager.GetStudentCourses(id, a.UserId);
            return View(studentCourses);
        }
    }
}
