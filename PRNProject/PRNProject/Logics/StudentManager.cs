using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class StudentManager
    {
        PRNProjectContext context;

        public StudentManager()
        {
            context = new PRNProjectContext();
        }
        public List<Student> GetStudents()
        {
            return context.Students.ToList();
        }
        public Student GetStudent(int id)
        {
            context.Accounts.ToList();
            return context.Students.FirstOrDefault(x => x.UserId == id);
        }

    }
}
