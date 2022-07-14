using Microsoft.Extensions.Configuration;
using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class NewsManager
    {
        readonly PRNProjectContext context;
        readonly int PageSize;
        readonly int LatestNewsSize;
        readonly int OtherNewsSize;
        public NewsManager()
        {
            context = new PRNProjectContext();
            var config = new ConfigurationBuilder().AddJsonFile("appsettings.json").Build();
            LatestNewsSize = config.GetValue<int>("NewsLatestSize");
            PageSize = config.GetValue<int>("NewsPageSize");
            OtherNewsSize = config.GetValue<int>("OtherNewsSize");
        }
        public List<News> GetNews()
        {
            return context.News.ToList();
        }
        public News GetNews(int id)
        {
            context.Accounts.ToList();
            return context.News.FirstOrDefault(x => x.NewsId == id);
        }
        public List<News> GetLatestNews()
        {
            return context.News.OrderByDescending(x => x.NewsId).Take(LatestNewsSize).ToList();
        }
        public List<News> GetOtherNews()
        {
            return context.News.OrderByDescending(x => x.NewsId).Take(OtherNewsSize).ToList();
        }
        public List<News> GetNewsByPage(int pageNumber)
        {
            return context.News.Skip((pageNumber - 1) * PageSize).Take(PageSize).ToList();
        }
        public int CountPageNumber()
        {
            if (context.News.Count() % PageSize == 0)
            {
                return context.News.Count() / PageSize;
            }
            else
            {
                return 1 + (context.News.Count() / PageSize);
            }
        }
    }
}
