using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class Subject
    {
        public Subject()
        {
            Courses = new HashSet<Course>();
            CuriculumSubjects = new HashSet<CuriculumSubject>();
        }

        public int SubjectId { get; set; }
        public string SubjectCode { get; set; }
        public string SubjectName { get; set; }
        public int? DepartmentId { get; set; }

        public virtual Department Department { get; set; }
        public virtual ICollection<Course> Courses { get; set; }
        public virtual ICollection<CuriculumSubject> CuriculumSubjects { get; set; }
    }
}
