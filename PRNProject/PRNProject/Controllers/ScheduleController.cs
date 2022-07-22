using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PRNProject.Logics;
using PRNProject.Models;
using System;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class ScheduleController : Controller
    {
        public IActionResult Index(int year = 0, int week = 0)
        {

            //GetAccount
            Account account = JsonConvert.DeserializeObject<Account>(HttpContext.Session.GetString("account"));
            StudentManager studentManager = new StudentManager();
            Student student = studentManager.GetStudent(account.UserId);
            CourseScheduleManager courseScheduleManager = new CourseScheduleManager();
            //getYearList
            List<int> years = courseScheduleManager.GetYears();
            ViewBag.Years = years;
            Dictionary<int, string> data;
            List<DateTime> datesInWeek;
            if (year == 0)
            {
                //getTime
                DateTime now = DateTime.Now;
                year = now.Year;
                week = courseScheduleManager.GetNthWeek();
                //getweek
                data = courseScheduleManager.GetWeeks(year);


                //GetDateInWeek
                datesInWeek = courseScheduleManager.GetDateTimesOfWeek(year, week);

            } else
            {
                data = courseScheduleManager.GetWeeks(year);
                datesInWeek = courseScheduleManager.GetDateTimesOfWeek(year, week);
            }
            ViewBag.DatesInWeek = datesInWeek;

            //get Schedule
            RollCallBookManager rollCallBookManager = new RollCallBookManager();

            Dictionary<int, List<RollCallBook>> schedule = new Dictionary<int, List<RollCallBook>>();
            for (int i = 1; i <= 8; i++)
            {
                List<RollCallBook> rollCallBooks = rollCallBookManager.GetRollCallBooks(datesInWeek, student.StudentId, i);
                schedule.Add(i, rollCallBooks);
            }
            ViewBag.Weeks = data;


            ViewBag.NthWeek = week;
            ViewBag.Year = year;
            return View(schedule);
        }
    }
}
