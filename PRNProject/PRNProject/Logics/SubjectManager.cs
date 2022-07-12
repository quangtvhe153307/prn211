using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class SubjectManager
    {
        PRNProjectContext context;

        public SubjectManager()
        {
            context = new PRNProjectContext();
        }
        public List<Subject> GetSubjects()
        {
            return context.Subjects.ToList();
        }
        public Subject GetSubject(int id)
        {
            return context.Subjects.FirstOrDefault(x => x.SubjectId == id);
        }
        public List<Subject> GetSubjects(int termId, int userId)
        {
            return context.Subjects.Join(context.Courses, x => x.SubjectId, y => y.SubjectId, (x, y) => new { x, y })
                .Join(context.StudentCourses, xy => xy.y.CourseId, x => x.CourseId, (xy, x) => new { xy, x })
                .Join(context.Students, xyx => xyx.x.StudentId, x => x.StudentId, (xyx, x) => new { xyx, x })
                .Where(m => m.x.UserId == userId && m.xyx.xy.y.TermId == termId)
                .Select(m => m.xyx.xy.x)
                .ToList();
        }
    }
}
