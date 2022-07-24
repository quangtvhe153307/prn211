using WinFormsApp1.Models;
using System;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class RollCallBookManager
    {
        PRNProjectContext context;

        public RollCallBookManager()
        {
            context = new PRNProjectContext();
        }
        public List<RollCallBook> GetRollCallBooks(int id)
        {
            context.Students.ToList();
            return context.RollCallBooks
                .Where(x => x.TeachingScheduleId == id)
                .ToList();
         
        }
        public void Update(List<RollCallBook> rollCallBooks)
        {
            context.RollCallBooks.UpdateRange(rollCallBooks);
            context.SaveChanges();
        }
    }
}
