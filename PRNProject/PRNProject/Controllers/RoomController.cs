using Microsoft.AspNetCore.Mvc;
using PRNProject.Filter;
using PRNProject.Logics;
using PRNProject.Models;
using System.Collections.Generic;

namespace PRNProject.Controllers
{
    [TypeFilter(typeof(Authorize))]
    public class RoomController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult List()
        {
            RoomManager roomManager = new();
            List<Room> rooms = roomManager.GetRooms();
            return View(rooms);
        }
    }
}
