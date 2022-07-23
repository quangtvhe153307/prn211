using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Policy;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using Newtonsoft.Json;
using PRNProject.Models;
using System;
using System.Reflection;
using System.Threading.Tasks;

namespace PRNProject.Filter
{
    public class Authorize : Attribute, IAuthorizationFilter
    {

        public Authorize()
        {

        }


        public void OnAuthorization(AuthorizationFilterContext context)
        {
            string session = context.HttpContext.Session.GetString("account");
            if (session is null)
            {
                context.Result = new RedirectToRouteResult
                (
                new RouteValueDictionary(new
                {
                    action = "Error",
                    controller = "Error"
                }));
            }
            else
            {
                Account account = JsonConvert.DeserializeObject<Account>(session);
                if (account.Role != 1)
                {
                    context.Result = new RedirectToRouteResult
                 (
                 new RouteValueDictionary(new
                 {
                     action = "Error",
                     controller = "Error"
                 }));
                }
            }
        }

    }
}
