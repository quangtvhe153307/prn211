using System;
using System.Collections.Generic;

#nullable disable

namespace WinFormsApp1.Models
{
    public partial class Application
    {
        public int ApplicationId { get; set; }
        public int StudentId { get; set; }
        public int Type { get; set; }
        public DateTime? SentDate { get; set; }
        public string FilePath { get; set; }
        public int? Status { get; set; }

        public virtual ApplicationStatus StatusNavigation { get; set; }
        public virtual Student Student { get; set; }
        public virtual ApplicationType TypeNavigation { get; set; }
    }
}
