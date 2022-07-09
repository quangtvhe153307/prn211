using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class CourseManager
    {
        PRNProjectContext context;

        public CourseManager()
        {
            context = new PRNProjectContext();
        }
        public List<Course> GetCourses()
        {
            return context.Courses.ToList();
        }
        public Course GetCourse(int id)
        {
            return context.Courses.FirstOrDefault(x => x.CourseId == id);
        }
    }
}
