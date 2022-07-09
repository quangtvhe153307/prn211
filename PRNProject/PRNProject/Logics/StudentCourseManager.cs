using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class StudentCourseManager
    {
        PRNProjectContext context;

        public StudentCourseManager()
        {
            context = new PRNProjectContext();
        }
        public List<StudentCourse> GetStudentCourses()
        {
            return context.StudentCourses.ToList();
        }
    }
}
