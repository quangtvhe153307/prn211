using ClosedXML.Excel;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;

namespace PRNProject.Controllers
{
    [TypeFilter(typeof(Authorize))]
    public class StudentController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Profile()
        {
            StudentManager studentManager = new StudentManager();
            if (HttpContext.Session.GetString("account") == null)
            {
                return RedirectPermanent("");
            }
            else
            {
                Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
                Student student = studentManager.GetStudent(a.UserId);
                NewsManager newsManager = new NewsManager();
                List<News> newList = newsManager.GetLatestNews();
                ViewBag.News = newList;
                return View(student);
            }
        }
        public IActionResult AddBalance(int id)
        {
            if (HttpContext.Session.GetString("account") == null)
            {
                return RedirectPermanent("");
            }
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new StudentManager();
            Student student = studentManager.GetStudent(a.UserId);
            NewsManager newsManager = new NewsManager();
            List<News> newList = newsManager.GetLatestNews();
            ViewBag.News = newList;
            return View(student);
        }
        public IActionResult DoAddBalance(int id, decimal balance)
        {
            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new StudentManager();
            Student student = studentManager.GetStudent(a.UserId);
            student.Balanced += balance;
            studentManager.UpdateStudent(student);
            Dictionary<string, string> map = new Dictionary<string, string>();
            map.Add("newBalance", student.Balanced.ToString());
            map.Add("message", "successfully");

            return RedirectToAction("AddBalance", new { id = id });
        }
        public string UpdateProfile(Student s, Account a)
        {
            AccountManager accountManager = new();
            StudentManager studentManager = new();
            Account myAcc = new();
            if (HttpContext.Session.GetString("account") != null)
            {
                myAcc = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            }
            myAcc.Address = a.Address;
            myAcc.Email = a.Email;
            myAcc.Phone = a.Phone;
            accountManager.UpdateAccount(myAcc);
            HttpContext.Session.Remove("account");
            HttpContext.Session.SetString("account", JsonConvert.SerializeObject(myAcc));
            Student student = studentManager.GetStudent(myAcc.UserId);
            student.FirstName = s.FirstName; student.LastName = s.LastName; student.MidName = s.MidName;
            studentManager.UpdateStudent(student);
            return "successfully";
        }

        [HttpPost]
        public IActionResult Export()
        {
            DataTable dt = new DataTable("Curriculum");
            dt.Columns.AddRange(new DataColumn[7] {new DataColumn("#"),
                                        new DataColumn("TermNo"),
                                        new DataColumn("Semeter"),
                                        new DataColumn("Subject Code"),
                                        new DataColumn("Subject Name"),
                                        new DataColumn("Grade"),
                                        new DataColumn("Status")});


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

            for (int i = 0; i < curiculum.CuriculumSubjects.Count; i++)
            {
                string semeter = "";
                string status = "";
                string grade = "";
                if(studentCourses[i] != null)
                {
                    semeter = studentCourses[i].Course.Term.TermName;
                    grade = studentCourses[i].Mark.ToString();
                    if (studentCourses[i].Mark >= 5)
                    {
                        status = "Passed";
                    } else if(studentCourses[i].Mark < 5)
                    {
                        status = "Failed";
                    } else
                    {
                        status = "Studying";
                    }
                } else
                {
                    semeter = "";
                    status = "Not started";
                }


                dt.Rows.Add(i + 1, curiculum.CuriculumSubjects.ToList()[i].TermNo,
                    semeter,
                    curiculum.CuriculumSubjects.ToList()[i].Subject.SubjectCode,
                    curiculum.CuriculumSubjects.ToList()[i].Subject.SubjectName,
                    grade,
                    status
                    );
            }
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt);
                using (MemoryStream stream = new MemoryStream())
                {
                    wb.SaveAs(stream);
                    return File(stream.ToArray(), "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Curriculum.xlsx");
                }
            }
        }
    }
}
