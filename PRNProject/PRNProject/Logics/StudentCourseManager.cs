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
        public List<StudentCourse> GetStudentCourses(int termId, int studentId)
        {
            return context.Terms.Join(context.Courses, x => x.TermId, y => y.TermId, (x,y) => new {x, y})
                .Join(context.StudentCourses, xy => xy.y.CourseId, x => x.CourseId, (xy, x) => new {xy, x})
                .Where(m => m.x.StudentId == studentId && m.xy.x.TermId == termId)
                .Select(m => m.x)
                .ToList();
        }
    }
}
