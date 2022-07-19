using PRNProject.Models;
using System.Linq;

namespace PRNProject.Logics
{
    public class CuriculumManager
    {
        PRNProjectContext context;

        public CuriculumManager()
        {
            context = new PRNProjectContext();
        }
        public Curiculum GetCuriculum(int id)
        {
            context.Subjects.ToList();
            context.CuriculumSubjects.ToList();
            return context.Curiculums.FirstOrDefault(x => x.CuriculumId == id);
        }
    }
}
