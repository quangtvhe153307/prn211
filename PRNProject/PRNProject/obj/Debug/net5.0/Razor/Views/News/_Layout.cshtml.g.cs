#pragma checksum "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\News\_Layout.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "e7b196c737b7ca6ca666eda224ccca150e014972"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_News__Layout), @"mvc.1.0.view", @"/Views/News/_Layout.cshtml")]
namespace AspNetCore
{
    #line hidden
    using System;
    using System.Collections.Generic;
    using System.Linq;
    using System.Threading.Tasks;
    using Microsoft.AspNetCore.Mvc;
    using Microsoft.AspNetCore.Mvc.Rendering;
    using Microsoft.AspNetCore.Mvc.ViewFeatures;
#nullable restore
#line 1 "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\News\_Layout.cshtml"
using PRNProject.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"e7b196c737b7ca6ca666eda224ccca150e014972", @"/Views/News/_Layout.cshtml")]
    #nullable restore
    public class Views_News__Layout : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/StyleLayout.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_2 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("src", new global::Microsoft.AspNetCore.Html.HtmlString("~/js/Layout.js"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        #line hidden
        #pragma warning disable 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperExecutionContext __tagHelperExecutionContext;
        #pragma warning restore 0649
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner __tagHelperRunner = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperRunner();
        #pragma warning disable 0169
        private string __tagHelperStringValueBuffer;
        #pragma warning restore 0169
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __backed__tagHelperScopeManager = null;
        private global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager __tagHelperScopeManager
        {
            get
            {
                if (__backed__tagHelperScopeManager == null)
                {
                    __backed__tagHelperScopeManager = new global::Microsoft.AspNetCore.Razor.Runtime.TagHelpers.TagHelperScopeManager(StartTagHelperWritingScope, EndTagHelperWritingScope);
                }
                return __backed__tagHelperScopeManager;
            }
        }
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            WriteLiteral("<!DOCTYPE html>\r\n<html>\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("head", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "e7b196c737b7ca6ca666eda224ccca150e0149724185", async() => {
                WriteLiteral("\r\n    <meta charset=\"utf-8\" />\r\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>");
#nullable restore
#line 7 "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\News\_Layout.cshtml"
      Write(ViewBag.Title);

#line default
#line hidden
#nullable disable
                WriteLiteral("</title>\r\n     <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor\" crossorigin=\"anonymous\">\r\n     ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagOnly, "e7b196c737b7ca6ca666eda224ccca150e0149725054", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_0);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_1);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n     <script src=\"https://kit.fontawesome.com/3c84cb624f.js\" crossorigin=\"anonymous\"></script>\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.HeadTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_HeadTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n");
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("body", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "e7b196c737b7ca6ca666eda224ccca150e0149727039", async() => {
                WriteLiteral(@"
    <nav class=""navbar navbar-expand-lg"">
  <div class=""container-fluid"">
    <a class=""navbar-brand"" href=""/home/home"">SMS</a>
    <button class=""navbar-toggler"" type=""button"" data-bs-toggle=""collapse"" data-bs-target=""#navbarScroll"" aria-controls=""navbarScroll"" aria-expanded=""false"" aria-label=""Toggle navigation"">
      <span class=""navbar-toggler-icon""></span>
    </button>
    <div class=""collapse navbar-collapse"" id=""navbarScroll"">
      <ul class=""navbar-nav me-auto my-2 my-lg-0 navbar-nav-scroll"" style=""--bs-scroll-height: 100px;"">
        <li class=""nav-item"">
          <a class=""nav-link active"" aria-current=""page"" href=""#"">Home</a>
        </li>
        <li class=""nav-item"">
          <a class=""nav-link"" href=""#"">Link</a>
        </li>
        <li class=""nav-item dropdown"">
          <a class=""nav-link dropdown-toggle"" href=""#"" id=""navbarScrollingDropdown"" role=""button"" data-bs-toggle=""dropdown"" aria-expanded=""false"">
            Link
          </a>
          <ul class=""dropdown-m");
                WriteLiteral(@"enu"" aria-labelledby=""navbarScrollingDropdown"">
            <li><a class=""dropdown-item"" href=""#"">Action</a></li>
            <li><a class=""dropdown-item"" href=""#"">Another action</a></li>
            <li><hr class=""dropdown-divider""></li>
            <li><a class=""dropdown-item"" href=""#"">Something else here</a></li>
          </ul>
        </li>
      </ul>
    </div>
<div class=""btn-group account-container"">
  <div type=""button"" class=""btn dropdown-toggle account-wrapper"" data-bs-toggle=""dropdown"" data-bs-display=""static"" aria-expanded=""false"">
    <img src=""https://steamuserimages-a.akamaihd.net/ugc/1479948835346597290/21C17714FAB9334768A882F9884AFA81ABEB0809/?imw=512&&ima=fit&impolicy=Letterbox&imcolor=%23000000&letterbox=false"" class=""img-thumbnail""/>
    <span id=""acc-name""></span>
  </div>
  <ul class=""dropdown-menu dropdown-menu-lg-end"">
    <li><a class=""dropdown-item"" href=""#"">Profile</a></li>
    <li><a class=""dropdown-item"" href=""#"">Mark Report</a></li>
    <li><hr class=""dropdown-");
                WriteLiteral("divider\"></li>\r\n    <li><a class=\"dropdown-item\" href=\"/authentication/logout\">Logout</a></li>\r\n  </ul>\r\n</div>\r\n  </div>\r\n</nav>\r\n    <div class=\"container body-content\">\r\n        <div class=\"row container-sm body-content\"> \r\n        ");
#nullable restore
#line 56 "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\News\_Layout.cshtml"
   Write(RenderBody());

#line default
#line hidden
#nullable disable
                WriteLiteral(@"
    </div>
</div>
        <hr />
        <footer>
            <div class=""container"">
                <div class=""row"">
                    <div class=""col-md-6"">
                        <h3 class=""footer-title"">About us</h3>
                        Death is like the wind, always by my side!
                        <ul class=""footer-links"">
                            <li><a");
                BeginWriteAttribute("href", " href=\"", 3278, "\"", 3285, 0);
                EndWriteAttribute();
                WriteLiteral("><i class=\"fa-solid fa-location-dot\"></i>Khu Công nghệ cao Hòa Lạc, Km29, Đại lộ Thăng Long, H. Thạch Thất, Tp. Hà Nội</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 3449, "\"", 3456, 0);
                EndWriteAttribute();
                WriteLiteral("><i class=\"fa-solid fa-phone\"></i>+84395073662</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 3548, "\"", 3555, 0);
                EndWriteAttribute();
                WriteLiteral(@"><i class=""fa-solid fa-envelope""></i>quangtvhe153307@fpt.edu.vn</a></li>
                        </ul>
                    </div>
                    <div class=""col-md-3"">
                        <h3 class=""footer-title"">Information</h3>
                        <ul class=""footer-links"">
                            <li><a");
                BeginWriteAttribute("href", " href=\"", 3885, "\"", 3892, 0);
                EndWriteAttribute();
                WriteLiteral(">About us</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 3947, "\"", 3954, 0);
                EndWriteAttribute();
                WriteLiteral(">Contact us<a/></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4011, "\"", 4018, 0);
                EndWriteAttribute();
                WriteLiteral(">Privacy Prolicy</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4080, "\"", 4087, 0);
                EndWriteAttribute();
                WriteLiteral(">Orders and Returns</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4152, "\"", 4159, 0);
                EndWriteAttribute();
                WriteLiteral(@">Terms & Condition</a></li>
                        </ul>
                    </div>
                    <div class=""col-md-3"">
                        <h3 class=""footer-title"">Service</h3>
                        <ul class=""footer-links"">
                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4440, "\"", 4447, 0);
                EndWriteAttribute();
                WriteLiteral(">My Account</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4504, "\"", 4511, 0);
                EndWriteAttribute();
                WriteLiteral(">Contact us<a/></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4568, "\"", 4575, 0);
                EndWriteAttribute();
                WriteLiteral(">View Cart</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4631, "\"", 4638, 0);
                EndWriteAttribute();
                WriteLiteral(">Track My Order</a></li>\r\n                            <li><a");
                BeginWriteAttribute("href", " href=\"", 4699, "\"", 4706, 0);
                EndWriteAttribute();
                WriteLiteral(@">Help</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </footer>
    </div>
    <script src=""https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"" integrity=""sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"" crossorigin=""anonymous""></script>
    <script src=""https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js""></script>
    ");
                __tagHelperExecutionContext = __tagHelperScopeManager.Begin("script", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.StartTagAndEndTag, "e7b196c737b7ca6ca666eda224ccca150e01497214229", async() => {
                }
                );
                __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper>();
                __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper);
                __tagHelperExecutionContext.AddHtmlAttribute(__tagHelperAttribute_2);
                await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
                if (!__tagHelperExecutionContext.Output.IsContentModified)
                {
                    await __tagHelperExecutionContext.SetOutputContentAsync();
                }
                Write(__tagHelperExecutionContext.Output);
                __tagHelperExecutionContext = __tagHelperScopeManager.End();
                WriteLiteral("\r\n");
            }
            );
            __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper = CreateTagHelper<global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.BodyTagHelper>();
            __tagHelperExecutionContext.Add(__Microsoft_AspNetCore_Mvc_Razor_TagHelpers_BodyTagHelper);
            await __tagHelperRunner.RunAsync(__tagHelperExecutionContext);
            if (!__tagHelperExecutionContext.Output.IsContentModified)
            {
                await __tagHelperExecutionContext.SetOutputContentAsync();
            }
            Write(__tagHelperExecutionContext.Output);
            __tagHelperExecutionContext = __tagHelperScopeManager.End();
            WriteLiteral("\r\n</html>");
        }
        #pragma warning restore 1998
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.ViewFeatures.IModelExpressionProvider ModelExpressionProvider { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IUrlHelper Url { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.IViewComponentHelper Component { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IJsonHelper Json { get; private set; } = default!;
        #nullable disable
        #nullable restore
        [global::Microsoft.AspNetCore.Mvc.Razor.Internal.RazorInjectAttribute]
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<dynamic> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
