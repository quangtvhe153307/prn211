using PRNProject.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class RollCallBookManager
    {
        PRNProjectContext context;

        public RollCallBookManager()
        {
            context = new PRNProjectContext();
        }
        public List<RollCallBook> GetRollCallBooks(List<DateTime> dateTimes, int studentId, int slot)
        {
            List<RollCallBook> rollCallBooks = new List<RollCallBook>();
            foreach (DateTime date in dateTimes)
            {
                context.Subjects.ToList();
                context.Courses.ToList();
                context.CourseSchedules.ToList();
                context.Rooms.ToList();
                //RollCallBook item = context.RollCallBooks.FirstOrDefault(x => x.RollCallBookId == 1500);
                RollCallBook item = context.RollCallBooks.FirstOrDefault(x => x.StudentId == studentId && x.TeachingSchedule.Slot == slot && x.TeachingSchedule.TeachingDate == date);
                rollCallBooks.Add(item);
            }
            return rollCallBooks;
        }
        
    }
}
