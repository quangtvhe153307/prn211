#pragma checksum "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\Home\Home.cshtml" "{ff1816ec-aa5e-4d10-87f7-6f4963833460}" "a4a0b4ba921afffd0d780462664d916f5f7732e3"
// <auto-generated/>
#pragma warning disable 1591
[assembly: global::Microsoft.AspNetCore.Razor.Hosting.RazorCompiledItemAttribute(typeof(AspNetCore.Views_Home_Home), @"mvc.1.0.view", @"/Views/Home/Home.cshtml")]
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
#line 1 "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\Home\Home.cshtml"
using PRNProject.Models;

#line default
#line hidden
#nullable disable
    [global::Microsoft.AspNetCore.Razor.Hosting.RazorSourceChecksumAttribute(@"SHA1", @"a4a0b4ba921afffd0d780462664d916f5f7732e3", @"/Views/Home/Home.cshtml")]
    #nullable restore
    public class Views_Home_Home : global::Microsoft.AspNetCore.Mvc.Razor.RazorPage<dynamic>
    #nullable disable
    {
        private static readonly global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute __tagHelperAttribute_0 = new global::Microsoft.AspNetCore.Razor.TagHelpers.TagHelperAttribute("href", new global::Microsoft.AspNetCore.Html.HtmlString("~/css/StyleHome.css"), global::Microsoft.AspNetCore.Razor.TagHelpers.HtmlAttributeValueStyle.DoubleQuotes);
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
            __tagHelperExecutionContext = __tagHelperScopeManager.Begin("link", global::Microsoft.AspNetCore.Razor.TagHelpers.TagMode.SelfClosing, "a4a0b4ba921afffd0d780462664d916f5f7732e33473", async() => {
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

        <div>
                <div>
                    <h3>Academic information</h3>
                </div>
                <div class=""row"">
                <div class=""col-md-6"">
                    <h4>Registration/Application</h4>
                    <ul>
                        <li><a");
            BeginWriteAttribute("href", " href=\"", 380, "\"", 387, 0);
            EndWriteAttribute();
            WriteLiteral(">Suspend one semeter </a><span>(Xin bảo lưu)</span></li>\r\n                        <li><a");
            BeginWriteAttribute("href", " href=\"", 476, "\"", 483, 0);
            EndWriteAttribute();
            WriteLiteral(">Withdraw </a><span>(Xin thôi học)</span></li>\r\n                        <li><a");
            BeginWriteAttribute("href", " href=\"", 562, "\"", 569, 0);
            EndWriteAttribute();
            WriteLiteral(">Move out class </a><span>(Xin chuyển lớp)</span></li>\r\n                    </ul>\r\n                </div>\r\n                <div class=\"col-md-6\">\r\n                    <h4>Information access</h4>\r\n                    <ul>\r\n                        <li><a");
            BeginWriteAttribute("href", " href=\"", 822, "\"", 829, 0);
            EndWriteAttribute();
            WriteLiteral(">University timetable </a><span>(Lịch học)</span></li>\r\n                        <li><a");
            BeginWriteAttribute("href", " href=\"", 916, "\"", 923, 0);
            EndWriteAttribute();
            WriteLiteral(">Weekly timetable </a><span>(Thời khóa biểu từng tuần)</span></li>\r\n                        <li><a");
            BeginWriteAttribute("href", " href=\"", 1022, "\"", 1029, 0);
            EndWriteAttribute();
            WriteLiteral(@">University timetable </a><span>Lịch học</span></li>
                    </ul>
                </div>
                </div>
                <div class=""row"">
                                <div class=""col-md-6"">
                    <h4>Feedbacks</h4>
                    <ul>
                        <li><a");
            BeginWriteAttribute("href", " href=\"", 1346, "\"", 1353, 0);
            EndWriteAttribute();
            WriteLiteral(@">Feedback about teaching </a><span>(Báo cáo về việc giảng dạy)</span></li>
                    </ul>
                </div>
                <div class=""col-md-6"">
                    <h4>Report</h4>
                    <ul>
                        <li><a");
            BeginWriteAttribute("href", " href=\"", 1614, "\"", 1621, 0);
            EndWriteAttribute();
            WriteLiteral(">Attendance report </a><span>(Báo cáo điểm danh)</span></li>\r\n                        <li><a href=\"/Grade/StudentGrade\">Mark report </a><span>(Báo cáo điểm)</span></li>\r\n                        <li><a");
            BeginWriteAttribute("href", " href=\"", 1822, "\"", 1829, 0);
            EndWriteAttribute();
            WriteLiteral(@">Academic transcript </a><span>(Báo cáo điểm)</span></li>
                    </ul>
                </div>
                </div>
                <div  class=""row"">
                                <div class=""col-md-6"">
                    <h4>Other</h4>
                    <span>");
#nullable restore
#line 45 "C:\Users\Admin\Desktop\PRN20220715\prn211\PRNProject\PRNProject\Views\Home\Home.cshtml"
                     Write(ViewBag.Id);

#line default
#line hidden
#nullable disable
            WriteLiteral(@"</span>
                    <ul>
                        <li><a href=""/Student/Profile"">Student profile </a><span></span></li>
                        <li><a href=""/Term/List"">View semeter </a><span>(Xem thông tin về học kỳ)</span></li>
                        <li><a href=""/Room/List"">View room </a><span>(Xem thông tin về phòng)</span></li>
                    </ul>
                </div>
            </div>
            </div>
");
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
