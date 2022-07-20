using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class Application
    {
        public int ApplicationId { get; set; }
        public string ApplicationName { get; set; }
        public decimal? Cost { get; set; }
    }
}
