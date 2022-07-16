using PRNProject.Models;
using System.Collections.Generic;
using System.Linq;

namespace PRNProject.Logics
{
    public class RoomManager
    {
        PRNProjectContext context;

        public RoomManager()
        {
            context = new PRNProjectContext();
        }
        public List<Room> GetRooms()
        {
            return context.Rooms.ToList();
        }
    }
}
