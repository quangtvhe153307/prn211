using System;
using System.Collections.Generic;

#nullable disable

namespace PRNProject.Models
{
    public partial class MajorCur
    {
        public MajorCur()
        {
            Students = new HashSet<Student>();
        }

        public int Id { get; set; }
        public int? MajorId { get; set; }
        public int? CuriculumId { get; set; }

        public virtual Curiculum Curiculum { get; set; }
        public virtual Major Major { get; set; }
        public virtual ICollection<Student> Students { get; set; }
    }
}
