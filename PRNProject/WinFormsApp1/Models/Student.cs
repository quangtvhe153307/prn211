using System;
using System.Collections.Generic;

#nullable disable

namespace WinFormsApp1.Models
{
    public partial class Student
    {
        public Student()
        {
            Applications = new HashSet<Application>();
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
        public decimal? Balanced { get; set; }

        public virtual MajorCur MajorCur { get; set; }
        public virtual Account User { get; set; }
        public virtual ICollection<Application> Applications { get; set; }
        public virtual ICollection<RollCallBook> RollCallBooks { get; set; }
        public virtual ICollection<StudentCourse> StudentCourses { get; set; }
    }
}
