using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class ApplicationStatus
    {
        public ApplicationStatus()
        {
            Applications = new HashSet<Application>();
        }

        public int Status { get; set; }
        public string StatusName { get; set; }

        public virtual ICollection<Application> Applications { get; set; }
    }
}
