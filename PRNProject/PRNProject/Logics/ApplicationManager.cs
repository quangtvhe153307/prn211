using Microsoft.Extensions.Configuration;
using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class ApplicationManager
    {
        PRNProjectContext context;
        int pageSize;
        public ApplicationManager()
        {
            context = new PRNProjectContext();
            var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
            pageSize = config.GetValue<int>("ApplicationPageSize");
        }
        public void AddApplication(Application a)
        {
            context.Applications.Add(a);
            context.SaveChanges();
        }
        public int GetTotalPageApplication(int studentId)
        {
            int count =  context.Applications.Where(x => x.StudentId == studentId).Count();
            if(count % pageSize == 0)
            {
                return count / pageSize;
            } else
            {
                return 1 + count / pageSize;
            }
        }
        public List<Application> GetApplicationsByPage(int page, int studentId)
        {
            context.ApplicationStatuses.ToList();
            context.ApplicationTypes.ToList();
            return context.Applications
                .Where(x => x.StudentId == studentId)
                .Skip((page-1)*pageSize)
                .Take(pageSize)
                .ToList();
        }
    }
}
