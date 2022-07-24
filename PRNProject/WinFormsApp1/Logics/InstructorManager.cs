using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WinFormsApp1.Models;

namespace WinFormsApp1.Logics
{
    internal class InstructorManager
    {
        PRNProjectContext context;

        public InstructorManager()
        {
            context = new PRNProjectContext();
        }
        public List<Instructor> GetInstructors()
        {
            return context.Instructors.ToList();
        }
        public Instructor GetInstructor(int id)
        {
            context.Accounts.ToList();
            return context.Instructors.FirstOrDefault(x => x.UserId == id);
        }
        public void UpdateInstructor(Instructor ins)
        {
            context.Instructors.Update(ins);
            context.SaveChanges();
        }
    }
}
