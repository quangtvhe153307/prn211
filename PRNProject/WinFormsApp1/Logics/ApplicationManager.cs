using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsApp1.Models;

namespace WinFormsApp1.Logics
{
    internal class ApplicationManager
    {
        PRNProjectContext context;
        int pageSize = 10;
        public ApplicationManager()
        {
            context = new PRNProjectContext();
        }
        public List<Application> GetApplications()
        {
            return context.Applications.OrderByDescending(x => x.ApplicationId)
                .ToList();
        }
        public int TotalPage()
        {
            if(context.Applications.Count() % pageSize == 0)
            {
                return context.Applications.Count() / pageSize;
            } else
            {
                return 1 + context.Applications.Count() / pageSize;
            }
        }
        public void Update(Application application)
        {
            context.Applications.Update(application);
            context.SaveChanges();
        }
    }
}
