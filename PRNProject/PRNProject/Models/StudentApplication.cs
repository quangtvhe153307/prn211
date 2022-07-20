using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class StudentApplication
    {
        public int StudentId { get; set; }
        public int ApplicationId { get; set; }
        public DateTime? SentDate { get; set; }
        public string FilePath { get; set; }
        public int? Status { get; set; }

        public virtual Application Application { get; set; }
        public virtual ApplicationStatus StatusNavigation { get; set; }
        public virtual Student Student { get; set; }
    }
}
