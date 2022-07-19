using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Controllers
{
    public class AcademicTranscriptController : Controller
    {
        public IActionResult Index()
        {
            Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new();
            Student student = studentManager.GetStudent(account.UserId);
            CuriculumManager curiculumManager = new();
            MajorCurManager majorCurManager = new();

            Curiculum curiculum = curiculumManager.GetCuriculum((int)majorCurManager.GetCuriculumId((int)student.MajorCurId));


            StudentCourseManager studentCourseManager = new();
            List<StudentCourse> studentCourses = new();
            for (int i = 0; i < curiculum.CuriculumSubjects.Count; i++)
            {
                studentCourses.Add(studentCourseManager.GetStudentCourse(curiculum.CuriculumSubjects.ToList()[i].SubjectId, student.StudentId));
            }
            ViewBag.StudentCourses = studentCourses;
            return View(curiculum);
        }
    }
}
