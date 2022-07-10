using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class TermManager
    {
        PRNProjectContext context;

        public TermManager()
        {
            context = new PRNProjectContext();
        }
        public List<Term> GetTerms()
        {
            return context.Terms.ToList();
        }
        public Term GetTerm(int id)
        {
            return context.Terms.FirstOrDefault(x => x.TermId == id);
        }
        //public List<Term> GetTerms(int studentId)
        //{
        //    return context.Terms.Join(context.Courses, x => x.TermId, y => y.TermId, (x, y) => new {x, y})
        //        .Join(context.StudentCourses, xy => xy.y.CourseId, sc => sc.CourseId, (xy, sc) => new {xy, sc})
        //        .Where(m => m.sc.StudentId == studentId)
        //        .Select(m => m.xy.x)
        //        .ToList();
        //}
        public List<Term> GetTerms(int studentId)
        {
            return context.Terms.Join(context.Courses, x => x.TermId, y => y.TermId, (x, y) => new { x, y })
                .Join(context.StudentCourses, xy => xy.y.CourseId, sc => sc.CourseId, (xy, sc) => new { xy, sc })
                .Where(m => m.sc.StudentId == studentId)
                .Select(m => m.xy.x)
                .ToList();
        }
    }
}
