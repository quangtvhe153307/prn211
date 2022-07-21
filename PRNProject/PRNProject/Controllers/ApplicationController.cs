using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;
using System;
using System.Collections.Generic;
using System.IO;

namespace PRNProject.Controllers
{
    public class ApplicationController : Controller
    {
        private IWebHostEnvironment Environment;
        public ApplicationController(IWebHostEnvironment _environment)
        {
            Environment = _environment;
        }

        public IActionResult Index()
        {
            return View();
        }
        public IActionResult ViewApplication(int id)
        {
            //if (HttpContext.Session.GetString("account") is null)
            //{
            //    return RedirectPermanent("/Authentication/Login");
            //}
            //else
            //{
            Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new StudentManager();
            Student student = studentManager.GetStudent(account.UserId);
            ApplicationManager applicationManager = new ApplicationManager();
            List<Application> applications = applicationManager.GetApplicationsByPage(id, student.StudentId);

            NewsManager newsManager = new NewsManager();
            List<News> newList = newsManager.GetLatestNews();
            ViewBag.News = newList;

            ViewBag.PageNumber = id;
            ViewBag.TotalPage = applicationManager.GetTotalPageApplication(student.StudentId);
            return View(applications);
            //}
        }
        public IActionResult SendApplication(string id)
        {
            ApplicationTypeManager applicationTypeManager = new();
            List<ApplicationType> applications = applicationTypeManager.GetApplicationTypes();

            Account a = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new StudentManager();
            Student student = studentManager.GetStudent(a.UserId);
            ViewBag.Student = student;

            NewsManager newsManager = new NewsManager();
            List<News> newList = newsManager.GetLatestNews();
            ViewBag.News = newList;

            ViewBag.Message = id;
            return View(applications);
        }

        [HttpPost]
        public IActionResult DoSendApplication(int appType, string purpose, IFormFile postedFile)
        {
            string wwwPath = this.Environment.WebRootPath;

            string path = Path.Combine(wwwPath, "uploads");

            Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new StudentManager();
            Student student = studentManager.GetStudent(account.UserId);

            ApplicationTypeManager applicationTypeManager = new();
            ApplicationType applicationType = applicationTypeManager.GetApplicationType(appType);

            if (student.Balanced < applicationType.Cost)
            {
                return RedirectToAction("SendApplication", new { id = "Your balance is not enough" });
            }
            else
            {
                student.Balanced = student.Balanced - applicationType.Cost;
                studentManager.UpdateStudent(student);

                Random random = new Random();
                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }

                string[] array = postedFile.FileName.Split(".");
                string newFileName = student.Roll + "_" + random.Next(1000) + "." + array[1];
                string filePath = Path.Combine(path, newFileName);

                while (System.IO.File.Exists(filePath))
                {
                    newFileName = student.Roll + "_" + random.Next(1000) + "." + array[1];
                    filePath = Path.Combine(path, newFileName);
                }


                using (FileStream fileStream = new FileStream(filePath, FileMode.Create))
                {
                    postedFile.CopyTo(fileStream);
                }

                ApplicationManager applicationManage = new ApplicationManager();
                Application application = new();
                application.StudentId = student.StudentId;
                application.Type = appType;
                application.SentDate = DateTime.Now;
                application.FilePath = @"uploads/" + newFileName;
                application.Status = 1;

                applicationManage.AddApplication(application);
                return RedirectToAction("SendApplication", new { id = "Successfully" });
            }
        }
    }
}
