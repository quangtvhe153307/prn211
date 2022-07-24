using WinFormsApp1.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class CourseScheduleManager
    {
        PRNProjectContext context;

        public CourseScheduleManager()
        {
            context = new PRNProjectContext();
        }
        public List<int> GetYears()
        {
            DateTime now = DateTime.Now;
            int start = ((DateTime)context.Terms.ToList()[0].FromDate).Year;
            List<int> years = new List<int>();
            for (int i = start; i <= now.Year; i++)
            {
                years.Add(i);
            }
            return years;
        }
        public Dictionary<int, string> GetWeeks(int year)
        {
            Dictionary<int, string> weeks = new Dictionary<int, string>();
            DateTime firstMonday = new DateTime(year, 1, 1);
            while(!(firstMonday.DayOfWeek == DayOfWeek.Monday))
            {
                firstMonday = firstMonday.AddDays(1);
            }
            DateTime lastDayOfYear = new DateTime(year, 12, 31);
            int totalDay = lastDayOfYear.DayOfYear - firstMonday.DayOfYear + 1;
            int totalWeek = (totalDay % 7 == 0) ? totalDay / 7 : (1 + totalDay / 7);
            for(int i = 1; i <= totalWeek; i++)
            {
                weeks.Add(i, firstMonday.AddDays((i - 1) * 7).ToString("dd/MM") + " to " + firstMonday.AddDays((i - 1) * 7 + 6).ToString("dd/MM"));
            }
            return weeks;
        }
        public List<DateTime> GetDateTimesOfWeek(int year, int weekNth)
        {
            DateTime firstMonday = new DateTime(year, 1, 1);
            while (!(firstMonday.DayOfWeek == DayOfWeek.Monday))
            {
                firstMonday = firstMonday.AddDays(1);
            }

            firstMonday = firstMonday.AddDays((weekNth - 1) * 7);
            List<DateTime> weeks = new List<DateTime>();
            for(int i = 0; i < 7; i++)
            {
                weeks.Add(firstMonday.AddDays(i));
            }
            return weeks;
        }
        public int GetNthWeek()
        {
            DateTime now = DateTime.Now;
            DateTime firstMonday = new DateTime(now.Year, 1, 1);
            while (!(firstMonday.DayOfWeek == DayOfWeek.Monday))
            {
                firstMonday = firstMonday.AddDays(1);
            }
            int totalDay = now.DayOfYear - firstMonday.DayOfYear + 1;
            int nthWeek = (totalDay % 7 == 0) ? totalDay / 7 : (1 + totalDay / 7);
            return nthWeek;
        }
        public List<CourseSchedule> GetCourseSchedulesToday(int id)
        {
            DateTime today = new DateTime(DateTime.Now.Year, DateTime.Now.Month, DateTime.Now.Day);
            context.Subjects.ToList();
            context.Courses.ToList();
            return context.CourseSchedules.Where(x => x.Course.InstructorId == id && ((DateTime)x.TeachingDate) == today).ToList();

            //return context.CourseSchedules.Where(x => x.CourseId == 78).ToList();

        }
    }
}
