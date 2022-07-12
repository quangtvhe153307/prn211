using System;

#nullable disable

namespace PRNProject.Models
{
    public partial class News
    {
        public int NewsId { get; set; }
        public int? UserId { get; set; }
        public DateTime? CreatedDate { get; set; }
        public string Title { get; set; }
        public string Context { get; set; }

        public virtual Account User { get; set; }
    }
}
