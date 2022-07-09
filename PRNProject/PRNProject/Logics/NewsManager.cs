using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class NewsManager
    {
        PRNProjectContext context;

        public NewsManager()
        {
            context = new PRNProjectContext();
        }
        public List<News> GetNews()
        {
            return context.News.ToList();
        }
        public News GetNews(int id)
        {
            return context.News.FirstOrDefault(x => x.NewsId == id);
        }
        public List<News> GetLatestNews()
        {
            return context.News.OrderByDescending(x => x.NewsId).Take(10).ToList();
        }
    }
}
