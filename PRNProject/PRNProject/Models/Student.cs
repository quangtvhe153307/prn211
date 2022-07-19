using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class Student
    {
        public Student()
        {
            RollCallBooks = new HashSet<RollCallBook>();
            StudentCourses = new HashSet<StudentCourse>();
        }

        public int StudentId { get; set; }
        public string Roll { get; set; }
        public string FirstName { get; set; }
        public string MidName { get; set; }
        public string LastName { get; set; }
        public int? UserId { get; set; }
        public int? MajorCurId { get; set; }

        public virtual MajorCur MajorCur { get; set; }
        public virtual Account User { get; set; }
        public virtual ICollection<RollCallBook> RollCallBooks { get; set; }
        public virtual ICollection<StudentCourse> StudentCourses { get; set; }
    }
}
