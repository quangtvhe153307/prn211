using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

namespace PRNProject.Filter
{
    public class Authorize : IAuthorizationFilter
    {
        public Authorize()
        {
        }

        public void OnAuthorization(AuthorizationFilterContext context)
        {
            string session = context.HttpContext.Session.GetString("account");
            if (session is null)
            {
                context.Result = new StatusCodeResult(StatusCodes.Status403Forbidden);
                return;
            }
        }
    }
}
