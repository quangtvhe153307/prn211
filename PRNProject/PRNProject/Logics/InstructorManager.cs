using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class InstructorManager
    {
        PRNProjectContext context;

        public InstructorManager()
        {
            context = new PRNProjectContext();
        }
        public List<Instructor> GetInstructors()
        {
            return context.Instructors.ToList();
        }
        public Instructor GetInstructor(int id)
        {
            context.Accounts.ToList();
            return context.Instructors.FirstOrDefault(x => x.UserId == id);
        }
    }
}
