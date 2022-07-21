using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class ApplicationTypeManager
    {
        PRNProjectContext context;

        public ApplicationTypeManager()
        {
            context = new PRNProjectContext();
        }
        public List<ApplicationType> GetApplicationTypes()
        {
            return context.ApplicationTypes.ToList();
        }
        public ApplicationType GetApplicationType(int id)
        {
            return context.ApplicationTypes.FirstOrDefault(x => x.ApplicationId == id);
        }
    }
}
