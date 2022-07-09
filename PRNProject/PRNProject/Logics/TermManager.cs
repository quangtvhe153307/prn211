using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class TermManager
    {
        PRNProjectContext context;

        public TermManager()
        {
            context = new PRNProjectContext();
        }
        public List<Term> GetTerms()
        {
            return context.Terms.ToList();
        }
        public Term GetTerm(int id)
        {
            return context.Terms.FirstOrDefault(x => x.TermId == id);
        }
    }
}
