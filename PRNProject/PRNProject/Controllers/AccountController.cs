using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class AccountController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public string GetAccount()
        {
            if (HttpContext.Session.GetString("account") != null)
            {
                Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
                if (account.Role == 1)
                {
                    StudentManager studentManager = new StudentManager();
                    Student student = studentManager.GetStudent(account.UserId);
                    return student.FirstName;
                }
                else if (account.Role == 2)
                {
                    InstructorManager instructorManager = new InstructorManager();
                    Instructor instructor = instructorManager.GetInstructor(account.UserId);
                    return JsonConvert.SerializeObject(instructor);
                }
                else
                {
                    return "test";
                }
            }
            return "";
            //return HttpContext.Session.GetString("account");
        }
        public string GetInfor()
        {
            if (HttpContext.Session.GetString("account") != null)
            {
                Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
                if (account.Role == 1)
                {
                    StudentManager studentManager = new StudentManager();
                    Student student = studentManager.GetStudent(account.UserId);
                    Dictionary<string, string> dic = new Dictionary<string, string>();

                    dic.Add("FirstName", student.FirstName);
                    dic.Add("MidName", student.MidName);
                    dic.Add("LastName", student.LastName);
                    dic.Add("Address", account.Address);
                    dic.Add("Email", account.Email);
                    dic.Add("Phone", account.Phone);
                    string result = JsonConvert.SerializeObject(dic);

                    return result;
                }
                else if (account.Role == 2)
                {
                    InstructorManager instructorManager = new InstructorManager();
                    Instructor instructor = instructorManager.GetInstructor(account.UserId);
                    string result = JsonConvert.SerializeObject(new { account = account, instructor = instructor });
                    return result;
                }
                else
                {
                    return "test";
                }
            }
            return "quang";
        }
    }
}

