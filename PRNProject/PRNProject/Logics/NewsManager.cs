using Microsoft.Extensions.Configuration;
using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class NewsManager
    {
        PRNProjectContext context;
        int PageSize;
        int LatestNewsSize;
        public NewsManager()
        {
            context = new PRNProjectContext();
            var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
            LatestNewsSize = config.GetValue<int>("NewsLatestSize");
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
            return context.News.OrderByDescending(x => x.NewsId).Take(LatestNewsSize).ToList();
        }
    }
}
