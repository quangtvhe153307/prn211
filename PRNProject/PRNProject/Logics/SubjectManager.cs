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
    }
}
