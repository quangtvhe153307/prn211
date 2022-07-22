using System;
using System.Collections.Generic;

#nullable disable

namespace WinFormsApp1.Models
{
    public partial class ApplicationType
    {
        public ApplicationType()
        {
            Applications = new HashSet<Application>();
        }

        public int ApplicationId { get; set; }
        public string ApplicationName { get; set; }
        public decimal? Cost { get; set; }

        public virtual ICollection<Application> Applications { get; set; }
    }
}
