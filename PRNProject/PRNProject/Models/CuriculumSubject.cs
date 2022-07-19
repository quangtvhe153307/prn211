using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class CuriculumSubject
    {
        public int CuriculumId { get; set; }
        public int SubjectId { get; set; }
        public int? TermNo { get; set; }

        public virtual Curiculum Curiculum { get; set; }
        public virtual Subject Subject { get; set; }
    }
}
