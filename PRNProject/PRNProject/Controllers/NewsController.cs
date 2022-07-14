using Microsoft.AspNetCore.Mvc;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    public class NewsController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List(int id=1)
        {   
            NewsManager newsManager = new();
            List<News> news = newsManager.GetNewsByPage(id);

            ViewBag.PageNumber = id;
            ViewBag.TotalPage = newsManager.CountPageNumber();
            return View(news);
        }
        public IActionResult Details(int id)
        {
            NewsManager newsManager = new();
            News news= newsManager.GetNews(id);

            List<News> otherNews = newsManager.GetOtherNews();
            ViewBag.OtherNews = otherNews;
            return View(news);
        }
    }
}
