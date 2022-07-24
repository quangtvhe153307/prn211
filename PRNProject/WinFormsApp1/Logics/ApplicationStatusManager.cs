using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsApp1.Models;

namespace WinFormsApp1.Logics
{
    internal class ApplicationStatusManager
    {
        PRNProjectContext context;

        public ApplicationStatusManager()
        {
            context = new PRNProjectContext();
        }
        public List<ApplicationStatus> GetApplicationStatuses()
        {
            return context.ApplicationStatuses.ToList();
        }
    }
}
