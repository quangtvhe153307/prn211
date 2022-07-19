using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class Curiculum
    {
        public Curiculum()
        {
            CuriculumSubjects = new HashSet<CuriculumSubject>();
            MajorCurs = new HashSet<MajorCur>();
        }

        public int CuriculumId { get; set; }
        public string CuriculumName { get; set; }

        public virtual ICollection<CuriculumSubject> CuriculumSubjects { get; set; }
        public virtual ICollection<MajorCur> MajorCurs { get; set; }
    }
}
