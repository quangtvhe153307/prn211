#pragma checksum "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "3fc02c2f208d40d0e38b327040d76e4ca2e9a7f3"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_News_List), @"mvc.1.0.view", @"/Views/News/List.cshtml")]
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
#line 1 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
using PRNProject.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"3fc02c2f208d40d0e38b327040d76e4ca2e9a7f3", @"/Views/News/List.cshtml")]
    #nullable restore
    public class Views_News_List : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<List<News>>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/StyleNewsList.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_1 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("rel", new global::Microsoft.AspNetCore.Html.HtmlString("stylesheet"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
        private global::Microsoft.AspNetCore.Mvc.Razor.TagHelpers.UrlResolutionTagHelper __Microsoft_AspNetCore_Mvc_Razor_TagHelpers_UrlResolutionTagHelper;
        #pragma warning disable 1998
        public async override global::System.Threading.Tasks.Task ExecuteAsync()
        {
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "3fc02c2f208d40d0e38b327040d76e4ca2e9a7f33478", async() => {
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
            WriteLiteral(@"
<nav style=""--bs-breadcrumb-divider: '>';"" aria-label=""breadcrumb"">
  <ol class=""breadcrumb"">
    <li class=""breadcrumb-item""><a href=""/"">Home</a></li>
    <li class=""breadcrumb-item active"" aria-current=""page"">News List</li>
  </ol>
</nav>
<div>
    <h1>News</h1>
    <div class=""news-container"">
        <ul>
");
#nullable restore
#line 14 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
             foreach (News news in Model)
           {

#line default
#line hidden
#nullable disable
            WriteLiteral("               <li><span>");
#nullable restore
#line 16 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                    Write(news.CreatedDate);

#line default
#line hidden
#nullable disable
            WriteLiteral("</span><a");
            BeginWriteAttribute("href", " href=\"", 531, "\"", 564, 2);
            WriteAttributeValue("", 538, "/News/Details/", 538, 14, true);
#nullable restore
#line 16 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 552, news.NewsId, 552, 12, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 16 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                 Write(news.Title);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 17 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
           }

#line default
#line hidden
#nullable disable
            WriteLiteral("        </ul>\r\n    </div>\r\n    <nav aria-label=\"Page navigation example\">\r\n  <ul class=\"pagination justify-content-center\">\r\n    <li");
            BeginWriteAttribute("class", " class=\"", 734, "\"", 792, 2);
            WriteAttributeValue("", 742, "page-item", 742, 9, true);
#nullable restore
#line 22 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue(" ", 751, ViewBag.PageNumber == 1?"disabled":"", 752, 40, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n      <a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 822, "\"", 865, 2);
            WriteAttributeValue("", 829, "/News/List/", 829, 11, true);
#nullable restore
#line 23 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 840, ViewBag.PageNumber - 1, 840, 25, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Previous</a>\r\n    </li>\r\n");
#nullable restore
#line 25 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
             if (ViewBag.PageNumber == 1)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral(@"                <li class=""page-item""><a class=""page-link"" href=""/News/List/1"">1</a></li>
                <li class=""page-item""><a class=""page-link"" href=""/News/List/2"">2</a></li>
                <li class=""page-item""><a class=""page-link"" href=""/News/List/3"">3</a></li>
");
#nullable restore
#line 30 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
            } else if(ViewBag.PageNumber == ViewBag.TotalPage)
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <li class=\"page-item\"><a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 1360, "\"", 1402, 2);
            WriteAttributeValue("", 1367, "/News/List/", 1367, 11, true);
#nullable restore
#line 32 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 1378, ViewBag.TotalPage - 2, 1378, 24, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 32 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                                  Write(ViewBag.TotalPage - 2);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n                <li class=\"page-item\"><a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 1497, "\"", 1539, 2);
            WriteAttributeValue("", 1504, "/News/List/", 1504, 11, true);
#nullable restore
#line 33 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 1515, ViewBag.TotalPage - 1, 1515, 24, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 33 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                                  Write(ViewBag.TotalPage - 1);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n                <li class=\"page-item\"><a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 1634, "\"", 1672, 2);
            WriteAttributeValue("", 1641, "/News/List/", 1641, 11, true);
#nullable restore
#line 34 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 1652, ViewBag.TotalPage, 1652, 20, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 34 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                              Write(ViewBag.TotalPage);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 35 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
            } else
            {

#line default
#line hidden
#nullable disable
            WriteLiteral("                <li class=\"page-item\"><a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 1798, "\"", 1841, 2);
            WriteAttributeValue("", 1805, "/News/List/", 1805, 11, true);
#nullable restore
#line 37 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 1816, ViewBag.PageNumber - 1, 1816, 25, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 37 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                                   Write(ViewBag.PageNumber - 1);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n                <li class=\"page-item\"><a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 1937, "\"", 1976, 2);
            WriteAttributeValue("", 1944, "/News/List/", 1944, 11, true);
#nullable restore
#line 38 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 1955, ViewBag.PageNumber, 1955, 21, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 38 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                               Write(ViewBag.PageNumber);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n                <li class=\"page-item\"><a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 2068, "\"", 2111, 2);
            WriteAttributeValue("", 2075, "/News/List/", 2075, 11, true);
#nullable restore
#line 39 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 2086, ViewBag.PageNumber + 1, 2086, 25, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">");
#nullable restore
#line 39 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
                                                                                                   Write(ViewBag.PageNumber + 1);

#line default
#line hidden
#nullable disable
            WriteLiteral("</a></li>\r\n");
#nullable restore
#line 40 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
            }

#line default
#line hidden
#nullable disable
            WriteLiteral("            <li");
            BeginWriteAttribute("class", " class=\"", 2179, "\"", 2253, 2);
            WriteAttributeValue("", 2187, "page-item", 2187, 9, true);
#nullable restore
#line 41 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue(" ", 2196, ViewBag.PageNumber == ViewBag.TotalPage?"disabled":"", 2197, 56, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">\r\n              <a class=\"page-link\"");
            BeginWriteAttribute("href", " href=\"", 2291, "\"", 2334, 2);
            WriteAttributeValue("", 2298, "/News/List/", 2298, 11, true);
#nullable restore
#line 42 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue("", 2309, ViewBag.PageNumber + 1, 2309, 25, false);

#line default
#line hidden
#nullable disable
            EndWriteAttribute();
            WriteLiteral(">Next</a>\r\n            </li>\r\n            <li>\r\n                <form action=\"/News/List\" method=\"post\" id=\"frm\">\r\n                    <input type=\"number\" name=\"id\"");
            BeginWriteAttribute("oninput", " oninput=\"", 2500, "\"", 2548, 3);
            WriteAttributeValue("", 2510, "checkNumber(this,", 2510, 17, true);
#nullable restore
#line 46 "C:\Users\Admin\Desktop\New folder\prn211\PRNProject\PRNProject\Views\News\List.cshtml"
WriteAttributeValue(" ", 2527, ViewBag.TotalPage, 2528, 18, false);

#line default
#line hidden
#nullable disable
            WriteAttributeValue("", 2546, ");", 2546, 2, true);
            EndWriteAttribute();
            WriteLiteral(@"/>
                </form>
            </li>
            <li class=""page-item goto-page"" onclick=""searchNewsPage();""><i class=""fa-solid fa-magnifying-glass""></i></li>
  </ul>
</nav>
</div>
<script>
    function checkNumber(item, max) {
    if (item.value > max) {
        item.value = max;
    }
    if (item.value < 1) {
        item.value = 1;
    }
}
function searchNewsPage(){
    document.getElementById('frm').submit();
}
</script>");
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
        public global::Microsoft.AspNetCore.Mvc.Rendering.IHtmlHelper<List<News>> Html { get; private set; } = default!;
        #nullable disable
    }
}
#pragma warning restore 1591
