using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;

namespace PRNProject
{
    public class Startup
    {
        // This method gets called by the runtime. Use this method to add services to the container.
        // For more information on how to configure your application, visit https://go.microsoft.com/fwlink/?LinkID=398940
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews();
            services.AddSession();
            //services.AddScoped<Authorize>(container =>
            //{
            //    return new Authorize();
            //});
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseRouting();
            app.UseSession();
            app.UseStaticFiles();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "/{controller=authentication}/{action=index}"
                    );
                endpoints.MapControllerRoute(
                    name: "d1",
                    pattern: "/{controller=news}/{action=list}/{id?}"
                    );
                endpoints.MapControllerRoute(
                    name: "d2",
                    pattern: "/{controller=news}/{action=list}/{id?}/{balance?}"
                    );
                endpoints.MapControllerRoute(
                    name: "d3",
                    pattern: "/{controller=Application}/{action=DoSendApplication}/{appType?}/{purpose?}/{postedFiles?}"
                    );
            });
        }
    }
}
