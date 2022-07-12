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
        public List<StudentCourse> GetStudentCourses(int termId, int userId)
        {
            context.Subjects.ToList();
            context.Courses.ToList();
            context.Students.ToList();
            List<StudentCourse> list = context.StudentCourses.Where(x => x.Course.TermId == termId).ToList();
            list = list.Where(x => x.Student.UserId == userId).ToList();
            return list;
        }
    }
}
