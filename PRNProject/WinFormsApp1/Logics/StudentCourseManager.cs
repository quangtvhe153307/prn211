using WinFormsApp1.Models;
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
        public List<StudentCourse> GetStudentCourses(int courseID)
        {
            context.Subjects.ToList();
            context.Courses.ToList();
            context.Students.ToList();
            return context.StudentCourses.Where(x => x.CourseId == courseID).ToList();
        }
        public StudentCourse GetStudentCourse(int subjectId, int studentId)
        {
            context.Terms.ToList();
            context.Courses.ToList();
            return context.StudentCourses.FirstOrDefault(x => x.Course.SubjectId == subjectId && x.StudentId == studentId);
        }
        public void Update(List<StudentCourse> studentCourses)
        {
            context.StudentCourses.UpdateRange(studentCourses);
            context.SaveChanges();
        }
    }
}
