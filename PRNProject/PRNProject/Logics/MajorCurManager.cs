using PRNProject.Models;
using System.Linq;

namespace PRNProject.Logics
{
    public class MajorCurManager
    {
        PRNProjectContext context;

        public MajorCurManager()
        {
            context = new();
        }
        public int? GetCuriculumId(int majorCurId)
        {
            return context.MajorCurs.FirstOrDefault(x => x.Id == majorCurId).CuriculumId;
        }
    }
}
