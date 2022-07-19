using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class Major
    {
        public Major()
        {
            MajorCurs = new HashSet<MajorCur>();
        }

        public int MajorId { get; set; }
        public string MajorName { get; set; }

        public virtual ICollection<MajorCur> MajorCurs { get; set; }
    }
}
